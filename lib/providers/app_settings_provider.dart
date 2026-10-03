import 'package:flutter/foundation.dart';

import '../models/app_settings.dart';

import '../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../services/food_database_bindings/usda/usda_binding.dart';
import '../services/key_value_storage_service/key_value_storage_service_interface.dart';
import 'log_provider.dart';

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
  final LogProvider _logger;

  /// Completes after the stored app settings have been loaded.
  late final Future<void> initialized;

  AppSettingsProvider({required this._keyValueStorage, required this._logger}) {
    initialized = _loadSettings();
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

  /// Returns whether the database with [originName] is currently activated.
  bool isFoodDatabaseActivated(String originName) {
    return switch (originName) {
      SwissFoodCompositionDatabaseBinding.originName => isProviderSndbActivated,
      OpenFoodFactsBinding.originName => isProviderOpenFoodFactsActivated,
      USDABinding.originName => isProviderUsdaActivated,
      _ => throw ArgumentError.value(originName, 'originName'),
    };
  }

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

  /// Persists activation for [originName] and waits for completion.
  Future<bool> setFoodDatabaseActivated(String originName, bool value) async {
    final key = switch (originName) {
      SwissFoodCompositionDatabaseBinding.originName =>
        AppSettings.isProviderSndbActivatedKey,
      OpenFoodFactsBinding.originName =>
        AppSettings.isProviderOpenFoodFactsActivatedKey,
      USDABinding.originName => AppSettings.isProviderUsdaActivatedKey,
      _ => throw ArgumentError.value(originName, 'originName'),
    };

    try {
      await _keyValueStorage.setValue<bool>(key, value);
      switch (originName) {
        case SwissFoodCompositionDatabaseBinding.originName:
          _settings.isProviderSndbActivated = value;
        case OpenFoodFactsBinding.originName:
          _settings.isProviderOpenFoodFactsActivated = value;
        case USDABinding.originName:
          _settings.isProviderUsdaActivated = value;
      }
      notifyListeners();
      return true;
    } catch (e, st) {
      _logger.error('Could not save food database activation', e, st);
      return false;
    }
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
    } catch (e, st) {
      _logger.error('Could not save all settings', e, st);
    }
  }
}
