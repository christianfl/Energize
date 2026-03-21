import 'package:flutter/foundation.dart';
import '../models/app_settings.dart';

import '../services/key_value_storage_service/key_value_storage_service_interface.dart';

/// Provider for app-wide settings.
///
/// Includes e.g.:
/// - UI settings
/// - Backup / Restore targets
/// - Activated food composition databases
class AppSettingsProvider with ChangeNotifier {
  AppSettings _settings = AppSettings();

  AppSettings get settings => _settings;

  final KeyValueStorageServiceInterface _keyValueStorage;

  AppSettingsProvider({
    required KeyValueStorageServiceInterface keyValueStorage,
  }) : _keyValueStorage = keyValueStorage {
    _loadSettings();
  }

  /// Loads settings from key-value storage into [_settings].
  Future<void> _loadSettings() async {
    _settings = AppSettings(
      isMealGroupingActivated: await _keyValueStorage.getValue<bool>(
        AppSettings.isMealGroupingActivatedKey,
        isMealGroupingActivated,
      ),
      isServingSizePreferred: await _keyValueStorage.getValue<bool>(
        AppSettings.isServingSizePreferredKey,
        isServingSizePreferred,
      ),
      backupServerUrl: await _keyValueStorage.getValue<String>(
        AppSettings.backupServerUrlKey,
        backupServerUrl,
      ),
      backupUsername: await _keyValueStorage.getValue<String>(
        AppSettings.backupUsernameKey,
        backupUsername,
      ),
      backupPathAndFilename: await _keyValueStorage.getValue<String>(
        AppSettings.backupPathAndFilenameKey,
        backupPathAndFilename,
      ),
      isProviderOpenFoodFactsActivated: await _keyValueStorage.getValue<bool>(
        AppSettings.isProviderOpenFoodFactsActivatedKey,
        isProviderOpenFoodFactsActivated,
      ),
      isProviderSndbActivated: await _keyValueStorage.getValue<bool>(
        AppSettings.isProviderSndbActivatedKey,
        isProviderSndbActivated,
      ),
      isProviderUsdaActivated: await _keyValueStorage.getValue<bool>(
        AppSettings.isProviderUsdaActivatedKey,
        isProviderUsdaActivated,
      ),
    );

    notifyListeners();
  }

  // Getters

  bool get isMealGroupingActivated => _settings.isMealGroupingActivated;
  bool get isServingSizePreferred => _settings.isServingSizePreferred;
  String get backupServerUrl => _settings.backupServerUrl;
  String get backupUsername => _settings.backupUsername;
  String get backupPathAndFilename => _settings.backupPathAndFilename;
  bool get isProviderOpenFoodFactsActivated =>
      _settings.isProviderOpenFoodFactsActivated;
  bool get isProviderSndbActivated => _settings.isProviderSndbActivated;
  bool get isProviderUsdaActivated => _settings.isProviderUsdaActivated;

  // Setters

  set isMealGroupingActivated(bool value) {
    _settings.isMealGroupingActivated = value;
    _keyValueStorage.setValue(AppSettings.isMealGroupingActivatedKey, value);

    notifyListeners();
  }

  set isServingSizePreferred(bool value) {
    _settings.isServingSizePreferred = value;
    _keyValueStorage.setValue(AppSettings.isServingSizePreferredKey, value);

    notifyListeners();
  }

  set backupServerUrl(String value) {
    _settings.backupServerUrl = value;
    _keyValueStorage.setValue(AppSettings.backupServerUrlKey, value);

    notifyListeners();
  }

  set backupUsername(String value) {
    _settings.backupUsername = value;
    _keyValueStorage.setValue(AppSettings.backupUsernameKey, value);

    notifyListeners();
  }

  set backupPathAndFilename(String value) {
    _settings.backupPathAndFilename = value;
    _keyValueStorage.setValue(AppSettings.backupPathAndFilenameKey, value);

    notifyListeners();
  }

  set isProviderOpenFoodFactsActivated(bool value) {
    _settings.isProviderOpenFoodFactsActivated = value;
    _keyValueStorage.setValue(
      AppSettings.isProviderOpenFoodFactsActivatedKey,
      value,
    );

    notifyListeners();
  }

  set isProviderSndbActivated(bool value) {
    _settings.isProviderSndbActivated = value;
    _keyValueStorage.setValue(AppSettings.isProviderSndbActivatedKey, value);

    notifyListeners();
  }

  set isProviderUsdaActivated(bool value) {
    _settings.isProviderUsdaActivated = value;
    _keyValueStorage.setValue(AppSettings.isProviderUsdaActivatedKey, value);

    notifyListeners();
  }

  void clearBackupServerUrl() {
    _settings.backupServerUrl = '';
    _keyValueStorage.remove(AppSettings.backupServerUrlKey);

    notifyListeners();
  }

  void clearBackupUsername() {
    _settings.backupUsername = '';
    _keyValueStorage.remove(AppSettings.backupUsernameKey);

    notifyListeners();
  }

  void clearBackupPathAndFilename() {
    _settings.backupPathAndFilename = '';
    _keyValueStorage.remove(AppSettings.backupPathAndFilenameKey);

    notifyListeners();
  }

  /// Sets all settings values according to [newSettings].
  Future<void> saveAll(AppSettings newSettings) async {
    try {
      final settingsMap = newSettings.toJson();
      await _keyValueStorage.setAll(settingsMap);
      _settings = newSettings;

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Could not save all settings: $e');
      }
    }
  }
}
