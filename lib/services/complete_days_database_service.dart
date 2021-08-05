import 'database_service.dart';

class CompleteDaysDatabaseService with DatabaseService {
  CompleteDaysDatabaseService._privateConstructor();
  static final CompleteDaysDatabaseService instance =
      CompleteDaysDatabaseService._privateConstructor();

  static Future<bool> isDateCompleted(DateTime date) async {
    final db = await instance.database;

    String day = '${date.year}-${date.month}-${date.day}';

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

  static Future<void> insert(DateTime date) async {
    final db = await instance.database;

    Map<String, String> value = {
      'date': '${date.year}-${date.month}-${date.day}',
    };

    await db.insert(
      DatabaseService.completeDaysTable,
      value,
    );
  }

  static Future<void> remove(DateTime date) async {
    final db = await instance.database;

    String day = '${date.year}-${date.month}-${date.day}';

    await db.delete(
      DatabaseService.completeDaysTable,
      where: 'date = ?',
      whereArgs: [day],
    );
  }
}
