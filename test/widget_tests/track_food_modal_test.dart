import 'package:energize/models/food/food.dart';
import 'package:energize/pages/tab_food/food_page.dart';
import 'package:energize/pages/tab_tracking/track_food_modal.dart';
import 'package:energize/providers/app_settings_provider.dart';
import 'package:energize/providers/body_targets_provider.dart';
import 'package:energize/providers/custom_food_provider.dart';
import 'package:energize/providers/log_provider.dart';
import 'package:energize/providers/tracked_food_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../test_utils/custom_food_database_service_mock.dart';
import '../test_utils/shared_preferences_service_mock.dart';
import '../test_utils/tracked_food_database_service_mock.dart';

void main() {
  testWidgets('TrackFoodModal Widget Tests', (WidgetTester tester) async {
    final mockTrackedFoodDb = TrackedFoodDatabaseServiceMock();
    final mockCustomFoodDb = CustomFoodDatabaseServiceMock();
    final mockSharedPrefs = SharedPreferencesServiceMock();

    final foodToTrack = Food(
      id: Food.generatedId,
      title: 'My food to track',
      origin: FoodPage.originName,
      servingSizes: {
        'l10nServing': 120,
      },
    );

    final modalArgs = ModalArguments(foodToTrack, ModalMode.add);

    final appSettingsProvider = AppSettingsProvider(
      sharedPrefs: SharedPreferencesServiceMock(),
    );

    // Disable prefering serving sizes
    appSettingsProvider.isServingSizePreferred = false;

    // Setup providers and pump Widget
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider(
            create: (_) => LogProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => appSettingsProvider,
          ),
          ChangeNotifierProvider(
            create: (ctx) {
              final logProvider = ctx.read<LogProvider>();

              return TrackedFoodProvider(
                db: mockTrackedFoodDb,
                logger: logProvider,
              );
            },
          ),
          ChangeNotifierProvider(
            create: (ctx) {
              final logProvider = ctx.read<LogProvider>();

              return CustomFoodProvider(
                db: mockCustomFoodDb,
                logger: logProvider,
              );
            },
          ),
          ChangeNotifierProvider(
            create: (_) => BodyTargetsProvider(sharedPrefs: mockSharedPrefs),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: RouteSettings(arguments: modalArgs),
              builder: (context) {
                return const TrackFood();
              },
            );
          },
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
      ),
    );

    // Wait until all frames were drawn
    await tester.pumpAndSettle();

    // Test that no serving size is pre-selected
    final amountWidgets = find.byKey(const Key('amountInputTextField'));
    final amountWidget = tester.widget<TextField>(amountWidgets);
    // Should default to 100 g (the controller value itself is empty)
    expect(amountWidget.controller?.text, equals(''));
    expect(amountWidget.decoration?.hintText, equals('100'));
  });
}
