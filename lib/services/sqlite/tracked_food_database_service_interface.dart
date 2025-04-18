import '../../models/food/food_tracked.dart';

/// Manages tracked foods.
abstract class TrackedFoodDatabaseServiceInterface {
  /// Returns all tracked food.
  Future<List<FoodTracked>> get trackedFoods;

  /// Returns all tracked food between given [startDate] and [endDate].
  Future<List<FoodTracked>> trackedFoodByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Inserts [food] as a new tracked food.
  Future<void> insert(FoodTracked food);

  /// Updates [food] by its [FoodTracked.id].
  Future<void> update(FoodTracked food);

  /// Removes the tracked food with given [id] as [FoodTracked.id].
  Future<void> remove(String id);
}
