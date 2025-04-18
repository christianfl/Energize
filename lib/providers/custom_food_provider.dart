import 'package:flutter/material.dart';

import '../models/food/food.dart';
import '../services/sqlite/custom_food_database_service_interface.dart';

/// Provider for everything related to custom food.
class CustomFoodProvider with ChangeNotifier {
  List<Food> _foods = [];
  List<Food> get foods => [..._foods];

  final CustomFoodDatabaseServiceInterface _db;

  CustomFoodProvider({required CustomFoodDatabaseServiceInterface db})
      : _db = db {
    _getFromDatabase();
  }

  /// Loads all custom foods into [_foods].
  void _getFromDatabase() async {
    _foods = await _db.customFoods;
    notifyListeners();
  }

  /// Adds a new custom food.
  void addFood(Food food) {
    if (!_foods.any((f) => f.id == food.id)) {
      _foods.add(food);
      notifyListeners();
    }

    _db.insert(food);
  }

  /// Updates a custom food.
  void updateFood(Food food) {
    final index = foods.indexWhere((element) => element.id == food.id);
    _foods[index] = food;
    notifyListeners();

    _db.update(food);
  }

  /// Removes a custom food.
  void removeFood(String id) {
    _foods.removeWhere((element) => element.id == id);
    notifyListeners();

    _db.remove(id);
  }

  /// Returns a single custom food by [Food.ean].
  Future<Food?> getCustomFoodByBarcode(String barcode) async {
    return _db.getByBarcode(barcode);
  }
}
