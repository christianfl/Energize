// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackupData _$BackupDataFromJson(Map<String, dynamic> json) => BackupData(
      customFood: (json['customFood'] as List<dynamic>?)
          ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackedFood: (json['trackedFood'] as List<dynamic>?)
          ?.map((e) => FoodTracked.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedDays: (json['completedDays'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$BackupDataToJson(BackupData instance) =>
    <String, dynamic>{
      'customFood': instance.customFood?.map((e) => e.toJson()).toList(),
      'trackedFood': instance.trackedFood?.map((e) => e.toJson()).toList(),
      'completedDays':
          instance.completedDays?.map((e) => e.toIso8601String()).toList(),
    };
