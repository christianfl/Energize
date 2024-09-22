import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:uuid/uuid.dart';

import '../../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../../services/food_database_bindings/usda/models/usda_food.dart';
import '../../services/food_database_bindings/usda/models/usda_food_nutrient.dart';
import '../../services/food_database_bindings/usda/models/usda_food_nutrient_unit.dart';
import '../../services/food_database_bindings/usda/usda_binding.dart';

part 'food.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class Food {
  // #################### Metadata ####################
  String id;
  String title;
  String origin;

  /// Can be any barcode (UPC, EAN, custom)
  String? ean;
  String? imageUrl;
  String? imageThumbnailUrl;

  /// String: servingName, double: Amount in g per servingName
  @JsonKey(
    includeFromJson: false,
    includeToJson: false,
  )
  Map<String, double>? servingSizes;

  // #################### Calories ####################

  /// In kcal/100 (g or ml)
  double? calories;

  // #################### Macronutrients ####################

  /// In g/100 (g or ml)
  double? protein;

  /// In g/100 (g or ml)
  double? carbs;

  /// In g/100 (g or ml)
  double? fat;

  // #################### Vitamins ####################

  /// In mg/100 (g or ml) RAE
  double? vitaminA;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Thiamine
  double? vitaminB1;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Riboflavin
  double? vitaminB2;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Niacin
  double? vitaminB3;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Pantothenic acid
  double? vitaminB5;

  /// In mg/100 (g or ml)
  double? vitaminB6;

  /// In μg/100 (g or ml)
  ///
  /// Alt name: Biotin
  double? vitaminB7;

  /// In μg/100 (g or ml)
  ///
  /// Alt name: Folate
  double? vitaminB9;

  /// In μg/100 (g or ml)
  ///
  /// Alt name: Cobalamin
  double? vitaminB12;

  /// In mg/100 (g or ml)
  double? vitaminC;

  /// In μg/100 (g or ml)
  double? vitaminD;

  /// In mg/100 (g or ml)
  double? vitaminE;

  /// In μg/100 (g or ml)
  double? vitaminK;

  // #################### Major minerals ####################

  /// In mg/100 (g or ml)
  double? calcium;

  /// In mg/100 (g or ml)
  double? chloride;

  /// In mg/100 (g or ml)
  double? magnesium;

  /// In mg/100 (g or ml)
  double? phosphorus;

  /// In mg/100 (g or ml)
  double? potassium;

  /// In mg/100 (g or ml)
  double? sodium;

  // #################### Trace elements ####################

  /// In μg/100 (g or ml)
  double? chromium;

  /// In mg/100 (g or ml)
  double? iron;

  /// In mg/100 (g or ml)
  double? fluorine;

  /// In μg/100 (g or ml)
  double? iodine;

  /// In mg/100 (g or ml)
  double? copper;

  /// In mg/100 (g or ml)
  double? manganese;

  /// In μg/100 (g or ml)
  double? molybdenum;

  /// In μg/100 (g or ml)
  double? selenium;

  /// In mg/100 (g or ml)
  double? zinc;

  // #################### Fats ####################

  /// In g/100 (g or ml)
  double? monounsaturatedFat;

  /// In g/100 (g or ml)
  double? polyunsaturatedFat;

  /// In g/100 (g or ml)
  double? omega3;

  /// In g/100 (g or ml)
  double? omega6;

  /// In g/100 (g or ml)
  double? saturatedFat;

  /// In g/100 (g or ml)
  double? transFat;

  /// In mg/100 (g or ml)
  double? cholesterol;

  // #################### Carbs ####################

  /// In g/100 (g or ml)
  double? fiber;

  /// In g/100 (g or ml)
  double? sugar;

  /// In g/100 (g or ml)
  double? sugarAlcohol;

  /// In g/100 (g or ml)
  double? starch;

  // #################### Other ####################

  /// In ml/100 (g or ml)
  double? water;

  /// In mg/100 (g or ml)
  double? caffeine;

  /// In g/100 (g or ml)
  double? alcohol;

  Food({
    required this.id,
    required this.title,
    required this.origin,
    this.ean,
    this.imageUrl,
    this.imageThumbnailUrl,
    this.servingSizes,
    this.calories,
    this.protein,
    this.carbs,
    this.fat,
    this.vitaminA,
    this.vitaminB1,
    this.vitaminB2,
    this.vitaminB3,
    this.vitaminB5,
    this.vitaminB6,
    this.vitaminB7,
    this.vitaminB9,
    this.vitaminB12,
    this.vitaminC,
    this.vitaminD,
    this.vitaminE,
    this.vitaminK,
    this.calcium,
    this.chloride,
    this.magnesium,
    this.phosphorus,
    this.potassium,
    this.sodium,
    this.chromium,
    this.iron,
    this.fluorine,
    this.iodine,
    this.copper,
    this.manganese,
    this.molybdenum,
    this.selenium,
    this.zinc,
    this.monounsaturatedFat,
    this.polyunsaturatedFat,
    this.omega3,
    this.omega6,
    this.saturatedFat,
    this.transFat,
    this.cholesterol,
    this.fiber,
    this.sugar,
    this.sugarAlcohol,
    this.starch,
    this.water,
    this.caffeine,
    this.alcohol,
  });

  factory Food.fromOpenFoodFactsProduct(Product product) {
    // Returns the value of the given nutrient in the desired unit per 100g or null
    double? getValInUnit(
      Nutrient nutrient, {
      Unit unit = Unit.G,
    }) {
      // Value in G
      double? value =
          product.nutriments?.getValue(nutrient, PerSize.oneHundredGrams);

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
      id: generatedId,
      title: '',
      origin: OpenFoodFactsBinding.originName,
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
    if (product.nutriments
            ?.getValue(Nutrient.energyKCal, PerSize.oneHundredGrams) !=
        null) {
      food.calories = product.nutriments
          ?.getValue(Nutrient.energyKCal, PerSize.oneHundredGrams);
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
    if (product.servingQuantity != null || product.quantity != null) {
      food.servingSizes = {};
    }

    if (product.servingQuantity != null) {
      // MapEntry<String, double> test =
      //     MapEntry<String, double>('serving', product.servingQuantity!);
      // TODO: Fix!
      // food.servingSizes!.putIfAbsent(key, () => null)(test);
    }
    if (product.quantity != null) {
      //food.servingSizes = {'serving': product.servingQuantity!};
    }

    // print(product.servingQuantity);
    // print(product.quantity);
    // Package size / quantity is not supported by OFF server yet

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
    food.monounsaturatedFat =
        getValInUnit(Nutrient.monounsaturatedFat, unit: Unit.G);
    food.polyunsaturatedFat =
        getValInUnit(Nutrient.polyunsaturatedFat, unit: Unit.G);
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

  factory Food.fromUSDAFoodProduct(USDAFood usdaFood) {
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
      if (usdaFoodNutrient?.unitName == null ||
          usdaFoodNutrient?.value == null) {
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
      id: generatedId,
      origin: USDABinding.originName,
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

  int get nutrientCount {
    int count = 0;

    count += calories != null && calories != 0 ? 1 : 0;
    count += protein != null && protein != 0 ? 1 : 0;
    count += carbs != null && carbs != 0 ? 1 : 0;
    count += fat != null && fat != 0 ? 1 : 0;
    count += vitaminA != null && vitaminA != 0 ? 1 : 0;
    count += vitaminB1 != null && vitaminB1 != 0 ? 1 : 0;
    count += vitaminB2 != null && vitaminB2 != 0 ? 1 : 0;
    count += vitaminB3 != null && vitaminB3 != 0 ? 1 : 0;
    count += vitaminB5 != null && vitaminB5 != 0 ? 1 : 0;
    count += vitaminB6 != null && vitaminB6 != 0 ? 1 : 0;
    count += vitaminB7 != null && vitaminB7 != 0 ? 1 : 0;
    count += vitaminB9 != null && vitaminB9 != 0 ? 1 : 0;
    count += vitaminB12 != null && vitaminB12 != 0 ? 1 : 0;
    count += vitaminC != null && vitaminC != 0 ? 1 : 0;
    count += vitaminD != null && vitaminD != 0 ? 1 : 0;
    count += vitaminE != null && vitaminE != 0 ? 1 : 0;
    count += vitaminK != null && vitaminK != 0 ? 1 : 0;
    count += calcium != null && calcium != 0 ? 1 : 0;
    count += chloride != null && chloride != 0 ? 1 : 0;
    count += magnesium != null && magnesium != 0 ? 1 : 0;
    count += phosphorus != null && phosphorus != 0 ? 1 : 0;
    count += potassium != null && potassium != 0 ? 1 : 0;
    count += sodium != null && sodium != 0 ? 1 : 0;
    count += chromium != null && chromium != 0 ? 1 : 0;
    count += iron != null && iron != 0 ? 1 : 0;
    count += fluorine != null && fluorine != 0 ? 1 : 0;
    count += iodine != null && iodine != 0 ? 1 : 0;
    count += copper != null && copper != 0 ? 1 : 0;
    count += manganese != null && manganese != 0 ? 1 : 0;
    count += molybdenum != null && molybdenum != 0 ? 1 : 0;
    count += selenium != null && selenium != 0 ? 1 : 0;
    count += zinc != null && zinc != 0 ? 1 : 0;
    count += monounsaturatedFat != null && monounsaturatedFat != 0 ? 1 : 0;
    count += polyunsaturatedFat != null && polyunsaturatedFat != 0 ? 1 : 0;
    count += omega3 != null && omega3 != 0 ? 1 : 0;
    count += omega6 != null && omega6 != 0 ? 1 : 0;
    count += saturatedFat != null && saturatedFat != 0 ? 1 : 0;
    count += transFat != null && transFat != 0 ? 1 : 0;
    count += cholesterol != null && cholesterol != 0 ? 1 : 0;
    count += fiber != null && fiber != 0 ? 1 : 0;
    count += sugar != null && sugar != 0 ? 1 : 0;
    count += sugarAlcohol != null && sugarAlcohol != 0 ? 1 : 0;
    count += starch != null && starch != 0 ? 1 : 0;
    count += water != null && water != 0 ? 1 : 0;
    count += caffeine != null && caffeine != 0 ? 1 : 0;
    count += alcohol != null && alcohol != 0 ? 1 : 0;

    return count;
  }

  static String get generatedId {
    return const Uuid().v4();
  }

  /// Returns hashCode based on all properties except:
  /// id, origin, ean, imageUrl, imageThumbnailUrl
  /// For food_input.dart in order to remove duplicate food entries.
  /// Did not override hashCode because these objects are not really the same
  /// and that could have introduced unwanted behaviour on other places
  int get customHashCode {
    final attributes = [
      title,
      calories,
      protein,
      carbs,
      fat,
      servingSizes,
      vitaminA,
      vitaminB1,
      vitaminB2,
      vitaminB3,
      vitaminB5,
      vitaminB6,
      vitaminB7,
      vitaminB9,
      vitaminB12,
      vitaminC,
      vitaminD,
      vitaminE,
      vitaminK,
      calcium,
      chloride,
      magnesium,
      phosphorus,
      potassium,
      sodium,
      chromium,
      iron,
      fluorine,
      iodine,
      copper,
      manganese,
      molybdenum,
      selenium,
      zinc,
      monounsaturatedFat,
      polyunsaturatedFat,
      omega3,
      omega6,
      saturatedFat,
      transFat,
      cholesterol,
      fiber,
      sugar,
      sugarAlcohol,
      starch,
      water,
      caffeine,
      alcohol,
    ];

    return Object.hashAll(attributes);
  }

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
