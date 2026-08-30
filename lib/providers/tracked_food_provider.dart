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

  /// Completes after the tracked foods for [selectedDate] have been loaded.
  late final Future<void> initialized;

  TrackedFoodProvider({required this._db, required this._logger}) {
    initialized = _getFromDatabase();
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

  /// Tracks a new food and optionally logs the action.
  void addTrackedFood(FoodTracked foodTracked, {bool logAction = true}) {
    if (!_foods.any((f) => f.id == foodTracked.id) &&
        DateUtils.isSameDay(foodTracked.dateEaten, selectedDate)) {
      _foods.add(foodTracked);
      notifyListeners();
    }

    _db.insert(foodTracked);

    if (logAction) {
      _logger.info('Tracked new food: ${foodTracked.title}');
    }
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
  Future<void> removeTrackedFood(String id) async {
    _foods.removeWhere((element) => element.id == id);
    notifyListeners();

    await _db.remove(id);

    _logger.info('Removed tracked food with id: $id');
  }

  /// Copies [foods] to [targetDay], preserving each food's time of day.
  Future<List<FoodTracked>> copyTrackedFoods(
    List<FoodTracked> foods,
    DateTime targetDay,
  ) async {
    final now = DateTime.now();
    final copies = foods.map((food) {
      return FoodTracked.fromFood(
        food,
        FoodTracked.generatedId,
        food.amount,
        _withDay(food.dateEaten, targetDay),
        now,
        selectedServingSize: food.selectedServingSize,
      );
    }).toList();

    await _db.insertAll(copies);

    if (DateUtils.isSameDay(targetDay, selectedDate)) {
      _foods.addAll(copies);
      notifyListeners();
    }

    _logger.info('Copied ${copies.length} tracked food item(s)');
    return copies;
  }

  /// Moves [foods] to [targetDay], preserving each food's time of day.
  Future<void> moveTrackedFoods(
    List<FoodTracked> foods,
    DateTime targetDay,
  ) async {
    await _setTrackedFoodDates({
      for (final food in foods) food: _withDay(food.dateEaten, targetDay),
    });
    _logger.info('Moved ${foods.length} tracked food item(s)');
  }

  /// Changes only the time of day of [foods].
  Future<void> changeTrackedFoodTime(
    List<FoodTracked> foods,
    TimeOfDay time,
  ) async {
    await _setTrackedFoodDates({
      for (final food in foods)
        food: food.dateEaten.copyWith(
          hour: time.hour,
          minute: time.minute,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        ),
    });
    _logger.info('Changed the time of ${foods.length} tracked food item(s)');
  }

  /// Restores exact tracked dates, for example when undoing a bulk action.
  Future<void> restoreTrackedFoodDates(
    Map<FoodTracked, DateTime> datesByFood,
  ) async {
    await _setTrackedFoodDates(datesByFood);
    _logger.info('Restored ${datesByFood.length} tracked food item(s)');
  }

  /// Removes [foods] and waits until the database operation is complete.
  Future<void> removeTrackedFoods(List<FoodTracked> foods) async {
    await _db.removeAll(foods);

    final ids = foods.map((food) => food.id).toSet();
    _foods.removeWhere((food) => ids.contains(food.id));

    notifyListeners();
    _logger.info('Removed ${foods.length} tracked food item(s)');
  }

  /// Restores previously removed [foods] with their original IDs and dates.
  Future<void> restoreTrackedFoods(List<FoodTracked> foods) async {
    await _db.insertAll(foods);

    for (final food in foods) {
      if (DateUtils.isSameDay(food.dateEaten, selectedDate) &&
          !_foods.any((existingFood) => existingFood.id == food.id)) {
        _foods.add(food);
      }
    }

    notifyListeners();
    _logger.info('Restored ${foods.length} tracked food item(s)');
  }

  /// Updates tracked dates and synchronizes the visible food list.
  Future<void> _setTrackedFoodDates(
    Map<FoodTracked, DateTime> datesByFood,
  ) async {
    if (datesByFood.isEmpty) return;

    final previousDates = {
      for (final food in datesByFood.keys) food: food.dateEaten,
    };

    for (final entry in datesByFood.entries) {
      entry.key.dateEaten = entry.value;
    }

    try {
      await _db.updateAll(datesByFood.keys.toList());
    } catch (_) {
      for (final entry in previousDates.entries) {
        entry.key.dateEaten = entry.value;
      }
      rethrow;
    }

    _foods.removeWhere(
      (food) => !DateUtils.isSameDay(food.dateEaten, selectedDate),
    );

    for (final food in datesByFood.keys) {
      if (DateUtils.isSameDay(food.dateEaten, selectedDate) &&
          !_foods.any((existingFood) => existingFood.id == food.id)) {
        _foods.add(food);
      }
    }

    notifyListeners();
  }

  /// Returns [date] with its calendar day replaced by [day].
  DateTime _withDay(DateTime date, DateTime day) {
    return date.copyWith(year: day.year, month: day.month, day: day.day);
  }

  /// Returns a list of all tracked food between now and [daysAgo].
  Future<List<FoodTracked>> getTrackedFoodFromUntilNow(int daysAgo) async {
    return _db.trackedFoodByDateRange(
      startDate: DateTime.now().subtract(Duration(days: daysAgo)),
      endDate: DateTime.now(),
    );
  }
}
