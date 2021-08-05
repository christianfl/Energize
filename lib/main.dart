import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/tab_food/add_edit_custom_food_modal.dart';
import 'pages/tab_settings/database_management_sub_page.dart';
import 'pages/tab_settings/macro_targets_sub_page.dart';
import 'pages/tab_settings/micro_targets_sub_page.dart';
import 'pages/tab_settings/personalization_sub_page.dart';
import 'pages/tab_tracking/add_food_modal.dart';
import 'pages/tab_tracking/detailed_summary_sub_page.dart';
import 'pages/tabs_page.dart';
import 'providers/app_settings.dart';
import 'providers/custom_food_provider.dart';
import 'providers/tracked_food_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AppSettings()),
        ChangeNotifierProvider(create: (ctx) => TrackedFoodProvider()),
        ChangeNotifierProvider(create: (ctx) => CustomFoodProvider()),
      ],
      child: MaterialApp(
        title: 'Energize',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.amber,
          highlightColor: Colors.pink,
          errorColor: Colors.red,
        ),
        darkTheme: ThemeData(
          // primarySwatch does not work in dark mode: https://github.com/flutter/flutter/issues/26323
          brightness: Brightness.dark,
          accentColor: Colors.amber,
          highlightColor: Colors.pink,
          errorColor: Colors.red,
        ),
        home: TabsPage(),
        routes: {
          AddFood.routeName: (ctx) => AddFood(),
          DetailedSummarySubPage.routeName: (ctx) => DetailedSummarySubPage(),
          AddEditCustomFoodModal.routeName: (ctx) => AddEditCustomFoodModal(),
          PersonalizationSubPage.routeName: (ctx) => PersonalizationSubPage(),
          MacroTargetsSubPage.routeName: (ctx) => MacroTargetsSubPage(),
          MicroTargetsSubPage.routeName: (ctx) => MicroTargetsSubPage(),
          DatabaseManagementSubPage.routeName: (ctx) =>
              DatabaseManagementSubPage(),
        },
      ),
    );
  }
}
