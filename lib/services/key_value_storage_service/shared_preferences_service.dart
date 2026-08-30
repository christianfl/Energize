import 'package:shared_preferences/shared_preferences.dart';

import '../log_service_interface.dart';
import 'key_value_storage_service_interface.dart';

class SharedPreferencesService implements KeyValueStorageServiceInterface {
  LogServiceInterface? _logger;

  SharedPreferencesService._privateConstructor();
  static final SharedPreferencesService instance =
      SharedPreferencesService._privateConstructor();

  /// Configures the logger used for storage warnings.
  void configureLogger(LogServiceInterface logger) {
    _logger = logger;
  }

  SharedPreferences? _sharedPrefs;

  /// Returns the SharedPreferences and caches it after first call.
  Future<SharedPreferences> get _cachedSharedPrefs async {
    if (_sharedPrefs != null) {
      return _sharedPrefs!;
    }

    _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs!;
  }

  /// Returns all values that may need migration to secure storage.
  Future<Map<String, Object>> getAllValues() async {
    final prefs = await _cachedSharedPrefs;
    final values = <String, Object>{};

    for (final key in prefs.getKeys()) {
      final value = prefs.get(key);
      if (value != null) values[key] = value;
    }

    return values;
  }

  /// Removes all values.
  ///
  /// Used after they have been migrated to secure storage successfully.
  Future<void> removeAll(Iterable<String> keys) async {
    final prefs = await _cachedSharedPrefs;
    await Future.wait(keys.map(prefs.remove));
  }

  @override
  Future<T> getValue<T>(String key, T fallback) async {
    final prefs = await _cachedSharedPrefs;
    T? returnValue;

    try {
      if (T == String) {
        returnValue = prefs.getString(key) as T?;
      } else if (T == bool) {
        returnValue = prefs.getBool(key) as T?;
      } else if (T == int) {
        returnValue = prefs.getInt(key) as T?;
      } else if (T == double) {
        returnValue = prefs.getDouble(key) as T?;
      } else {
        _logger?.warning(
          'Unsupported type $T requested from SharedPreferences',
        );
      }
    } catch (e, st) {
      _logger?.warning('Could not read key $key from SharedPreferences', e, st);

      return fallback;
    }

    return returnValue ?? fallback;
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    final prefs = await _cachedSharedPrefs;

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      _logger?.warning(
        'Unsupported type ${value.runtimeType} for SharedPreferences key $key',
      );
    }
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await _cachedSharedPrefs;
    await prefs.remove(key);
  }

  @override
  Future<void> setAll(Map<String, dynamic> values) async {
    await Future.wait(
      values.entries.map((entry) => setValue(entry.key, entry.value)),
    );
  }
}
