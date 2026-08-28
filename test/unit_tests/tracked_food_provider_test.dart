import 'package:energize/models/food/food_tracked.dart';
import 'package:energize/providers/log_provider.dart';
import 'package:energize/providers/tracked_food_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils/tracked_food_database_service_mock.dart';

void main() {
  late TrackedFoodDatabaseServiceMock database;
  late TrackedFoodProvider provider;
  late DateTime selectedDay;
  late FoodTracked meal1;
  late FoodTracked meal2;

  setUp(() async {
    database = TrackedFoodDatabaseServiceMock();
    provider = TrackedFoodProvider(db: database, logger: LogProvider());
    selectedDay = DateTime(2026, 8, 28, 12);
    meal1 = _trackedFood('Meal 1', DateTime(2026, 8, 28, 8, 15, 23));
    meal2 = _trackedFood('Meal 2', DateTime(2026, 8, 28, 19, 45, 51));

    await database.insertAll([meal1, meal2]);
    await provider.selectDate(selectedDay);
  });

  test('copies foods to another day while preserving their times', () async {
    final copies = await provider.copyTrackedFoods([
      meal1,
      meal2,
    ], DateTime(2026, 8, 30));

    expect(copies, hasLength(2));
    expect(copies.map((food) => food.id), isNot(contains(meal1.id)));
    expect(copies[0].dateEaten, DateTime(2026, 8, 30, 8, 15, 23));
    expect(copies[1].dateEaten, DateTime(2026, 8, 30, 19, 45, 51));
    expect(provider.foods, hasLength(2));
    expect(await database.trackedFoods, hasLength(4));

    await provider.removeTrackedFoods(copies);

    expect(await database.trackedFoods, hasLength(2));
  });

  test('moves foods and restores their original dates', () async {
    final originalDates = {meal1: meal1.dateEaten, meal2: meal2.dateEaten};

    await provider.moveTrackedFoods([meal1, meal2], DateTime(2026, 9, 1));

    expect(provider.foods, isEmpty);
    expect(meal1.dateEaten, DateTime(2026, 9, 1, 8, 15, 23));
    expect(meal2.dateEaten, DateTime(2026, 9, 1, 19, 45, 51));

    await provider.restoreTrackedFoodDates(originalDates);

    expect(provider.foods, hasLength(2));
    expect(meal1.dateEaten, DateTime(2026, 8, 28, 8, 15, 23));
    expect(meal2.dateEaten, DateTime(2026, 8, 28, 19, 45, 51));
  });

  test('changes only the tracked time and can restore it', () async {
    final originalDates = {meal1: meal1.dateEaten, meal2: meal2.dateEaten};

    await provider.changeTrackedFoodTime([
      meal1,
      meal2,
    ], const TimeOfDay(hour: 14, minute: 30));

    expect(meal1.dateEaten, DateTime(2026, 8, 28, 14, 30));
    expect(meal2.dateEaten, DateTime(2026, 8, 28, 14, 30));

    await provider.restoreTrackedFoodDates(originalDates);

    expect(meal1.dateEaten, DateTime(2026, 8, 28, 8, 15, 23));
    expect(meal2.dateEaten, DateTime(2026, 8, 28, 19, 45, 51));
  });

  test('removes multiple foods and restores their original entries', () async {
    await provider.removeTrackedFoods([meal1, meal2]);

    expect(provider.foods, isEmpty);
    expect(await database.trackedFoods, isEmpty);

    await provider.restoreTrackedFoods([meal1, meal2]);

    expect(provider.foods, hasLength(2));
    expect(await database.trackedFoods, hasLength(2));
    expect(provider.foods.map((food) => food.id), contains(meal1.id));
    expect(provider.foods.map((food) => food.id), contains(meal2.id));
  });
}

/// Creates a minimal tracked food for provider tests.
FoodTracked _trackedFood(String title, DateTime dateEaten) {
  return FoodTracked(
    id: FoodTracked.generatedId,
    amount: 100,
    dateAdded: dateEaten,
    dateEaten: dateEaten,
    title: title,
    origin: 'CUSTOM',
    calories: 100,
  );
}
