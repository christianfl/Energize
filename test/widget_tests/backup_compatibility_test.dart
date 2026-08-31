import 'dart:io';

import 'package:energize/models/person/enums/sex.dart';
import 'package:energize/providers/app_settings_provider.dart';
import 'package:energize/providers/body_targets_provider.dart';
import 'package:energize/providers/complete_days_provider.dart';
import 'package:energize/providers/custom_food_provider.dart';
import 'package:energize/providers/log_provider.dart';
import 'package:energize/providers/tracked_food_provider.dart';
import 'package:energize/services/backup_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../test_utils/complete_days_database_service_mock.dart';
import '../test_utils/custom_food_database_service_mock.dart';
import '../test_utils/key_value_storage_service_mock.dart';
import '../test_utils/tracked_food_database_service_mock.dart';

void main() {
  testWidgets('restores a backup created with Energize v0.13.3', (
    tester,
  ) async {
    final storage = KeyValueStorageServiceMock();
    final logger = LogProvider();
    final appSettings = AppSettingsProvider(
      keyValueStorage: storage,
      logger: logger,
    );
    final bodyTargets = BodyTargetsProvider(
      keyValueStorage: storage,
      logger: logger,
    );
    final customFoods = CustomFoodProvider(
      db: CustomFoodDatabaseServiceMock(),
      logger: logger,
    );
    final trackedFoods = TrackedFoodProvider(
      db: TrackedFoodDatabaseServiceMock(),
      logger: logger,
    );
    final completedDays = CompleteDaysProvider(
      db: CompleteDaysDatabaseServiceMock(),
      logger: logger,
    );

    await Future.wait([
      appSettings.initialized,
      bodyTargets.initialized,
      customFoods.initialized,
      trackedFoods.initialized,
    ]);

    late BuildContext context;

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: appSettings),
          ChangeNotifierProvider.value(value: bodyTargets),
          ChangeNotifierProvider.value(value: customFoods),
          ChangeNotifierProvider.value(value: trackedFoods),
          Provider.value(value: completedDays),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (buildContext) {
              context = buildContext;
              return const SizedBox();
            },
          ),
        ),
      ),
    );

    final encryptedBackup = File(
      'test/assets/backup-test-v0.13.3.json.aes',
    ).readAsStringSync();

    final backup = await BackupService.restoreBackup(
      encryptedBackup,
      'backuptestpw',
      context,
    );

    expect(backup.customFood, hasLength(1));
    expect(backup.customFood!.single.title, 'My Custom Food');
    expect(backup.trackedFood, hasLength(3));
    expect(backup.completedDays, isEmpty);
    expect(backup.appSettings!.isMealGroupingActivated, isFalse);
    expect(backup.bodyTargets!.age, 25);
    expect(backup.bodyTargets!.sex, Sex.male);
    expect(backup.bodyTargets!.weight, 75);
    expect(backup.bodyTargets!.height, 172);

    expect(
      customFoods.foods.any((food) => food.title == 'My Custom Food'),
      isTrue,
    );
    expect(await trackedFoods.getAll(), hasLength(3));
    expect(await completedDays.completedDays, isEmpty);
    expect(appSettings.isMealGroupingActivated, isFalse);
    expect(bodyTargets.age, 25);
    expect(bodyTargets.sex, Sex.male);
  });
}
