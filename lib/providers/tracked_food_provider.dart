import 'package:flutter/material.dart';

import '../../models/food_tracked.dart';
import '../../services/tracked_foods_database_service.dart';

/// Gets food only from the selected date
class TrackedFoodProvider with ChangeNotifier {
  List<FoodTracked> _foods = [];
  List<FoodTracked> get foods => [..._foods];
  DateTime selectedDate = DateTime.now();

  TrackedFoodProvider() {
    _getFromDatabase();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    _getFromDatabase();
  }

  void _getFromDatabase() async {
    _foods = await TrackedFoodDatabaseService.trackedFoodByDateRange(
        startDate: selectedDate, endDate: selectedDate);
    notifyListeners();
  }

  void addEatenFood(FoodTracked foodTracked) {
    _foods.add(foodTracked);
    notifyListeners();

    TrackedFoodDatabaseService.insert(foodTracked);
  }

  void editEatenFood({food: FoodTracked, amount: double}) {
    var index = foods.indexWhere((element) => element.id == food.id);
    _foods[index].amount = amount;
    notifyListeners();

    TrackedFoodDatabaseService.update(_foods[index]);
  }

  void removeEatenFood(String id) {
    _foods.removeWhere((element) => element.id == id);
    notifyListeners();

    TrackedFoodDatabaseService.remove(id);
  }
}
