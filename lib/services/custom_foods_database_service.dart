import 'package:sqflite/sqlite_api.dart';

import '../models/food/food.dart';
import 'database_service.dart';

class CustomFoodDatabaseService with DatabaseService {
  CustomFoodDatabaseService._privateConstructor();
  static final CustomFoodDatabaseService instance =
      CustomFoodDatabaseService._privateConstructor();

  static Future<List<Food>> get customFoods async {
    final db = await instance.database;

    final List<Map<String, dynamic>> customFoodMap =
        await db.query(DatabaseService.customFoodstable);

    return _generateFoodList(customFoodMap);
  }

  static Future<void> insert(Food food) async {
    final db = await instance.database;

    await db.insert(
      DatabaseService.customFoodstable,
      food.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<void> update(Food food) async {
    final db = await instance.database;

    await db.update(
      DatabaseService.customFoodstable,
      food.toJson(),
      where: 'id = ?',
      whereArgs: [food.id],
    );
  }

  static Future<void> remove(String id) async {
    final db = await instance.database;

    await db.delete(
      DatabaseService.customFoodstable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static List<Food> _generateFoodList(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Food.fromJson(maps[i]);
    });
  }
}
