import 'package:energize/services/key_value_storage_service/key_value_storage_service_interface.dart';

class KeyValueStorageServiceMock implements KeyValueStorageServiceInterface {
  final Map<String, dynamic> keyValueStorage = {};

  @override
  Future<T> getValue<T>(String key, T fallback) async {
    try {
      final value = keyValueStorage[key];

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
    keyValueStorage[key] = value;
  }

  @override
  Future<void> remove(String key) async {
    keyValueStorage.remove(key);
  }

  @override
  Future<void> setAll(Map<String, dynamic> values) async {
    keyValueStorage.clear();
    keyValueStorage.addAll(values);
  }
}
