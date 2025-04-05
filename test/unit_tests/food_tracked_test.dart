import 'package:energize/models/food/food_tracked.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FoodTracked trackedApple;

  group('FoodTracked Model Tests', () {
    setUp(() {
      // Create a FoodTracked object
      trackedApple = FoodTracked(
        id: FoodTracked.generatedId,
        title: 'Apple',
        amount: 3,
        calories: 95,
        dateAdded: DateTime(2025, 01, 23, 15, 57),
        dateEaten: DateTime(2025, 01, 23, 15, 42),
        origin: 'CUSTOM',
        servingSizes: {
          'servingA': 26.0,
          'servingB': 52.0,
        },
        selectedServingSize: 'servingA',
      );
    });

    test('Change the selectedServingSize to an invalid value', () {
      expect(
        () {
          trackedApple.selectedServingSize = 'servingC';
        },
        throwsArgumentError,
      );
    });

    test('Test calculated amounts and calories', () {
      expect(trackedApple.amount, 3);
      expect(trackedApple.calories, 95);
      expect(trackedApple.calculatedAmount, 78);
      expect(trackedApple.caloriesPerTrackedAmount, 74.1);
    });
  });
}
