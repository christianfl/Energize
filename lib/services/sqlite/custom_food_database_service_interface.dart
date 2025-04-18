import '../../models/food/food.dart';

/// Manages custom foods.
abstract class CustomFoodDatabaseServiceInterface {
  /// Returns all custom food.
  Future<List<Food>> get customFoods;

  /// Inserts [food] as a new custom food.
  Future<void> insert(Food food);

  /// Updates [customFood] via [Food.id].
  Future<void> update(Food customFood);

  /// Removes the custom food with given [id].
  Future<void> remove(String id);

  /// Returns a custom food with given [barcode] as [Food.ean] if any.
  Future<Food?> getByBarcode(String barcode);
}
