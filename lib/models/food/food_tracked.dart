import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'food.dart';

part 'food_tracked.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class FoodTracked extends Food {
  @override
  // ignore: overridden_fields
  final String id;

  /// In g ()
  double amount;
  @JsonKey(
    fromJson: _millisecondsSinceEpochToDate,
    toJson: _dateToMillisecondsSinceEpoch,
  )
  DateTime dateAdded;
  @JsonKey(
    fromJson: _millisecondsSinceEpochToDate,
    toJson: _dateToMillisecondsSinceEpoch,
  )
  final DateTime dateEaten;

  /// Refers to index of servingSizes Map, if serving size was selected
  @JsonKey(
    includeFromJson: false,
    includeToJson: false,
  )
  int? selectedServingSizeIndex;

  FoodTracked({
    required this.id,
    required this.amount,
    required this.dateAdded,
    required this.dateEaten,
    required String title,
    required String origin,
    String? ean,
    String? imageUrl,
    String? imageThumbnailUrl,
    Map<String, double>? servingSizes,
    double? calories,
    double? protein,
    double? carbs,
    double? fat,
    double? vitaminA,
    double? vitaminB1,
    double? vitaminB2,
    double? vitaminB3,
    double? vitaminB5,
    double? vitaminB6,
    double? vitaminB7,
    double? vitaminB9,
    double? vitaminB12,
    double? vitaminC,
    double? vitaminD,
    double? vitaminE,
    double? vitaminK,
    double? calcium,
    double? chloride,
    double? magnesium,
    double? phosphorus,
    double? potassium,
    double? sodium,
    double? chromium,
    double? iron,
    double? fluorine,
    double? iodine,
    double? copper,
    double? manganese,
    double? molybdenum,
    double? selenium,
    double? zinc,
    double? monounsaturatedFat,
    double? polyunsaturatedFat,
    double? omega3,
    double? omega6,
    double? saturatedFat,
    double? transFat,
    double? cholesterol,
    double? fiber,
    double? sugar,
    double? sugarAlcohol,
    double? starch,
    double? water,
    double? caffeine,
    double? alcohol,
  }) : super(
          id: id,
          title: title,
          origin: origin,
          ean: ean,
          imageUrl: imageUrl,
          imageThumbnailUrl: imageThumbnailUrl,
          servingSizes: servingSizes,
          calories: calories,
          protein: protein,
          carbs: carbs,
          fat: fat,
          vitaminA: vitaminA,
          vitaminB1: vitaminB1,
          vitaminB2: vitaminB2,
          vitaminB3: vitaminB3,
          vitaminB5: vitaminB5,
          vitaminB6: vitaminB6,
          vitaminB7: vitaminB7,
          vitaminB9: vitaminB9,
          vitaminB12: vitaminB12,
          vitaminC: vitaminC,
          vitaminD: vitaminD,
          vitaminE: vitaminE,
          vitaminK: vitaminK,
          calcium: calcium,
          chloride: chloride,
          magnesium: magnesium,
          phosphorus: phosphorus,
          potassium: potassium,
          sodium: sodium,
          chromium: chromium,
          iron: iron,
          fluorine: fluorine,
          iodine: iodine,
          copper: copper,
          manganese: manganese,
          molybdenum: molybdenum,
          selenium: selenium,
          zinc: zinc,
          monounsaturatedFat: monounsaturatedFat,
          polyunsaturatedFat: polyunsaturatedFat,
          omega3: omega3,
          omega6: omega6,
          saturatedFat: saturatedFat,
          transFat: transFat,
          cholesterol: cholesterol,
          fiber: fiber,
          sugar: sugar,
          sugarAlcohol: sugarAlcohol,
          starch: starch,
          water: water,
          caffeine: caffeine,
          alcohol: alcohol,
        );

  FoodTracked.fromFood(
      Food food, this.id, this.amount, this.dateEaten, this.dateAdded)
      : super(
          id: id,
          title: food.title,
          origin: food.origin,
          ean: food.ean,
          imageUrl: food.imageUrl,
          imageThumbnailUrl: food.imageThumbnailUrl,
          servingSizes: food.servingSizes,
          calories: food.calories,
          protein: food.protein,
          carbs: food.carbs,
          fat: food.fat,
          vitaminA: food.vitaminA,
          vitaminB1: food.vitaminB1,
          vitaminB2: food.vitaminB2,
          vitaminB3: food.vitaminB3,
          vitaminB5: food.vitaminB5,
          vitaminB6: food.vitaminB6,
          vitaminB7: food.vitaminB7,
          vitaminB9: food.vitaminB9,
          vitaminB12: food.vitaminB12,
          vitaminC: food.vitaminC,
          vitaminD: food.vitaminD,
          vitaminE: food.vitaminE,
          vitaminK: food.vitaminK,
          calcium: food.calcium,
          chloride: food.chloride,
          magnesium: food.magnesium,
          phosphorus: food.phosphorus,
          potassium: food.potassium,
          sodium: food.sodium,
          chromium: food.chromium,
          iron: food.iron,
          fluorine: food.fluorine,
          iodine: food.iodine,
          copper: food.copper,
          manganese: food.manganese,
          molybdenum: food.molybdenum,
          selenium: food.selenium,
          zinc: food.zinc,
          monounsaturatedFat: food.monounsaturatedFat,
          polyunsaturatedFat: food.polyunsaturatedFat,
          omega3: food.omega3,
          omega6: food.omega6,
          saturatedFat: food.saturatedFat,
          transFat: food.transFat,
          cholesterol: food.cholesterol,
          fiber: food.fiber,
          sugar: food.sugar,
          sugarAlcohol: food.sugarAlcohol,
          starch: food.starch,
          water: food.water,
          caffeine: food.caffeine,
          alcohol: food.alcohol,
        );

  // UUID creation as a static method so that sqflite db can create
  // foodTracked items from parsed Maps and set UUIDs, could also be
  // implemented with a factory
  static String get generatedId {
    return const Uuid().v4();
  }

  /// When no servingSize has been selected (index), it just returns the amount
  /// value (g), otherwise it calculates the amount with help of
  /// food.servingSizes, food.selectedServingSizeIndex and food.amount
  double get calculatedAmount {
    if (selectedServingSizeIndex == null) {
      return amount;
    } else {
      return servingSizes!.values.elementAt(selectedServingSizeIndex!) * amount;
    }
  }

  /// Returns the total protein of the tracked food in g
  double get proteinPerAmount {
    return (protein ?? 0) / 100 * amount;
  }

  /// Returns the total carbs of the tracked food in g
  double get carbsPerAmount {
    return (carbs ?? 0) / 100 * amount;
  }

  /// Returns the total fat of the tracked food in g
  double get fatPerAmount {
    return (fat ?? 0) / 100 * amount;
  }

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory FoodTracked.fromJson(Map<String, dynamic> json) =>
      _$FoodTrackedFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$FoodTrackedToJson(this);

  static _dateToMillisecondsSinceEpoch(DateTime dateTime) =>
      dateTime.millisecondsSinceEpoch;

  static _millisecondsSinceEpochToDate(int millisecondsSinceEpoch) =>
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
}
