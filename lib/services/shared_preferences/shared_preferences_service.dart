import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_service_interface.dart';

class SharedPreferencesService implements SharedPreferencesServiceInterface {
  SharedPreferencesService._privateConstructor();
  static final SharedPreferencesService instance =
      SharedPreferencesService._privateConstructor();

  SharedPreferences? _sharedPrefs;

  /// Returns the SharedPreferences and caches it after first call.
  Future<SharedPreferences> get _cachedSharedPrefs async {
    if (_sharedPrefs != null) {
      return _sharedPrefs!;
    }

    _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs!;
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
        if (kDebugMode) {
          debugPrint(
            'Warning: Unsupported type $T requested from SharedPreferences.',
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(
          'Warning: Could not read key $key from SharedPreferences.',
        );
      }

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
      if (kDebugMode) {
        debugPrint(
          'Warning: Unsupported type ${value.runtimeType} for key $key.',
        );
      }
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
      values.entries.map(
        (entry) => setValue(entry.key, entry.value),
      ),
    );
  }
}
