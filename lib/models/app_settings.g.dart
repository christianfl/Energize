// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
      isMealGroupingActivated:
          json['isMealGroupingActivated'] as bool? ?? false,
      isServingSizePreferred: json['isServingSizePreferred'] as bool? ?? true,
      backupServerUrl: json['backupServerUrl'] as String? ?? '',
      backupUsername: json['backupUsername'] as String? ?? '',
      backupPathAndFilename: json['backupPathAndFilename'] as String? ??
          '/Energize/backup.json.aes',
      isProviderOpenFoodFactsActivated:
          json['isProviderOpenFoodFactsActivated'] as bool? ?? true,
      isProviderSndbActivated: json['isProviderSndbActivated'] as bool? ?? true,
      isProviderUsdaActivated: json['isProviderUsdaActivated'] as bool? ?? true,
    );

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'isMealGroupingActivated': instance.isMealGroupingActivated,
      'isServingSizePreferred': instance.isServingSizePreferred,
      'backupServerUrl': instance.backupServerUrl,
      'backupUsername': instance.backupUsername,
      'backupPathAndFilename': instance.backupPathAndFilename,
      'isProviderOpenFoodFactsActivated':
          instance.isProviderOpenFoodFactsActivated,
      'isProviderSndbActivated': instance.isProviderSndbActivated,
      'isProviderUsdaActivated': instance.isProviderUsdaActivated,
    };
