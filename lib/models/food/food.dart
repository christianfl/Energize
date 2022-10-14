import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:uuid/uuid.dart';

import '../../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../../services/food_database_bindings/usda/models/usda_food.dart';
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
  String? ean;
  String? imageUrl;
  String? imageThumbnailUrl;

  /// String: servingName, double: Amount in g per servingName
  @JsonKey(ignore: true)
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

  /// In mg/100 (g or ml)
  double? vitaminA;

  /// In mg/100 (g or ml)
  double? vitaminB1;

  /// In mg/100 (g or ml)
  double? vitaminB2;

  /// In mg/100 (g or ml)
  double? vitaminB3;

  /// In mg/100 (g or ml)
  double? vitaminB5;

  /// In mg/100 (g or ml)
  double? vitaminB6;

  /// In μg/100 (g or ml)
  double? vitaminB7;

  /// In μg/100 (g or ml)
  double? vitaminB9;

  /// In μg/100 (g or ml)
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
    var food = Food(
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
    if (product.nutriments?.energyKcal100g != null) {
      food.calories = product.nutriments!.energyKcal100g!;
    } else {
      if (product.nutriments?.energy != null) {
        var kcal = product.nutriments!.energy! / 4.184;
        food.calories = double.parse(kcal.toStringAsFixed(1));
      } else {
        food.calories = null;
      }
    }

    // Other metadata and macronutrients
    food.ean = product.barcode;
    food.imageUrl = product.imageFrontUrl;
    food.imageThumbnailUrl = product.imageFrontSmallUrl;
    food.protein = product.nutriments?.proteins;
    food.carbs = product.nutriments?.carbohydrates;
    food.fat = product.nutriments?.fat;

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

    // Micronutrients and other
    if (product.nutriments?.vitaminA != null) {
      food.vitaminA = product.nutriments!.vitaminA! * 1000;
    }
    if (product.nutriments?.vitaminB1 != null) {
      food.vitaminB1 = product.nutriments!.vitaminB1! * 1000;
    }
    if (product.nutriments?.vitaminB2 != null) {
      food.vitaminB2 = product.nutriments!.vitaminB2! * 1000;
    }
    if (product.nutriments?.vitaminPP != null) {
      food.vitaminB3 = product.nutriments!.vitaminPP! * 1000;
    }
    if (product.nutriments?.pantothenicAcid != null) {
      food.vitaminB5 = product.nutriments!.pantothenicAcid! * 1000;
    }
    if (product.nutriments?.vitaminB6 != null) {
      food.vitaminB6 = product.nutriments!.vitaminB6! * 1000;
    }
    if (product.nutriments?.biotin != null) {
      food.vitaminB7 = product.nutriments!.biotin! * 1000 * 1000;
    }
    if (product.nutriments?.vitaminB9 != null) {
      food.vitaminB9 = product.nutriments!.vitaminB9! * 1000 * 1000;
    }
    if (product.nutriments?.vitaminB12 != null) {
      food.vitaminB12 = product.nutriments!.vitaminB12! * 1000 * 1000;
    }
    if (product.nutriments?.vitaminC != null) {
      food.vitaminC = product.nutriments!.vitaminC! * 1000;
    }
    if (product.nutriments?.vitaminD != null) {
      food.vitaminD = product.nutriments!.vitaminD! * 1000 * 1000;
    }
    if (product.nutriments?.vitaminE != null) {
      food.vitaminE = product.nutriments!.vitaminE! * 1000;
    }
    if (product.nutriments?.vitaminK != null) {
      food.vitaminK = product.nutriments!.vitaminK! * 1000 * 1000;
    }
    if (product.nutriments?.calcium != null) {
      food.calcium = product.nutriments!.calcium! * 1000;
    }
    if (product.nutriments?.chloride != null) {
      food.chloride = product.nutriments!.chloride! * 1000;
    }
    if (product.nutriments?.magnesium != null) {
      food.magnesium = product.nutriments!.magnesium! * 1000;
    }
    if (product.nutriments?.phosphorus != null) {
      food.phosphorus = product.nutriments!.phosphorus! * 1000;
    }
    if (product.nutriments?.potassium != null) {
      food.potassium = product.nutriments!.potassium! * 1000;
    }
    if (product.nutriments?.sodium != null) {
      food.sodium = product.nutriments!.sodium! * 1000;
    }
    if (product.nutriments?.chromium != null) {
      food.chromium = product.nutriments!.chromium! * 1000 * 1000;
    }
    if (product.nutriments?.iron != null) {
      food.iron = product.nutriments!.iron! * 1000;
    }
    if (product.nutriments?.fluoride != null) {
      food.fluorine = product.nutriments!.fluoride! * 1000;
    }
    if (product.nutriments?.iodine != null) {
      food.iodine = product.nutriments!.iodine! * 1000 * 1000;
    }
    if (product.nutriments?.copper != null) {
      food.copper = product.nutriments!.copper! * 1000;
    }
    if (product.nutriments?.manganese != null) {
      food.manganese = product.nutriments!.manganese! * 1000;
    }
    if (product.nutriments?.molybdenum != null) {
      food.molybdenum = product.nutriments!.molybdenum! * 1000 * 1000;
    }
    if (product.nutriments?.selenium != null) {
      food.selenium = product.nutriments!.selenium! * 1000 * 1000;
    }
    if (product.nutriments?.calcium != null) {
      food.calcium = product.nutriments!.calcium! * 1000;
    }
    if (product.nutriments?.zinc != null) {
      food.zinc = product.nutriments!.zinc! * 1000;
    }

    if (product.nutriments?.monounsaturatedAcid != null) {
      food.monounsaturatedFat = product.nutriments!.monounsaturatedAcid!;
    }
    if (product.nutriments?.polyunsaturatedAcid != null) {
      food.polyunsaturatedFat = product.nutriments!.polyunsaturatedAcid!;
    }
    food.omega3 = product.nutriments?.omega3Fat;
    food.omega6 = product.nutriments?.omega6Fat;
    food.saturatedFat = product.nutriments?.saturatedFat;
    food.transFat = product.nutriments?.transFat;
    if (product.nutriments?.cholesterol != null) {
      food.cholesterol = product.nutriments!.cholesterol! * 1000;
    }

    food.fiber = product.nutriments?.fiber;
    food.sugar = product.nutriments?.sugars;

    // OFF does not support food.sugarAlcohol
    // OFF does not support food.starch
    // OFF does not support food.water

    if (product.nutriments?.caffeine != null) {
      food.caffeine = product.nutriments!.caffeine! * 1000;
    }
    food.alcohol = product.nutriments?.alcohol;

    return food;
  }

  factory Food.fromUSDAFoodProduct(USDAFood usdaFood) {
    double? getTransformedValue(
      String nutrientName,
      USDAFoodNutrientUnit unit,
    ) {
      return usdaFood.foodNutrients
          ?.firstWhereOrNull((nutrient) =>
              nutrient.nutrientName == nutrientName &&
              nutrient.unitName == unit)
          ?.value;
    }

    var food = Food(
      id: generatedId,
      origin: USDABinding.originName,
      title: usdaFood.description ?? '',
    );

    food.calories = getTransformedValue('Energy', USDAFoodNutrientUnit.KCAL);
    food.protein = getTransformedValue('Protein', USDAFoodNutrientUnit.G);
    food.carbs = getTransformedValue(
        'Carbohydrate, by difference', USDAFoodNutrientUnit.G);
    food.fat = getTransformedValue('Total lipid (fat)', USDAFoodNutrientUnit.G);

    // vitaminA

    food.vitaminB1 = getTransformedValue('Thiamin', USDAFoodNutrientUnit.MG);
    food.vitaminB2 = getTransformedValue('Riboflavin', USDAFoodNutrientUnit.MG);
    food.vitaminB3 = getTransformedValue('Niacin', USDAFoodNutrientUnit.MG);

    // vitaminB5

    food.vitaminB6 =
        getTransformedValue('Vitamin B-6', USDAFoodNutrientUnit.MG);

    // vitaminB7
    // vitaminB9

    food.vitaminB12 =
        getTransformedValue('Vitamin B-12', USDAFoodNutrientUnit.UG);
    food.vitaminC = getTransformedValue(
        'Vitamin C, total ascorbic acid', USDAFoodNutrientUnit.MG);
    food.vitaminD =
        getTransformedValue('Vitamin D (D2 + D3)', USDAFoodNutrientUnit.UG);
    food.vitaminE = getTransformedValue(
        'Vitamin E (alpha-tocopherol)', USDAFoodNutrientUnit.MG);
    food.vitaminK = getTransformedValue(
        'Vitamin K (phylloquinone)', USDAFoodNutrientUnit.UG);
    food.calcium = getTransformedValue('Calcium, Ca', USDAFoodNutrientUnit.MG);

    // chloride

    food.magnesium =
        getTransformedValue('Magnesium, Mg', USDAFoodNutrientUnit.MG);
    food.phosphorus =
        getTransformedValue('Phosphorus, P', USDAFoodNutrientUnit.MG);
    food.potassium =
        getTransformedValue('Potassium, K', USDAFoodNutrientUnit.MG);

    food.potassium =
        getTransformedValue('Potassium, K', USDAFoodNutrientUnit.MG);

    food.sodium = getTransformedValue('Sodium, Na', USDAFoodNutrientUnit.MG);

    // chromium

    food.iron = getTransformedValue('Iron, Fe', USDAFoodNutrientUnit.MG);

    // fluorine
    // iodine

    food.copper = getTransformedValue('Copper, Cu', USDAFoodNutrientUnit.MG);

    // manganese
    // molybdenum

    food.selenium =
        getTransformedValue('Selenium, Se', USDAFoodNutrientUnit.MG);

    food.zinc = getTransformedValue('Zinc, Zn', USDAFoodNutrientUnit.MG);

    // monounsaturatedFat
    // polyunsaturatedFat
    // omega3
    // omega6

    food.saturatedFat = getTransformedValue(
        'Fatty acids, total saturated"', USDAFoodNutrientUnit.G);

    // transFat

    food.cholesterol =
        getTransformedValue('Cholesterol', USDAFoodNutrientUnit.G);
    food.fiber =
        getTransformedValue('Fiber, total dietary', USDAFoodNutrientUnit.G);
    food.sugar = getTransformedValue(
        'Sugars, total including NLEA', USDAFoodNutrientUnit.G);

    // sugarAlcohol
    // starch

    food.water = getTransformedValue('Water', USDAFoodNutrientUnit.G);
    food.caffeine = getTransformedValue('Caffeine', USDAFoodNutrientUnit.MG);
    food.alcohol =
        getTransformedValue('Alcohol, ethyl', USDAFoodNutrientUnit.G);

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
