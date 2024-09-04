import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../providers/tracked_food_provider.dart';
import '../../services/sqlite/complete_days_database_service.dart';
import '../../theme/energize_theme.dart';
import '../../utils/date_util.dart';
import '../../utils/time_util.dart';
import '../../widgets/macro_chart.dart';
import './detailed_summary_sub_page.dart';
import 'widgets/food_input.dart';
import 'widgets/tracked_food_list.dart';

const trackingFabTag = 'tracking_fab';

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

  @override
  Widget build(BuildContext context) {
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 0:
                  {
                    Navigator.of(context).pushNamed(
                      DetailedSummarySubPage.routeName,
                      arguments: trackedFoodProvider.foods,
                    );
                  }
                  break;

                case 1:
                  {
                    _switchDayCompletionStatus();
                  }
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(AppLocalizations.of(context)!.detailedSummary),
              ),
              PopupMenuItem(
                value: 1,
                child: _dayCompletionStatusMenuEntry(),
              ),
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
              onPressed: () => _pickDateDialog(context),
              style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: Text(DateUtil.getDate(_selectedDate, context)),
            ),
            IconButton(
              onPressed: () {
                _selectDate(_selectedDate.add(const Duration(days: 1)));
              },
              icon: const Icon(Icons.arrow_right),
            ),
            TextButton(
              onPressed: () => _selectTime(context),
              style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: Text(TimeUtil.getTime(_selectedDate, context)),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 3,
              ),
              child: MacroChart(
                trackedFoodProvider.foods,
                padding: 10.0,
              ),
            ),
          ),
          TrackedFoodList(_scrollController, _setIsFabExplicitelyVisible),
        ],
      ),
      // _isFabExplicitelyVisible is there because otherwise the fab could
      // hide itself after deleting entries until there is no scrollable
      // area anymore
      floatingActionButton: _lastScrollDirection != ScrollDirection.reverse ||
              _isFabExplicitelyVisible
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
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  label: AppLocalizations.of(context)!.searchFood,
                  labelBackgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  onTap: () =>
                      _startAddEatenFood(context, SheetModalMode.search),
                  child: const Icon(Icons.search),
                ),
                SpeedDialChild(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  label: AppLocalizations.of(context)!.scanBarcode,
                  labelBackgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  onTap: () => _startAddEatenFood(
                    context,
                    SheetModalMode.barcode,
                  ),
                  child: const Icon(Icons.qr_code),
                ),
              ],
            )
          : null,
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

  Future<void> _pickDateDialog(BuildContext ctx) async {
    final List<DateTime> completedDays =
        await CompleteDaysDatabaseService.completedDays;

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
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                ),
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
                  final DateTime selectedDateWithPreviousTime =
                      _selectedDate.copyWith(
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
                  return completedDays
                      .any((completedDay) => isSameDay(completedDay, day));
                },
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, day, focusedDay) {
                    return Center(
                      child: CircleAvatar(
                        radius: _datePickerHighlightRadius,
                        backgroundColor:
                            Theme.of(context).colorScheme.inverseSurface,
                        child: CircleAvatar(
                          radius: _datePickerHighlightRadius - 1,
                          backgroundColor:
                              Theme.of(context).dialogBackgroundColor,
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
                        backgroundColor:
                            Theme.of(context).colorScheme.inverseSurface,
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
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
              child: Text(
                MaterialLocalizations.of(context).cancelButtonLabel,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _selectDate(DateTime date) {
    final provider = Provider.of<TrackedFoodProvider>(context, listen: false);

    setState(() {
      _selectedDate = date;
      provider.selectDate(_selectedDate);
      CompleteDaysDatabaseService.isDateCompleted(_selectedDate)
          .then((value) => _isSelectedDateCompleted = value);
    });
  }

  /// Sets the current in-app time which acts as standard value for newly added food items
  void _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dialOnly,
      initialTime: TimeOfDay.now(),
      context: context,
      helpText:
          '${MaterialLocalizations.of(context).timePickerDialHelpText}\n\n${AppLocalizations.of(context)!.timeSetHelpText}',
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
    if (_isSelectedDateCompleted!) {
      CompleteDaysDatabaseService.remove(_selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.unmarkedDayAsComplete),
        ),
      );
    } else {
      CompleteDaysDatabaseService.insert(_selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.markedDayAsComplete),
        ),
      );
    }
    _isSelectedDateCompleted = !_isSelectedDateCompleted!;
  }
}
