import 'dart:ui';

import 'package:energize/services/food_database_bindings/food_database_binding_interface.dart';
import 'package:energize/services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const FoodDatabaseBindingInterface swissBinding =
      SwissFoodCompositionDatabaseBinding();

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('SFCDB Parsing Tests', () {
    test('Find "Apple" in English', () async {
      final foods = await swissBinding.searchFood(
        'Apple',
        locale: const Locale('en'),
      );

      expect(foods.length, 15);
    });

    test('Find "Apple" in German', () async {
      final foods = await swissBinding.searchFood(
        'Apfel',
        locale: const Locale('de'),
      );

      expect(foods.length, 14);
    });

    test('Find "Apple" in Italian', () async {
      final foods = await swissBinding.searchFood(
        'Mela',
        locale: const Locale('it'),
      );

      expect(foods.length, 10);
    });

    test('Find "Apple" in French', () async {
      final foods = await swissBinding.searchFood(
        'Pomme',
        locale: const Locale('fr'),
      );

      expect(foods.length, 33);
    });
  });

  test('an unmatched Swiss food query returns an empty list', () async {
    expect(
      await swissBinding.searchFood(
        'thisfooddoesnotexist',
        locale: const Locale('en'),
      ),
      isEmpty,
    );
  });
}
