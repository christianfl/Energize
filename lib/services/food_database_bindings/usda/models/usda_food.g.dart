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
      if (instance.fdcId case final value?) 'fdcId': value,
      if (instance.description case final value?) 'description': value,
      if (instance.dataType case final value?) 'dataType': value,
      if (instance.publishedDate case final value?) 'publishedDate': value,
      if (instance.foodCategory case final value?) 'foodCategory': value,
      if (instance.foodNutrients case final value?) 'foodNutrients': value,
    };
