import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'pages/tab_food/add_edit_custom_food_modal.dart';
import 'pages/tab_settings/about_sub_page.dart';
import 'pages/tab_settings/backup_and_restore_sub_page.dart';
import 'pages/tab_settings/database_management_sub_page.dart';
import 'pages/tab_settings/macro_targets_sub_page.dart';
import 'pages/tab_settings/micro_targets_sub_page.dart';
import 'pages/tab_settings/personalization_sub_page.dart';
import 'pages/tab_tracking/track_food_modal.dart';
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
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English, no country code
          Locale('de'), // German, no country code
          Locale('nb', 'NO'), // Norwegian Bokmål
          Locale('tr'), // Turkish, no country code
        ],
        theme: ThemeData.dark().copyWith(
          highlightColor: Colors.amber,
          scaffoldBackgroundColor: Color(0xFF1B262C),
          cardColor: Colors.black26,
          colorScheme: ColorScheme.dark().copyWith(
            primary: Colors.blue,
            onPrimary: Colors.white,
            secondary: Colors.pink,
            onSecondary: Colors.white,
            surface: Colors.pink,
          ),
        ),
        home: TabsPage(),
        routes: {
          TrackFood.routeName: (ctx) => TrackFood(),
          DetailedSummarySubPage.routeName: (ctx) => DetailedSummarySubPage(),
          AddEditCustomFoodModal.routeName: (ctx) => AddEditCustomFoodModal(),
          PersonalizationSubPage.routeName: (ctx) => PersonalizationSubPage(),
          MacroTargetsSubPage.routeName: (ctx) => MacroTargetsSubPage(),
          MicroTargetsSubPage.routeName: (ctx) => MicroTargetsSubPage(),
          DatabaseManagementSubPage.routeName: (ctx) =>
              DatabaseManagementSubPage(),
          BackupAndRestoreSubPage.routeName: (ctx) => BackupAndRestoreSubPage(),
          AboutSubPage.routeName: (ctx) => AboutSubPage(),
        },
      ),
    );
  }
}
