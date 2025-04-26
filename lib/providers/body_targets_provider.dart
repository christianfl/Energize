import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/person/body_targets.dart';
import '../models/person/enums/sex.dart';
import '../models/person/enums/weight_target.dart';
import '../services/shared_preferences/shared_preferences_service_interface.dart';

/// Provider for everything related to the body and targets.
///
/// Includes e.g.:
/// - Weight, height, activity
/// - Target calories and macros
/// - Target micros
class BodyTargetsProvider with ChangeNotifier {
  BodyTargets _bodyTargets = BodyTargets();

  BodyTargets get settings => _bodyTargets;

  final SharedPreferencesServiceInterface _sharedPrefs;

  BodyTargetsProvider({
    required SharedPreferencesServiceInterface sharedPrefs,
  }) : _sharedPrefs = sharedPrefs {
    _loadBodyAndTargets();
  }

  /// Loads data from SharedPreferences into [_bodyTargets].
  Future<void> _loadBodyAndTargets() async {
    // Prepare parse objects
    final sexString = await _sharedPrefs.getValue<String>(
      BodyTargets.sexKey,
      _bodyTargets.sex.toSharedPreferencesValue(),
    );
    final weightTargetString = await _sharedPrefs.getValue<String>(
      BodyTargets.weightTargetKey,
      _bodyTargets.weightTarget.toString(),
    );

    // Load each SharedPreferences value into BodyTargets
    _bodyTargets = BodyTargets(
      age: await _sharedPrefs.getValue<int>(
        BodyTargets.ageKey,
        age,
      ),
      sex: Sex.values.firstWhere(
        (e) => e.toSharedPreferencesValue() == sexString,
        orElse: () => _bodyTargets.sex,
      ),
      weight: await _sharedPrefs.getValue<int>(
        BodyTargets.weightKey,
        weight,
      ),
      height: await _sharedPrefs.getValue<int>(
        BodyTargets.heightKey,
        height,
      ),
      activityLevel: await _sharedPrefs.getValue<double>(
        BodyTargets.activityLevelKey,
        activityLevel,
      ),
      weightTarget: WeightTarget.values.firstWhere(
        (e) => e.toString() == weightTargetString,
        orElse: () => _bodyTargets.weightTarget,
      ),
      proteinRatio: await _sharedPrefs.getValue<double>(
        BodyTargets.proteinRatioKey,
        proteinRatio,
      ),
      carbsRatio: await _sharedPrefs.getValue<double>(
        BodyTargets.carbsRatioKey,
        carbsRatio,
      ),
      fatRatio: await _sharedPrefs.getValue<double>(
        BodyTargets.fatRatioKey,
        fatRatio,
      ),
      caloriesTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.caloriesTargetKey,
        caloriesTarget,
      ),
      proteinTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.proteinTargetKey,
        proteinTarget,
      ),
      carbsTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.carbsTargetKey,
        carbsTarget,
      ),
      fatTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.fatTargetKey,
        fatTarget,
      ),
      vitaminATarget: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminATargetKey,
        vitaminATarget,
      ),
      vitaminB1Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB1TargetKey,
        vitaminB1Target,
      ),
      vitaminB2Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB2TargetKey,
        vitaminB2Target,
      ),
      vitaminB3Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB3TargetKey,
        vitaminB3Target,
      ),
      vitaminB5Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB5TargetKey,
        vitaminB5Target,
      ),
      vitaminB6Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB6TargetKey,
        vitaminB6Target,
      ),
      vitaminB7Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB7TargetKey,
        vitaminB7Target,
      ),
      vitaminB9Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB9TargetKey,
        vitaminB9Target,
      ),
      vitaminB12Target: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminB12TargetKey,
        vitaminB12Target,
      ),
      vitaminCTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminCTargetKey,
        vitaminCTarget,
      ),
      vitaminDTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminDTargetKey,
        vitaminDTarget,
      ),
      vitaminETarget: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminETargetKey,
        vitaminETarget,
      ),
      vitaminKTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.vitaminKTargetKey,
        vitaminKTarget,
      ),
      calciumTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.calciumTargetKey,
        calciumTarget,
      ),
      chlorideTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.chlorideTargetKey,
        chlorideTarget,
      ),
      magnesiumTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.magnesiumTargetKey,
        magnesiumTarget,
      ),
      phosphorusTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.phosphorusTargetKey,
        phosphorusTarget,
      ),
      potassiumTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.potassiumTargetKey,
        potassiumTarget,
      ),
      sodiumTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.sodiumTargetKey,
        sodiumTarget,
      ),
      chromiumTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.chromiumTargetKey,
        chromiumTarget,
      ),
      ironTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.ironTargetKey,
        ironTarget,
      ),
      fluorineTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.fluorineTargetKey,
        fluorineTarget,
      ),
      iodineTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.iodineTargetKey,
        iodineTarget,
      ),
      copperTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.copperTargetKey,
        copperTarget,
      ),
      manganeseTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.manganeseTargetKey,
        manganeseTarget,
      ),
      molybdenumTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.molybdenumTargetKey,
        molybdenumTarget,
      ),
      seleniumTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.seleniumTargetKey,
        seleniumTarget,
      ),
      zincTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.zincTargetKey,
        zincTarget,
      ),
      monounsaturatedFatTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.monounsaturatedFatTargetKey,
        monounsaturatedFatTarget,
      ),
      polyunsaturatedFatTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.polyunsaturatedFatTargetKey,
        polyunsaturatedFatTarget,
      ),
      omega3Target: await _sharedPrefs.getValue<double>(
        BodyTargets.omega3TargetKey,
        omega3Target,
      ),
      omega6Target: await _sharedPrefs.getValue<double>(
        BodyTargets.omega6TargetKey,
        omega6Target,
      ),
      saturatedFatTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.saturatedFatTargetKey,
        saturatedFatTarget,
      ),
      transFatTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.transFatTargetKey,
        transFatTarget,
      ),
      cholesterolTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.cholesterolTargetKey,
        cholesterolTarget,
      ),
      fiberTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.fiberTargetKey,
        fiberTarget,
      ),
      sugarTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.sugarTargetKey,
        sugarTarget,
      ),
      sugarAlcoholTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.sugarAlcoholTargetKey,
        sugarAlcoholTarget,
      ),
      starchTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.starchTargetKey,
        starchTarget,
      ),
      waterTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.waterTargetKey,
        waterTarget,
      ),
      caffeineTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.caffeineTargetKey,
        caffeineTarget,
      ),
      alcoholTarget: await _sharedPrefs.getValue<double>(
        BodyTargets.alcoholTargetKey,
        alcoholTarget,
      ),
    );

    notifyListeners();
  }

  // Getters

  int get age => _bodyTargets.age;
  Sex get sex => _bodyTargets.sex;
  int get weight => _bodyTargets.weight;
  int get height => _bodyTargets.height;
  double get activityLevel => _bodyTargets.activityLevel;
  WeightTarget get weightTarget => _bodyTargets.weightTarget;
  double get proteinRatio => _bodyTargets.proteinRatio;
  double get carbsRatio => _bodyTargets.carbsRatio;
  double get fatRatio => _bodyTargets.fatRatio;
  double get caloriesTarget => _bodyTargets.caloriesTarget;
  double get proteinTarget => _bodyTargets.proteinTarget;
  double get carbsTarget => _bodyTargets.carbsTarget;
  double get fatTarget => _bodyTargets.fatTarget;
  double get vitaminATarget => _bodyTargets.vitaminATarget;
  double get vitaminB1Target => _bodyTargets.vitaminB1Target;
  double get vitaminB2Target => _bodyTargets.vitaminB2Target;
  double get vitaminB3Target => _bodyTargets.vitaminB3Target;
  double get vitaminB5Target => _bodyTargets.vitaminB5Target;
  double get vitaminB6Target => _bodyTargets.vitaminB6Target;
  double get vitaminB7Target => _bodyTargets.vitaminB7Target;
  double get vitaminB9Target => _bodyTargets.vitaminB9Target;
  double get vitaminB12Target => _bodyTargets.vitaminB12Target;
  double get vitaminCTarget => _bodyTargets.vitaminCTarget;
  double get vitaminDTarget => _bodyTargets.vitaminDTarget;
  double get vitaminETarget => _bodyTargets.vitaminETarget;
  double get vitaminKTarget => _bodyTargets.vitaminKTarget;
  double get calciumTarget => _bodyTargets.calciumTarget;
  double get chlorideTarget => _bodyTargets.chlorideTarget;
  double get magnesiumTarget => _bodyTargets.magnesiumTarget;
  double get phosphorusTarget => _bodyTargets.phosphorusTarget;
  double get potassiumTarget => _bodyTargets.potassiumTarget;
  double get sodiumTarget => _bodyTargets.sodiumTarget;
  double get chromiumTarget => _bodyTargets.chromiumTarget;
  double get ironTarget => _bodyTargets.ironTarget;
  double get fluorineTarget => _bodyTargets.fluorineTarget;
  double get iodineTarget => _bodyTargets.iodineTarget;
  double get copperTarget => _bodyTargets.copperTarget;
  double get manganeseTarget => _bodyTargets.manganeseTarget;
  double get molybdenumTarget => _bodyTargets.molybdenumTarget;
  double get seleniumTarget => _bodyTargets.seleniumTarget;
  double get zincTarget => _bodyTargets.zincTarget;
  double get monounsaturatedFatTarget => _bodyTargets.monounsaturatedFatTarget;
  double get polyunsaturatedFatTarget => _bodyTargets.polyunsaturatedFatTarget;
  double get omega3Target => _bodyTargets.omega3Target;
  double get omega6Target => _bodyTargets.omega6Target;
  double get saturatedFatTarget => _bodyTargets.saturatedFatTarget;
  double get transFatTarget => _bodyTargets.transFatTarget;
  double get cholesterolTarget => _bodyTargets.cholesterolTarget;
  double get fiberTarget => _bodyTargets.fiberTarget;
  double get sugarTarget => _bodyTargets.sugarTarget;
  double get sugarAlcoholTarget => _bodyTargets.sugarAlcoholTarget;
  double get starchTarget => _bodyTargets.starchTarget;
  double get waterTarget => _bodyTargets.waterTarget;
  double get caffeineTarget => _bodyTargets.caffeineTarget;
  double get alcoholTarget => _bodyTargets.alcoholTarget;

  // Setters

  set caloriesTarget(double value) {
    _bodyTargets.caloriesTarget = value;
    _sharedPrefs.setValue(
      BodyTargets.caloriesTargetKey,
      value,
    );

    notifyListeners();
  }

  set proteinTarget(double value) {
    _bodyTargets.proteinTarget = value;
    _sharedPrefs.setValue(BodyTargets.proteinTargetKey, value);

    notifyListeners();
  }

  set carbsTarget(double value) {
    _bodyTargets.carbsTarget = value;
    _sharedPrefs.setValue(BodyTargets.carbsTargetKey, value);

    notifyListeners();
  }

  set fatTarget(double value) {
    _bodyTargets.fatTarget = value;
    _sharedPrefs.setValue(BodyTargets.fatTargetKey, value);

    notifyListeners();
  }

  set vitaminATarget(double value) {
    _bodyTargets.vitaminATarget = value;
    _sharedPrefs.setValue(BodyTargets.vitaminATargetKey, value);

    notifyListeners();
  }

  set vitaminB1Target(double value) {
    _bodyTargets.vitaminB1Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB1TargetKey, value);

    notifyListeners();
  }

  set vitaminB2Target(double value) {
    _bodyTargets.vitaminB2Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB2TargetKey, value);

    notifyListeners();
  }

  set vitaminB3Target(double value) {
    _bodyTargets.vitaminB3Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB3TargetKey, value);

    notifyListeners();
  }

  set vitaminB5Target(double value) {
    _bodyTargets.vitaminB5Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB5TargetKey, value);

    notifyListeners();
  }

  set vitaminB6Target(double value) {
    _bodyTargets.vitaminB6Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB6TargetKey, value);

    notifyListeners();
  }

  set vitaminB7Target(double value) {
    _bodyTargets.vitaminB7Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB7TargetKey, value);

    notifyListeners();
  }

  set vitaminB9Target(double value) {
    _bodyTargets.vitaminB9Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB9TargetKey, value);

    notifyListeners();
  }

  set vitaminB12Target(double value) {
    _bodyTargets.vitaminB12Target = value;
    _sharedPrefs.setValue(BodyTargets.vitaminB12TargetKey, value);

    notifyListeners();
  }

  set vitaminCTarget(double value) {
    _bodyTargets.vitaminCTarget = value;
    _sharedPrefs.setValue(BodyTargets.vitaminCTargetKey, value);

    notifyListeners();
  }

  set vitaminDTarget(double value) {
    _bodyTargets.vitaminDTarget = value;
    _sharedPrefs.setValue(BodyTargets.vitaminDTargetKey, value);

    notifyListeners();
  }

  set vitaminETarget(double value) {
    _bodyTargets.vitaminETarget = value;
    _sharedPrefs.setValue(BodyTargets.vitaminETargetKey, value);

    notifyListeners();
  }

  set vitaminKTarget(double value) {
    _bodyTargets.vitaminKTarget = value;
    _sharedPrefs.setValue(BodyTargets.vitaminKTargetKey, value);

    notifyListeners();
  }

  set calciumTarget(double value) {
    _bodyTargets.calciumTarget = value;
    _sharedPrefs.setValue(BodyTargets.calciumTargetKey, value);

    notifyListeners();
  }

  set chlorideTarget(double value) {
    _bodyTargets.chlorideTarget = value;
    _sharedPrefs.setValue(BodyTargets.chlorideTargetKey, value);

    notifyListeners();
  }

  set magnesiumTarget(double value) {
    _bodyTargets.magnesiumTarget = value;
    _sharedPrefs.setValue(BodyTargets.magnesiumTargetKey, value);

    notifyListeners();
  }

  set phosphorusTarget(double value) {
    _bodyTargets.phosphorusTarget = value;
    _sharedPrefs.setValue(BodyTargets.phosphorusTargetKey, value);

    notifyListeners();
  }

  set potassiumTarget(double value) {
    _bodyTargets.potassiumTarget = value;
    _sharedPrefs.setValue(BodyTargets.potassiumTargetKey, value);

    notifyListeners();
  }

  set sodiumTarget(double value) {
    _bodyTargets.sodiumTarget = value;
    _sharedPrefs.setValue(BodyTargets.sodiumTargetKey, value);

    notifyListeners();
  }

  set chromiumTarget(double value) {
    _bodyTargets.chromiumTarget = value;
    _sharedPrefs.setValue(BodyTargets.chromiumTargetKey, value);

    notifyListeners();
  }

  set ironTarget(double value) {
    _bodyTargets.ironTarget = value;
    _sharedPrefs.setValue(BodyTargets.ironTargetKey, value);

    notifyListeners();
  }

  set fluorineTarget(double value) {
    _bodyTargets.fluorineTarget = value;
    _sharedPrefs.setValue(BodyTargets.fluorineTargetKey, value);

    notifyListeners();
  }

  set iodineTarget(double value) {
    _bodyTargets.iodineTarget = value;
    _sharedPrefs.setValue(BodyTargets.iodineTargetKey, value);

    notifyListeners();
  }

  set copperTarget(double value) {
    _bodyTargets.copperTarget = value;
    _sharedPrefs.setValue(BodyTargets.copperTargetKey, value);

    notifyListeners();
  }

  set manganeseTarget(double value) {
    _bodyTargets.manganeseTarget = value;
    _sharedPrefs.setValue(BodyTargets.manganeseTargetKey, value);

    notifyListeners();
  }

  set molybdenumTarget(double value) {
    _bodyTargets.molybdenumTarget = value;
    _sharedPrefs.setValue(BodyTargets.molybdenumTargetKey, value);

    notifyListeners();
  }

  set seleniumTarget(double value) {
    _bodyTargets.seleniumTarget = value;
    _sharedPrefs.setValue(BodyTargets.seleniumTargetKey, value);

    notifyListeners();
  }

  set zincTarget(double value) {
    _bodyTargets.zincTarget = value;
    _sharedPrefs.setValue(BodyTargets.zincTargetKey, value);

    notifyListeners();
  }

  set monounsaturatedFatTarget(double value) {
    _bodyTargets.monounsaturatedFatTarget = value;
    _sharedPrefs.setValue(BodyTargets.monounsaturatedFatTargetKey, value);

    notifyListeners();
  }

  set polyunsaturatedFatTarget(double value) {
    _bodyTargets.polyunsaturatedFatTarget = value;
    _sharedPrefs.setValue(BodyTargets.polyunsaturatedFatTargetKey, value);

    notifyListeners();
  }

  set omega3Target(double value) {
    _bodyTargets.omega3Target = value;
    _sharedPrefs.setValue(BodyTargets.omega3TargetKey, value);

    notifyListeners();
  }

  set omega6Target(double value) {
    _bodyTargets.omega6Target = value;
    _sharedPrefs.setValue(BodyTargets.omega6TargetKey, value);

    notifyListeners();
  }

  set saturatedFatTarget(double value) {
    _bodyTargets.saturatedFatTarget = value;
    _sharedPrefs.setValue(BodyTargets.saturatedFatTargetKey, value);

    notifyListeners();
  }

  set transFatTarget(double value) {
    _bodyTargets.transFatTarget = value;
    _sharedPrefs.setValue(BodyTargets.transFatTargetKey, value);

    notifyListeners();
  }

  set cholesterolTarget(double value) {
    _bodyTargets.cholesterolTarget = value;
    _sharedPrefs.setValue(BodyTargets.cholesterolTargetKey, value);

    notifyListeners();
  }

  set fiberTarget(double value) {
    _bodyTargets.fiberTarget = value;
    _sharedPrefs.setValue(BodyTargets.fiberTargetKey, value);

    notifyListeners();
  }

  set sugarTarget(double value) {
    _bodyTargets.sugarTarget = value;
    _sharedPrefs.setValue(BodyTargets.sugarTargetKey, value);

    notifyListeners();
  }

  set sugarAlcoholTarget(double value) {
    _bodyTargets.sugarAlcoholTarget = value;
    _sharedPrefs.setValue(BodyTargets.sugarAlcoholTargetKey, value);

    notifyListeners();
  }

  set starchTarget(double value) {
    _bodyTargets.starchTarget = value;
    _sharedPrefs.setValue(BodyTargets.starchTargetKey, value);

    notifyListeners();
  }

  set waterTarget(double value) {
    _bodyTargets.waterTarget = value;
    _sharedPrefs.setValue(BodyTargets.waterTargetKey, value);

    notifyListeners();
  }

  set caffeineTarget(double value) {
    _bodyTargets.caffeineTarget = value;
    _sharedPrefs.setValue(BodyTargets.caffeineTargetKey, value);

    notifyListeners();
  }

  set alcoholTarget(double value) {
    _bodyTargets.alcoholTarget = value;
    _sharedPrefs.setValue(BodyTargets.alcoholTargetKey, value);

    notifyListeners();
  }

  set age(int value) {
    _bodyTargets.age = value;
    _sharedPrefs.setValue(BodyTargets.ageKey, value);

    notifyListeners();
  }

  set sex(Sex value) {
    _bodyTargets.sex = value;
    // Use Sex.toSharedPreferencesValue() method For backwards compatibility.
    // Looks e.g. like this in persisted SharedPreferences:
    // sex: Male
    _sharedPrefs.setValue(BodyTargets.sexKey, value.toSharedPreferencesValue());

    notifyListeners();
  }

  set weight(int value) {
    _bodyTargets.weight = value;
    _sharedPrefs.setValue(BodyTargets.weightKey, value);

    notifyListeners();
  }

  set height(int value) {
    _bodyTargets.height = value;
    _sharedPrefs.setValue(BodyTargets.heightKey, value);

    notifyListeners();
  }

  set activityLevel(double value) {
    _bodyTargets.activityLevel = value;
    _sharedPrefs.setValue(BodyTargets.activityLevelKey, value);

    notifyListeners();
  }

  set weightTarget(WeightTarget value) {
    _bodyTargets.weightTarget = value;
    // Use Enum.toString() method For backwards compatibility.
    // Looks e.g. like this in persisted SharedPreferences:
    // weightTarget: WeightTarget.maintaining
    _sharedPrefs.setValue(BodyTargets.weightTargetKey, value.toString());

    notifyListeners();
  }

  set proteinRatio(double value) {
    _bodyTargets.proteinRatio = value;
    _sharedPrefs.setValue(BodyTargets.proteinRatioKey, value);

    notifyListeners();
  }

  set carbsRatio(double value) {
    _bodyTargets.carbsRatio = value;
    _sharedPrefs.setValue(BodyTargets.carbsRatioKey, value);

    notifyListeners();
  }

  set fatRatio(double value) {
    _bodyTargets.fatRatio = value;
    _sharedPrefs.setValue(BodyTargets.fatRatioKey, value);

    notifyListeners();
  }

  /// Resets all micro targets
  Future<void> resetMicros() async {
    final keysToDelete = [
      BodyTargets.vitaminATargetKey,
      BodyTargets.vitaminB1TargetKey,
      BodyTargets.vitaminB2TargetKey,
      BodyTargets.vitaminB3TargetKey,
      BodyTargets.vitaminB5TargetKey,
      BodyTargets.vitaminB6TargetKey,
      BodyTargets.vitaminB7TargetKey,
      BodyTargets.vitaminB9TargetKey,
      BodyTargets.vitaminB12TargetKey,
      BodyTargets.vitaminCTargetKey,
      BodyTargets.vitaminDTargetKey,
      BodyTargets.vitaminETargetKey,
      BodyTargets.vitaminKTargetKey,
      BodyTargets.calciumTargetKey,
      BodyTargets.calciumTargetKey,
      BodyTargets.chlorideTargetKey,
      BodyTargets.magnesiumTargetKey,
      BodyTargets.phosphorusTargetKey,
      BodyTargets.potassiumTargetKey,
      BodyTargets.sodiumTargetKey,
      BodyTargets.chromiumTargetKey,
      BodyTargets.ironTargetKey,
      BodyTargets.fluorineTargetKey,
      BodyTargets.iodineTargetKey,
      BodyTargets.copperTargetKey,
      BodyTargets.manganeseTargetKey,
      BodyTargets.molybdenumTargetKey,
      BodyTargets.seleniumTargetKey,
      BodyTargets.zincTargetKey,
      BodyTargets.monounsaturatedFatTargetKey,
      BodyTargets.polyunsaturatedFatTargetKey,
      BodyTargets.omega3TargetKey,
      BodyTargets.omega6TargetKey,
      BodyTargets.saturatedFatTargetKey,
      BodyTargets.transFatTargetKey,
      BodyTargets.cholesterolTargetKey,
      BodyTargets.fiberTargetKey,
      BodyTargets.sugarTargetKey,
      BodyTargets.sugarAlcoholTargetKey,
      BodyTargets.starchTargetKey,
      BodyTargets.waterTargetKey,
      BodyTargets.caffeineTargetKey,
      BodyTargets.alcoholTargetKey,
    ];

    for (final key in keysToDelete) {
      try {
        await _sharedPrefs.remove(key);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Could not remove micro target value: $e');
        }
      }
    }
  }
}
