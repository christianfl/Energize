import 'food_database_binding_interface.dart';
import 'open_food_facts/open_food_facts_binding.dart';
import 'swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import 'usda/usda_binding.dart';

/// Registered food database bindings, in their displayed order.
final foodDatabases = List<FoodDatabaseBindingInterface>.unmodifiable([
  const SwissFoodCompositionDatabaseBinding(),
  OpenFoodFactsBinding(),
  const USDABinding(),
]);
