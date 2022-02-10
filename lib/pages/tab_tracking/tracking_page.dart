import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import './detailed_summary_sub_page.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/complete_days_database_service.dart';
import '../../widgets/food_input.dart';
import '../../widgets/macro_chart.dart';
import '../../widgets/tracked_food_list.dart';

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final df = new DateFormat('dd.MM.yyyy');
  var _selectedDate = DateTime.now();
  bool? _isSelectedDateCompleted;
  final _scrollController = ScrollController();
  ScrollDirection? _lastScrollDirection;
  bool _isFabExplicitelyVisible = false;

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
      shape: RoundedRectangleBorder(
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

  void _pickDateDialog(BuildContext ctx) {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      _selectDate(pickedDate);
    });
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
          backgroundColor: Theme.of(context).errorColor,
          content: Text('Unmarked completion!'),
        ),
      );
    } else {
      CompleteDaysDatabaseService.insert(_selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: Text('Day marked as completed!'),
        ),
      );
    }
    _isSelectedDateCompleted = !_isSelectedDateCompleted!;
  }

  Widget _dayCompletionStatusMenuEntry() {
    if (_isSelectedDateCompleted!) {
      return Row(
        children: <Widget>[
          Icon(Icons.clear),
          SizedBox(width: 10),
          Text('Unmark completion'),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Icon(Icons.done),
          SizedBox(width: 10),
          Text(AppLocalizations.of(context)!.markDayAsCompleted),
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
            icon: Icon(Icons.more_vert),
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
                child: Text(AppLocalizations.of(context)!.detailedSummary),
                value: 0,
              ),
              PopupMenuItem(
                child: _dayCompletionStatusMenuEntry(),
                value: 1,
              ),
            ],
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                _selectDate(_selectedDate.subtract(Duration(days: 1)));
              },
              icon: const Icon(Icons.arrow_left),
              color: Colors.white,
            ),
            TextButton(
              child: Text(
                df.format(
                  _selectedDate,
                ),
              ),
              onPressed: () => _pickDateDialog(context),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
            IconButton(
              onPressed: () {
                _selectDate(_selectedDate.add(Duration(days: 1)));
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
            child: MacroChart(trackedFoodProvider.foods),
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
        animationSpeed: 0,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: Icon(Icons.search),
            backgroundColor: Colors.red,
            label: 'Search product name',
            labelBackgroundColor: Colors.red,
            onTap: () => _startAddEatenFood(context, SheetModalMode.search),
          ),
          SpeedDialChild(
            child: Icon(Icons.qr_code),
            backgroundColor: Colors.blue,
            label: 'Scan product EAN',
            labelBackgroundColor: Colors.blue,
            onTap: () => _startAddEatenFood(context, SheetModalMode.ean),
          ),
        ],
      ),
    );
  }
}
