import 'package:energize/models/person/enums/sex.dart';
import 'package:energize/models/person/enums/weight_target.dart';
import 'package:energize/services/nutrition_targets_calculator/nutrition_targets_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('calculates energy and macros for: male, slightly gaining weight', () {
    final targets = NutritionTargetsCalculator.calculate(
      age: 20,
      sex: Sex.male,
      weight: 80,
      height: 180,
      activityLevel: 1.4,
      weightTarget: WeightTarget.slightGain,
      proteinRatio: 20,
      carbsRatio: 50,
      fatRatio: 30,
    );

    expect(targets.calories, 2818.2);
    expect(targets.protein, 140.9);
    expect(targets.carbs, 352.3);
    expect(targets.fat, 93.9);
  });

  test('calculates energy and macros for: female, maintaining weight', () {
    final targets = NutritionTargetsCalculator.calculate(
      age: 25,
      sex: Sex.female,
      weight: 70,
      height: 170,
      activityLevel: 1.6,
      weightTarget: WeightTarget.maintaining,
      proteinRatio: 30,
      carbsRatio: 50,
      fatRatio: 20,
    );

    expect(targets.calories, 2362.4);
    expect(targets.protein, 177.2);
    expect(targets.carbs, 295.3);
    expect(targets.fat, 52.5);
  });

  test('rejects sex selections without calculation references', () {
    for (final sex in [Sex.notSpecified, Sex.diverse]) {
      expect(
        () => NutritionTargetsCalculator.calculate(
          age: 20,
          sex: sex,
          weight: 80,
          height: 180,
          activityLevel: 1.4,
          weightTarget: WeightTarget.maintaining,
          proteinRatio: 20,
          carbsRatio: 50,
          fatRatio: 30,
        ),
        throwsArgumentError,
      );
    }
  });
}
