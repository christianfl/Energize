import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

mixin DatabaseService {
  static Database? _database;
  static const db = 'foods_database.db';
  static const customFoodstable = 'customfoods';
  static const trackedFoodsTable = 'trackedfoods';
  static const completeDaysTable = 'completedays';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), db),
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1) {
      await db
          .execute('ALTER TABLE $customFoodstable ADD COLUMN cholesterol REAL');
      await db.execute('ALTER TABLE $customFoodstable ADD COLUMN starch REAL');
      await db.execute('ALTER TABLE $customFoodstable ADD COLUMN alcohol REAL');

      await db.execute(
        'ALTER TABLE $trackedFoodsTable ADD COLUMN cholesterol REAL',
      );
      await db.execute('ALTER TABLE $trackedFoodsTable ADD COLUMN starch REAL');
      await db
          .execute('ALTER TABLE $trackedFoodsTable ADD COLUMN alcohol REAL');
    }
  }

  Future _onCreate(Database db, int version) async {
    const createCustomFoodstable = '''CREATE TABLE $customFoodstable(
      id TEXT PRIMARY KEY,
      title TEXT,
      origin TEXT,
      ean TEXT,
      imageUrl TEXT,
      imageThumbnailUrl TEXT,
      calories REAL,
      protein REAL,
      carbs REAL,
      fat REAL,
      vitaminA REAL,
      vitaminB1 REAL,
      vitaminB2 REAL,
      vitaminB3 REAL,
      vitaminB5 REAL,
      vitaminB6 REAL,
      vitaminB7 REAL,
      vitaminB9 REAL,
      vitaminB12 REAL,
      vitaminC REAL,
      vitaminD REAL,
      vitaminE REAL,
      vitaminK REAL,
      calcium REAL,
      chloride REAL,
      magnesium REAL,
      phosphorus REAL,
      potassium REAL,
      sodium REAL,
      chromium REAL,
      iron REAL,
      fluorine REAL,
      iodine REAL,
      copper REAL,
      manganese REAL,
      molybdenum REAL,
      selenium REAL,
      zinc REAL,
      monounsaturatedFat REAL,
      polyunsaturatedFat REAL,
      omega3 REAL,
      omega6 REAL,
      saturatedFat REAL,
      transFat REAL,
      cholesterol REAL,
      fiber REAL,
      sugar REAL,
      sugarAlcohol REAL,
      starch REAL,
      water REAL,
      caffeine REAL,
      alcohol REAL
    )''';
    await db.execute(createCustomFoodstable);

    const createTrackedFoodsTable = '''CREATE TABLE $trackedFoodsTable(
      id TEXT PRIMARY KEY,
      amount REAL,
      dateEaten INTEGER,
      dateAdded INTEGER,
      title TEXT,
      origin TEXT,
      ean TEXT,
      imageUrl TEXT,
      imageThumbnailUrl TEXT,
      calories REAL,
      protein REAL,
      carbs REAL,
      fat REAL,
      vitaminA REAL,
      vitaminB1 REAL,
      vitaminB2 REAL,
      vitaminB3 REAL,
      vitaminB5 REAL,
      vitaminB6 REAL,
      vitaminB7 REAL,
      vitaminB9 REAL,
      vitaminB12 REAL,
      vitaminC REAL,
      vitaminD REAL,
      vitaminE REAL,
      vitaminK REAL,
      calcium REAL,
      chloride REAL,
      magnesium REAL,
      phosphorus REAL,
      potassium REAL,
      sodium REAL,
      chromium REAL,
      iron REAL,
      fluorine REAL,
      iodine REAL,
      copper REAL,
      manganese REAL,
      molybdenum REAL,
      selenium REAL,
      zinc REAL,
      monounsaturatedFat REAL,
      polyunsaturatedFat REAL,
      omega3 REAL,
      omega6 REAL,
      saturatedFat REAL,
      transFat REAL,
      cholesterol REAL,
      fiber REAL,
      sugar REAL,
      sugarAlcohol REAL,
      starch REAL,
      water REAL,
      caffeine REAL,
      alcohol REAL
    )''';
    await db.execute(createTrackedFoodsTable);

    const createCompleteDaysTable = '''CREATE TABLE $completeDaysTable(
      date TEXT PRIMARY KEY
    )''';
    await db.execute(createCompleteDaysTable);
  }
}
