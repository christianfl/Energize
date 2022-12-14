// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serving_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServingSize _$ServingSizeFromJson(Map<String, dynamic> json) => ServingSize(
      json['internalName'] as String?,
      json['translatedName'] as String,
      (json['inGrams'] as num).toDouble(),
    );

Map<String, dynamic> _$ServingSizeToJson(ServingSize instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('internalName', instance.internalName);
  val['translatedName'] = instance.translatedName;
  val['inGrams'] = instance.inGrams;
  return val;
}
