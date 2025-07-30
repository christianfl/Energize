import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'food.dart';

part 'food_tracked.g.dart';

@JsonSerializable()
class FoodTracked extends Food {
  @override
  // ignore: overridden_fields
  final String id;

  /// Either:
  ///
  /// - Amount of servings per [selectedServingSize].
  /// - Or amount in g if [selectedServingSize] is null.
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

  /// If set, this is the serving size the user chose when tracking the food.
  ///
  /// `amount * servingSizes[selectedServingSize]` = calories per tracked food.
  ///
  /// If set, a key with the same name must exist in [servingSizes].
  String? _selectedServingSize;

  /// Get _selectedServingSize with custom validation.
  String? get selectedServingSize {
    if (servingSizes != null) {
      if (_selectedServingSize != null) {
        if (servingSizes!.containsKey(_selectedServingSize)) {
          return _selectedServingSize;
        }
      }
    }
    return null;
  }

  /// Set [_selectedServingSize] with custom validation.
  set selectedServingSize(String? value) {
    if (value != null) {
      if (servingSizes == null ||
          !servingSizes!.containsKey(value) ||
          value.isEmpty) {
        throw ArgumentError(
          'selectedServingSize "$value" is not a valid key in servingSizes.',
        );
      }
    }

    _selectedServingSize = value;
  }

  FoodTracked({
    required this.id,
    required this.amount,
    required this.dateAdded,
    required this.dateEaten,
    String? selectedServingSize,
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
  }) : super(id: id) {
    {
      // Call here to ensure the setter with custom logic is used
      _selectedServingSize = selectedServingSize;
    }
  }

  FoodTracked.fromFood(
    Food food,
    this.id,
    this.amount,
    this.dateEaten,
    this.dateAdded, {
    String? selectedServingSize,
  }) : super(
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
       ) {
    // Call here to ensure the setter with custom logic is used
    _selectedServingSize = selectedServingSize;
  }

  // UUID creation as a static method so that sqflite db can create
  // foodTracked items from parsed Maps and set UUIDs, could also be
  // implemented with a factory
  static String get generatedId {
    return const Uuid().v4();
  }

  /// Returns the amount of the tracked food in g.
  ///
  /// This is either just [amount] or [amount] * g per [selectedServingSize].
  double get calculatedAmount {
    if (selectedServingSize != null && servingSizes != null) {
      return servingSizes![selectedServingSize!]! * amount;
    }

    return amount;
  }

  /// Returns the total protein of the tracked food in g
  double get proteinPerTrackedAmount {
    return (protein ?? 0) / 100 * calculatedAmount;
  }

  /// Returns the total carbs of the tracked food in g
  double get carbsPerTrackedAmount {
    return (carbs ?? 0) / 100 * calculatedAmount;
  }

  /// Returns the total fat of the tracked food in g
  double get fatPerTrackedAmount {
    return (fat ?? 0) / 100 * calculatedAmount;
  }

  /// Returns the total calories of the tracked food in kcal
  double get caloriesPerTrackedAmount {
    return (calories ?? 0) / 100 * calculatedAmount;
  }

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory FoodTracked.fromJson(Map<String, dynamic> json) {
    final foodTracked = _$FoodTrackedFromJson(json);

    // Ensure validation by using the setter
    foodTracked.selectedServingSize = foodTracked.selectedServingSize;

    return foodTracked;
  }

  /// Connect the generated toJson function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$FoodTrackedToJson(this);

  static int _dateToMillisecondsSinceEpoch(DateTime dateTime) =>
      dateTime.millisecondsSinceEpoch;

  static DateTime _millisecondsSinceEpochToDate(int millisecondsSinceEpoch) =>
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
}
