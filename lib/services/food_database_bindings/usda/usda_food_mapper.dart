import 'package:collection/collection.dart';

import '../../../models/food/food.dart';
import 'models/usda_food.dart';
import 'models/usda_food_nutrient.dart';
import 'models/usda_food_nutrient_unit.dart';
import 'usda_binding.dart';

/// Maps an API product to the app food model, including nutrient unit conversions.
Food foodFromUSDAFoodProduct(USDAFood usdaFood) {
  double? getNutrientValue({
    required String usdaNutrientName,
    required USDAFoodNutrientUnit targetUnit,
  }) {
    USDAFoodNutrient? usdaFoodNutrient;

    // Prefer original value in kcal over kJ, so no conversion is needed
    // nutrientName 'Energy' can be both provided in kcal and kJ
    if (targetUnit == USDAFoodNutrientUnit.KCAL) {
      usdaFoodNutrient = usdaFood.foodNutrients?.firstWhereOrNull(
        (nutrient) =>
            nutrient.nutrientName == usdaNutrientName &&
            nutrient.unitName == targetUnit,
      );
    } else {
      // Match USDAFoodNutrient only on foodNutrients.nutrientName
      usdaFoodNutrient = usdaFood.foodNutrients?.firstWhereOrNull(
        (nutrient) => nutrient.nutrientName == usdaNutrientName,
      );
    }

    // Both must be present in order to have a valid value
    if (usdaFoodNutrient?.unitName == null || usdaFoodNutrient?.value == null) {
      return null;
    }

    // Do conversions in all possible directions
    switch (usdaFoodNutrient!.unitName) {
      case null:
        return null;
      case USDAFoodNutrientUnit.G:
        switch (targetUnit) {
          case USDAFoodNutrientUnit.G:
            return usdaFoodNutrient.value;
          case USDAFoodNutrientUnit.MG:
            return usdaFoodNutrient.value! * 1000;
          case USDAFoodNutrientUnit.UG:
            return usdaFoodNutrient.value! * 1000 * 1000;
          default:
            return null;
        }
      case USDAFoodNutrientUnit.KCAL:
        switch (targetUnit) {
          case USDAFoodNutrientUnit.KCAL:
            return usdaFoodNutrient.value;
          case USDAFoodNutrientUnit.kJ:
            return usdaFoodNutrient.value! * 4.184;
          default:
            return null;
        }
      case USDAFoodNutrientUnit.MG:
        switch (targetUnit) {
          case USDAFoodNutrientUnit.G:
            return usdaFoodNutrient.value! / 1000;
          case USDAFoodNutrientUnit.MG:
            return usdaFoodNutrient.value;
          case USDAFoodNutrientUnit.UG:
            return usdaFoodNutrient.value! * 1000;
          default:
            return null;
        }
      case USDAFoodNutrientUnit.UG:
        switch (targetUnit) {
          case USDAFoodNutrientUnit.G:
            return usdaFoodNutrient.value! / 1000 / 1000;
          case USDAFoodNutrientUnit.MG:
            return usdaFoodNutrient.value! / 1000;
          case USDAFoodNutrientUnit.UG:
            return usdaFoodNutrient.value;
          default:
            return null;
        }
      case USDAFoodNutrientUnit.IU:
        switch (targetUnit) {
          case USDAFoodNutrientUnit.IU:
            return usdaFoodNutrient.value;
          default:
            return null;
        }
      case USDAFoodNutrientUnit.kJ:
        switch (targetUnit) {
          case USDAFoodNutrientUnit.kJ:
            return usdaFoodNutrient.value;
          case USDAFoodNutrientUnit.KCAL:
            return usdaFoodNutrient.value! * 0.239006;
          default:
            return null;
        }
    }
  }

  // Create Food object
  final food = Food(
    id: Food.generatedId,
    origin: USDABinding.originId,
    title: usdaFood.description ?? '',
  );

  // Set all supported nutrients
  // Field names from: https://fdc.nal.usda.gov/download-datasets.html
  food.calories = getNutrientValue(
    usdaNutrientName: 'Energy',
    targetUnit: USDAFoodNutrientUnit.KCAL,
  );
  food.protein = getNutrientValue(
    usdaNutrientName: 'Protein',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.carbs = getNutrientValue(
    usdaNutrientName: 'Carbohydrate, by difference',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.fat = getNutrientValue(
    usdaNutrientName: 'Total lipid (fat)',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.vitaminA = getNutrientValue(
    usdaNutrientName: 'Vitamin A, RAE',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminB1 = getNutrientValue(
    usdaNutrientName: 'Thiamin',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminB2 = getNutrientValue(
    usdaNutrientName: 'Riboflavin',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminB3 = getNutrientValue(
    usdaNutrientName: 'Niacin',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminB5 = getNutrientValue(
    usdaNutrientName: 'Pantothenic acid',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminB6 = getNutrientValue(
    usdaNutrientName: 'Vitamin B-6',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminB7 = getNutrientValue(
    usdaNutrientName: 'Biotin',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.vitaminB9 = getNutrientValue(
    usdaNutrientName: 'Folate, total',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.vitaminB12 = getNutrientValue(
    usdaNutrientName: 'Vitamin B-12',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.vitaminC = getNutrientValue(
    usdaNutrientName: 'Vitamin C, total ascorbic acid',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminD = getNutrientValue(
    usdaNutrientName: 'Vitamin D (D2 + D3)',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.vitaminE = getNutrientValue(
    usdaNutrientName: 'Vitamin E (alpha-tocopherol)',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.vitaminK = getNutrientValue(
    usdaNutrientName: 'Vitamin K (phylloquinone)',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.calcium = getNutrientValue(
    usdaNutrientName: 'Calcium, Ca',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  // Not supported: chloride
  food.magnesium = getNutrientValue(
    usdaNutrientName: 'Magnesium, Mg',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.phosphorus = getNutrientValue(
    usdaNutrientName: 'Phosphorus, P',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.potassium = getNutrientValue(
    usdaNutrientName: 'Potassium, K',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.sodium = getNutrientValue(
    usdaNutrientName: 'Sodium, Na',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.chromium = getNutrientValue(
    usdaNutrientName: 'Chromium, Cr',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.iron = getNutrientValue(
    usdaNutrientName: 'Iron, Fe',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  // Not supported: fluorine
  // Instead supported: Fluoride, F
  food.iodine = getNutrientValue(
    usdaNutrientName: 'Iodine, I',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.copper = getNutrientValue(
    usdaNutrientName: 'Copper, Cu',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.manganese = getNutrientValue(
    usdaNutrientName: 'Manganese, Mn',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.molybdenum = getNutrientValue(
    usdaNutrientName: 'Molybdenum, Mo',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.selenium = getNutrientValue(
    usdaNutrientName: 'Selenium, Se',
    targetUnit: USDAFoodNutrientUnit.UG,
  );
  food.zinc = getNutrientValue(
    usdaNutrientName: 'Zinc, Zn',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.monounsaturatedFat = getNutrientValue(
    usdaNutrientName: 'Fatty acids, total monounsaturated',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.polyunsaturatedFat = getNutrientValue(
    usdaNutrientName: 'Fatty acids, total polyunsaturated',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  // Not supported: omega3
  // Instead, components of omega3 are present:
  // - DHA
  // - EPA
  // - ALA
  // Not supported: omega6
  food.saturatedFat = getNutrientValue(
    usdaNutrientName: 'Fatty acids, total saturated',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.transFat = getNutrientValue(
    usdaNutrientName: 'Fatty acids, total trans',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.cholesterol = getNutrientValue(
    usdaNutrientName: 'Cholesterol',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.fiber = getNutrientValue(
    usdaNutrientName: 'Fiber, total dietary',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.sugar = getNutrientValue(
    usdaNutrientName: 'Sugars, total including NLEA',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.sugarAlcohol = getNutrientValue(
    usdaNutrientName: 'Total sugar alcohols',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.starch = getNutrientValue(
    usdaNutrientName: 'Starch',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.water = getNutrientValue(
    usdaNutrientName: 'Water',
    targetUnit: USDAFoodNutrientUnit.G,
  );
  food.caffeine = getNutrientValue(
    usdaNutrientName: 'Caffeine',
    targetUnit: USDAFoodNutrientUnit.MG,
  );
  food.alcohol = getNutrientValue(
    usdaNutrientName: 'Alcohol, ethyl',
    targetUnit: USDAFoodNutrientUnit.G,
  );

  return food;
}
