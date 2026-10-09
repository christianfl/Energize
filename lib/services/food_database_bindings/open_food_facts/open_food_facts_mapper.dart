import 'package:openfoodfacts/openfoodfacts.dart';

import '../../../models/food/food.dart';
import 'open_food_facts_binding.dart';

/// Maps an API product to the app food model, including nutrient unit conversions.
Food foodFromOpenFoodFactsProduct(Product product) {
  // Returns the value of the given nutrient in the desired unit per 100g or null
  double? getValInUnit(Nutrient nutrient, {Unit unit = Unit.G}) {
    // Value in G
    double? value = product.nutriments?.getValue(
      nutrient,
      PerSize.oneHundredGrams,
    );

    // Conversion of vol % in g because alcohol value is not stored in G within OFF
    if (value != null && nutrient == Nutrient.alcohol) {
      value *= 7.89;
    }

    if (value == null) {
      return null;
    } else if (unit == Unit.G) {
      return value;
    } else if (unit == Unit.MILLI_G) {
      return value * 1000;
    } else if (unit == Unit.MICRO_G) {
      return value * 1000 * 1000;
    } else {
      throw UnimplementedError('This unit conversion is not implemented');
    }
  }

  final food = Food(
    id: Food.generatedId,
    title: '',
    origin: OpenFoodFactsBinding.originId,
  );

  // Title
  food.title = product.brands ?? '';
  if (product.brands != null && product.productName != null) {
    food.title += ' ';
  }
  if (product.productName != null) food.title += product.productName!;

  // Make sure there are no leading or trailing whitespaces
  food.title = food.title.trim();

  // Calories
  if (product.nutriments?.getValue(
        Nutrient.energyKCal,
        PerSize.oneHundredGrams,
      ) !=
      null) {
    food.calories = product.nutriments?.getValue(
      Nutrient.energyKCal,
      PerSize.oneHundredGrams,
    );
  } else {
    if (product.nutriments?.getComputedKJ(PerSize.oneHundredGrams) != null) {
      final kcal =
          product.nutriments!.getComputedKJ(PerSize.oneHundredGrams)! / 4.184;
      food.calories = double.parse(kcal.toStringAsFixed(1));
    } else {
      food.calories = null;
    }
  }

  // Other metadata and macronutrients
  food.ean = product.barcode;
  food.imageUrl = product.imageFrontUrl;
  food.imageThumbnailUrl = product.imageFrontSmallUrl;
  food.protein = getValInUnit(Nutrient.proteins, unit: Unit.G);
  food.carbs = getValInUnit(Nutrient.carbohydrates, unit: Unit.G);
  food.fat = getValInUnit(Nutrient.fat, unit: Unit.G);

  // Fill serving size with serving and package size
  if (product.quantity != null || product.servingSize != null) {
    final Map<String, double> servingSizes = {};

    /// Basic parsing of Serving sizes from Open Food Facts
    ///
    /// [servingStringOFF] can be e.g.: "30 g", "10 ml", "20 x 30 bottles"
    /// Ignores multipliers and only supports: g, mg, l, ml
    ///
    /// Returns the parsed double in g
    double? parseOFFServingSize(String servingStringOFF) {
      // Normalize input (remove spaces and convert to lowercase)
      final String normalizedServing = servingStringOFF
          .replaceAll(' ', '')
          .toLowerCase();

      double? parseVal(String str, String unit, double factor) {
        if (str.contains(unit)) {
          // Remove the unit
          final String numPart = str.replaceAll(unit, '');
          final double? value = double.tryParse(numPart);

          if (value != null && value.isFinite && value > 0) {
            return value * factor;
          }
        }

        return null;
      }

      return parseVal(normalizedServing, 'mg', 1 / 1000) ?? // 1000 mg = 1 g
          parseVal(normalizedServing, 'g', 1) ?? // g
          parseVal(normalizedServing, 'ml', 1) ?? // ml assumed ≈ g
          parseVal(normalizedServing, 'l', 1000); // l assumed ≈ 1000 g
    }

    if (product.quantity != null) {
      // Whole package
      final packageInG = parseOFFServingSize(product.quantity!);
      if (packageInG != null) {
        servingSizes['l10nPackage'] = packageInG;
      }
    }
    if (product.servingSize != null) {
      // 1 Serving
      final servingInG = parseOFFServingSize(product.servingSize!);
      if (servingInG != null) {
        servingSizes['l10nServing'] = servingInG;
      }
    }

    // food.servingSizes should never be empty if not null
    if (servingSizes.isNotEmpty) {
      food.servingSizes = servingSizes;
    }
  }

  // Vitamins
  food.vitaminA = getValInUnit(Nutrient.vitaminA, unit: Unit.MILLI_G);
  food.vitaminB1 = getValInUnit(Nutrient.vitaminB1, unit: Unit.MILLI_G);
  food.vitaminB2 = getValInUnit(Nutrient.vitaminB2, unit: Unit.MILLI_G);
  food.vitaminB3 = getValInUnit(Nutrient.vitaminPP, unit: Unit.MILLI_G);
  food.vitaminB5 = getValInUnit(Nutrient.pantothenicAcid, unit: Unit.MILLI_G);
  food.vitaminB6 = getValInUnit(Nutrient.vitaminB6, unit: Unit.MILLI_G);
  food.vitaminB7 = getValInUnit(Nutrient.biotin, unit: Unit.MICRO_G);
  food.vitaminB9 = getValInUnit(Nutrient.vitaminB9, unit: Unit.MICRO_G);
  food.vitaminB12 = getValInUnit(Nutrient.vitaminB12, unit: Unit.MICRO_G);
  food.vitaminC = getValInUnit(Nutrient.vitaminC, unit: Unit.MILLI_G);
  food.vitaminD = getValInUnit(Nutrient.vitaminD, unit: Unit.MICRO_G);
  food.vitaminE = getValInUnit(Nutrient.vitaminE, unit: Unit.MILLI_G);
  food.vitaminK = getValInUnit(Nutrient.vitaminK, unit: Unit.MICRO_G);

  // Minerals
  food.calcium = getValInUnit(Nutrient.calcium, unit: Unit.MILLI_G);
  food.chloride = getValInUnit(Nutrient.chloride, unit: Unit.MILLI_G);
  food.magnesium = getValInUnit(Nutrient.magnesium, unit: Unit.MILLI_G);
  food.phosphorus = getValInUnit(Nutrient.phosphorus, unit: Unit.MILLI_G);
  food.potassium = getValInUnit(Nutrient.potassium, unit: Unit.MILLI_G);
  food.sodium = getValInUnit(Nutrient.sodium, unit: Unit.MILLI_G);
  food.chromium = getValInUnit(Nutrient.chromium, unit: Unit.MICRO_G);
  food.iron = getValInUnit(Nutrient.iron, unit: Unit.MILLI_G);
  food.fluorine = getValInUnit(Nutrient.fluoride, unit: Unit.MILLI_G);
  food.iodine = getValInUnit(Nutrient.iodine, unit: Unit.MICRO_G);
  food.copper = getValInUnit(Nutrient.copper, unit: Unit.MILLI_G);
  food.manganese = getValInUnit(Nutrient.manganese, unit: Unit.MILLI_G);
  food.molybdenum = getValInUnit(Nutrient.molybdenum, unit: Unit.MICRO_G);
  food.selenium = getValInUnit(Nutrient.selenium, unit: Unit.MICRO_G);
  food.calcium = getValInUnit(Nutrient.calcium, unit: Unit.MILLI_G);
  food.zinc = getValInUnit(Nutrient.zinc, unit: Unit.MILLI_G);

  // Fats
  food.monounsaturatedFat = getValInUnit(
    Nutrient.monounsaturatedFat,
    unit: Unit.G,
  );
  food.polyunsaturatedFat = getValInUnit(
    Nutrient.polyunsaturatedFat,
    unit: Unit.G,
  );
  food.omega3 = getValInUnit(Nutrient.omega3, unit: Unit.G);
  food.omega6 = getValInUnit(Nutrient.omega6, unit: Unit.G);
  food.saturatedFat = getValInUnit(Nutrient.saturatedFat, unit: Unit.G);
  food.transFat = getValInUnit(Nutrient.transFat, unit: Unit.G);
  food.cholesterol = getValInUnit(Nutrient.cholesterol, unit: Unit.MILLI_G);

  // Carbs
  food.fiber = getValInUnit(Nutrient.fiber, unit: Unit.G);
  food.sugar = getValInUnit(Nutrient.sugars, unit: Unit.G);
  // OFF does not support food.sugarAlcohol
  // OFF does not support food.starch

  // Other
  // OFF does not support food.water
  food.caffeine = getValInUnit(Nutrient.caffeine, unit: Unit.MILLI_G);
  food.alcohol = getValInUnit(Nutrient.alcohol, unit: Unit.G);

  return food;
}
