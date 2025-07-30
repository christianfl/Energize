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

Map<String, dynamic> _$USDAFoodToJson(USDAFood instance) => <String, dynamic>{
  'fdcId': ?instance.fdcId,
  'description': ?instance.description,
  'dataType': ?instance.dataType,
  'publishedDate': ?instance.publishedDate,
  'foodCategory': ?instance.foodCategory,
  'foodNutrients': ?instance.foodNutrients,
};
