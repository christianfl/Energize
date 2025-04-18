import 'package:sqflite/sqlite_api.dart';

import '../../models/food/food.dart';
import 'custom_food_database_service_interface.dart';
import 'database_service.dart';

class CustomFoodDatabaseService
    with DatabaseService
    implements CustomFoodDatabaseServiceInterface {
  CustomFoodDatabaseService._privateConstructor();
  static final CustomFoodDatabaseService instance =
      CustomFoodDatabaseService._privateConstructor();

  @override
  Future<List<Food>> get customFoods async {
    final db = await database;

    final List<Map<String, dynamic>> customFoodMap =
        await db.query(DatabaseService.customFoodstable);

    return _generateFoodList(customFoodMap);
  }

  @override
  Future<void> insert(Food food) async {
    final db = await database;

    await db.insert(
      DatabaseService.customFoodstable,
      food.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  @override
  Future<void> update(Food food) async {
    final db = await database;

    await db.update(
      DatabaseService.customFoodstable,
      food.toJson(),
      where: 'id = ?',
      whereArgs: [food.id],
    );
  }

  @override
  Future<void> remove(String id) async {
    final db = await database;

    await db.delete(
      DatabaseService.customFoodstable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  List<Food> _generateFoodList(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Food.fromJson(maps[i]);
    });
  }

  /// Gets the first custom food with the specified barcode (ordered by name)
  @override
  Future<Food?> getByBarcode(String barcode) async {
    final db = await database;

    final foodJsonList = await db.query(
      DatabaseService.customFoodstable,
      where: 'ean = ?',
      whereArgs: [barcode],
      orderBy: 'title asc',
      limit: 1,
    );

    try {
      final foodJson = foodJsonList[0];

      final foodWithEan = Food.fromJson(foodJson);
      return foodWithEan;
    } catch (e) {
      // No custom food with this EAN found
      return null;
    }
  }
}
