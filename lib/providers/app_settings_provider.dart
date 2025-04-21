import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for app-wide settings.
///
/// Includes e.g.:
/// - UI settings
/// - Backup / Restore targets
/// - Activated food composition databases
class AppSettingsProvider with ChangeNotifier {
  SharedPreferences? _preferences;

  // ##################### UI Settings #####################

  bool _isMealGroupingActivated = false;

  // ##################### Backup & Restore #####################

  String _backupServerUrl = '';
  String _backupUsername = '';
  String _backupPathAndFilename = '/Energize/backup.json.aes';

  // ##################### DB management #####################

  bool _isProviderOpenFoodFactsActivated = true;
  bool _isProviderSndbActivated = true;
  bool _isProviderUsdaActivated = true;

  // Getter

  bool get isMealGroupingActivated => _isMealGroupingActivated;

  String get backupServerUrl => _backupServerUrl;
  String get backupUsername => _backupUsername;
  String get backupPathAndFilename => _backupPathAndFilename;

  bool get isProviderOpenFoodFactsActivated =>
      _isProviderOpenFoodFactsActivated;
  bool get isProviderSndbActivated => _isProviderSndbActivated;
  bool get isProviderUsdaActivated => _isProviderUsdaActivated;

  AppSettingsProvider() {
    _loadFromSharedPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// Loads all key value pairs from shared preferences into local variables
  Future<void> _loadFromSharedPreferences() async {
    await _initPreferences();

    _isMealGroupingActivated =
        _preferences!.getBool('isMealGroupingActivated') ?? false;

    _backupServerUrl =
        _preferences!.getString('backupServerUrl') ?? _backupServerUrl;
    _backupUsername =
        _preferences!.getString('backupUsername') ?? _backupUsername;
    _backupPathAndFilename = _preferences!.getString('backupPathAndFilename') ??
        _backupPathAndFilename;

    _isProviderOpenFoodFactsActivated =
        _preferences!.getBool('isProviderOpenFoodFactsActivated') ?? true;
    _isProviderSndbActivated =
        _preferences!.getBool('isProviderSndbActivated') ?? true;
    _isProviderUsdaActivated =
        _preferences!.getBool('isProviderUsdaActivated') ?? true;

    notifyListeners();
  }

  /// Save int, double, String, or bool to shared preferences
  _saveToPreferences(String key, var value) async {
    await _initPreferences();

    if (value is int) {
      unawaited(_preferences!.setInt(key, value));
    } else if (value is double) {
      unawaited(_preferences!.setDouble(key, value));
    } else if (value is String) {
      unawaited(_preferences!.setString(key, value));
    } else if (value is bool) {
      unawaited(_preferences!.setBool(key, value));
    }
  }

  set isMealGroupingActivated(bool value) {
    _isMealGroupingActivated = value;
    notifyListeners();
    _saveToPreferences('isMealGroupingActivated', value);
  }

  set isProviderOpenFoodFactsActivated(bool value) {
    _isProviderOpenFoodFactsActivated = value;
    notifyListeners();
    _saveToPreferences('isProviderOpenFoodFactsActivated', value);
  }

  set isProviderSndbActivated(bool value) {
    _isProviderSndbActivated = value;
    notifyListeners();
    _saveToPreferences('isProviderSndbActivated', value);
  }

  set isProviderUsdaActivated(bool value) {
    _isProviderUsdaActivated = value;
    notifyListeners();
    _saveToPreferences('isProviderUsdaActivated', value);
  }

  set backupServerUrl(String value) {
    _backupServerUrl = value;
    notifyListeners();
    _saveToPreferences('backupServerUrl', value);
  }

  set backupUsername(String value) {
    _backupUsername = value;
    notifyListeners();
    _saveToPreferences('backupUsername', value);
  }

  set backupPathAndFilename(String value) {
    _backupPathAndFilename = value;
    notifyListeners();
    _saveToPreferences('backupPathAndFilename', value);
  }

  void clearBackupServerUrl() async {
    await _initPreferences();
    unawaited(_preferences!.remove('backupServerUrl'));

    _backupServerUrl = '';
  }

  void clearBackupUsername() async {
    await _initPreferences();
    unawaited(_preferences!.remove('backupUsername'));

    _backupUsername = '';
  }

  void clearBackupPathAndFilename() async {
    await _initPreferences();
    unawaited(_preferences!.remove('backupPathAndFilename'));

    _backupPathAndFilename = '/Energize/backup.json.aes';
  }
}
