import 'package:flutter/material.dart';

import '../models/food/food_tracked.dart';
import '../services/sqlite/tracked_food_database_service_interface.dart';
import 'log_provider.dart';

/// Provider for everything related to tracked food.
///
/// [selectedDate] determines from which day the provider holds the
/// corresponding tracked food items.
class TrackedFoodProvider with ChangeNotifier {
  final TrackedFoodDatabaseServiceInterface _db;
  final LogProvider _logger;

  List<FoodTracked> _foods = [];
  List<FoodTracked> get foods => [..._foods];

  /// Determines from when the provider holds corresponding tracked food items.
  DateTime selectedDate = DateTime.now();

  TrackedFoodProvider({
    required TrackedFoodDatabaseServiceInterface db,
    required LogProvider logger,
  }) : _db = db,
       _logger = logger {
    _getFromDatabase();
  }

  /// Sets [selectedDate] as [date] and fetches tracked food from this date.
  Future<void> selectDate(DateTime date) async {
    selectedDate = date;

    await _getFromDatabase();
  }

  /// Loads all tracked food from [selectedDate] into [_foods].
  Future<void> _getFromDatabase() async {
    _foods = await _db.trackedFoodByDateRange(
      startDate: selectedDate,
      endDate: selectedDate,
    );

    notifyListeners();
  }

  /// Returns all tracked food from the database.
  Future<List<FoodTracked>> getAll() async {
    return _db.trackedFoods;
  }

  /// Tracks a new food.
  void addTrackedFood(FoodTracked foodTracked) {
    if (!_foods.any((f) => f.id == foodTracked.id) &&
        DateUtils.isSameDay(foodTracked.dateEaten, selectedDate)) {
      _foods.add(foodTracked);
      notifyListeners();
    }

    _db.insert(foodTracked);

    _logger.info('Tracked new food: ${foodTracked.title}');
  }

  /// Edits a tracked food.
  void editTrackedFood({
    required FoodTracked food,
    double? amount,
    DateTime? dateEaten,
    required String? selectedServingSize,
  }) {
    final index = foods.indexWhere((element) => element.id == food.id);

    if (amount != null) {
      _foods[index].amount = amount;
    }
    if (dateEaten != null) {
      _foods[index].dateEaten = dateEaten;
    }

    _foods[index].selectedServingSize = selectedServingSize;

    notifyListeners();

    _db.update(_foods[index]);

    _logger.info('Edited tracked food: ${food.title}');
  }

  /// Removes a tracked food.
  void removeTrackedFood(String id) {
    _foods.removeWhere((element) => element.id == id);
    notifyListeners();

    _db.remove(id);

    _logger.info('Removed tracked food with id: $id');
  }

  /// Returns a list of all tracked food between now and [daysAgo].
  Future<List<FoodTracked>> getTrackedFoodFromUntilNow(int daysAgo) async {
    return _db.trackedFoodByDateRange(
      startDate: DateTime.now().subtract(Duration(days: daysAgo)),
      endDate: DateTime.now(),
    );
  }
}
