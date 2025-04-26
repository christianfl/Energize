/// Manages data saved in the SharedPreferences.
abstract class SharedPreferencesServiceInterface {
  /// Returns the value by [key].
  ///
  /// If the value can't be found or is null, [fallback] is returned.
  Future<T> getValue<T>(String key, T fallback);

  /// Sets the value of [key] to [value].
  Future<void> setValue<T>(String key, T value);

  /// Sets all key-value pairs from [values].
  Future<void> setAll(Map<String, dynamic> values);

  /// Removes [key] entirely.
  Future<void> remove(String key);
}
