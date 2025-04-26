import 'package:json_annotation/json_annotation.dart';

import 'enums/sex.dart';
import 'enums/weight_target.dart';

part 'body_targets.g.dart';

/// Holds body and nutriet target values.
@JsonSerializable()
class BodyTargets {
  /// Keys for shared preferences
  static const ageKey = 'age';
  static const sexKey = 'sex';
  static const weightKey = 'weight';
  static const heightKey = 'height';
  static const activityLevelKey = 'activityLevel';
  static const weightTargetKey = 'weightTarget';
  static const proteinRatioKey = 'proteinRatio';
  static const carbsRatioKey = 'carbsRatio';
  static const fatRatioKey = 'fatRatio';
  static const caloriesTargetKey = 'caloriesTarget';
  static const proteinTargetKey = 'proteinTarget';
  static const carbsTargetKey = 'carbsTarget';
  static const fatTargetKey = 'fatTarget';
  static const vitaminATargetKey = 'vitaminATarget';
  static const vitaminB1TargetKey = 'vitaminB1Target';
  static const vitaminB2TargetKey = 'vitaminB2Target';
  static const vitaminB3TargetKey = 'vitaminB3Target';
  static const vitaminB5TargetKey = 'vitaminB5Target';
  static const vitaminB6TargetKey = 'vitaminB6Target';
  static const vitaminB7TargetKey = 'vitaminB7Target';
  static const vitaminB9TargetKey = 'vitaminB9Target';
  static const vitaminB12TargetKey = 'vitaminB12Target';
  static const vitaminCTargetKey = 'vitaminCTarget';
  static const vitaminDTargetKey = 'vitaminDTarget';
  static const vitaminETargetKey = 'vitaminETarget';
  static const vitaminKTargetKey = 'vitaminKTarget';
  static const calciumTargetKey = 'calciumTarget';
  static const chlorideTargetKey = 'chlorideTarget';
  static const magnesiumTargetKey = 'magnesiumTarget';
  static const phosphorusTargetKey = 'phosphorusTarget';
  static const potassiumTargetKey = 'potassiumTarget';
  static const sodiumTargetKey = 'sodiumTarget';
  static const chromiumTargetKey = 'chromiumTarget';
  static const ironTargetKey = 'ironTarget';
  static const fluorineTargetKey = 'fluorineTarget';
  static const iodineTargetKey = 'iodineTarget';
  static const copperTargetKey = 'copperTarget';
  static const manganeseTargetKey = 'manganeseTarget';
  static const molybdenumTargetKey = 'molybdenumTarget';
  static const seleniumTargetKey = 'seleniumTarget';
  static const zincTargetKey = 'zincTarget';
  static const monounsaturatedFatTargetKey = 'monounsaturatedFatTarget';
  static const polyunsaturatedFatTargetKey = 'polyunsaturatedFatTarget';
  static const omega3TargetKey = 'omega3Target';
  static const omega6TargetKey = 'omega6Target';
  static const saturatedFatTargetKey = 'saturatedFatTarget';
  static const transFatTargetKey = 'transFatTarget';
  static const cholesterolTargetKey = 'cholesterolTarget';
  static const fiberTargetKey = 'fiberTarget';
  static const sugarTargetKey = 'sugarTarget';
  static const sugarAlcoholTargetKey = 'sugarAlcoholTarget';
  static const starchTargetKey = 'starchTarget';
  static const waterTargetKey = 'waterTarget';
  static const caffeineTargetKey = 'caffeineTarget';
  static const alcoholTargetKey = 'alcoholTarget';

  int age;
  Sex sex;

  /// in kg
  int weight;

  /// in cm
  int height;

  /// Should be between 1 and 2; but no hard limit
  double activityLevel = 1.4;

  WeightTarget weightTarget;

  /// in %
  double proteinRatio;

  /// in %
  double carbsRatio;

  /// in %
  double fatRatio;

  double caloriesTarget;
  double proteinTarget;
  double carbsTarget;
  double fatTarget;
  double vitaminATarget;
  double vitaminB1Target;
  double vitaminB2Target;
  double vitaminB3Target;
  double vitaminB5Target;
  double vitaminB6Target;
  double vitaminB7Target;
  double vitaminB9Target;
  double vitaminB12Target;
  double vitaminCTarget;
  double vitaminDTarget;
  double vitaminETarget;
  double vitaminKTarget;
  double calciumTarget;
  double chlorideTarget;
  double magnesiumTarget;
  double phosphorusTarget;
  double potassiumTarget;
  double sodiumTarget;
  double chromiumTarget;
  double ironTarget;
  double fluorineTarget;
  double iodineTarget;
  double copperTarget;
  double manganeseTarget;
  double molybdenumTarget;
  double seleniumTarget;
  double zincTarget;
  double monounsaturatedFatTarget;
  double polyunsaturatedFatTarget;
  double omega3Target;
  double omega6Target;
  double saturatedFatTarget;
  double transFatTarget;
  double cholesterolTarget;
  double fiberTarget;
  double sugarTarget;
  double sugarAlcoholTarget;
  double starchTarget;
  double waterTarget;
  double caffeineTarget;
  double alcoholTarget;

  BodyTargets({
    this.age = 20,
    this.sex = Sex.male,
    this.weight = 80,
    this.height = 180,
    this.activityLevel = 1.4,
    this.weightTarget = WeightTarget.maintaining,
    this.proteinRatio = 20,
    this.carbsRatio = 50,
    this.fatRatio = 30,
    this.caloriesTarget = 0.0,
    this.proteinTarget = 0.0,
    this.carbsTarget = 0.0,
    this.fatTarget = 0.0,
    this.vitaminATarget = 0.0,
    this.vitaminB1Target = 0.0,
    this.vitaminB2Target = 0.0,
    this.vitaminB3Target = 0.0,
    this.vitaminB5Target = 0.0,
    this.vitaminB6Target = 0.0,
    this.vitaminB7Target = 0.0,
    this.vitaminB9Target = 0.0,
    this.vitaminB12Target = 0.0,
    this.vitaminCTarget = 0.0,
    this.vitaminDTarget = 0.0,
    this.vitaminETarget = 0.0,
    this.vitaminKTarget = 80.0,
    this.calciumTarget = 0.0,
    this.chlorideTarget = 0.0,
    this.magnesiumTarget = 0.0,
    this.phosphorusTarget = 0.0,
    this.potassiumTarget = 0.0,
    this.sodiumTarget = 0.0,
    this.chromiumTarget = 0.0,
    this.ironTarget = 0.0,
    this.fluorineTarget = 0.0,
    this.iodineTarget = 0.0,
    this.copperTarget = 0.0,
    this.manganeseTarget = 0.0,
    this.molybdenumTarget = 0.0,
    this.seleniumTarget = 0.0,
    this.zincTarget = 0.0,
    this.monounsaturatedFatTarget = 0.0,
    this.polyunsaturatedFatTarget = 0.0,
    this.omega3Target = 0.0,
    this.omega6Target = 0.0,
    this.saturatedFatTarget = 0.0,
    this.transFatTarget = 0.0,
    this.cholesterolTarget = 0.0,
    this.fiberTarget = 0.0,
    this.sugarTarget = 0.0,
    this.sugarAlcoholTarget = 0.0,
    this.starchTarget = 0.0,
    this.waterTarget = 0.0,
    this.caffeineTarget = 0.0,
    this.alcoholTarget = 0.0,
  });

  // Connect the generated fromJson function to the `fromJson` factory.
  factory BodyTargets.fromJson(Map<String, dynamic> json) =>
      _$BodyTargetsFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BodyTargetsToJson(this);
}
