import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/time_util.dart';
import './detailed_summary_sub_page.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/complete_days_database_service.dart';
import '../../utils/date_util.dart';
import '../../widgets/food_input.dart';
import '../../widgets/macro_chart.dart';
import '../../widgets/tracked_food_list.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

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

  void _setIsFabExplicitelyVisible(bool value) {
    setState(() {
      _isFabExplicitelyVisible = value;
    });
  }

  void _startAddEatenFood(BuildContext ctx, SheetModalMode mode) {
    showModalBottomSheet(
      context: ctx,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (_) {
        return FoodInput(_selectedDate, mode);
      },
    );
  }

  Future<void> _pickDateDialog(BuildContext ctx) async {
    final List<DateTime> completedDays =
        await CompleteDaysDatabaseService.completedDays;

    return showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            MaterialLocalizations.of(context).datePickerHelpText.toUpperCase(),
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
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.blueGrey),
                ),
                daysOfWeekHeight: 32.0,
                startingDayOfWeek: StartingDayOfWeek.monday,
                firstDay: DateTime(2000),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                focusedDay: _selectedDate,
                onDaySelected: (selectedDay, focusedDay) {
                  DateTime selectedDateWithPreviousTime =
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
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          radius: _datePickerHighlightRadius - 1,
                          backgroundColor:
                              Theme.of(context).dialogBackgroundColor,
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Center(
                      child: CircleAvatar(
                        radius: _datePickerHighlightRadius,
                        backgroundColor: Colors.blue,
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.white),
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
                            backgroundColor: Colors.green,
                            child: Text(
                              '${day.day}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const Icon(
                            Icons.check,
                            size: 16,
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
                MaterialLocalizations.of(context)
                    .cancelButtonLabel
                    .toUpperCase(),
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

  /// Sets the current in-app time which acts as standard value for newly added food items
  void _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
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

  void _selectDate(DateTime date) {
    final provider = Provider.of<TrackedFoodProvider>(context, listen: false);

    setState(() {
      _selectedDate = date;
      provider.selectDate(_selectedDate);
      CompleteDaysDatabaseService.isDateCompleted(_selectedDate)
          .then((value) => _isSelectedDateCompleted = value);
    });
  }

  void _switchDayCompletionStatus() {
    if (_isSelectedDateCompleted!) {
      CompleteDaysDatabaseService.remove(_selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text(AppLocalizations.of(context)!.unmarkedDayAsComplete),
        ),
      );
    } else {
      CompleteDaysDatabaseService.insert(_selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: Text(AppLocalizations.of(context)!.markedDayAsComplete),
        ),
      );
    }
    _isSelectedDateCompleted = !_isSelectedDateCompleted!;
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
                        arguments: trackedFoodProvider.foods);
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
              color: Colors.white,
            ),
            TextButton(
              onPressed: () => _pickDateDialog(context),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Text(DateUtil.getDate(_selectedDate, context)),
            ),
            const SizedBox(width: 3),
            Text(
              '|',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(width: 3),
            TextButton(
              onPressed: () => _selectTime(context),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Text(TimeUtil.getTime(_selectedDate, context)),
            ),
            IconButton(
              onPressed: () {
                _selectDate(_selectedDate.add(const Duration(days: 1)));
              },
              icon: const Icon(Icons.arrow_right),
              color: Colors.white,
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
      floatingActionButton: SpeedDial(
        // _isFabExplicitelyVisible is there because otherwise the fab could
        // hide itself after deleting entries until there is no scrollable
        // area anymore
        visible: _lastScrollDirection != ScrollDirection.reverse ||
            _isFabExplicitelyVisible,
        curve: Curves.linear,
        icon: Icons.add,
        activeIcon: Icons.close,
        overlayOpacity: 0,
        animationDuration: const Duration(),
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.search),
            backgroundColor: Colors.red,
            label: AppLocalizations.of(context)!.searchFood,
            labelBackgroundColor: Colors.red,
            onTap: () => _startAddEatenFood(context, SheetModalMode.search),
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code),
            backgroundColor: Colors.blue,
            label: AppLocalizations.of(context)!.scanEANCode,
            labelBackgroundColor: Colors.blue,
            onTap: () => _startAddEatenFood(context, SheetModalMode.ean),
          ),
        ],
      ),
    );
  }
}
