import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'pages/tab_food/add_edit_custom_food_modal.dart';
import 'pages/tab_settings/about_sub_page/about_sub_page.dart';
import 'pages/tab_settings/backup_and_restore_sub_page.dart';
import 'pages/tab_settings/database_management_sub_page.dart';
import 'pages/tab_settings/donation_sub_page.dart';
import 'pages/tab_settings/personalization_page/nutrition_targets_page.dart';
import 'pages/tab_settings/ui_settings_sub_page.dart';
import 'pages/tab_tracking/detailed_summary_sub_page.dart';
import 'pages/tab_tracking/track_food_modal.dart';
import 'pages/tabs_page.dart';
import 'providers/app_settings.dart';
import 'providers/custom_food_provider.dart';
import 'providers/tracked_food_provider.dart';
import 'theme/energize_theme.dart';

Future main() async {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else if (Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  /// Call MyApp in debug mode without debug mode banner.
  ///
  /// Used for screenshot creation within integration tests.
  final bool debugShowCheckedModeBanner;

  /// Call MyApp with a forced ThemeMode.
  ///
  /// Used for screenshot creation within integration tests.
  final ThemeMode? themeMode;

  /// Call MyApp with a forced Locale.
  ///
  /// Used for screenshot creation within integration tests.
  final Locale? locale;

  const MyApp({
    super.key,
    this.debugShowCheckedModeBanner = true,
    this.themeMode,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AppSettings()),
        ChangeNotifierProvider(create: (ctx) => TrackedFoodProvider()),
        ChangeNotifierProvider(create: (ctx) => CustomFoodProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        onGenerateTitle: (context) {
          return AppLocalizations.of(context)!.appName;
        },
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        theme: EnergizeTheme.theme,
        darkTheme: EnergizeTheme.darkTheme,
        themeMode: themeMode,
        home: const TabsPage(),
        routes: {
          TrackFood.routeName: (ctx) => const TrackFood(),
          DetailedSummarySubPage.routeName: (ctx) =>
              const DetailedSummarySubPage(),
          AddEditCustomFoodModal.routeName: (ctx) =>
              const AddEditCustomFoodModal(),
          NutritionTargetsPage.routeName: (ctx) => const NutritionTargetsPage(),
          UISettingsSubPage.routeName: (ctx) => const UISettingsSubPage(),
          DatabaseManagementSubPage.routeName: (ctx) =>
              const DatabaseManagementSubPage(),
          BackupAndRestoreSubPage.routeName: (ctx) =>
              const BackupAndRestoreSubPage(),
          AboutSubPage.routeName: (ctx) => const AboutSubPage(),
          DonationSubPage.routeName: (ctx) => const DonationSubPage(),
        },
      ),
    );
  }
}
