/// Holds calculated daily energy and macro targets.
class CalculatedNutritionTargets {
  final double calories;
  final double protein;
  final double carbs;
  final double fat;

  const CalculatedNutritionTargets({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}
