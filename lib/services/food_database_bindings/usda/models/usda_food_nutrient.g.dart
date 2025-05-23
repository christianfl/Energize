// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_food_nutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

USDAFoodNutrient _$USDAFoodNutrientFromJson(Map<String, dynamic> json) =>
    USDAFoodNutrient(
      nutrientName: json['nutrientName'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      unitName:
          $enumDecodeNullable(_$USDAFoodNutrientUnitEnumMap, json['unitName']),
    );

Map<String, dynamic> _$USDAFoodNutrientToJson(USDAFoodNutrient instance) =>
    <String, dynamic>{
      if (instance.nutrientName case final value?) 'nutrientName': value,
      if (instance.value case final value?) 'value': value,
      if (_$USDAFoodNutrientUnitEnumMap[instance.unitName] case final value?)
        'unitName': value,
    };

const _$USDAFoodNutrientUnitEnumMap = {
  USDAFoodNutrientUnit.G: 'G',
  USDAFoodNutrientUnit.KCAL: 'KCAL',
  USDAFoodNutrientUnit.MG: 'MG',
  USDAFoodNutrientUnit.UG: 'UG',
  USDAFoodNutrientUnit.IU: 'IU',
  USDAFoodNutrientUnit.kJ: 'kJ',
};
