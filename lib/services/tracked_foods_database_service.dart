import '../../models/food_tracked.dart';
import 'database_service.dart';

class TrackedFoodDatabaseService with DatabaseService {
  TrackedFoodDatabaseService._privateConstructor();
  static final TrackedFoodDatabaseService instance =
      TrackedFoodDatabaseService._privateConstructor();

  static Future<List<FoodTracked>> trackedFoodByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    final db = await instance.database;

    DateTime dayStart =
        DateTime(startDate.year, startDate.month, startDate.day);
    DateTime dayEnd =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59, 999);

    var args = [dayStart.millisecondsSinceEpoch, dayEnd.millisecondsSinceEpoch];

    final List<Map<String, dynamic>> trackedFoodMap = await db.query(
        DatabaseService.trackedFoodsTable,
        where: 'dateEaten BETWEEN ? AND ?',
        whereArgs: args);

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
      food.toMap(),
    );
  }

  static Future<void> update(FoodTracked food) async {
    final db = await instance.database;

    await db.update(
      DatabaseService.trackedFoodsTable,
      food.toMap(),
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
      return FoodTracked(
        id: maps[i]['id'],
        amount: maps[i]['amount'],
        dateEaten: DateTime.fromMillisecondsSinceEpoch(maps[i]['dateEaten']),
        dateAdded: DateTime.fromMillisecondsSinceEpoch(maps[i]['dateAdded']),
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
