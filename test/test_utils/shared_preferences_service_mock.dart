import 'package:energize/services/shared_preferences/shared_preferences_service_interface.dart';

class SharedPreferencesServiceMock
    implements SharedPreferencesServiceInterface {
  final Map<String, dynamic> sharedPrefs = {};

  @override
  Future<T> getValue<T>(String key, T fallback) async {
    try {
      final value = sharedPrefs[key];

      if (value != null && value is T) {
        return value;
      }

      return fallback;
    } catch (e) {
      return fallback;
    }
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    sharedPrefs[key] = value;
  }

  @override
  Future<void> remove(String key) async {
    sharedPrefs.remove(key);
  }

  @override
  Future<void> setAll(Map<String, dynamic> values) async {
    sharedPrefs.clear();
    sharedPrefs.addAll(values);
  }
}
