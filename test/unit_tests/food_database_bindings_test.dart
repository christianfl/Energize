import 'dart:ui';

import 'package:energize/pages/tab_custom_food/custom_food_page.dart';
import 'package:energize/services/food_database_bindings/food_databases.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('food database IDs and ID aliases are unique (case insensitive)', () {
    // Reserve CUSTOM so food database IDs don't conflict with custom foods.
    final origins = <String, String>{
      CustomFoodPage.originId.toLowerCase(): 'custom foods',
    };

    for (final database in foodDatabases) {
      final metadata = database.metadata;
      for (final id in [metadata.originId, ...metadata.legacyOriginIds]) {
        expect(id.trim(), isNotEmpty, reason: 'IDs must not be blank');
        expect(id, id.trim(), reason: 'IDs must not contain edge spaces');
        final normalizedId = id.toLowerCase();
        expect(
          origins.containsKey(normalizedId),
          isFalse,
          reason:
              '$id from ${metadata.originId} conflicts with '
              '${origins[normalizedId]}',
        );
        origins[normalizedId] = metadata.originId;
      }
    }
  });

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
