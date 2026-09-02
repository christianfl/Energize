import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../l10n/app_localizations.dart';
import '../../models/food/food_tracked.dart';
import '../../providers/complete_days_provider.dart';
import '../../providers/tracked_food_provider.dart';
import '../../theme/energize_theme.dart';
import '../../utils/date_util.dart';
import '../../utils/time_util.dart';
import '../../widgets/macro_chart.dart';
import './detailed_summary_sub_page.dart';
import 'widgets/food_input.dart';
import 'widgets/tracked_food_list.dart';

const trackingFabTag = 'tracking_fab';

/// Actions shown in the tracked food selection overflow menu.
enum _TrackedFoodSelectionAction { changeTime, delete }

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  TrackingPageState createState() => TrackingPageState();
}

class TrackingPageState extends State<TrackingPage> {
  var _selectedDate = DateTime.now();
  bool? _isSelectedDateCompleted;
  final _scrollController = ScrollController();
  ScrollDirection? _lastScrollDirection;
  bool _isFabExplicitelyVisible = false;
  final double _datePickerHighlightRadius = 16;
  final Set<String> _selectedFoodIds = {};

  /// True while any food(s) action is pending.
  bool _isApplyingFoodAction = false;

  /// Whether at least one tracked food is selected.
  bool get _isSelectionMode => _selectedFoodIds.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(context);

