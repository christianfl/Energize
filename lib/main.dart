import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'config/env_config.dart';
import 'l10n/app_localizations.dart';
import 'pages/introduction/introduction_gate.dart';
import 'pages/introduction/introduction_page.dart';
import 'pages/tab_custom_food/add_edit_custom_food_modal.dart';
import 'pages/tab_settings/about_sub_page/about_sub_page.dart';
import 'pages/tab_settings/backup_and_restore_sub_page.dart';
import 'pages/tab_settings/database_management_sub_page.dart';
import 'pages/tab_settings/donation_sub_page.dart';
import 'pages/tab_settings/personalization_page/nutrition_targets_page.dart';
import 'pages/tab_settings/ui_settings_sub_page.dart';
import 'pages/tab_tracking/detailed_summary_sub_page.dart';
import 'pages/tab_tracking/track_food_modal.dart';
import 'pages/tabs_page.dart';
import 'providers/app_settings_provider.dart';
import 'providers/body_targets_provider.dart';
import 'providers/complete_days_provider.dart';
import 'providers/custom_food_provider.dart';
import 'providers/log_provider.dart';
import 'providers/tracked_food_provider.dart';
import 'services/introduction_service.dart';
import 'services/key_value_storage_service/secure_storage_service.dart';
import 'services/sqlite/complete_days_database_service.dart';
import 'services/sqlite/custom_food_database_service.dart';
import 'services/sqlite/tracked_food_database_service.dart';
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

  // Make environment variables available
  await dotenv.load(fileName: '.env');

  if (!dotenv.isEveryDefined(requiredEnvVars)) {
    throw Exception('There are .env variables missing.');
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

  /// Call MyApp with skipped introduction screen.
  ///
  /// Used for screenshot creation within integration tests.
  final bool skipIntroduction;

  const MyApp({
    super.key,
    this.debugShowCheckedModeBanner = true,
    this.themeMode,
    this.locale,
    this.skipIntroduction = false,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (ctx) => LogProvider(talker: TalkerFlutter.init())),
        Provider(
          create: (ctx) {
            final service = SecureStorageService.instance;
            service.configureLogger(ctx.read<LogProvider>());
            return service;
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) => AppSettingsProvider(
            keyValueStorage: ctx.read<SecureStorageService>(),
            logger: ctx.read<LogProvider>(),
          ),
        ),
        Provider(
          create: (ctx) => IntroductionService(
            keyValueStorage: ctx.read<SecureStorageService>(),
            logger: ctx.read<LogProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BodyTargetsProvider(
            keyValueStorage: ctx.read<SecureStorageService>(),
            logger: ctx.read<LogProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) {
            final logProvider = ctx.read<LogProvider>();
            final database = TrackedFoodDatabaseService.instance;
            database.configureLogger(logProvider);

            return TrackedFoodProvider(db: database, logger: logProvider);
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) {
            final logProvider = ctx.read<LogProvider>();
            final database = CustomFoodDatabaseService.instance;
            database.configureLogger(logProvider);

            return CustomFoodProvider(db: database, logger: logProvider);
          },
        ),
        Provider(
          create: (ctx) {
            final logProvider = ctx.read<LogProvider>();
            final database = CompleteDaysDatabaseService.instance;
            database.configureLogger(logProvider);

            return CompleteDaysProvider(db: database, logger: logProvider);
          },
        ),
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
        home: skipIntroduction ? const TabsPage() : const IntroductionGate(),
        routes: {
          IntroductionPage.routeName: (ctx) => IntroductionPage(
            isReplay: true,
            onCompleted: () => Navigator.of(ctx).pop(),
          ),
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
