import 'package:flutter/foundation.dart';
import 'package:sqflite/sqlite_api.dart';

import 'complete_days_database_service_interface.dart';
import 'database_service.dart';

class CompleteDaysDatabaseService
    with DatabaseService
    implements CompleteDaysDatabaseServiceInterface {
  CompleteDaysDatabaseService._privateConstructor();

  static final CompleteDaysDatabaseService instance =
      CompleteDaysDatabaseService._privateConstructor();

  @override
  Future<bool> isDateCompleted(DateTime date) async {
    final db = await database;

    final String day = '${date.year}-${date.month}-${date.day}';

    final List<Map<String, dynamic>> completeDay = await db.query(
      DatabaseService.completeDaysTable,
      where: 'date = ?',
      whereArgs: [day],
      limit: 1,
    );

    if (completeDay.length == 1) {
      return true;
    }

    return false;
  }

  @override
  Future<void> insert(DateTime date) async {
    final db = await database;

    final Map<String, String> value = {
      'date': '${date.year}-${date.month}-${date.day}',
    };

    await db.insert(
      DatabaseService.completeDaysTable,
      value,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  @override
  Future<void> remove(DateTime date) async {
    final db = await database;

    final String day = '${date.year}-${date.month}-${date.day}';

    await db.delete(
      DatabaseService.completeDaysTable,
      where: 'date = ?',
      whereArgs: [day],
    );
  }

  @override
  Future<List<DateTime>> get completedDays async {
    final db = await database;

    final List<Map<String, dynamic>> completeDays = await db.query(
      DatabaseService.completeDaysTable,
    );

    final List<DateTime> allCompletedDays = [];

    for (var dateEntry in completeDays) {
      final String date = dateEntry['date'];
      final splittedDate = date.split('-');

      try {
        final int year = int.parse(splittedDate[0]);
        final int month = int.parse(splittedDate[1]);
        final int day = int.parse(splittedDate[2]);

        allCompletedDays.add(DateTime(year, month, day));
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Could not parse completed day from db: $e');
        }
      }
    }

    return allCompletedDays;
  }
}
