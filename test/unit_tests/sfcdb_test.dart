import 'dart:ui';

import 'package:energize/services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('SFCDB Parsing Tests', () {
    test('Find "Apple" in English', () async {
      final foods = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Apple',
        Locale('en'),
      );

      expect(foods?.length, 15);
    });

    test('Find "Apple" in German', () async {
      final foods = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Apfel',
        Locale('de'),
      );

      expect(foods?.length, 14);
    });

    test('Find "Apple" in Italian', () async {
      final foods = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Mela',
        Locale('it'),
      );

      expect(foods?.length, 10);
    });

    test('Find "Apple" in French', () async {
      final foods = await SwissFoodCompositionDatabaseBinding.searchFood(
        'Pomme',
        Locale('fr'),
      );

      expect(foods?.length, 33);
    });
  });
}
