import 'dart:io';

import 'package:energize/main.dart';
import 'package:energize/pages/tab_settings/settings_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  takeAndroidScreenshot(String pathAndFilename, WidgetTester tester) async {
    if (!kIsWeb) {
      // Required for all platforms but web
      await binding.convertFlutterSurfaceToImage();

      if (Platform.isAndroid) {
        // Only supported yet

        await binding.takeScreenshot(pathAndFilename);
      }
    }
  }

  group('Tracking Page Test', () {
    // Nothing here yet
  });

  group('Custom Food Page Test', () {
    // Nothing here yet
  });

  group('Settings Page Test', () {
    testWidgets('isLoaded', (WidgetTester tester) async {
      // Load MyApp widget
      await tester.pumpWidget(const MyApp());

      /// Check there are three navigation bar items
      final navigationItems = find.byType(NavigationDestination);
      expect(navigationItems, findsExactly(3));

      // Emulate a tap on Settings navigation item
      await tester.tap(navigationItems.last);

      // Wait for the page to appear
      await tester.pump();

      // Check whether SettingsPage is loaded (last navigation item)
      expect(find.byType(SettingsPage), findsOneWidget);

      // Check whether at least one ListTile is present
      final listTile = find.byType(ListTile);
      expect(listTile, findsAtLeast(1));

      // Create and save a screenshot
      await takeAndroidScreenshot(
        'en-US/images/phoneScreenshots/test',
        tester,
      );
    });
  });
}
