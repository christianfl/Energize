import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/backup_data.dart';
import '../providers/app_settings_provider.dart';
import '../providers/body_targets_provider.dart';
import '../providers/complete_days_provider.dart';
import '../providers/custom_food_provider.dart';
import '../providers/tracked_food_provider.dart';
import 'encryption_service.dart';

/// Offers methods for creating backups and restoring them
class BackupService {
  /// Creates a backup of the database.
  ///
  /// Returns object with:
  /// - backupData: Object which contains plaintext backup as Objects
  /// - encryptedData: encrypted data as JSON encoded encrypted String and
  static Future<CreateBackupReturnData> createBackup(
    String encryptionPassword,
    BuildContext context,
  ) async {
    // Initialize providers
    final customFoodProvider = Provider.of<CustomFoodProvider>(
      context,
      listen: false,
    );
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(
      context,
      listen: false,
    );
    final completeDaysProvider = Provider.of<CompleteDaysProvider>(
      context,
      listen: false,
    );
    final appSettingsProvider = Provider.of<AppSettingsProvider>(
      context,
      listen: false,
    );
    final bodyTargetsProvider = Provider.of<BodyTargetsProvider>(
      context,
      listen: false,
    );

    final backupData = BackupData(
      customFood: await customFoodProvider.getAll(),
      trackedFood: await trackedFoodProvider.getAll(),
      completedDays: await completeDaysProvider.completedDays,
      appSettings: appSettingsProvider.settings,
      bodyTargets: bodyTargetsProvider.bodyTargets,
    );

    final encodedBackupData = json.encode(backupData.toJson());
    final encryptedData = EncryptionService.encrypt(
      encodedBackupData,
      encryptionPassword,
    );

    return CreateBackupReturnData(
      backupData: backupData,
      encryptedData: encryptedData,
    );
  }

  /// Restores a previously created backup.
  ///
  /// Changes are directly reflected in the UI.
  ///
  /// Returns backupData (Object which contains plaintext backup as Objects)
  static Future<BackupData> restoreBackup(
    String encryptedData,
    String encryptionPassword,
    BuildContext context,
  ) async {
    try {
      final decryptedBackup = EncryptionService.decrypt(
        encryptedData,
        encryptionPassword,
      );

      final backupData = BackupData.fromJson(json.decode(decryptedBackup));

      // Initialize providers for directly reflect data changes in UI
      final customFoodProvider = Provider.of<CustomFoodProvider>(
        context,
        listen: false,
      );
      final trackedFoodProvider = Provider.of<TrackedFoodProvider>(
        context,
        listen: false,
      );
      final completeDaysProvider = Provider.of<CompleteDaysProvider>(
        context,
        listen: false,
      );
      final appSettingsProvider = Provider.of<AppSettingsProvider>(
        context,
        listen: false,
      );
      final bodyTargetsProvider = Provider.of<BodyTargetsProvider>(
        context,
        listen: false,
      );

      // Custom food
      if (backupData.customFood != null) {
        for (var customFood in backupData.customFood!) {
          customFoodProvider.addFood(customFood);
        }
      }

      // Tracked food
      if (backupData.trackedFood != null) {
        for (var trackedFood in backupData.trackedFood!) {
          trackedFoodProvider.addTrackedFood(trackedFood);
        }
      }

      // Complete days
      if (backupData.completedDays != null) {
        for (var completedDay in backupData.completedDays!) {
          await completeDaysProvider.markCompleted(completedDay);
        }
      }

      // App settings
      if (backupData.appSettings != null) {
        await appSettingsProvider.saveAll(backupData.appSettings!);
      }

      // Body and targets
      if (backupData.bodyTargets != null) {
        await bodyTargetsProvider.saveAll(backupData.bodyTargets!);
      }

      // Return backupData so that the UI can show how many objects where restored
      return backupData;
    } catch (exception) {
      // do something to catch

      String errorMessage = 'Error while restoring backup';

      if (exception.toString().toLowerCase().contains(
        'invalid or corrupted pad block',
      )) {
        errorMessage =
            'Something went wrong. Is the decryption password correct?';
      }

      throw Exception(errorMessage);
    }
  }
}

class CreateBackupReturnData {
  final BackupData backupData;
  final String encryptedData;

  CreateBackupReturnData({
    required this.encryptedData,
    required this.backupData,
  });
}