    return PopScope(
      canPop: !_isSelectionMode,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isSelectionMode && !_isApplyingFoodAction) {
          _clearSelection();
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(trackedFoodProvider),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 3,
                ),
                child: MacroChart(trackedFoodProvider.foods, padding: 10.0),
              ),
            ),
            TrackedFoodList(
              _scrollController,
              _setIsFabExplicitelyVisible,
              selectedFoodIds: _selectedFoodIds,
              onSelectionToggle: _toggleFoodSelection,
            ),
          ],
        ),
        // _isFabExplicitelyVisible is there because otherwise the fab could
        // hide itself after deleting entries until there is no scrollable
        // area anymore
        floatingActionButton:
            !_isSelectionMode &&
                (_lastScrollDirection != ScrollDirection.reverse ||
                    _isFabExplicitelyVisible)
            ? SpeedDial(
                heroTag: trackingFabTag,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                spacing: 16,
                childMargin: EdgeInsets.zero,
                childPadding: const EdgeInsets.all(8),
                curve: Curves.linear,
                icon: Icons.add,
                activeIcon: Icons.close,
                overlayOpacity: 0,
                animationDuration: const Duration(),
                children: [
                  SpeedDialChild(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    foregroundColor: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer,
                    label: AppLocalizations.of(context)!.searchFood,
                    labelBackgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    onTap: () =>
                        _startAddEatenFood(context, SheetModalMode.search),
                    child: const Icon(Icons.search),
                  ),
                  SpeedDialChild(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    foregroundColor: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer,
                    label: AppLocalizations.of(context)!.scanBarcode,
                    labelBackgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    onTap: () =>
                        _startAddEatenFood(context, SheetModalMode.barcode),
                    child: const Icon(Icons.qr_code),
                  ),
                ],
              )
            : null,
      ),
    );
  }

  /// Builds the regular or contextual tracking page app bar.
  PreferredSizeWidget _buildAppBar(TrackedFoodProvider trackedFoodProvider) {
    if (_isSelectionMode) {
      final localizations = AppLocalizations.of(context)!;
      return AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          onPressed: _isApplyingFoodAction ? null : _clearSelection,
          icon: const Icon(Icons.close),
        ),
        title: Text(
          localizations.trackedFoodsSelected(_selectedFoodIds.length),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            tooltip: localizations.copyTrackedFoods,
            onPressed: _isApplyingFoodAction
                ? null
                : () => _copySelectedFoods(trackedFoodProvider),
            icon: const Icon(Icons.copy),
          ),
          IconButton(
            tooltip: localizations.moveTrackedFoods,
            onPressed: _isApplyingFoodAction
                ? null
                : () => _moveSelectedFoods(trackedFoodProvider),
            icon: const Icon(Icons.edit_calendar),
          ),
          PopupMenuButton<_TrackedFoodSelectionAction>(
            enabled: !_isApplyingFoodAction,
            tooltip: MaterialLocalizations.of(context).moreButtonTooltip,
            onSelected: (action) {
              switch (action) {
                case _TrackedFoodSelectionAction.changeTime:
                  _changeSelectedFoodsTime(trackedFoodProvider);
                  break;
                case _TrackedFoodSelectionAction.delete:
                  _deleteSelectedFoods(trackedFoodProvider);
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _TrackedFoodSelectionAction.changeTime,
                child: Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(width: 12),
                    Text(localizations.changeTrackedTime),
                  ],
                ),
              ),
              PopupMenuItem(
                value: _TrackedFoodSelectionAction.delete,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      localizations.deleteTrackedFoods,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    return AppBar(
      centerTitle: true,
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            switch (value) {
              case 0:
                Navigator.of(context).pushNamed(
                  DetailedSummarySubPage.routeName,
                  arguments: trackedFoodProvider.foods,
                );
                break;
              case 1:
                _switchDayCompletionStatus();
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Text(AppLocalizations.of(context)!.detailedSummary),
            ),
            PopupMenuItem(value: 1, child: _dayCompletionStatusMenuEntry()),
          ],
        ),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              _selectDate(_selectedDate.subtract(const Duration(days: 1)));
            },
            icon: const Icon(Icons.arrow_left),
          ),
          TextButton(
            onPressed: () => _showPickDateDialog(context),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: Text(DateUtil.getDate(_selectedDate, context)),
          ),
          IconButton(
            onPressed: () {
              _selectDate(_selectedDate.add(const Duration(days: 1)));
            },
            icon: const Icon(Icons.arrow_right),
          ),
          Tooltip(
            message: AppLocalizations.of(context)!.defaultConsumptionTime,
            child: TextButton(
              onPressed: () => _selectTime(context),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(
                  context,
                ).colorScheme.onPrimaryContainer,
              ),
              child: Text(TimeUtil.getTime(_selectedDate, context)),
            ),
          ),
        ],
      ),
    );
  }

  /// Toggles the selection state of [food].
  void _toggleFoodSelection(FoodTracked food) {
    if (_isApplyingFoodAction) return;

    setState(() {
      if (!_selectedFoodIds.add(food.id)) {
        _selectedFoodIds.remove(food.id);
      }
    });
  }

  /// Clears the tracked food selection and action state.
  void _clearSelection() {
    setState(() {
      _selectedFoodIds.clear();
      _isApplyingFoodAction = false;
    });
  }

  /// Returns the currently selected tracked foods from [provider].
  List<FoodTracked> _selectedFoods(TrackedFoodProvider provider) {
    return provider.foods
        .where((food) => _selectedFoodIds.contains(food.id))
        .toList();
  }

  /// Shows the date picker for copy and move actions.
  Future<DateTime?> _pickTrackedFoodTargetDate() {
    return showDatePicker(
      context: context,
      initialDate: DateUtils.dateOnly(_selectedDate),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
  }

  /// Copies the selected tracked foods to a chosen day.
  Future<void> _copySelectedFoods(TrackedFoodProvider provider) async {
    final targetDay = await _pickTrackedFoodTargetDate();
    if (targetDay == null || !mounted) return;

    final selectedFoods = _selectedFoods(provider);
    if (selectedFoods.isEmpty) return;

    _setFoodActionRunning(true);
    try {
      final copies = await provider.copyTrackedFoods(selectedFoods, targetDay);
      if (!mounted) return;

      _clearSelection();
      _showTrackedFoodActionResult(
        AppLocalizations.of(context)!.copiedTrackedFoods(copies.length),
        () => provider.removeTrackedFoods(copies),
      );
    } catch (_) {
      _handleTrackedFoodActionError();
    }
  }

  /// Moves the selected tracked foods to picked day.
  Future<void> _moveSelectedFoods(TrackedFoodProvider provider) async {
    final targetDay = await _pickTrackedFoodTargetDate();
    if (targetDay == null || !mounted) return;

    // Don't allow moving to current day
    if (DateUtils.isSameDay(targetDay, _selectedDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.chooseAnotherDayForMove),
        ),
      );
      return;
    }

    final selectedFoods = _selectedFoods(provider);
    if (selectedFoods.isEmpty) return;

    final previousDates = {
      for (final food in selectedFoods) food: food.dateEaten,
    };

    _setFoodActionRunning(true);
    try {
      await provider.moveTrackedFoods(selectedFoods, targetDay);
      if (!mounted) return;

      _clearSelection();
      _showTrackedFoodActionResult(
        AppLocalizations.of(context)!.movedTrackedFoods(selectedFoods.length),
        () => provider.restoreTrackedFoodDates(previousDates),
      );
    } catch (_) {
      _handleTrackedFoodActionError();
    }
  }

  /// Changes the time of all selected tracked foods.
  Future<void> _changeSelectedFoodsTime(TrackedFoodProvider provider) async {
    final selectedFoods = _selectedFoods(provider);
    if (selectedFoods.isEmpty) return;

    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedFoods.first.dateEaten),
    );
    if (selectedTime == null || !mounted) return;

    final previousDates = {
      for (final food in selectedFoods) food: food.dateEaten,
    };

    _setFoodActionRunning(true);
    try {
      await provider.changeTrackedFoodTime(selectedFoods, selectedTime);
      if (!mounted) return;

      _clearSelection();
      _showTrackedFoodActionResult(
        AppLocalizations.of(
          context,
        )!.changedTrackedFoodTimes(selectedFoods.length),
        () => provider.restoreTrackedFoodDates(previousDates),
      );
    } catch (_) {
      _handleTrackedFoodActionError();
    }
  }

  /// Deletes all selected tracked foods.
  Future<void> _deleteSelectedFoods(TrackedFoodProvider provider) async {
    final selectedFoods = _selectedFoods(provider);
    if (selectedFoods.isEmpty) return;

    _setFoodActionRunning(true);
    try {
      await provider.removeTrackedFoods(selectedFoods);
      if (!mounted) return;

      _clearSelection();
      _showTrackedFoodActionResult(
        AppLocalizations.of(context)!.deletedTrackedFoods(selectedFoods.length),
        () => provider.restoreTrackedFoods(selectedFoods),
      );
    } catch (_) {
      _handleTrackedFoodActionError();
    }
  }

  /// Sets whether a tracked food action is currently running.
  void _setFoodActionRunning(bool value) {
    if (!mounted) return;

    setState(() => _isApplyingFoodAction = value);
  }

  /// Resets the action state and shows a generic error message.
  void _handleTrackedFoodActionError() {
    if (!mounted) return;

    _setFoodActionRunning(false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.unknownErrorText)),
    );
  }

  /// Shows a successful tracked food action with an undo action.
  void _showTrackedFoodActionResult(
    String message,
    Future<void> Function() undo,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: AppLocalizations.of(context)!.undo,
          onPressed: () async {
            try {
              await undo();
            } catch (_) {
              _handleTrackedFoodActionError();
            }
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_lastScrollDirection !=
          _scrollController.position.userScrollDirection) {
        setState(() {
          _lastScrollDirection = _scrollController.position.userScrollDirection;
          _setIsFabExplicitelyVisible(false);
        });
      }
    });

    _selectDate(DateTime.now());

    super.initState();
  }

  Widget _dayCompletionStatusMenuEntry() {
    if (_isSelectedDateCompleted!) {
      return Row(
        children: [
          const Icon(Icons.clear),
          const SizedBox(width: 10),
          Text(AppLocalizations.of(context)!.dayIncomplete),
        ],
      );
    } else {
      return Row(
        children: [
          const Icon(Icons.done),
          const SizedBox(width: 10),
          Text(AppLocalizations.of(context)!.dayComplete),
        ],
      );
    }
  }

  /// Shows the dialog for picking [_selectedDate].
  Future<void> _showPickDateDialog(BuildContext ctx) async {
    final completeDaysProvider = Provider.of<CompleteDaysProvider>(
      context,
      listen: false,
    );

    final List<DateTime> completedDays =
        await completeDaysProvider.completedDays;

    if (!ctx.mounted) return;

    return showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            MaterialLocalizations.of(context).datePickerHelpText,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TableCalendar(
                locale: Localizations.localeOf(context).toString(),
                availableCalendarFormats: const {CalendarFormat.month: ''},
                weekendDays: const [],
                headerStyle: const HeaderStyle(titleCentered: true),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Theme.of(context).microNutrientsContainer,
                  ),
                ),
                daysOfWeekHeight: 32.0,
                startingDayOfWeek: StartingDayOfWeek.monday,
                firstDay: DateTime(2000),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                focusedDay: _selectedDate,
                onDaySelected: (selectedDay, focusedDay) {
                  final DateTime selectedDateWithPreviousTime = _selectedDate
                      .copyWith(
                        year: selectedDay.year,
                        month: selectedDay.month,
                        day: selectedDay.day,
                      );
                  _selectDate(selectedDateWithPreviousTime);
                  Navigator.of(context).pop();
                },
                // Mark current selected date
                selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
                // Holidays == Days which are marked as done
                holidayPredicate: (day) {
                  return completedDays.any(
                    (completedDay) => isSameDay(completedDay, day),
                  );
                },
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, day, focusedDay) {
                    return Center(
                      child: CircleAvatar(
                        radius: _datePickerHighlightRadius,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.inverseSurface,
                        child: CircleAvatar(
                          radius: _datePickerHighlightRadius - 1,
                          backgroundColor: Theme.of(
                            context,
                          ).dialogTheme.backgroundColor,
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Center(
                      child: CircleAvatar(
                        radius: _datePickerHighlightRadius,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.inverseSurface,
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onInverseSurface,
                          ),
                        ),
                      ),
                    );
                  },
                  holidayBuilder: (context, day, focusedDay) {
                    return Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: _datePickerHighlightRadius,
                            backgroundColor: Theme.of(context).successContainer,
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: Theme.of(context).onSuccessContainer,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.check,
                            size: 16,
                            color: Theme.of(context).onSuccessContainer,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Sets [_selectedDate] and [TrackedFoodProvider.selectedDate].
  ///
  /// Setting the latter automatically triggers loading corresponding
  /// tracked foods from the database into [TrackedFoodProvider.foods].
  Future<void> _selectDate(DateTime date) async {
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(
      context,
      listen: false,
    );
    final completeDaysProvider = Provider.of<CompleteDaysProvider>(
      context,
      listen: false,
    );

    // Set selected date
    _selectedDate = date;

    // Triggers loading tracked foods from this date into provider
    await trackedFoodProvider.selectDate(_selectedDate);

    // _isSelectedDateCompleted according to the selected date
    _isSelectedDateCompleted = await completeDaysProvider.isDateCompleted(
      _selectedDate,
    );

    // Trigger UI rebuilding
    setState(() {});
  }

  /// Sets the current in-app time which acts as standard value for newly added food items
  void _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (selectedTime != null) {
      setState(() {
        _selectedDate = _selectedDate.copyWith(
          hour: selectedTime.hour,
          minute: selectedTime.minute,
        );
      });
    }
  }

  void _setIsFabExplicitelyVisible(bool value) {
    setState(() {
      _isFabExplicitelyVisible = value;
    });
  }

  void _startAddEatenFood(BuildContext ctx, SheetModalMode mode) {
    showModalBottomSheet(
      context: ctx,
      showDragHandle: true,
      builder: (_) {
        return FoodInput(_selectedDate, mode);
      },
    );
  }

  void _switchDayCompletionStatus() {
    final completeDaysProvider = Provider.of<CompleteDaysProvider>(
      context,
      listen: false,
    );

    if (_isSelectedDateCompleted!) {
      completeDaysProvider.remove(_selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.unmarkedDayAsComplete),
        ),
      );
    } else {
      completeDaysProvider.markCompleted(_selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.markedDayAsComplete),
        ),
      );
    }
    _isSelectedDateCompleted = !_isSelectedDateCompleted!;
  }
}
