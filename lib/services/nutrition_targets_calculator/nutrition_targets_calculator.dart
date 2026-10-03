import '../../models/person/enums/sex.dart';
import '../../models/person/enums/weight_target.dart';
import 'calculated_nutrition_targets.dart';

/// Calculator for daily energy and macro targets.
class NutritionTargetsCalculator {
  /// Calculates daily energy and macro targets based on several input factors.
  static CalculatedNutritionTargets calculate({
    required int age,
    required Sex sex,
    required int weight,
    required int height,
    required double activityLevel,
    required WeightTarget weightTarget,
    required double proteinRatio,
    required double carbsRatio,
    required double fatRatio,
  }) {
    final calories = calculateCalories(
      age: age,
      sex: sex,
      weight: weight,
      height: height,
      activityLevel: activityLevel,
      weightTarget: weightTarget,
    );

    return CalculatedNutritionTargets(
      calories: calories,
      protein: calculateMacroTarget(
        calories: calories,
        ratio: proteinRatio,
        kilocaloriesPerGram: 4,
      ),
      carbs: calculateMacroTarget(
        calories: calories,
        ratio: carbsRatio,
        kilocaloriesPerGram: 4,
      ),
      fat: calculateMacroTarget(
        calories: calories,
        ratio: fatRatio,
        kilocaloriesPerGram: 9,
      ),
    );
  }

  /// Calculates the daily energy target using Mifflin-St Jeor.
  ///
  /// Returns daily energy target in kcal.
  static double calculateCalories({
    required int age,
    required Sex sex,
    required int weight,
    required int height,
    required double activityLevel,
    required WeightTarget weightTarget,
  }) {
    final sexFactor = switch (sex) {
      Sex.female => -161,
      Sex.male => 5,
      Sex.notSpecified || Sex.diverse => throw ArgumentError(
        'Selected sex has no calculation reference',
      ),
    };
    final basalMetabolicRate =
        (10 * weight) + (6.25 * height) - (5 * age) + sexFactor;
    final calories =
        basalMetabolicRate * activityLevel * weightTarget.toValue();
    return double.parse(calories.toStringAsFixed(1));
  }

  /// Converts an energy percentage into a daily macro target.
  ///
  /// Returns the daily macro target in g.
  static double calculateMacroTarget({
    required double calories,
    required double ratio,
    required double kilocaloriesPerGram,
  }) {
    final target = calories / kilocaloriesPerGram * (ratio / 100);
    return double.parse(target.toStringAsFixed(1));
  }
}
