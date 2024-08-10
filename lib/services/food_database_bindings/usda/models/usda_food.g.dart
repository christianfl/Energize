// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

USDAFood _$USDAFoodFromJson(Map<String, dynamic> json) => USDAFood(
      fdcId: (json['fdcId'] as num?)?.toInt(),
      description: json['description'] as String?,
      dataType: json['dataType'] as String?,
      publishedDate: json['publishedDate'] as String?,
      foodCategory: json['foodCategory'] as String?,
      foodNutrients: (json['foodNutrients'] as List<dynamic>?)
          ?.map((e) => USDAFoodNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$USDAFoodToJson(USDAFood instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fdcId', instance.fdcId);
  writeNotNull('description', instance.description);
  writeNotNull('dataType', instance.dataType);
  writeNotNull('publishedDate', instance.publishedDate);
  writeNotNull('foodCategory', instance.foodCategory);
  writeNotNull('foodNutrients', instance.foodNutrients);
  return val;
}
