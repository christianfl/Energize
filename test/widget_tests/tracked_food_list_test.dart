import 'package:energize/models/food/food.dart';
import 'package:energize/models/food/food_tracked.dart';
import 'package:energize/pages/tab_food/food_page.dart';
import 'package:energize/pages/tab_tracking/widgets/tracked_food_list.dart';
import 'package:energize/pages/tab_tracking/widgets/tracked_food_list_item.dart';
import 'package:energize/pages/tab_tracking/widgets/tracked_food_list_item_grouper.dart';
import 'package:energize/providers/app_settings_provider.dart';
import 'package:energize/providers/tracked_food_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../test_utils/tracked_food_database_service_mock.dart';

void main() {
  testWidgets('TrackedFoodList Widget Tests', (WidgetTester tester) async {
    final mockTrackedFoodDb = TrackedFoodDatabaseServiceMock();

    // Setup providers and pump Widget
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppSettingsProvider()),
          ChangeNotifierProvider(
            create: (_) => TrackedFoodProvider(db: mockTrackedFoodDb),
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TrackedFoodList(
                  ScrollController(),
                  () => {},
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
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);
    appSettings.isMealGroupingActivated = false;

    // Set dates
    final now = DateTime(2025, 2, 1, 12, 30);
    final twoHoursAgo = now.subtract(const Duration(hours: 2));

    // Select the date for the tracking overview
    final trackedFoodProvider =
        Provider.of<TrackedFoodProvider>(context, listen: false);
    await trackedFoodProvider.selectDate(now);

    // Test there are no tracked food items yet in the list
    expect(find.byIcon(Icons.no_food), findsNWidgets(1));

    // Prepare food
    final myFood = FoodTracked(
      id: Food.generatedId,
      amount: 120,
      dateAdded: now,
      dateEaten: now,
      title: 'My tracked food 1',
      origin: FoodPage.originName,
    );
    final myFood2 = FoodTracked(
      id: Food.generatedId,
      amount: 100,
      dateAdded: now,
      dateEaten: now,
      title: 'My tracked food 2',
      origin: FoodPage.originName,
    );
    final myFood3 = FoodTracked(
      id: Food.generatedId,
      amount: 80,
      dateAdded: now,
      dateEaten: twoHoursAgo,
      title: 'My tracked food 3',
      origin: FoodPage.originName,
    );

    // Add tracked food
    trackedFoodProvider.addTrackedFood(myFood);
    trackedFoodProvider.addTrackedFood(myFood2);
    trackedFoodProvider.addTrackedFood(myFood3);

    // Wait until all frames were drawn
    await tester.pumpAndSettle();

    // Test the tracked foods are present
    expect(find.byType(TrackedFoodListItem), findsExactly(3));

    // Activate meal grouping
    appSettings.isMealGroupingActivated = true;

    // Wait until all frames were drawn
    await tester.pumpAndSettle();

    // Test the tracked foods and the grouper are present
    expect(find.byType(TrackedFoodListItem), findsExactly(3));
    expect(find.byType(TrackedFoodListItemGrouper), findsOne);
  });
}
