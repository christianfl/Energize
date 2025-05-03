import 'package:collection/collection.dart';
import 'package:energize/models/food/food.dart';
import 'package:energize/services/sqlite/custom_food_database_service_interface.dart';

class CustomFoodDatabaseServiceMock
    implements CustomFoodDatabaseServiceInterface {
  final List<Food> _customFoods = [];

  @override
  Future<List<Food>> get customFoods async {
    return _customFoods;
  }

  @override
  Future<Food?> getByBarcode(String barcode) async {
    return _customFoods.firstWhereOrNull((food) => food.ean == barcode);
  }

  @override
  Future<void> insert(Food food) async {
    _customFoods.add(food);
  }

  @override
  Future<void> remove(String id) async {
    _customFoods.removeWhere((food) => food.id == id);
  }

  @override
  Future<void> update(Food customFood) async {
    final index = _customFoods.indexWhere((f) => f.id == customFood.id);
    if (index != -1) {
      _customFoods[index] = customFood;
    }
  }
}
