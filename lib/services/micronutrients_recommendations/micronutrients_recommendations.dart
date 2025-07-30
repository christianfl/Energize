import 'package:collection/collection.dart';

import '../../../models/food/food.dart';
import '../../models/person/enums/sex.dart';
import '../../providers/body_targets_provider.dart';
import 'dge_data.dart';
import 'micronutrients_model.dart';

class MicronutrientsRecommendations {
  // Gets generated during runtime out of DGE_DATA.dart (CSV)
  static final List<MicronutrientsModel> _nutrientsByGroup = [];

  /// Returns the DGE nutrition recommendation by age and sex, based on https://www.dge.de/wissenschaft/referenzwerte/tool/
  static Food _getNutritionData(int age, Sex sex) {
    // After first invocation of this method the database is filled
    if (_nutrientsByGroup.isNotEmpty) {
      final MicronutrientsModel? model = _nutrientsByGroup.firstWhereOrNull(
        (element) =>
            age >= element.ageGroup[0] &&
            age < element.ageGroup[1] &&
            element.sex == sex,
      );

      return model != null
          ? model.nutritionRecommendationPerDay
          : Food(id: '', origin: '', title: '');
    }

    for (var row in dgeDATA) {
      final splittedRow = row.split('§');

      _nutrientsByGroup.add(
        MicronutrientsModel(
          ageGroup: splittedRow[0]
              .replaceAll('[', '')
              .replaceAll(']', '')
              .split(',')
              .map(int.parse)
              .toList(),
          sex: splittedRow[1] == 'Weiblich' ? Sex.female : Sex.male,
          nutritionRecommendationPerDay: Food(
            id: '',
            title: 'Recommended Micronutrients',
            origin: 'DGE',
            alcohol: double.tryParse(splittedRow[2]),
            fiber: double.tryParse(splittedRow[3]),
            calcium: double.tryParse(splittedRow[4]),
            chloride: double.tryParse(splittedRow[5]),
            chromium: double.tryParse(splittedRow[6]),
            iron: double.tryParse(splittedRow[7]),
            fluorine: double.tryParse(splittedRow[8]),
            iodine: double.tryParse(splittedRow[9]),
            potassium: double.tryParse(splittedRow[10]),
            copper: double.tryParse(splittedRow[11]),
            magnesium: double.tryParse(splittedRow[12]),
            manganese: double.tryParse(splittedRow[13]),
            molybdenum: double.tryParse(splittedRow[14]),
            sodium: double.tryParse(splittedRow[15]),
            phosphorus: double.tryParse(splittedRow[16]),
            selenium: double.tryParse(splittedRow[17]),
            vitaminA: double.tryParse(splittedRow[18]),
            vitaminB1: double.tryParse(splittedRow[19]),
            vitaminB12: double.tryParse(splittedRow[20]),
            vitaminB2: double.tryParse(splittedRow[21]),
            vitaminB3: double.tryParse(splittedRow[22]),
            vitaminB5: double.tryParse(splittedRow[23]),
            vitaminB6: double.tryParse(splittedRow[24]),
            vitaminB7: double.tryParse(splittedRow[25]),
            vitaminB9: double.tryParse(splittedRow[26]),
            vitaminC: double.tryParse(splittedRow[27]),
            vitaminD: double.tryParse(splittedRow[28]),
            vitaminE: double.tryParse(splittedRow[29]),
            vitaminK: double.tryParse(splittedRow[30]),
            water: double.tryParse(splittedRow[31]),
            zinc: double.tryParse(splittedRow[32]),
          ),
        ),
      );
    }

    return _getNutritionData(age, sex);
  }

  /// Sets the user's micronutrients targets based on their age and sex
  static void setRecommendedNutritionAsTargets(
    BodyTargetsProvider bodyTargets,
    int age,
    Sex sex,
  ) {
    final microRecommendations = _getNutritionData(age, sex);

    // Set nutrient recommendations
    bodyTargets.alcoholTarget = microRecommendations.alcohol ?? 0;
    bodyTargets.fiberTarget = microRecommendations.fiber ?? 0;
    bodyTargets.calciumTarget = microRecommendations.calcium ?? 0;
    bodyTargets.chlorideTarget = microRecommendations.chloride ?? 0;
    bodyTargets.chromiumTarget = microRecommendations.chromium ?? 0;
    bodyTargets.ironTarget = microRecommendations.iron ?? 0;
    bodyTargets.fluorineTarget = microRecommendations.fluorine ?? 0;
    bodyTargets.iodineTarget = microRecommendations.iodine ?? 0;
    bodyTargets.potassiumTarget = microRecommendations.potassium ?? 0;
    bodyTargets.copperTarget = microRecommendations.copper ?? 0;
    bodyTargets.magnesiumTarget = microRecommendations.magnesium ?? 0;
    bodyTargets.manganeseTarget = microRecommendations.manganese ?? 0;
    bodyTargets.molybdenumTarget = microRecommendations.molybdenum ?? 0;
    bodyTargets.sodiumTarget = microRecommendations.sodium ?? 0;
    bodyTargets.phosphorusTarget = microRecommendations.phosphorus ?? 0;
    bodyTargets.seleniumTarget = microRecommendations.selenium ?? 0;
    bodyTargets.vitaminATarget = microRecommendations.vitaminA ?? 0;
    bodyTargets.vitaminB1Target = microRecommendations.vitaminB1 ?? 0;
    bodyTargets.vitaminB12Target = microRecommendations.vitaminB12 ?? 0;
    bodyTargets.vitaminB2Target = microRecommendations.vitaminB2 ?? 0;
    bodyTargets.vitaminB3Target = microRecommendations.vitaminB3 ?? 0;
    bodyTargets.vitaminB5Target = microRecommendations.vitaminB5 ?? 0;
    bodyTargets.vitaminB6Target = microRecommendations.vitaminB6 ?? 0;
    bodyTargets.vitaminB7Target = microRecommendations.vitaminB7 ?? 0;
    bodyTargets.vitaminB9Target = microRecommendations.vitaminB9 ?? 0;
    bodyTargets.vitaminCTarget = microRecommendations.vitaminC ?? 0;
    bodyTargets.vitaminDTarget = microRecommendations.vitaminD ?? 0;
    bodyTargets.vitaminETarget = microRecommendations.vitaminE ?? 0;
    bodyTargets.vitaminKTarget = microRecommendations.vitaminK ?? 0;
    bodyTargets.waterTarget = microRecommendations.water ?? 0;
    bodyTargets.zincTarget = microRecommendations.zinc ?? 0;
  }
}
