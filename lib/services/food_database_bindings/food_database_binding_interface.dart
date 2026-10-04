import 'dart:ui' show Locale;

import '../../models/food/food.dart';
import '../log_service_interface.dart';
import 'food_database_binding_metadata.dart';

/// Interface for all registered (usable) food database bindings.
abstract interface class FoodDatabaseBindingInterface {
  FoodDatabaseBindingMetadata get metadata;

  /// Search food by name ([searchText]).
  ///
  /// Using [locale] where the database supports localization.
  ///
  /// Returns an empty list for blank queries or no matches.
  ///
  /// Throws on failure.
  Future<List<Food>> searchFood(
    String searchText, {
    required Locale locale,
    LogServiceInterface? logger,
  });
}
