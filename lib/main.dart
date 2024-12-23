import 'dart:collection';
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
        title: 'Energize',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        localeListResolutionCallback: _advancedLocaleListResolution,
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

  /// Locale resolution algorithm.
  ///
  /// Same as basicLocaleListResolution but defaults to english instead of
  /// first element of supportedLocales as a fallback.
  ///
  /// https://api.flutter.dev/flutter/widgets/basicLocaleListResolution.html
  Locale _advancedLocaleListResolution(
    List<Locale>? preferredLocales,
    Iterable<Locale> supportedLocales,
  ) {
    // Setup english locale
    const englishLocale = Locale('en');

    // preferredLocales can be null when called before the platform has had a chance to
    // initialize the locales. Platforms without locale passing support will provide an empty list.
    // We default to english locale in these cases.
    if (preferredLocales == null || preferredLocales.isEmpty) {
      return englishLocale;
    }
    // Hash the supported locales because apps can support many locales and would
    // be expensive to search through them many times.
    final Map<String, Locale> allSupportedLocales = HashMap<String, Locale>();
    final Map<String, Locale> languageAndCountryLocales =
        HashMap<String, Locale>();
    final Map<String, Locale> languageAndScriptLocales =
        HashMap<String, Locale>();
    final Map<String, Locale> languageLocales = HashMap<String, Locale>();
    final Map<String?, Locale> countryLocales = HashMap<String?, Locale>();
    for (final Locale locale in supportedLocales) {
      allSupportedLocales[
              '${locale.languageCode}_${locale.scriptCode}_${locale.countryCode}'] ??=
          locale;
      languageAndScriptLocales[
          '${locale.languageCode}_${locale.scriptCode}'] ??= locale;
      languageAndCountryLocales[
          '${locale.languageCode}_${locale.countryCode}'] ??= locale;
      languageLocales[locale.languageCode] ??= locale;
      countryLocales[locale.countryCode] ??= locale;
    }

    // Since languageCode-only matches are possibly low quality, we don't return
    // it instantly when we find such a match. We check to see if the next
    // preferred locale in the list has a high accuracy match, and only return
    // the languageCode-only match when a higher accuracy match in the next
    // preferred locale cannot be found.
    Locale? matchesLanguageCode;
    Locale? matchesCountryCode;
    // Loop over user's preferred locales
    for (int localeIndex = 0;
        localeIndex < preferredLocales.length;
        localeIndex += 1) {
      final Locale userLocale = preferredLocales[localeIndex];
      // Look for perfect match.
      if (allSupportedLocales.containsKey(
        '${userLocale.languageCode}_${userLocale.scriptCode}_${userLocale.countryCode}',
      )) {
        return userLocale;
      }
      // Look for language+script match.
      if (userLocale.scriptCode != null) {
        final Locale? match = languageAndScriptLocales[
            '${userLocale.languageCode}_${userLocale.scriptCode}'];
        if (match != null) {
          return match;
        }
      }
      // Look for language+country match.
      if (userLocale.countryCode != null) {
        final Locale? match = languageAndCountryLocales[
            '${userLocale.languageCode}_${userLocale.countryCode}'];
        if (match != null) {
          return match;
        }
      }
      // If there was a languageCode-only match in the previous iteration's higher
      // ranked preferred locale, we return it if the current userLocale does not
      // have a better match.
      if (matchesLanguageCode != null) {
        return matchesLanguageCode;
      }
      // Look and store language-only match.
      Locale? match = languageLocales[userLocale.languageCode];
      if (match != null) {
        matchesLanguageCode = match;
        // Since first (default) locale is usually highly preferred, we will allow
        // a languageCode-only match to be instantly matched. If the next preferred
        // languageCode is the same, we defer hastily returning until the next iteration
        // since at worst it is the same and at best an improved match.
        if (localeIndex == 0 &&
            !(localeIndex + 1 < preferredLocales.length &&
                preferredLocales[localeIndex + 1].languageCode ==
                    userLocale.languageCode)) {
          return matchesLanguageCode;
        }
      }
      // countryCode-only match. When all else except default supported locale fails,
      // attempt to match by country only, as a user is likely to be familiar with a
      // language from their listed country.
      if (matchesCountryCode == null && userLocale.countryCode != null) {
        match = countryLocales[userLocale.countryCode];
        if (match != null) {
          matchesCountryCode = match;
        }
      }
    }
    // When there is no languageCode-only match. Fallback to matching countryCode only. Country
    // fallback only applies on iOS. When there is no countryCode-only match, we return english
    // locale.
    final Locale resolvedLocale =
        matchesLanguageCode ?? matchesCountryCode ?? englishLocale;

    return resolvedLocale;
  }
}
