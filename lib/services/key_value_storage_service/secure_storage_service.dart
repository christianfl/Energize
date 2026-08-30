import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../log_service_interface.dart';
import 'key_value_storage_service_interface.dart';
import 'shared_preferences_service.dart';

/// Stores key-value pairs using platform specific secure storage.
class SecureStorageService implements KeyValueStorageServiceInterface {
  static const _migrationMarker = '_secureStorageMigrationV1';

  final FlutterSecureStorage _secureStorage;
  final SharedPreferencesService _legacyStorage;

  LogServiceInterface? _logger;
  Future<void>? _migration;

  SecureStorageService({
    FlutterSecureStorage? secureStorage,
    SharedPreferencesService? legacyStorage,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage(),
       _legacyStorage = legacyStorage ?? SharedPreferencesService.instance;

  static final SecureStorageService instance = SecureStorageService();

  /// Configures the logger used for storage warnings and migration details.
  void configureLogger(LogServiceInterface logger) {
    _logger = logger;
    _legacyStorage.configureLogger(logger);
  }

  /// Migrates legacy values before first secure-storage operation.
  Future<void> _ensureMigrated() {
    return _migration ??= _runMigration();
  }

  /// Runs migration and allows a later operation to retry after failure.
  Future<void> _runMigration() async {
    try {
      await _migrateLegacyValues();
    } catch (_) {
      _migration = null;
      rethrow;
    }
  }

  /// Copies legacy values safely and removes their unencrypted originals.
  Future<void> _migrateLegacyValues() async {
    if (await _secureStorage.read(key: _migrationMarker) == '1') {
      await _logStorageValueCounts();
      return;
    }

    final legacyValues = await _legacyStorage.getAllValues();
    final migratedKeys = <String>[];

    for (final entry in legacyValues.entries) {
      final encodedValue = _encodeValue(entry.value);
      if (encodedValue == null) {
        _logger?.warning(
          'Could not migrate unsupported SharedPreferences value '
          '${entry.key} of type ${entry.value.runtimeType}',
        );
        continue;
      }

      var secureValue = await _secureStorage.read(key: entry.key);
      if (secureValue == null) {
        await _secureStorage.write(key: entry.key, value: encodedValue);
        secureValue = await _secureStorage.read(key: entry.key);
        if (secureValue != encodedValue) {
          throw StateError('Could not verify migrated value ${entry.key}');
        }
      }

      migratedKeys.add(entry.key);
    }

    await _legacyStorage.removeAll(migratedKeys);
    await _secureStorage.write(key: _migrationMarker, value: '1');
    await _logStorageValueCounts();

    if (migratedKeys.isNotEmpty) {
      _logger?.info(
        'Migrated ${migratedKeys.length} value(s) to secure storage',
      );
    }
  }

  /// Logs how many legacy and secure values remain after migration.
  ///
  /// Should be 0 for legacy storage.
  Future<void> _logStorageValueCounts() async {
    final logger = _logger;
    if (logger == null) return;

    try {
      final legacyValueCount = (await _legacyStorage.getAllValues()).length;
      final secureValues = await _secureStorage.readAll();
      final secureValueCount =
          secureValues.length -
          (secureValues.containsKey(_migrationMarker) ? 1 : 0);

      logger.info(
        'Storage contains $legacyValueCount legacy SharedPreferences value(s) '
        'and $secureValueCount secure value(s)',
      );
    } catch (e, st) {
      logger.warning('Could not count stored values', e, st);
    }
  }

  @override
  Future<T> getValue<T>(String key, T fallback) async {
    try {
      await _ensureMigrated();
      final value = await _secureStorage.read(key: key);

      if (value == null) return fallback;

      final decodedValue = _decodeValue<T>(value);

      if (decodedValue != null) return decodedValue;

      _logger?.warning('Could not read secure value $key as $T');
    } catch (e, st) {
      _logger?.warning('Could not read key $key from secure storage', e, st);
    }

    return fallback;
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    await _ensureMigrated();
    final encodedValue = _encodeValue(value);

    if (encodedValue == null) {
      _logger?.warning(
        'Unsupported type ${value.runtimeType} for secure storage key $key',
      );
      return;
    }

    await _secureStorage.write(key: key, value: encodedValue);
  }

  @override
  Future<void> remove(String key) async {
    await _ensureMigrated();
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> setAll(Map<String, dynamic> values) async {
    await _ensureMigrated();
    await Future.wait(
      values.entries.map((entry) => setValue(entry.key, entry.value)),
    );
  }

  /// Converts a supported value into the secure storage string format.
  String? _encodeValue(Object? value) {
    if (value is String || value is bool || value is int || value is double) {
      return value.toString();
    }

    return null;
  }

  /// Converts a secure storage string into the requested type.
  T? _decodeValue<T>(String value) {
    final Object? decodedValue = switch (T) {
      const (String) => value,
      const (bool) => switch (value) {
        'true' => true,
        'false' => false,
        _ => null,
      },
      const (int) => int.tryParse(value),
      const (double) => double.tryParse(value),
      _ => null,
    };

    return decodedValue as T?;
  }
}
