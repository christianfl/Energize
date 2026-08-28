import 'package:sqflite/sqlite_api.dart';

import '../../models/food/food_tracked.dart';
import '../log_service_interface.dart';
import 'database_service.dart';
import 'tracked_food_database_service_interface.dart';

class TrackedFoodDatabaseService
    with DatabaseService
    implements TrackedFoodDatabaseServiceInterface {
  LogServiceInterface? _logger;

  TrackedFoodDatabaseService._privateConstructor();

  static final TrackedFoodDatabaseService instance =
      TrackedFoodDatabaseService._privateConstructor();

  /// Configures the logger used for database errors.
  void configureLogger(LogServiceInterface logger) {
    _logger = logger;
  }

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

  /// Inserts [foods] as new tracked foods in a single transaction.
  @override
  Future<void> insertAll(List<FoodTracked> foods) async {
    if (foods.isEmpty) return;

    final db = await database;
    await db.transaction((transaction) async {
      final batch = transaction.batch();
      for (final food in foods) {
        batch.insert(
          DatabaseService.trackedFoodsTable,
          food.toJson(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      await batch.commit(noResult: true);
    });
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

  /// Updates [foods] by their IDs in a single transaction.
  @override
  Future<void> updateAll(List<FoodTracked> foods) async {
    if (foods.isEmpty) return;

    final db = await database;
    await db.transaction((transaction) async {
      final batch = transaction.batch();
      for (final food in foods) {
        batch.update(
          DatabaseService.trackedFoodsTable,
          food.toJson(),
          where: 'id = ?',
          whereArgs: [food.id],
        );
      }
      await batch.commit(noResult: true);
    });
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

  /// Removes all tracked [foods] by their IDs.
  @override
  Future<void> removeAll(List<FoodTracked> foods) async {
    if (foods.isEmpty) return;

    final db = await database;
    final placeholders = List.filled(foods.length, '?').join(', ');
    await db.delete(
      DatabaseService.trackedFoodsTable,
      where: 'id IN ($placeholders)',
      whereArgs: foods.map((food) => food.id).toList(),
    );
  }

  List<FoodTracked> _generateFoodList(List<Map<String, dynamic>> maps) {
    final List<FoodTracked?> tempList = List.generate(maps.length, (i) {
      try {
        return FoodTracked.fromJson(maps[i]);
      } catch (e, st) {
        _logger?.error('Error parsing tracked food from database', e, st);
        return null;
      }
    });

    // Remove null entries
    return tempList.whereType<FoodTracked>().toList();
  }
}
