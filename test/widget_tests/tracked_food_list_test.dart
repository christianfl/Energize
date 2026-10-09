import 'package:energize/l10n/app_localizations.dart';
import 'package:energize/models/food/food.dart';
import 'package:energize/models/food/food_tracked.dart';
import 'package:energize/pages/tab_custom_food/custom_food_page.dart';
import 'package:energize/pages/tab_tracking/widgets/tracked_food_list.dart';
import 'package:energize/pages/tab_tracking/widgets/tracked_food_list_item.dart';
import 'package:energize/pages/tab_tracking/widgets/tracked_food_list_item_grouper.dart';
import 'package:energize/providers/app_settings_provider.dart';
import 'package:energize/providers/log_provider.dart';
import 'package:energize/providers/tracked_food_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../test_utils/key_value_storage_service_mock.dart';
import '../test_utils/tracked_food_database_service_mock.dart';

void main() {
  testWidgets('TrackedFoodList Widget Tests', (WidgetTester tester) async {
    final mockTrackedFoodDb = TrackedFoodDatabaseServiceMock();
    FoodTracked? longPressedFood;

    // Setup providers and pump Widget
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider(create: (_) => LogProvider()),
          ChangeNotifierProvider(
            create: (ctx) => AppSettingsProvider(
              keyValueStorage: KeyValueStorageServiceMock(),
              logger: ctx.read<LogProvider>(),
            ),
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
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TrackedFoodList(
                  ScrollController(),
                  () => {},
                  onSelectionToggle: (food) => longPressedFood = food,
                ),
              ],
            ),
          ),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
      ),
    );

    // Get BuildContext
    final BuildContext context = tester.element(find.byType(TrackedFoodList));

    // Deactivate meal grouping
    final appSettings = Provider.of<AppSettingsProvider>(
      context,
      listen: false,
    );
    appSettings.isMealGroupingActivated = false;

    // Set dates
    final now = DateTime(2025, 2, 1, 12, 30);
    final twoHoursAgo = now.subtract(const Duration(hours: 2));

    // Select the date for the tracking overview
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(
      context,
      listen: false,
    );
    await trackedFoodProvider.selectDate(now);
    await tester.pump();

    // Test there are no tracked food items yet in the list
    expect(find.byIcon(Icons.no_food), findsNWidgets(1));

    // Prepare food
    final myFood = FoodTracked(
      id: Food.generatedId,
      amount: 120,
      dateAdded: now,
      dateEaten: now,
      title: 'My tracked food 1',
      origin: CustomFoodPage.originId,
    );
    final myFood2 = FoodTracked(
      id: Food.generatedId,
      amount: 100,
      dateAdded: now,
      dateEaten: now,
      title: 'My tracked food 2',
      origin: CustomFoodPage.originId,
    );
    final myFood3 = FoodTracked(
      id: Food.generatedId,
      amount: 80,
      dateAdded: now,
      dateEaten: twoHoursAgo,
      title: 'My tracked food 3',
      origin: CustomFoodPage.originId,
    );

    // Add tracked food
    trackedFoodProvider.addTrackedFood(myFood);
    trackedFoodProvider.addTrackedFood(myFood2);
    trackedFoodProvider.addTrackedFood(myFood3);

    // Wait until all frames were drawn
    await tester.pumpAndSettle();

    // Test the tracked foods are present
    expect(find.byType(TrackedFoodListItem), findsExactly(3));

    await tester.longPress(find.text('My tracked food 1'));
    expect(longPressedFood, myFood);

    // Activate meal grouping
    appSettings.isMealGroupingActivated = true;

    // Wait until all frames were drawn
    await tester.pumpAndSettle();

    // Test the tracked foods and the grouper are present
    expect(find.byType(TrackedFoodListItem), findsExactly(3));
    expect(find.byType(TrackedFoodListItemGrouper), findsOne);
  });
}
