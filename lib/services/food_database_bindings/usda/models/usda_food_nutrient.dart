import 'package:json_annotation/json_annotation.dart';

import 'usda_food_nutrient_unit.dart';

part 'usda_food_nutrient.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class USDAFoodNutrient {
  String? nutrientName;
  double? value;
  USDAFoodNutrientUnit? unitName;

  USDAFoodNutrient({
    this.nutrientName,
    this.value,
    this.unitName,
  });

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory USDAFoodNutrient.fromJson(Map<String, dynamic> json) =>
      _$USDAFoodNutrientFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$USDAFoodNutrientToJson(this);
}
