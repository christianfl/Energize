import 'package:sqflite/sqlite_api.dart';

import '../../models/food/food_tracked.dart';
import 'database_service.dart';

class TrackedFoodDatabaseService with DatabaseService {
  TrackedFoodDatabaseService._privateConstructor();
  static final TrackedFoodDatabaseService instance =
      TrackedFoodDatabaseService._privateConstructor();

  static Future<List<FoodTracked>> trackedFoodByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await instance.database;

    final DateTime dayStart =
        DateTime(startDate.year, startDate.month, startDate.day);
    final DateTime dayEnd =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59, 999);

    final args = [dayStart.millisecondsSinceEpoch, dayEnd.millisecondsSinceEpoch];

    final List<Map<String, dynamic>> trackedFoodMap = await db.query(
      DatabaseService.trackedFoodsTable,
      where: 'dateEaten BETWEEN ? AND ?',
      whereArgs: args,
    );

    return _generateFoodList(trackedFoodMap);
  }

  static Future<List<FoodTracked>> get trackedFoods async {
    final db = await instance.database;

    final List<Map<String, dynamic>> trackedFoodMap =
        await db.query(DatabaseService.trackedFoodsTable);

    return _generateFoodList(trackedFoodMap);
  }

  static Future<void> insert(FoodTracked food) async {
    final db = await instance.database;

    await db.insert(
      DatabaseService.trackedFoodsTable,
      food.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<void> update(FoodTracked food) async {
    final db = await instance.database;

    await db.update(
      DatabaseService.trackedFoodsTable,
      food.toJson(),
      where: 'id = ?',
      whereArgs: [food.id],
    );
  }

  static Future<void> remove(String id) async {
    final db = await instance.database;

    await db.delete(
      DatabaseService.trackedFoodsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static List<FoodTracked> _generateFoodList(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return FoodTracked.fromJson(maps[i]);
    });
  }
}
