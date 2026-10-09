import '../providers/app_settings_provider.dart';
import 'food_database_bindings/food_databases.dart';
import 'key_value_storage_service/key_value_storage_service_interface.dart';
import 'log_service_interface.dart';
import 'sqlite/database_service.dart';

/// Tracks introduction completion and initializes food dbs activation settings.
class IntroductionService {
  static const currentVersion = 1;
  static const _completedVersionKey = '_completedIntroductionVersion';
  static const _databaseDefaultsInitializedKey =
      '_introductionDatabaseDefaultsInitializedV1';

  final KeyValueStorageServiceInterface _keyValueStorage;
  final LogServiceInterface _logger;
  final Future<bool> Function() _hasExistingDatabase;

  IntroductionService({
    required this._keyValueStorage,
    required this._logger,
    Future<bool> Function()? hasExistingDatabase,
  }) : _hasExistingDatabase =
           hasExistingDatabase ?? (() => DatabaseService.hasExistingDatabase);

  /// Prepares database defaults and returns whether the introduction is due.
  /// Throws if initialization fails so the caller can offer a retry.
  Future<bool> prepare(AppSettingsProvider appSettings) async {
    final completedVersion = await _keyValueStorage.getValue<int>(
      _completedVersionKey,
      0,
    );
    if (completedVersion >= currentVersion) return false;

    await _initializeDatabaseDefaults(appSettings);
    return true;
  }

  /// Marks the current introduction version as completed.
  Future<bool> complete() async {
    try {
      await _keyValueStorage.setValue<int>(
        _completedVersionKey,
        currentVersion,
      );
      return true;
    } catch (e, st) {
      _logger.error('Could not mark introduction as completed', e, st);
      return false;
    }
  }

  /// Returns the persisted introduction version for inclusion in backups.
  Future<int> get completedVersion {
    return _keyValueStorage.getValue<int>(_completedVersionKey, 0);
  }

  /// Restores progress without reducing locally completed progress.
  /// Legacy backups without a version count as completing the current intro.
  Future<bool> restoreCompletedVersion(int? version) async {
    try {
      final restoredVersion = version ?? currentVersion;
      if (restoredVersion > await completedVersion) {
        await _keyValueStorage.setValue<int>(
          _completedVersionKey,
          restoredVersion,
        );
      }
      return true;
    } catch (e, st) {
      _logger.error('Could not restore completed introduction version', e, st);
      return false;
    }
  }

  /// Persists old choices or disables all databases for a new installation.
  ///
  /// This is a workaround because in the past, dbs were activated by default.
  Future<void> _initializeDatabaseDefaults(
    AppSettingsProvider appSettings,
  ) async {
    final initialized = await _keyValueStorage.getValue<bool>(
      _databaseDefaultsInitializedKey,
      false,
    );
    if (initialized) return;

    final isExistingInstallation = await _hasExistingDatabase();

    for (final binding in foodDatabases) {
      final database = binding.metadata;
      final activated = isExistingInstallation
          ? appSettings.isFoodDatabaseActivated(database.originId)
          : false;
      final saved = await appSettings.setFoodDatabaseActivated(
        database.originId,
        activated,
      );
      if (!saved) {
        throw StateError(
          'Could not initialize ${database.originId} activation',
        );
      }
    }

    await _keyValueStorage.setValue<bool>(
      _databaseDefaultsInitializedKey,
      true,
    );
  }
}
