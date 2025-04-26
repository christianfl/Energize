import 'package:json_annotation/json_annotation.dart';

part 'app_settings.g.dart';

/// Holds app-wide settings.
@JsonSerializable()
class AppSettings {
  // Keys for shared preferences
  static const isMealGroupingActivatedKey = 'isMealGroupingActivated';
  static const backupServerUrlKey = 'backupServerUrl';
  static const backupUsernameKey = 'backupUsername';
  static const backupPathAndFilenameKey = 'backupPathAndFilename';
  static const isProviderOpenFoodFactsActivatedKey =
      'isProviderOpenFoodFactsActivated';
  static const isProviderSndbActivatedKey = 'isProviderSndbActivated';
  static const isProviderUsdaActivatedKey = 'isProviderUsdaActivated';

  bool isMealGroupingActivated;
  String backupServerUrl;
  String backupUsername;
  String backupPathAndFilename;
  bool isProviderOpenFoodFactsActivated;
  bool isProviderSndbActivated;
  bool isProviderUsdaActivated;

  AppSettings({
    this.isMealGroupingActivated = false,
    this.backupServerUrl = '',
    this.backupUsername = '',
    this.backupPathAndFilename = '/Energize/backup.json.aes',
    this.isProviderOpenFoodFactsActivated = true,
    this.isProviderSndbActivated = true,
    this.isProviderUsdaActivated = true,
  });

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}
