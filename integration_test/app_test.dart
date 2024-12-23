import 'dart:io';

import 'package:energize/main.dart';
import 'package:energize/models/food/food.dart';
import 'package:energize/models/food/food_tracked.dart';
import 'package:energize/models/person/enums/sex.dart';
import 'package:energize/pages/tab_food/food_page.dart';
import 'package:energize/pages/tab_settings/settings_page.dart';
import 'package:energize/pages/tab_tracking/tracking_page.dart';
import 'package:energize/providers/app_settings.dart';
import 'package:energize/providers/custom_food_provider.dart';
import 'package:energize/providers/tracked_food_provider.dart';
import 'package:energize/services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import 'package:energize/services/micronutrients_recommendations/micronutrients_recommendations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

/// Setup test variants for screenshots.
///
/// For screenshotting each locale with each theme.
class EnergizeTestVariant {
  final ThemeMode themeMode;
  final Locale locale;

  EnergizeTestVariant({
    required this.themeMode,
    required this.locale,
  });
}

void main() {
  // Main setup
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Enter full screen for screenshots
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  /// Helper method for taking screenshots.
  ///
  /// Taking Screenshots within integration tests will be improved in the future
  /// See: https://github.com/flutter/flutter/pull/142166#issuecomment-2140837892
  takeAndroidScreenshot(
    String fileName,
    WidgetTester tester,
    EnergizeTestVariant? currentVariant,
  ) async {
    if (Platform.isAndroid) {
      // Only supported yet

      final currentTheme = currentVariant?.themeMode;

      // Guard clause - ThemeMode should be dark or light
      if (currentTheme == null || currentTheme == ThemeMode.system) {
        return;
      }

      final locale = currentVariant?.locale;

      final String themeMode = currentTheme == ThemeMode.dark
          ? 'dark'
          : currentTheme == ThemeMode.light
              ? 'light'
              : '';

      await binding.takeScreenshot(
        '$locale/images/phoneScreenshots/${fileName}_$themeMode',
      );
    }
  }

  // Setup Test Variants
  // Create screenshots for each language and themeMode
  final List<EnergizeTestVariant> testVariants = [];
  const supportedLocales = AppLocalizations.supportedLocales;
  const List<ThemeMode> supportedThemeModes = [ThemeMode.dark, ThemeMode.light];

  for (final locale in supportedLocales) {
    for (final themeMode in supportedThemeModes) {
      testVariants.add(
        EnergizeTestVariant(
          themeMode: themeMode,
          locale: locale,
        ),
      );
    }
  }

  final valueVariants = ValueVariant<EnergizeTestVariant>({...testVariants});

  group('Tracking Page Test', () {
    testWidgets('Tracking Page Screenshots', variant: valueVariants,
        (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(
        MyApp(
          debugShowCheckedModeBanner: false,
          themeMode: valueVariants.currentValue?.themeMode,
          locale: valueVariants.currentValue?.locale,
        ),
      );

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // This has to be present after tester.pumpAndSettle()
      // See: https://github.com/flutter/flutter/issues/128100#issuecomment-1576334061
      await binding.convertFlutterSurfaceToImage();

      // Check whether TrackingPage is loaded
      expect(find.byType(TrackingPage), findsOneWidget);

      // Get BuildContext
      final BuildContext context = tester.element(find.byType(TrackingPage));

      // Prepare tracked Food
      final now = DateTime.now();

      // Prepare food from Swiss Food Composition Database
      final breadSearch = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Brown bread',
        const Locale('en'),
      );
      final bread = breadSearch!.first;

      final scrambledEggsSearch =
          await SwissFoodCompositionDatabaseBinding.searchFood(
        'scrambled eggs',
        const Locale('en'),
      );
      final scrambledEggs = scrambledEggsSearch!.first;

      final appleSearch = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Apple, fresh',
        const Locale('en'),
      );
      final apple = appleSearch![1];

      final pastaSearch = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Durum wheat semolina',
        const Locale('en'),
      );
      final pasta = pastaSearch!.first;

      final pestoSearch = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Pesto sauce',
        const Locale('en'),
      );
      final pesto = pestoSearch!.first;

      final parmesanSearch =
          await SwissFoodCompositionDatabaseBinding.searchFood(
        'parmesan cheese',
        const Locale('en'),
      );
      final parmesan = parmesanSearch!.first;

      final trackedBread = FoodTracked.fromFood(
        bread,
        FoodTracked.generatedId,
        120,
        DateTime.now().copyWith(hour: 8, minute: 30),
        now,
      );
      final trackedEggs = FoodTracked.fromFood(
        scrambledEggs,
        FoodTracked.generatedId,
        150,
        DateTime.now().copyWith(hour: 8, minute: 30),
        now,
      );
      final trackedApple = FoodTracked.fromFood(
        apple,
        FoodTracked.generatedId,
        120,
        DateTime.now().copyWith(hour: 10, minute: 30),
        now,
      );
      final trackedPasta = FoodTracked.fromFood(
        pasta,
        FoodTracked.generatedId,
        150,
        DateTime.now().copyWith(hour: 13, minute: 30),
        now,
      );
      final trackedPesto = FoodTracked.fromFood(
        pesto,
        FoodTracked.generatedId,
        50,
        DateTime.now().copyWith(hour: 13, minute: 30),
        now,
      );
      final trackedParmesan = FoodTracked.fromFood(
        parmesan,
        FoodTracked.generatedId,
        20,
        DateTime.now().copyWith(hour: 13, minute: 30),
        now,
      );

      // Activate meal grouping
      final appSettings = Provider.of<AppSettings>(context, listen: false);
      appSettings.isMealGroupingActivated = true;

      // Add tracked food
      final trackedFoodProvider =
          Provider.of<TrackedFoodProvider>(context, listen: false);
      trackedFoodProvider.addEatenFood(trackedBread);
      trackedFoodProvider.addEatenFood(trackedEggs);
      trackedFoodProvider.addEatenFood(trackedApple);
      trackedFoodProvider.addEatenFood(trackedPasta);
      trackedFoodProvider.addEatenFood(trackedPesto);
      trackedFoodProvider.addEatenFood(trackedParmesan);

      final appSettingsProvider =
          Provider.of<AppSettings>(context, listen: false);

      // Set calories and macro targets
      appSettingsProvider.caloriesTarget = 2000;
      appSettingsProvider.proteinTarget = 120;
      appSettingsProvider.carbsTarget = 220;
      appSettingsProvider.fatTarget = 70;

      // Set micro targets
      MicronutrientsRecommendations.setRecommendedNutritionAsTargets(
        appSettingsProvider,
        20,
        Sex.female,
      );

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // Create and save a screenshot

      await takeAndroidScreenshot(
        '1',
        tester,
        valueVariants.currentValue,
      );

      // Go to detailed view next...

      // Check there is a PopupMenuButton
      final button = find.byType(PopupMenuButton<int>);
      expect(button, findsOne);

      // Emulate a tap on the PopupMenuButton
      await tester.tap(button);

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // Check there are at least two menu items
      final menuItems = find.byType(PopupMenuItem<int>);
      expect(menuItems, findsAtLeast(2));

      // Emulate a tap on the first PopupMenuButton (detailed summary)
      await tester.tap(menuItems.first);

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // Create and save a screenshot
      await takeAndroidScreenshot(
        '2',
        tester,
        valueVariants.currentValue,
      );

      // Remove tracked food
      for (final food in trackedFoodProvider.foods) {
        trackedFoodProvider.removeEatenFood(food.id);
      }
    });
  });

  group('Custom Food Page Test', () {
    testWidgets('Custom Food Page Screenshot', variant: valueVariants,
        (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(
        MyApp(
          debugShowCheckedModeBanner: false,
          themeMode: valueVariants.currentValue?.themeMode,
          locale: valueVariants.currentValue?.locale,
        ),
      );

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // This has to be present after tester.pumpAndSettle()
      // See: https://github.com/flutter/flutter/issues/128100#issuecomment-1576334061
      await binding.convertFlutterSurfaceToImage();

      // Check there are three navigation bar items
      final navigationItems = find.byType(NavigationDestination);
      expect(navigationItems, findsExactly(3));

      // Emulate a tap on Custom Foods navigation item
      await tester.tap(navigationItems.at(1));

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // Check whether FoodPage is loaded (second navigation item)
      expect(find.byType(FoodPage), findsOneWidget);

      // Get BuildContext
      final BuildContext context = tester.element(find.byType(FoodPage));

      final customFoodProvider =
          Provider.of<CustomFoodProvider>(context, listen: false);

      // Add custom food
      final customFood1 = Food(
        id: Food.generatedId,
        title: 'Rosinenbrötchen',
        origin: 'CUSTOM',
        calories: 480,
      );
      final customFood2 = Food(
        id: Food.generatedId,
        title: 'Käsespätzle',
        origin: 'CUSTOM',
        calories: 300,
        carbs: 40,
        fat: 20,
      );
      final customFood3 = Food(
        id: Food.generatedId,
        title: 'Tiroler Kasnocken',
        origin: 'CUSTOM',
        calories: 290,
      );
      final customFood4 = Food(
        id: Food.generatedId,
        title: 'Custom Cola Zero',
        origin: 'CUSTOM',
        calories: 1,
      );
      customFoodProvider.addFood(customFood1);
      customFoodProvider.addFood(customFood2);
      customFoodProvider.addFood(customFood3);
      customFoodProvider.addFood(customFood4);

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // Create and save a screenshot
      await takeAndroidScreenshot(
        '3',
        tester,
        valueVariants.currentValue,
      );

      // Remove custom food
      for (final food in customFoodProvider.foods) {
        customFoodProvider.removeFood(food.id);
      }
    });
  });

  group('Settings Page Test', () {
    testWidgets('Settings Page Screenshot', variant: valueVariants,
        (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(
        MyApp(
          debugShowCheckedModeBanner: false,
          themeMode: valueVariants.currentValue?.themeMode,
          locale: valueVariants.currentValue?.locale,
        ),
      );

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // This has to be present after tester.pumpAndSettle()
      // See: https://github.com/flutter/flutter/issues/128100#issuecomment-1576334061
      await binding.convertFlutterSurfaceToImage();

      // Check there are three navigation bar items
      final navigationItems = find.byType(NavigationDestination);
      expect(navigationItems, findsExactly(3));

      // Emulate a tap on Settings navigation item
      await tester.tap(navigationItems.last);

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // Check whether SettingsPage is loaded (last navigation item)
      expect(find.byType(SettingsPage), findsOneWidget);

      // Check whether at least one ListTile is present
      final listTile = find.byType(ListTile);
      expect(listTile, findsAtLeast(1));

      // Create and save a screenshot
      await takeAndroidScreenshot(
        '4',
        tester,
        valueVariants.currentValue,
      );
    });
  });
}
