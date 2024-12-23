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
  DateTime dateEaten;

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
    required super.title,
    required super.origin,
    super.ean,
    super.imageUrl,
    super.imageThumbnailUrl,
    super.servingSizes,
    super.calories,
    super.protein,
    super.carbs,
    super.fat,
    super.vitaminA,
    super.vitaminB1,
    super.vitaminB2,
    super.vitaminB3,
    super.vitaminB5,
    super.vitaminB6,
    super.vitaminB7,
    super.vitaminB9,
    super.vitaminB12,
    super.vitaminC,
    super.vitaminD,
    super.vitaminE,
    super.vitaminK,
    super.calcium,
    super.chloride,
    super.magnesium,
    super.phosphorus,
    super.potassium,
    super.sodium,
    super.chromium,
    super.iron,
    super.fluorine,
    super.iodine,
    super.copper,
    super.manganese,
    super.molybdenum,
    super.selenium,
    super.zinc,
    super.monounsaturatedFat,
    super.polyunsaturatedFat,
    super.omega3,
    super.omega6,
    super.saturatedFat,
    super.transFat,
    super.cholesterol,
    super.fiber,
    super.sugar,
    super.sugarAlcohol,
    super.starch,
    super.water,
    super.caffeine,
    super.alcohol,
  }) : super(
          id: id,
        );

  FoodTracked.fromFood(
    Food food,
    this.id,
    this.amount,
    this.dateEaten,
    this.dateAdded,
  ) : super(
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

  /// Returns the total calories of the tracked food in kcal
  double get caloriesPerAmount {
    return (calories ?? 0) / 100 * amount;
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
