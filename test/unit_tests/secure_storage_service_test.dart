import 'package:energize/models/app_settings.dart';
import 'package:energize/models/person/body_targets.dart';
import 'package:energize/services/key_value_storage_service/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test_utils/log_service_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('migrates settings and body targets to secure storage', () async {
    SharedPreferences.setMockInitialValues({
      AppSettings.backupPathAndFilenameKey: '/legacy/backup.json.aes',
      AppSettings.isMealGroupingActivatedKey: true,
      BodyTargets.ageKey: 42,
      BodyTargets.activityLevelKey: 1.5,
      AppSettings.backupUsernameKey: 'legacy-user',
    });
    FlutterSecureStorage.setMockInitialValues({
      AppSettings.backupUsernameKey: 'secure-user',
    });

    final service = SecureStorageService();
    final logger = LogServiceMock();
    service.configureLogger(logger);

    expect(
      await service.getValue(AppSettings.backupPathAndFilenameKey, ''),
      '/legacy/backup.json.aes',
    );
    expect(
      await service.getValue(AppSettings.isMealGroupingActivatedKey, false),
      isTrue,
    );
    expect(await service.getValue(BodyTargets.ageKey, 0), 42);
    expect(await service.getValue(BodyTargets.activityLevelKey, 0.0), 1.5);
    expect(
      await service.getValue(AppSettings.backupUsernameKey, ''),
      'secure-user',
    );
    expect(
      logger.infoMessages,
      contains(
        'Storage contains 0 legacy SharedPreferences value(s) and 5 secure '
        'value(s)',
      ),
    );

    final legacyStorage = await SharedPreferences.getInstance();
    expect(legacyStorage.getKeys(), isEmpty);

    await service.setValue(
      AppSettings.backupPathAndFilenameKey,
      '/secure/backup.json.aes',
    );
    await service.setValue(AppSettings.isMealGroupingActivatedKey, false);
    await service.setValue(BodyTargets.ageKey, 30);
    await service.setValue(BodyTargets.activityLevelKey, 1.8);

    expect(
      await service.getValue(AppSettings.backupPathAndFilenameKey, ''),
      '/secure/backup.json.aes',
    );
    expect(
      await service.getValue(AppSettings.isMealGroupingActivatedKey, true),
      isFalse,
    );
    expect(await service.getValue(BodyTargets.ageKey, 0), 30);
    expect(await service.getValue(BodyTargets.activityLevelKey, 0.0), 1.8);

    await service.remove(AppSettings.backupPathAndFilenameKey);
    expect(
      await service.getValue(AppSettings.backupPathAndFilenameKey, 'fallback'),
      'fallback',
    );
    expect(
      logger.infoMessages.where(
        (message) => message.startsWith('Storage contains'),
      ),
      hasLength(1),
    );
  });
}
