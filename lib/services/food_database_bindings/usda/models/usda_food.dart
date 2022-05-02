import 'package:json_annotation/json_annotation.dart';

import 'usda_food_nutrient.dart';

part 'usda_food.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class USDAFood {
  int? fdcId;
  String? description;
  String? dataType;
  String? publishedDate;
  String? foodCategory;
  List<USDAFoodNutrient>? foodNutrients;

  USDAFood({
    this.fdcId,
    this.description,
    this.dataType,
    this.publishedDate,
    this.foodCategory,
    this.foodNutrients,
  });

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory USDAFood.fromJson(Map<String, dynamic> json) =>
      _$USDAFoodFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$USDAFoodToJson(this);
}
