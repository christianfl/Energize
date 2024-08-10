import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/backup_data.dart';
import '../providers/custom_food_provider.dart';
import '../providers/tracked_food_provider.dart';
import 'encryption_service.dart';
import 'sqlite/complete_days_database_service.dart';
import 'sqlite/custom_foods_database_service.dart';
import 'sqlite/tracked_foods_database_service.dart';

/// Offers methods for creating backups and restoring them
class BackupService {
  /// Creates a backup of the database.
  ///
  /// Currently WIP: Does only backup custumFood, trackedFood, completedDays
  ///
  /// Returns object with:
  /// - backupData: Object which contains plaintext backup as Objects
  /// - encryptedData: encrypted data as JSON encoded encrypted String and
  static Future<CreateBackupReturnData> createBackup(
    String encryptionPassword,
  ) async {
    final backupData = BackupData(
      customFood: await CustomFoodDatabaseService.customFoods,
      trackedFood: await TrackedFoodDatabaseService.trackedFoods,
      completedDays: await CompleteDaysDatabaseService.completedDays,
    );

    final encodedBackupData = json.encode(backupData.toJson());
    final encryptedData =
        EncryptionService.encrypt(encodedBackupData, encryptionPassword);

    return CreateBackupReturnData(
      backupData: backupData,
      encryptedData: encryptedData,
    );
  }

  /// Restores a previously created backup and reflects changes in UI with provider
  ///
  /// Currently WIP: Does only restore custumFood, trackedFood, completedDays
  ///
  /// Returns backupData (Object which contains plaintext backup as Objects)
  static BackupData restoreBackup(
    String encryptedData,
    String encryptionPassword,
    BuildContext context,
  ) {
    try {
      final decryptedBackup = EncryptionService.decrypt(
        encryptedData,
        encryptionPassword,
      );

      final backupData = BackupData.fromJson(json.decode(decryptedBackup));

      // Initialize providers for directly reflect data changes in UI
      final customFoodProvider =
          Provider.of<CustomFoodProvider>(context, listen: false);
      final trackedFoodProvider =
          Provider.of<TrackedFoodProvider>(context, listen: false);

      // Custum food
      if (backupData.customFood != null) {
        for (var customFood in backupData.customFood!) {
          customFoodProvider.addFood(customFood);
        }
      }

      // Tracked food
      if (backupData.trackedFood != null) {
        for (var trackedFood in backupData.trackedFood!) {
          trackedFoodProvider.addEatenFood(trackedFood);
        }
      }
      if (backupData.completedDays != null) {
        for (var completedDay in backupData.completedDays!) {
          CompleteDaysDatabaseService.insert(completedDay);
        }
      }

      // Return backupData so that the UI can show how many objects where restored
      return backupData;
    } catch (exception) {
      // do something to catch

      String errorMessage = 'Error while restoring backup';

      if (exception
          .toString()
          .toLowerCase()
          .contains('invalid or corrupted pad block')) {
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
