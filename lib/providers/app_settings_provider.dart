import 'package:flutter/foundation.dart';
import '../models/app_settings.dart';

import '../services/shared_preferences/shared_preferences_service_interface.dart';

/// Provider for app-wide settings.
///
/// Includes e.g.:
/// - UI settings
/// - Backup / Restore targets
/// - Activated food composition databases
class AppSettingsProvider with ChangeNotifier {
  AppSettings _settings = AppSettings();

  AppSettings get settings => _settings;

  final SharedPreferencesServiceInterface _sharedPrefs;

  AppSettingsProvider({
    required SharedPreferencesServiceInterface sharedPrefs,
  }) : _sharedPrefs = sharedPrefs {
    _loadSettings();
  }

  /// Loads settings from SharedPreferences into [_settings].
  Future<void> _loadSettings() async {
    _settings = AppSettings(
      isMealGroupingActivated: await _sharedPrefs.getValue<bool>(
        AppSettings.isMealGroupingActivatedKey,
        isMealGroupingActivated,
      ),
      backupServerUrl: await _sharedPrefs.getValue<String>(
        AppSettings.backupServerUrlKey,
        backupServerUrl,
      ),
      backupUsername: await _sharedPrefs.getValue<String>(
        AppSettings.backupUsernameKey,
        backupUsername,
      ),
      backupPathAndFilename: await _sharedPrefs.getValue<String>(
        AppSettings.backupPathAndFilenameKey,
        backupPathAndFilename,
      ),
      isProviderOpenFoodFactsActivated: await _sharedPrefs.getValue<bool>(
        AppSettings.isProviderOpenFoodFactsActivatedKey,
        isProviderOpenFoodFactsActivated,
      ),
      isProviderSndbActivated: await _sharedPrefs.getValue<bool>(
        AppSettings.isProviderSndbActivatedKey,
        isProviderSndbActivated,
      ),
      isProviderUsdaActivated: await _sharedPrefs.getValue<bool>(
        AppSettings.isProviderUsdaActivatedKey,
        isProviderUsdaActivated,
      ),
    );

    notifyListeners();
  }

  // Getters

  bool get isMealGroupingActivated => _settings.isMealGroupingActivated;
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
    _sharedPrefs.setValue(
      AppSettings.isMealGroupingActivatedKey,
      value,
    );

    notifyListeners();
  }

  set backupServerUrl(String value) {
    _settings.backupServerUrl = value;
    _sharedPrefs.setValue(
      AppSettings.backupServerUrlKey,
      value,
    );

    notifyListeners();
  }

  set backupUsername(String value) {
    _settings.backupUsername = value;
    _sharedPrefs.setValue(
      AppSettings.backupUsernameKey,
      value,
    );

    notifyListeners();
  }

  set backupPathAndFilename(String value) {
    _settings.backupPathAndFilename = value;
    _sharedPrefs.setValue(
      AppSettings.backupPathAndFilenameKey,
      value,
    );

    notifyListeners();
  }

  set isProviderOpenFoodFactsActivated(bool value) {
    _settings.isProviderOpenFoodFactsActivated = value;
    _sharedPrefs.setValue(
      AppSettings.isProviderOpenFoodFactsActivatedKey,
      value,
    );

    notifyListeners();
  }

  set isProviderSndbActivated(bool value) {
    _settings.isProviderSndbActivated = value;
    _sharedPrefs.setValue(
      AppSettings.isProviderSndbActivatedKey,
      value,
    );

    notifyListeners();
  }

  set isProviderUsdaActivated(bool value) {
    _settings.isProviderUsdaActivated = value;
    _sharedPrefs.setValue(
      AppSettings.isProviderUsdaActivatedKey,
      value,
    );

    notifyListeners();
  }

  void clearBackupServerUrl() {
    _settings.backupServerUrl = '';
    _sharedPrefs.remove(
      AppSettings.backupServerUrlKey,
    );

    notifyListeners();
  }

  void clearBackupUsername() {
    _settings.backupUsername = '';
    _sharedPrefs.remove(
      AppSettings.backupUsernameKey,
    );

    notifyListeners();
  }

  void clearBackupPathAndFilename() {
    _settings.backupPathAndFilename = '';
    _sharedPrefs.remove(
      AppSettings.backupPathAndFilenameKey,
    );

    notifyListeners();
  }

  /// Sets all settings values according to [newSettings].
  Future<void> saveAll(AppSettings newSettings) async {
    try {
      final settingsMap = newSettings.toJson();
      await _sharedPrefs.setAll(settingsMap);
      _settings = newSettings;

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Could not save all settings: $e');
      }
    }
  }
}
