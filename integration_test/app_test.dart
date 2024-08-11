import 'dart:io';

import 'package:energize/main.dart';
import 'package:energize/pages/tab_food/food_page.dart';
import 'package:energize/pages/tab_settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  // Setup
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /// Helper method for taking screenshots.
  ///
  /// Taking Screenshots within integration tests will be improved in the future
  /// See: https://github.com/flutter/flutter/pull/142166#issuecomment-2140837892
  takeAndroidScreenshot(String pathAndFilename, WidgetTester tester) async {
    if (Platform.isAndroid) {
      // Only supported yet

      await binding.takeScreenshot(pathAndFilename);
    }
  }

  group('Tracking Page Test', () {
    // Nothing here yet
  });

  group('Custom Food Page Test', () {
    testWidgets('isLoaded', (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(const MyApp(debugShowCheckedModeBanner: false));

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // This has to be present after tester.pumpAndSettle()
      // See: https://github.com/flutter/flutter/issues/128100#issuecomment-1576334061
      await binding.convertFlutterSurfaceToImage();

      /// Check there are three navigation bar items
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
      );
    });
  });

  group('Settings Page Test', () {
    testWidgets('isLoaded', (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(const MyApp(debugShowCheckedModeBanner: false));

      // Wait until all frames were drawn
      await tester.pumpAndSettle();

      // This has to be present after tester.pumpAndSettle()
      // See: https://github.com/flutter/flutter/issues/128100#issuecomment-1576334061
      await binding.convertFlutterSurfaceToImage();

      /// Check there are three navigation bar items
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
      );
    });
  });
}
