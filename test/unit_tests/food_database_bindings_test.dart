import 'dart:ui';

import 'package:energize/services/food_database_bindings/food_databases.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'registered food database bindings return no results for blank queries',
    () async {
      for (final database in foodDatabases) {
        expect(
          await database.searchFood(' ', locale: const Locale('en')),
          isEmpty,
        );
      }
    },
  );
}
