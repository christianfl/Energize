import 'package:flutter/material.dart';

import '../models/food/food.dart';
import '../services/sqlite/custom_food_database_service_interface.dart';
import 'log_provider.dart';

/// Provider for everything related to custom food.
class CustomFoodProvider with ChangeNotifier {
  final CustomFoodDatabaseServiceInterface _db;
  final LogProvider _logger;

  List<Food> _foods = [];
  List<Food> get foods => [..._foods];

  CustomFoodProvider({
    required CustomFoodDatabaseServiceInterface db,
    required LogProvider logger,
  })  : _db = db,
        _logger = logger {
    _getFromDatabase();
  }

  /// Loads all custom foods into [_foods].
  void _getFromDatabase() async {
    _foods = await getAll();
    notifyListeners();
  }

  /// Returns all custom foods from the database.
  Future<List<Food>> getAll() async {
    return _db.customFoods;
  }

  /// Adds a new custom food.
  void addFood(Food food) {
    if (!_foods.any((f) => f.id == food.id)) {
      _foods.add(food);
      notifyListeners();
    }

    _db.insert(food);

    _logger.info('Added new custom food: ${food.title}');
  }

  /// Updates a custom food.
  void updateFood(Food food) {
    final index = foods.indexWhere((element) => element.id == food.id);
    _foods[index] = food;
    notifyListeners();

    _db.update(food);

    _logger.info('Edited custom food: ${food.title}');
  }

  /// Removes a custom food.
  void removeFood(String id) {
    _foods.removeWhere((element) => element.id == id);
    notifyListeners();

    _db.remove(id);

    _logger.info('Removed custom food with id: $id');
  }

  /// Returns a single custom food by [Food.ean].
  Future<Food?> getCustomFoodByBarcode(String barcode) async {
    return _db.getByBarcode(barcode);
  }
}
