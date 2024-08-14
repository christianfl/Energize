import 'dart:io';

import 'package:energize/main.dart';
import 'package:energize/models/food/food_tracked.dart';
import 'package:energize/pages/tab_food/food_page.dart';
import 'package:energize/pages/tab_settings/settings_page.dart';
import 'package:energize/pages/tab_tracking/tracking_page.dart';
import 'package:energize/providers/tracked_food_provider.dart';
import 'package:energize/services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  // Main setup
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /// Helper method for taking screenshots.
  ///
  /// Taking Screenshots within integration tests will be improved in the future
  /// See: https://github.com/flutter/flutter/pull/142166#issuecomment-2140837892
  takeAndroidScreenshot(
    String pathAndFilename,
    WidgetTester tester,
    ThemeMode? currentThemeMode,
  ) async {
    if (Platform.isAndroid) {
      // Only supported yet

      // Guard clause - ThemeMode should be dark or light
      if (currentThemeMode == null || currentThemeMode == ThemeMode.system) {
        return;
      }

      final String themeMode = currentThemeMode == ThemeMode.dark
          ? '_dark'
          : currentThemeMode == ThemeMode.light
              ? '_light'
              : '';

      await binding.takeScreenshot('$pathAndFilename$themeMode');
    }
  }

  // Setup variants for DarkMode and LightMode
  final ValueVariant<ThemeMode> themeVariants =
      ValueVariant<ThemeMode>({ThemeMode.dark, ThemeMode.light});

  group('Tracking Page Test', () {
    testWidgets('Tracking Page Screenshots', variant: themeVariants,
        (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(
        MyApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeVariants.currentValue,
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
      final sfcdFoods = SwissFoodCompositionDatabaseBinding.allFoods;
      final avocado =
          sfcdFoods.firstWhere((elem) => elem.title.startsWith('Avocado'));
      final banana =
          sfcdFoods.firstWhere((elem) => elem.title.startsWith('Banane'));
      final apple =
          sfcdFoods.firstWhere((elem) => elem.title.startsWith('Apfel, roh'));
      final oatmeal =
          sfcdFoods.firstWhere((elem) => elem.title.startsWith('Haferflocken'));
      final coconutMilk = sfcdFoods
          .firstWhere((elem) => elem.title.startsWith('Kokosnussmilch'));

      final trackedAvocado = FoodTracked.fromFood(
        avocado,
        FoodTracked.generatedId,
        120,
        now,
        now,
      );
      final trackedBanana = FoodTracked.fromFood(
        banana,
        FoodTracked.generatedId,
        90,
        now,
        now,
      );
      final trackedApple = FoodTracked.fromFood(
        apple,
        FoodTracked.generatedId,
        180,
        now,
        now,
      );
      final trackedOatMeal = FoodTracked.fromFood(
        oatmeal,
        FoodTracked.generatedId,
        100,
        now,
        now,
      );
      final trackedCoconutMilk = FoodTracked.fromFood(
        coconutMilk,
        FoodTracked.generatedId,
        150,
        now,
        now,
      );

      // Add tracked food
      final trackedFoodProvider =
          Provider.of<TrackedFoodProvider>(context, listen: false);
      trackedFoodProvider.addEatenFood(trackedAvocado);
      trackedFoodProvider.addEatenFood(trackedBanana);
      trackedFoodProvider.addEatenFood(trackedApple);
      trackedFoodProvider.addEatenFood(trackedOatMeal);
      trackedFoodProvider.addEatenFood(trackedCoconutMilk);

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // Create and save a screenshot
      await takeAndroidScreenshot(
        'en-US/images/phoneScreenshots/test_1',
        tester,
        themeVariants.currentValue,
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
        'en-US/images/phoneScreenshots/test_2',
        tester,
        themeVariants.currentValue,
      );

      // Remove tracked food
      trackedFoodProvider.removeEatenFood(trackedAvocado.id);
      trackedFoodProvider.removeEatenFood(trackedBanana.id);
      trackedFoodProvider.removeEatenFood(trackedApple.id);
      trackedFoodProvider.removeEatenFood(trackedOatMeal.id);
      trackedFoodProvider.removeEatenFood(trackedCoconutMilk.id);
    });
  });

  group('Custom Food Page Test', () {
    testWidgets('Custom Food Page Screenshot', variant: themeVariants,
        (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(
        MyApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeVariants.currentValue,
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

      // Create and save a screenshot
      await takeAndroidScreenshot(
        'en-US/images/phoneScreenshots/test_3',
        tester,
        themeVariants.currentValue,
      );
    });
  });

  group('Settings Page Test', () {
    testWidgets('Settings Page Screenshot', variant: themeVariants,
        (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(
        MyApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeVariants.currentValue,
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
        'en-US/images/phoneScreenshots/test_4',
        tester,
        themeVariants.currentValue,
      );
    });
  });
}
