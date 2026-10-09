import 'package:energize/models/app_settings.dart';
import 'package:energize/providers/app_settings_provider.dart';
import 'package:energize/providers/log_provider.dart';
import 'package:energize/services/food_database_bindings/food_databases.dart';
import 'package:energize/services/introduction_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils/key_value_storage_service_mock.dart';
import '../test_utils/log_service_mock.dart';

void main() {
  group('IntroductionService', () {
    test('disables food databases for a new installation', () async {
      final storage = KeyValueStorageServiceMock();
      final settings = AppSettingsProvider(
        keyValueStorage: storage,
        logger: LogProvider(),
      );
      await settings.initialized;
      final service = IntroductionService(
        keyValueStorage: storage,
        logger: LogServiceMock(),
        hasExistingDatabase: () async => false,
      );

      expect(await service.prepare(settings), isTrue);

      for (final binding in foodDatabases) {
        final database = binding.metadata;
        expect(settings.isFoodDatabaseActivated(database.originId), isFalse);
      }
      expect(
        storage.keyValueStorage[AppSettings.isProviderSndbActivatedKey],
        isFalse,
      );
      expect(
        storage.keyValueStorage[AppSettings
            .isProviderOpenFoodFactsActivatedKey],
        isFalse,
      );
      expect(
        storage.keyValueStorage[AppSettings.isProviderUsdaActivatedKey],
        isFalse,
      );
    });

    test('preserves database choices for an existing installation', () async {
      final storage = KeyValueStorageServiceMock();
      storage.keyValueStorage.addAll({
        AppSettings.isProviderSndbActivatedKey: true,
        AppSettings.isProviderOpenFoodFactsActivatedKey: false,
        AppSettings.isProviderUsdaActivatedKey: true,
      });
      final settings = AppSettingsProvider(
        keyValueStorage: storage,
        logger: LogProvider(),
      );
      await settings.initialized;
      final service = IntroductionService(
        keyValueStorage: storage,
        logger: LogServiceMock(),
        hasExistingDatabase: () async => true,
      );

      expect(await service.prepare(settings), isTrue);

      expect(settings.isProviderSndbActivated, isTrue);
      expect(settings.isProviderOpenFoodFactsActivated, isFalse);
      expect(settings.isProviderUsdaActivated, isTrue);
    });

    test('does not show completed intro again', () async {
      final storage = KeyValueStorageServiceMock();
      final settings = AppSettingsProvider(
        keyValueStorage: storage,
        logger: LogProvider(),
      );
      await settings.initialized;
      var checkedDatabase = false;
      final service = IntroductionService(
        keyValueStorage: storage,
        logger: LogServiceMock(),
        hasExistingDatabase: () async {
          checkedDatabase = true;
          return false;
        },
      );

      expect(await service.complete(), isTrue);
      expect(await service.prepare(settings), isFalse);
      expect(checkedDatabase, isFalse);
    });

    test('exposes and restores the completed version for backups', () async {
      final storage = KeyValueStorageServiceMock();
      final service = IntroductionService(
        keyValueStorage: storage,
        logger: LogServiceMock(),
        hasExistingDatabase: () async => false,
      );

      // No intro completed yet: restoring version 0 keeps stored version at 0.
      expect(await service.completedVersion, 0);
      expect(await service.restoreCompletedVersion(0), isTrue);
      expect(await service.completedVersion, 0);

      // Completing the intro stores the current version.
      expect(await service.complete(), isTrue);
      expect(
        await service.completedVersion,
        IntroductionService.currentVersion,
      );

      // Restoring version 0 now must preserve the completed current version.
      expect(await service.restoreCompletedVersion(0), isTrue);
      expect(
        await service.completedVersion,
        IntroductionService.currentVersion,
      );
      // A backup with newer completed progress advances the stored version.
      final newerVersion = IntroductionService.currentVersion + 1;
      expect(await service.restoreCompletedVersion(newerVersion), isTrue);
      expect(await service.completedVersion, newerVersion);
      // A legacy backup uses current version, preserving newer local progress.
      expect(await service.restoreCompletedVersion(null), isTrue);
      expect(await service.completedVersion, newerVersion);
    });
  });
}
