import 'package:sqflite/sqlite_api.dart';

import '../../models/food.dart';
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
      food.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<void> update(Food food) async {
    final db = await instance.database;

    await db.update(
      DatabaseService.customFoodstable,
      food.toMap(),
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
      return Food(
        id: maps[i]['id'],
        title: maps[i]['title'],
        origin: maps[i]['origin'],
        ean: maps[i]['ean'],
        imageUrl: maps[i]['imageUrl'],
        imageThumbnailUrl: maps[i]['imageThumbnailUrl'],
        calories: maps[i]['calories'],
        protein: maps[i]['protein'],
        carbs: maps[i]['carbs'],
        fat: maps[i]['fat'],
        vitaminA: maps[i]['vitaminA'],
        vitaminB1: maps[i]['vitaminB1'],
        vitaminB2: maps[i]['vitaminB2'],
        vitaminB3: maps[i]['vitaminB3'],
        vitaminB5: maps[i]['vitaminB5'],
        vitaminB6: maps[i]['vitaminB6'],
        vitaminB7: maps[i]['vitaminB7'],
        vitaminB9: maps[i]['vitaminB9'],
        vitaminB12: maps[i]['vitaminB12'],
        vitaminC: maps[i]['vitaminC'],
        vitaminD: maps[i]['vitaminD'],
        vitaminE: maps[i]['vitaminE'],
        vitaminK: maps[i]['vitaminK'],
        calcium: maps[i]['calcium'],
        chloride: maps[i]['chloride'],
        magnesium: maps[i]['magnesium'],
        phosphorus: maps[i]['phosphorus'],
        potassium: maps[i]['potassium'],
        sodium: maps[i]['sodium'],
        chromium: maps[i]['chromium'],
        iron: maps[i]['iron'],
        fluorine: maps[i]['fluorine'],
        iodine: maps[i]['iodine'],
        copper: maps[i]['copper'],
        manganese: maps[i]['manganese'],
        molybdenum: maps[i]['molybdenum'],
        selenium: maps[i]['selenium'],
        zinc: maps[i]['zinc'],
        monounsaturatedFat: maps[i]['monounsaturatedFat'],
        polyunsaturatedFat: maps[i]['polyunsaturatedFat'],
        omega3: maps[i]['omega3'],
        omega6: maps[i]['omega6'],
        saturatedFat: maps[i]['saturatedFat'],
        transFat: maps[i]['transFat'],
        cholesterol: maps[i]['cholesterol'],
        fiber: maps[i]['fiber'],
        sugar: maps[i]['sugar'],
        sugarAlcohol: maps[i]['sugarAlcohol'],
        starch: maps[i]['starch'],
        water: maps[i]['water'],
        caffeine: maps[i]['caffeine'],
        alcohol: maps[i]['alcohol'],
      );
    });
  }
}
