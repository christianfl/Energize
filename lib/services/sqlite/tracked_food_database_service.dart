import 'package:flutter/foundation.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../models/food/food_tracked.dart';
import 'database_service.dart';
import 'tracked_food_database_service_interface.dart';

class TrackedFoodDatabaseService
    with DatabaseService
    implements TrackedFoodDatabaseServiceInterface {
  TrackedFoodDatabaseService._privateConstructor();

  static final TrackedFoodDatabaseService instance =
      TrackedFoodDatabaseService._privateConstructor();

  @override
  Future<List<FoodTracked>> trackedFoodByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await database;

    final DateTime dayStart = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    final DateTime dayEnd = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      23,
      59,
      59,
      999,
    );

    final args = [
      dayStart.millisecondsSinceEpoch,
      dayEnd.millisecondsSinceEpoch,
    ];

    final List<Map<String, dynamic>> trackedFoodMap = await db.query(
      DatabaseService.trackedFoodsTable,
      where: 'dateEaten BETWEEN ? AND ?',
      whereArgs: args,
    );

    return _generateFoodList(trackedFoodMap);
  }

  @override
  Future<List<FoodTracked>> get trackedFoods async {
    final db = await database;

    final List<Map<String, dynamic>> trackedFoodMap = await db.query(
      DatabaseService.trackedFoodsTable,
    );

    return _generateFoodList(trackedFoodMap);
  }

  @override
  Future<void> insert(FoodTracked food) async {
    final db = await database;

    await db.insert(
      DatabaseService.trackedFoodsTable,
      food.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  @override
  Future<void> update(FoodTracked food) async {
    final db = await database;

    await db.update(
      DatabaseService.trackedFoodsTable,
      food.toJson(),
      where: 'id = ?',
      whereArgs: [food.id],
    );
  }

  @override
  Future<void> remove(String id) async {
    final db = await database;

    await db.delete(
      DatabaseService.trackedFoodsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  List<FoodTracked> _generateFoodList(List<Map<String, dynamic>> maps) {
    final List<FoodTracked?> tempList = List.generate(maps.length, (i) {
      try {
        return FoodTracked.fromJson(maps[i]);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Error parsing tracked food from db: $e');
        }
        return null;
      }
    });

    // Remove null entries
    return tempList.whereType<FoodTracked>().toList();
  }
}
