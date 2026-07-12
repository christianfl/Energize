import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/person/body_targets.dart';
import '../models/person/enums/sex.dart';
import '../models/person/enums/weight_target.dart';
import '../services/key_value_storage_service/key_value_storage_service_interface.dart';

/// Provider for everything related to the body and targets.
///
/// Includes e.g.:
/// - Weight, height, activity
/// - Target calories and macros
/// - Target micros
class BodyTargetsProvider with ChangeNotifier {
  BodyTargets _bodyTargets = BodyTargets();

  BodyTargets get bodyTargets => _bodyTargets;

  final KeyValueStorageServiceInterface _keyValueStorage;

  BodyTargetsProvider({required this._keyValueStorage}) {
    _loadBodyAndTargets();
  }

  /// Loads data from key-value storage into [_bodyTargets].
  Future<void> _loadBodyAndTargets() async {
    // Prepare parse objects
    final sexString = await _keyValueStorage.getValue<String>(
      BodyTargets.sexKey,
      _bodyTargets.sex.toKeyValueStorageValueName(),
    );
    final weightTargetString = await _keyValueStorage.getValue<String>(
      BodyTargets.weightTargetKey,
      _bodyTargets.weightTarget.toString(),
    );

    // Load each value from key-value storage into BodyTargets
    _bodyTargets = BodyTargets(
      age: await _keyValueStorage.getValue<int>(BodyTargets.ageKey, age),
      sex: Sex.values.firstWhere(
        (e) => e.toKeyValueStorageValueName() == sexString,
        orElse: () => _bodyTargets.sex,
      ),
      weight: await _keyValueStorage.getValue<int>(
        BodyTargets.weightKey,
        weight,
      ),
      height: await _keyValueStorage.getValue<int>(
        BodyTargets.heightKey,
        height,
      ),
      activityLevel: await _keyValueStorage.getValue<double>(
        BodyTargets.activityLevelKey,
        activityLevel,
      ),
      weightTarget: WeightTarget.values.firstWhere(
        (e) => e.toString() == weightTargetString,
        orElse: () => _bodyTargets.weightTarget,
      ),
      proteinRatio: await _keyValueStorage.getValue<double>(
        BodyTargets.proteinRatioKey,
        proteinRatio,
      ),
      carbsRatio: await _keyValueStorage.getValue<double>(
        BodyTargets.carbsRatioKey,
        carbsRatio,
      ),
      fatRatio: await _keyValueStorage.getValue<double>(
        BodyTargets.fatRatioKey,
        fatRatio,
      ),
      caloriesTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.caloriesTargetKey,
        caloriesTarget,
      ),
      proteinTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.proteinTargetKey,
        proteinTarget,
      ),
      carbsTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.carbsTargetKey,
        carbsTarget,
      ),
      fatTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.fatTargetKey,
        fatTarget,
      ),
      vitaminATarget: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminATargetKey,
        vitaminATarget,
      ),
      vitaminB1Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB1TargetKey,
        vitaminB1Target,
      ),
      vitaminB2Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB2TargetKey,
        vitaminB2Target,
      ),
      vitaminB3Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB3TargetKey,
        vitaminB3Target,
      ),
      vitaminB5Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB5TargetKey,
        vitaminB5Target,
      ),
      vitaminB6Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB6TargetKey,
        vitaminB6Target,
      ),
      vitaminB7Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB7TargetKey,
        vitaminB7Target,
      ),
      vitaminB9Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB9TargetKey,
        vitaminB9Target,
      ),
      vitaminB12Target: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminB12TargetKey,
        vitaminB12Target,
      ),
      vitaminCTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminCTargetKey,
        vitaminCTarget,
      ),
      vitaminDTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminDTargetKey,
        vitaminDTarget,
      ),
      vitaminETarget: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminETargetKey,
        vitaminETarget,
      ),
      vitaminKTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.vitaminKTargetKey,
        vitaminKTarget,
      ),
      calciumTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.calciumTargetKey,
        calciumTarget,
      ),
      chlorideTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.chlorideTargetKey,
        chlorideTarget,
      ),
      magnesiumTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.magnesiumTargetKey,
        magnesiumTarget,
      ),
      phosphorusTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.phosphorusTargetKey,
        phosphorusTarget,
      ),
      potassiumTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.potassiumTargetKey,
        potassiumTarget,
      ),
      sodiumTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.sodiumTargetKey,
        sodiumTarget,
      ),
      chromiumTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.chromiumTargetKey,
        chromiumTarget,
      ),
      ironTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.ironTargetKey,
        ironTarget,
      ),
      fluorineTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.fluorineTargetKey,
        fluorineTarget,
      ),
      iodineTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.iodineTargetKey,
        iodineTarget,
      ),
      copperTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.copperTargetKey,
        copperTarget,
      ),
      manganeseTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.manganeseTargetKey,
        manganeseTarget,
      ),
      molybdenumTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.molybdenumTargetKey,
        molybdenumTarget,
      ),
      seleniumTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.seleniumTargetKey,
        seleniumTarget,
      ),
      zincTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.zincTargetKey,
        zincTarget,
      ),
      monounsaturatedFatTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.monounsaturatedFatTargetKey,
        monounsaturatedFatTarget,
      ),
      polyunsaturatedFatTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.polyunsaturatedFatTargetKey,
        polyunsaturatedFatTarget,
      ),
      omega3Target: await _keyValueStorage.getValue<double>(
        BodyTargets.omega3TargetKey,
        omega3Target,
      ),
      omega6Target: await _keyValueStorage.getValue<double>(
        BodyTargets.omega6TargetKey,
        omega6Target,
      ),
      saturatedFatTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.saturatedFatTargetKey,
        saturatedFatTarget,
      ),
      transFatTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.transFatTargetKey,
        transFatTarget,
      ),
      cholesterolTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.cholesterolTargetKey,
        cholesterolTarget,
      ),
      fiberTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.fiberTargetKey,
        fiberTarget,
      ),
      sugarTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.sugarTargetKey,
        sugarTarget,
      ),
      sugarAlcoholTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.sugarAlcoholTargetKey,
        sugarAlcoholTarget,
      ),
      starchTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.starchTargetKey,
        starchTarget,
      ),
      waterTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.waterTargetKey,
        waterTarget,
      ),
      caffeineTarget: await _keyValueStorage.getValue<double>(
        BodyTargets.caffeineTargetKey,
        caffeineTarget,
      ),
      alcoholTarget: await _keyValueStorage.getValue<double>(
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
    _keyValueStorage.setValue(BodyTargets.caloriesTargetKey, value);

    notifyListeners();
  }

  set proteinTarget(double value) {
    _bodyTargets.proteinTarget = value;
    _keyValueStorage.setValue(BodyTargets.proteinTargetKey, value);

    notifyListeners();
  }

  set carbsTarget(double value) {
    _bodyTargets.carbsTarget = value;
    _keyValueStorage.setValue(BodyTargets.carbsTargetKey, value);

    notifyListeners();
  }

  set fatTarget(double value) {
    _bodyTargets.fatTarget = value;
    _keyValueStorage.setValue(BodyTargets.fatTargetKey, value);

    notifyListeners();
  }

  set vitaminATarget(double value) {
    _bodyTargets.vitaminATarget = value;
    _keyValueStorage.setValue(BodyTargets.vitaminATargetKey, value);

    notifyListeners();
  }

  set vitaminB1Target(double value) {
    _bodyTargets.vitaminB1Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB1TargetKey, value);

    notifyListeners();
  }

  set vitaminB2Target(double value) {
    _bodyTargets.vitaminB2Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB2TargetKey, value);

    notifyListeners();
  }

  set vitaminB3Target(double value) {
    _bodyTargets.vitaminB3Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB3TargetKey, value);

    notifyListeners();
  }

  set vitaminB5Target(double value) {
    _bodyTargets.vitaminB5Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB5TargetKey, value);

    notifyListeners();
  }

  set vitaminB6Target(double value) {
    _bodyTargets.vitaminB6Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB6TargetKey, value);

    notifyListeners();
  }

  set vitaminB7Target(double value) {
    _bodyTargets.vitaminB7Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB7TargetKey, value);

    notifyListeners();
  }

  set vitaminB9Target(double value) {
    _bodyTargets.vitaminB9Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB9TargetKey, value);

    notifyListeners();
  }

  set vitaminB12Target(double value) {
    _bodyTargets.vitaminB12Target = value;
    _keyValueStorage.setValue(BodyTargets.vitaminB12TargetKey, value);

    notifyListeners();
  }

  set vitaminCTarget(double value) {
    _bodyTargets.vitaminCTarget = value;
    _keyValueStorage.setValue(BodyTargets.vitaminCTargetKey, value);

    notifyListeners();
  }

  set vitaminDTarget(double value) {
    _bodyTargets.vitaminDTarget = value;
    _keyValueStorage.setValue(BodyTargets.vitaminDTargetKey, value);

    notifyListeners();
  }

  set vitaminETarget(double value) {
    _bodyTargets.vitaminETarget = value;
    _keyValueStorage.setValue(BodyTargets.vitaminETargetKey, value);

    notifyListeners();
  }

  set vitaminKTarget(double value) {
    _bodyTargets.vitaminKTarget = value;
    _keyValueStorage.setValue(BodyTargets.vitaminKTargetKey, value);

    notifyListeners();
  }

  set calciumTarget(double value) {
    _bodyTargets.calciumTarget = value;
    _keyValueStorage.setValue(BodyTargets.calciumTargetKey, value);

    notifyListeners();
  }

  set chlorideTarget(double value) {
    _bodyTargets.chlorideTarget = value;
    _keyValueStorage.setValue(BodyTargets.chlorideTargetKey, value);

    notifyListeners();
  }

  set magnesiumTarget(double value) {
    _bodyTargets.magnesiumTarget = value;
    _keyValueStorage.setValue(BodyTargets.magnesiumTargetKey, value);

    notifyListeners();
  }

  set phosphorusTarget(double value) {
    _bodyTargets.phosphorusTarget = value;
    _keyValueStorage.setValue(BodyTargets.phosphorusTargetKey, value);

    notifyListeners();
  }

  set potassiumTarget(double value) {
    _bodyTargets.potassiumTarget = value;
    _keyValueStorage.setValue(BodyTargets.potassiumTargetKey, value);

    notifyListeners();
  }

  set sodiumTarget(double value) {
    _bodyTargets.sodiumTarget = value;
    _keyValueStorage.setValue(BodyTargets.sodiumTargetKey, value);

    notifyListeners();
  }

  set chromiumTarget(double value) {
    _bodyTargets.chromiumTarget = value;
    _keyValueStorage.setValue(BodyTargets.chromiumTargetKey, value);

    notifyListeners();
  }

  set ironTarget(double value) {
    _bodyTargets.ironTarget = value;
    _keyValueStorage.setValue(BodyTargets.ironTargetKey, value);

    notifyListeners();
  }

  set fluorineTarget(double value) {
    _bodyTargets.fluorineTarget = value;
    _keyValueStorage.setValue(BodyTargets.fluorineTargetKey, value);

    notifyListeners();
  }

  set iodineTarget(double value) {
    _bodyTargets.iodineTarget = value;
    _keyValueStorage.setValue(BodyTargets.iodineTargetKey, value);

    notifyListeners();
  }

  set copperTarget(double value) {
    _bodyTargets.copperTarget = value;
    _keyValueStorage.setValue(BodyTargets.copperTargetKey, value);

    notifyListeners();
  }

  set manganeseTarget(double value) {
    _bodyTargets.manganeseTarget = value;
    _keyValueStorage.setValue(BodyTargets.manganeseTargetKey, value);

    notifyListeners();
  }

  set molybdenumTarget(double value) {
    _bodyTargets.molybdenumTarget = value;
    _keyValueStorage.setValue(BodyTargets.molybdenumTargetKey, value);

    notifyListeners();
  }

  set seleniumTarget(double value) {
    _bodyTargets.seleniumTarget = value;
    _keyValueStorage.setValue(BodyTargets.seleniumTargetKey, value);

    notifyListeners();
  }

  set zincTarget(double value) {
    _bodyTargets.zincTarget = value;
    _keyValueStorage.setValue(BodyTargets.zincTargetKey, value);

    notifyListeners();
  }

  set monounsaturatedFatTarget(double value) {
    _bodyTargets.monounsaturatedFatTarget = value;
    _keyValueStorage.setValue(BodyTargets.monounsaturatedFatTargetKey, value);

    notifyListeners();
  }

  set polyunsaturatedFatTarget(double value) {
    _bodyTargets.polyunsaturatedFatTarget = value;
    _keyValueStorage.setValue(BodyTargets.polyunsaturatedFatTargetKey, value);

    notifyListeners();
  }

  set omega3Target(double value) {
    _bodyTargets.omega3Target = value;
    _keyValueStorage.setValue(BodyTargets.omega3TargetKey, value);

    notifyListeners();
  }

  set omega6Target(double value) {
    _bodyTargets.omega6Target = value;
    _keyValueStorage.setValue(BodyTargets.omega6TargetKey, value);

    notifyListeners();
  }

  set saturatedFatTarget(double value) {
    _bodyTargets.saturatedFatTarget = value;
    _keyValueStorage.setValue(BodyTargets.saturatedFatTargetKey, value);

    notifyListeners();
  }

  set transFatTarget(double value) {
    _bodyTargets.transFatTarget = value;
    _keyValueStorage.setValue(BodyTargets.transFatTargetKey, value);

    notifyListeners();
  }

  set cholesterolTarget(double value) {
    _bodyTargets.cholesterolTarget = value;
    _keyValueStorage.setValue(BodyTargets.cholesterolTargetKey, value);

    notifyListeners();
  }

  set fiberTarget(double value) {
    _bodyTargets.fiberTarget = value;
    _keyValueStorage.setValue(BodyTargets.fiberTargetKey, value);

    notifyListeners();
  }

  set sugarTarget(double value) {
    _bodyTargets.sugarTarget = value;
    _keyValueStorage.setValue(BodyTargets.sugarTargetKey, value);

    notifyListeners();
  }

  set sugarAlcoholTarget(double value) {
    _bodyTargets.sugarAlcoholTarget = value;
    _keyValueStorage.setValue(BodyTargets.sugarAlcoholTargetKey, value);

    notifyListeners();
  }

  set starchTarget(double value) {
    _bodyTargets.starchTarget = value;
    _keyValueStorage.setValue(BodyTargets.starchTargetKey, value);

    notifyListeners();
  }

  set waterTarget(double value) {
    _bodyTargets.waterTarget = value;
    _keyValueStorage.setValue(BodyTargets.waterTargetKey, value);

    notifyListeners();
  }

  set caffeineTarget(double value) {
    _bodyTargets.caffeineTarget = value;
    _keyValueStorage.setValue(BodyTargets.caffeineTargetKey, value);

    notifyListeners();
  }

  set alcoholTarget(double value) {
    _bodyTargets.alcoholTarget = value;
    _keyValueStorage.setValue(BodyTargets.alcoholTargetKey, value);

    notifyListeners();
  }

  set age(int value) {
    _bodyTargets.age = value;
    _keyValueStorage.setValue(BodyTargets.ageKey, value);

    notifyListeners();
  }

  set sex(Sex value) {
    _bodyTargets.sex = value;
    // Use Sex.toKeyValueStorageValueName() method For backwards compatibility.
    // Looks e.g. like this in persisted key-value storage:
    // sex: Male
    _keyValueStorage.setValue(
      BodyTargets.sexKey,
      value.toKeyValueStorageValueName(),
    );

    notifyListeners();
  }

  set weight(int value) {
    _bodyTargets.weight = value;
    _keyValueStorage.setValue(BodyTargets.weightKey, value);

    notifyListeners();
  }

  set height(int value) {
    _bodyTargets.height = value;
    _keyValueStorage.setValue(BodyTargets.heightKey, value);

    notifyListeners();
  }

  set activityLevel(double value) {
    _bodyTargets.activityLevel = value;
    _keyValueStorage.setValue(BodyTargets.activityLevelKey, value);

    notifyListeners();
  }

  set weightTarget(WeightTarget value) {
    _bodyTargets.weightTarget = value;
    // Use Enum.toString() method For backwards compatibility.
    // Looks e.g. like this in persisted key value storage:
    // weightTarget: WeightTarget.maintaining
    _keyValueStorage.setValue(BodyTargets.weightTargetKey, value.toString());

    notifyListeners();
  }

  set proteinRatio(double value) {
    _bodyTargets.proteinRatio = value;
    _keyValueStorage.setValue(BodyTargets.proteinRatioKey, value);

    notifyListeners();
  }

  set carbsRatio(double value) {
    _bodyTargets.carbsRatio = value;
    _keyValueStorage.setValue(BodyTargets.carbsRatioKey, value);

    notifyListeners();
  }

  set fatRatio(double value) {
    _bodyTargets.fatRatio = value;
    _keyValueStorage.setValue(BodyTargets.fatRatioKey, value);

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
        await _keyValueStorage.remove(key);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Could not remove micro target value: $e');
        }
      }
    }
  }

  /// Sets [_bodyTargets] to [newBodyTargets] and persists the new values.
  Future<void> saveAll(BodyTargets newBodyTargets) async {
    try {
      final bodyTargetsMap = newBodyTargets.toJson();
      await _keyValueStorage.setAll(bodyTargetsMap);
      _bodyTargets = newBodyTargets;

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Could not save all body targets: $e');
      }
    }
  }
}
