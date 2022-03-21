import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:uuid/uuid.dart';

import 'SNDB.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  // Gets generated during runtime out of SNDB.dart (CSV)
  static List<Food> _sndb = [];

  static const openFoodFactsImageUrl = 'assets/food_databases/off.png';
  static const openFoodFactsTermsUrl =
      'https://world.openfoodfacts.org/terms-of-use';
  static const openFoodFactsContributeUrl =
      'https://world.openfoodfacts.org/contribute';
  static const openFoodFactsProductUrl = 'https://openfoodfacts.org/product/';
  static const swissNutritionDatabaseImageUrl =
      'assets/food_databases/sndb.png';
  static const swissNutritionDatabaseUrl = 'https://naehrwertdaten.ch/de/';

  // #################### Metadata ####################
  String id;
  String title;
  String origin;
  String? ean;
  String? imageUrl;
  String? imageThumbnailUrl;

  /// String: servingName, double: Amount in g per servingName
  Map<String, double>? servingSizes;

  // #################### Calories ####################

  /// In g/100 (g or ml)
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

  /// In g/100 (g or ml)
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
    var food = Food(id: generatedId, title: '', origin: 'OFF');

    // Title
    food.title = product.brands ?? '';
    if (product.brands != null && product.productName != null)
      food.title += ' ';
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
    food.ean = product.barcode ?? null;
    food.imageUrl = product.imageFrontUrl ?? null;
    food.imageThumbnailUrl = product.imageFrontSmallUrl ?? null;
    food.protein = product.nutriments?.proteins ?? null;
    food.carbs = product.nutriments?.carbohydrates ?? null;
    food.fat = product.nutriments?.fat ?? null;

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
      food.sodium = product.nutriments!.sodium!;
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
    food.omega3 = product.nutriments?.omega3Fat ?? null;
    food.omega6 = product.nutriments?.omega6Fat ?? null;
    food.saturatedFat = product.nutriments?.saturatedFat ?? null;
    food.transFat = product.nutriments?.transFat ?? null;
    if (product.nutriments?.cholesterol != null) {
      food.cholesterol = product.nutriments!.cholesterol! * 1000;
    }

    food.fiber = product.nutriments?.fiber ?? null;
    food.sugar = product.nutriments?.sugars ?? null;

    // OFF does not support food.sugarAlcohol
    // OFF does not support food.starch
    // OFF does not support food.water

    if (product.nutriments?.caffeine != null) {
      food.caffeine = product.nutriments!.caffeine! * 1000;
    }
    food.alcohol = product.nutriments?.alcohol ?? null;

    return food;
  }

  int get nutrientCount {
    int count = 0;

    count += calories != null ? 1 : 0;
    count += protein != null ? 1 : 0;
    count += carbs != null ? 1 : 0;
    count += fat != null ? 1 : 0;
    count += vitaminA != null ? 1 : 0;
    count += vitaminB1 != null ? 1 : 0;
    count += vitaminB2 != null ? 1 : 0;
    count += vitaminB3 != null ? 1 : 0;
    count += vitaminB5 != null ? 1 : 0;
    count += vitaminB6 != null ? 1 : 0;
    count += vitaminB7 != null ? 1 : 0;
    count += vitaminB9 != null ? 1 : 0;
    count += vitaminB12 != null ? 1 : 0;
    count += vitaminC != null ? 1 : 0;
    count += vitaminD != null ? 1 : 0;
    count += vitaminE != null ? 1 : 0;
    count += vitaminK != null ? 1 : 0;
    count += calcium != null ? 1 : 0;
    count += chloride != null ? 1 : 0;
    count += magnesium != null ? 1 : 0;
    count += phosphorus != null ? 1 : 0;
    count += potassium != null ? 1 : 0;
    count += sodium != null ? 1 : 0;
    count += chromium != null ? 1 : 0;
    count += iron != null ? 1 : 0;
    count += fluorine != null ? 1 : 0;
    count += iodine != null ? 1 : 0;
    count += copper != null ? 1 : 0;
    count += manganese != null ? 1 : 0;
    count += molybdenum != null ? 1 : 0;
    count += selenium != null ? 1 : 0;
    count += zinc != null ? 1 : 0;
    count += monounsaturatedFat != null ? 1 : 0;
    count += polyunsaturatedFat != null ? 1 : 0;
    count += omega3 != null ? 1 : 0;
    count += omega6 != null ? 1 : 0;
    count += saturatedFat != null ? 1 : 0;
    count += transFat != null ? 1 : 0;
    count += cholesterol != null ? 1 : 0;
    count += fiber != null ? 1 : 0;
    count += sugar != null ? 1 : 0;
    count += sugarAlcohol != null ? 1 : 0;
    count += starch != null ? 1 : 0;
    count += water != null ? 1 : 0;
    count += caffeine != null ? 1 : 0;
    count += alcohol != null ? 1 : 0;

    return count;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'origin': origin,
      'ean': ean,
      'imageUrl': imageUrl,
      'imageThumbnailUrl': imageThumbnailUrl,
      // TODO: Issue #1: servingSizes
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'vitaminA': vitaminA,
      'vitaminB1': vitaminB1,
      'vitaminB2': vitaminB2,
      'vitaminB3': vitaminB3,
      'vitaminB5': vitaminB5,
      'vitaminB6': vitaminB6,
      'vitaminB7': vitaminB7,
      'vitaminB9': vitaminB9,
      'vitaminB12': vitaminB12,
      'vitaminC': vitaminC,
      'vitaminD': vitaminD,
      'vitaminE': vitaminE,
      'vitaminK': vitaminK,
      'calcium': calcium,
      'chloride': chloride,
      'magnesium': magnesium,
      'phosphorus': phosphorus,
      'potassium': potassium,
      'sodium': sodium,
      'chromium': chromium,
      'iron': iron,
      'fluorine': fluorine,
      'iodine': iodine,
      'copper': copper,
      'manganese': manganese,
      'molybdenum': molybdenum,
      'selenium': selenium,
      'zinc': zinc,
      'monounsaturatedFat': monounsaturatedFat,
      'polyunsaturatedFat': polyunsaturatedFat,
      'omega3': omega3,
      'omega6': omega6,
      'saturatedFat': saturatedFat,
      'transFat': transFat,
      'cholesterol': cholesterol,
      'fiber': fiber,
      'sugar': sugar,
      'sugarAlcohol': sugarAlcohol,
      'starch': starch,
      'water': water,
      'caffeine': caffeine,
      'alcohol': alcohol,
    };
  }

  static List<Food> get foodFromSndb {
    // After first invocation of this method the database is filled
    if (_sndb.length != 0) return _sndb;

    for (var entry in SNDB) {
      var food = entry.split('§');

      _sndb.add(
        Food(
          id: generatedId,
          title: food[1],
          origin: 'SNDB',
          calories: food[3] != '' ? double.parse(food[3]) : null,
          protein: food[4] != '' ? double.parse(food[4]) : null,
          carbs: food[5] != '' ? double.parse(food[5]) : null,
          fat: food[6] != '' ? double.parse(food[6]) : null,
          // Micros
          vitaminA: food[7] != '' ? double.parse(food[7]) / 1000 : null,
          vitaminB1: food[8] != '' ? double.parse(food[8]) : null,
          vitaminB2: food[9] != '' ? double.parse(food[9]) : null,
          vitaminB3: food[10] != '' ? double.parse(food[10]) : null,
          vitaminB5: food[11] != '' ? double.parse(food[11]) : null,
          vitaminB6: food[12] != '' ? double.parse(food[12]) : null,
          vitaminB9: food[13] != '' ? double.parse(food[13]) : null,
          vitaminB12: food[14] != '' ? double.parse(food[14]) : null,
          vitaminC: food[15] != '' ? double.parse(food[15]) : null,
          vitaminD: food[16] != '' ? double.parse(food[16]) : null,
          vitaminE: food[17] != '' ? double.parse(food[17]) : null,
          calcium: food[18] != '' ? double.parse(food[18]) : null,
          chloride: food[19] != '' ? double.parse(food[19]) : null,
          magnesium: food[20] != '' ? double.parse(food[20]) : null,
          phosphorus: food[21] != '' ? double.parse(food[21]) : null,
          potassium: food[22] != '' ? double.parse(food[22]) : null,
          sodium: food[23] != '' ? double.parse(food[23]) / 1000 : null,
          iron: food[24] != '' ? double.parse(food[24]) : null,
          iodine: food[25] != '' ? double.parse(food[25]) : null,
          selenium: food[26] != '' ? double.parse(food[26]) : null,
          zinc: food[27] != '' ? double.parse(food[27]) : null,
          monounsaturatedFat: food[28] != '' ? double.parse(food[28]) : null,
          polyunsaturatedFat: food[29] != '' ? double.parse(food[29]) : null,
          saturatedFat: food[30] != '' ? double.parse(food[30]) : null,
          cholesterol: food[31] != '' ? double.parse(food[31]) : null,
          fiber: food[32] != '' ? double.parse(food[32]) : null,
          sugar: food[33] != '' ? double.parse(food[33]) : null,
          starch: food[34] != '' ? double.parse(food[34]) : null,
          water: food[35] != '' ? double.parse(food[35]) : null,
          alcohol: food[36] != '' ? double.parse(food[36]) : null,
        ),
      );
    }

    return _sndb;
  }

  static String get generatedId {
    return Uuid().v4();
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

    return hashList(attributes);
  }

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
