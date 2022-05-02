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

Map<String, dynamic> _$USDAFoodNutrientToJson(USDAFoodNutrient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nutrientName', instance.nutrientName);
  writeNotNull('value', instance.value);
  writeNotNull('unitName', _$USDAFoodNutrientUnitEnumMap[instance.unitName]);
  return val;
}

const _$USDAFoodNutrientUnitEnumMap = {
  USDAFoodNutrientUnit.G: 'G',
  USDAFoodNutrientUnit.KCAL: 'KCAL',
  USDAFoodNutrientUnit.MG: 'MG',
  USDAFoodNutrientUnit.UG: 'UG',
  USDAFoodNutrientUnit.IU: 'IU',
  USDAFoodNutrientUnit.kJ: 'kJ',
};
