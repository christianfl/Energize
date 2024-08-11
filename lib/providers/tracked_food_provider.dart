import 'package:flutter/material.dart';

import '../../services/sqlite/tracked_foods_database_service.dart';
import '../models/food/food_tracked.dart';

/// Gets food only from the selected date
class TrackedFoodProvider with ChangeNotifier {
  List<FoodTracked> _foods = [];
  List<FoodTracked> get foods => [..._foods];
  DateTime selectedDate = DateTime.now();

  TrackedFoodProvider() {
    _getFromDatabase();
  }

  bool _isSameDay(DateTime day1, DateTime day2) {
    if (day1.year == day2.year &&
        day1.month == day2.month &&
        day1.day == day2.day) {
      return true;
    }

    return false;
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    _getFromDatabase();
  }

  void _getFromDatabase() async {
    _foods = await TrackedFoodDatabaseService.trackedFoodByDateRange(
      startDate: selectedDate,
      endDate: selectedDate,
    );
    notifyListeners();
  }

  void addEatenFood(FoodTracked foodTracked) {
    if (!_foods.any((f) => f.id == foodTracked.id) &&
        _isSameDay(foodTracked.dateEaten, selectedDate)) {
      _foods.add(foodTracked);
      notifyListeners();
    }

    TrackedFoodDatabaseService.insert(foodTracked);
  }

  void editEatenFood({
    required FoodTracked food,
    double? amount,
    DateTime? dateEaten,
  }) {
    final index = foods.indexWhere((element) => element.id == food.id);

    if (amount != null) {
      _foods[index].amount = amount;
    }
    if (dateEaten != null) {
      _foods[index].dateEaten = dateEaten;
    }

    notifyListeners();

    TrackedFoodDatabaseService.update(_foods[index]);
  }

  void removeEatenFood(String id) {
    _foods.removeWhere((element) => element.id == id);
    notifyListeners();

    TrackedFoodDatabaseService.remove(id);
  }
}
