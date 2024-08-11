import '../../../models/food/food.dart';
import 'sfcdb_data.dart';

class SwissFoodCompositionDatabaseBinding {
  static const originName = 'SFCDB';

  static const imageUrl = 'assets/food_databases/sfcdb.png';
  static const sourceUrl = 'https://naehrwertdaten.ch/de/';

  // Gets generated during runtime out of SFCDB_data.dart (CSV)
  static final List<Food> _sfcdb = [];

  static List<Food> get allFoods {
    // After first invocation of this method the database is filled
    if (_sfcdb.isNotEmpty) return _sfcdb;

    for (var entry in sfcdbData) {
      final food = entry.split('§');

      _sfcdb.add(
        Food(
          id: Food.generatedId,
          title: food[1],
          origin: SwissFoodCompositionDatabaseBinding.originName,
          calories: food[3] != '' ? double.parse(food[3]) : null,
          protein: food[4] != '' ? double.parse(food[4]) : null,
          carbs: food[5] != '' ? double.parse(food[5]) : null,
          fat: food[6] != '' ? double.parse(food[6]) : null,
          // Micros
          vitaminA: food[7] != '' ? double.parse(food[7]) / 1000 : null,
          vitaminB1: food[8] != '' ? double.parse(food[8]) : null,
          vitaminB2: food[9] != '' ? double.parse(food[9]) : null,
          vitaminB3: food[10] != '' ? double.parse(food[10]) : null,
          vitaminB5: food[11] != '' ? double.parse(food[11]) : null,
          vitaminB6: food[12] != '' ? double.parse(food[12]) : null,
          vitaminB9: food[13] != '' ? double.parse(food[13]) : null,
          vitaminB12: food[14] != '' ? double.parse(food[14]) : null,
          vitaminC: food[15] != '' ? double.parse(food[15]) : null,
          vitaminD: food[16] != '' ? double.parse(food[16]) : null,
          vitaminE: food[17] != '' ? double.parse(food[17]) : null,
          calcium: food[18] != '' ? double.parse(food[18]) : null,
          chloride: food[19] != '' ? double.parse(food[19]) : null,
          magnesium: food[20] != '' ? double.parse(food[20]) : null,
          phosphorus: food[21] != '' ? double.parse(food[21]) : null,
          potassium: food[22] != '' ? double.parse(food[22]) : null,
          sodium: food[23] != '' ? double.parse(food[23]) : null,
          iron: food[24] != '' ? double.parse(food[24]) : null,
          iodine: food[25] != '' ? double.parse(food[25]) : null,
          selenium: food[26] != '' ? double.parse(food[26]) : null,
          zinc: food[27] != '' ? double.parse(food[27]) : null,
          monounsaturatedFat: food[28] != '' ? double.parse(food[28]) : null,
          polyunsaturatedFat: food[29] != '' ? double.parse(food[29]) : null,
          saturatedFat: food[30] != '' ? double.parse(food[30]) : null,
          cholesterol: food[31] != '' ? double.parse(food[31]) : null,
          fiber: food[32] != '' ? double.parse(food[32]) : null,
          sugar: food[33] != '' ? double.parse(food[33]) : null,
          starch: food[34] != '' ? double.parse(food[34]) : null,
          water: food[35] != '' ? double.parse(food[35]) : null,
          alcohol: food[36] != '' ? double.parse(food[36]) : null,
        ),
      );
    }

    return _sfcdb;
  }
}
