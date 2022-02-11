import 'package:flutter/material.dart';

import '../../models/food.dart';
import '../../services/custom_foods_database_service.dart';

class CustomFoodProvider with ChangeNotifier {
  List<Food> _foods = [];
  List<Food> get foods => [..._foods];

  CustomFoodProvider() {
    _getFromDatabase();
  }

  void _getFromDatabase() async {
    _foods = await CustomFoodDatabaseService.customFoods;
    notifyListeners();
  }

  void addFood(Food food) {
    if (!_foods.any((f) => f.id == food.id)) {
      _foods.add(food);
      notifyListeners();
    }

    CustomFoodDatabaseService.insert(food);
  }

  void updateFood(Food food) {
    var index = foods.indexWhere((element) => element.id == food.id);
    _foods[index] = food;
    notifyListeners();

    CustomFoodDatabaseService.update(food);
  }

  void removeFood(String id) {
    _foods.removeWhere((element) => element.id == id);
    notifyListeners();

    CustomFoodDatabaseService.remove(id);
  }
}
