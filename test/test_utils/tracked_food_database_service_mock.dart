import 'package:energize/models/food/food_tracked.dart';
import 'package:energize/services/sqlite/tracked_food_database_service_interface.dart';

class TrackedFoodDatabaseServiceMock
    implements TrackedFoodDatabaseServiceInterface {
  final List<FoodTracked> _foods = [];

  @override
  Future<List<FoodTracked>> trackedFoodByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final DateTime dayStart = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    final DateTime dayEnd = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      23,
      59,
      59,
      999,
    );

    return _foods
        .where(
          (food) =>
              food.dateEaten.isAfter(dayStart) &&
              food.dateEaten.isBefore(dayEnd),
        )
        .toList();
  }

  @override
  Future<List<FoodTracked>> get trackedFoods async => _foods;

  @override
  Future<void> insert(FoodTracked food) async {
    _foods.add(food);
  }

  /// Inserts all tracked [foods] into the in-memory list.
  @override
  Future<void> insertAll(List<FoodTracked> foods) async {
    _foods.addAll(foods);
  }

  @override
  Future<void> update(FoodTracked food) async {
    final index = _foods.indexWhere((f) => f.id == food.id);
    if (index != -1) {
      _foods[index] = food;
    }
  }

  /// Updates all tracked [foods] in the in-memory list.
  @override
  Future<void> updateAll(List<FoodTracked> foods) async {
    for (final food in foods) {
      await update(food);
    }
  }

  @override
  Future<void> remove(String id) async {
    _foods.removeWhere((food) => food.id == id);
  }

  /// Removes all tracked [foods] from the in-memory list.
  @override
  Future<void> removeAll(List<FoodTracked> foods) async {
    final ids = foods.map((food) => food.id).toSet();
    _foods.removeWhere((food) => ids.contains(food.id));
  }
}
