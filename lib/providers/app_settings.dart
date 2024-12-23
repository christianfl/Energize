import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/person/enums/weight_target.dart';

class AppSettings with ChangeNotifier {
  SharedPreferences? _preferences;

  // ########################## Personalization ##########################
  int _age = 20;
  String _sex = 'Male';

  /// in kg
  int _weight = 80;

  /// in cm
  int _height = 180;

  /// Could be anything but about between 1 and 2
  double _activityLevel = 1.4;

  WeightTarget _weightTarget = WeightTarget.maintaining;

  /// in %
  double _proteinRatio = 20;

  /// in %
  double _carbsRatio = 50;

  /// in %
  double _fatRatio = 30;

  // ########################## UI Settings ##########################

  bool _isMealGroupingActivated = false;

  // ########################## Backup & Restore ##########################

  String _backupServerUrl = '';
  String _backupUsername = '';
  String _backupPathAndFilename = '/Energize/backup.json.aes';

  // ########################## DB management ##########################

  bool _isProviderOpenFoodFactsActivated = true;
  bool _isProviderSndbActivated = true;
  bool _isProviderUsdaActivated = true;

  // ########################## Targets ##########################

  double _caloriesTarget = 0.0;
  double _proteinTarget = 0.0;
  double _carbsTarget = 0.0;
  double _fatTarget = 0.0;
  double _vitaminATarget = 0.0;
  double _vitaminB1Target = 0.0;
  double _vitaminB2Target = 0.0;
  double _vitaminB3Target = 0.0;
  double _vitaminB5Target = 0.0;
  double _vitaminB6Target = 0.0;
  double _vitaminB7Target = 0.0;
  double _vitaminB9Target = 0.0;
  double _vitaminB12Target = 0.0;
  double _vitaminCTarget = 0.0;
  double _vitaminDTarget = 0.0;
  double _vitaminETarget = 0.0;
  double _vitaminKTarget = 80.0;
  double _calciumTarget = 0.0;
  double _chlorideTarget = 0.0;
  double _magnesiumTarget = 0.0;
  double _phosphorusTarget = 0.0;
  double _potassiumTarget = 0.0;
  double _sodiumTarget = 0.0;
  double _chromiumTarget = 0.0;
  double _ironTarget = 0.0;
  double _fluorineTarget = 0.0;
  double _iodineTarget = 0.0;
  double _copperTarget = 0.0;
  double _manganeseTarget = 0.0;
  double _molybdenumTarget = 0.0;
  double _seleniumTarget = 0.0;
  double _zincTarget = 0.0;
  double _monounsaturatedFatTarget = 0.0;
  double _polyunsaturatedFatTarget = 0.0;
  double _omega3Target = 0.0;
  double _omega6Target = 0.0;
  double _saturatedFatTarget = 0.0;
  double _transFatTarget = 0.0;
  double _cholesterolTarget = 0.0;
  double _fiberTarget = 0.0;
  double _sugarTarget = 0.0;
  double _sugarAlcoholTarget = 0.0;
  double _starchTarget = 0.0;
  double _waterTarget = 0.0;
  double _caffeineTarget = 0.0;
  double _alcoholTarget = 0.0;

  int get age => _age;
  String get sex => _sex;
  int get weight => _weight;
  int get height => _height;
  double get activityLevel => _activityLevel;
  WeightTarget get weightTarget => _weightTarget;
  double get proteinRatio => _proteinRatio;
  double get carbsRatio => _carbsRatio;
  double get fatRatio => _fatRatio;

  bool get isMealGroupingActivated => _isMealGroupingActivated;

  String get backupServerUrl => _backupServerUrl;
  String get backupUsername => _backupUsername;
  String get backupPathAndFilename => _backupPathAndFilename;

  bool get isProviderOpenFoodFactsActivated =>
      _isProviderOpenFoodFactsActivated;
  bool get isProviderSndbActivated => _isProviderSndbActivated;
  bool get isProviderUsdaActivated => _isProviderUsdaActivated;

  double get caloriesTarget => _caloriesTarget;
  double get proteinTarget => _proteinTarget;
  double get carbsTarget => _carbsTarget;
  double get fatTarget => _fatTarget;
  double get vitaminATarget => _vitaminATarget;
  double get vitaminB1Target => _vitaminB1Target;
  double get vitaminB2Target => _vitaminB2Target;
  double get vitaminB3Target => _vitaminB3Target;
  double get vitaminB5Target => _vitaminB5Target;
  double get vitaminB6Target => _vitaminB6Target;
  double get vitaminB7Target => _vitaminB7Target;
  double get vitaminB9Target => _vitaminB9Target;
  double get vitaminB12Target => _vitaminB12Target;
  double get vitaminCTarget => _vitaminCTarget;
  double get vitaminDTarget => _vitaminDTarget;
  double get vitaminETarget => _vitaminETarget;
  double get vitaminKTarget => _vitaminKTarget;
  double get calciumTarget => _calciumTarget;
  double get chlorideTarget => _chlorideTarget;
  double get magnesiumTarget => _magnesiumTarget;
  double get phosphorusTarget => _phosphorusTarget;
  double get potassiumTarget => _potassiumTarget;
  double get sodiumTarget => _sodiumTarget;
  double get chromiumTarget => _chromiumTarget;
  double get ironTarget => _ironTarget;
  double get fluorineTarget => _fluorineTarget;
  double get iodineTarget => _iodineTarget;
  double get copperTarget => _copperTarget;
  double get manganeseTarget => _manganeseTarget;
  double get molybdenumTarget => _molybdenumTarget;
  double get seleniumTarget => _seleniumTarget;
  double get zincTarget => _zincTarget;
  double get monounsaturatedFatTarget => _monounsaturatedFatTarget;
  double get polyunsaturatedFatTarget => _polyunsaturatedFatTarget;
  double get omega3Target => _omega3Target;
  double get omega6Target => _omega6Target;
  double get saturatedFatTarget => _saturatedFatTarget;
  double get transFatTarget => _transFatTarget;
  double get cholesterolTarget => _cholesterolTarget;
  double get fiberTarget => _fiberTarget;
  double get sugarTarget => _sugarTarget;
  double get sugarAlcoholTarget => _sugarAlcoholTarget;
  double get starchTarget => _starchTarget;
  double get waterTarget => _waterTarget;
  double get caffeineTarget => _caffeineTarget;
  double get alcoholTarget => _alcoholTarget;

  AppSettings() {
    _loadFromSharedPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  // Loads all key value pairs from shared preferences into local variables
  _loadFromSharedPreferences() async {
    await _initPreferences();

    _age = _preferences!.getInt('age') ?? _age;
    _sex = _preferences!.getString('sex') ?? _sex;
    _weight = _preferences!.getInt('weight') ?? _weight;
    _height = _preferences!.getInt('height') ?? _height;
    _activityLevel = _preferences!.getDouble('activityLevel') ?? _activityLevel;
    _weightTarget = WeightTarget.values.firstWhere(
      (target) {
        return target.toString() == _preferences!.getString('weightTarget');
      },
      orElse: () => _weightTarget,
    );
    _proteinRatio = _preferences!.getDouble('proteinRatio') ?? _proteinRatio;
    _carbsRatio = _preferences!.getDouble('carbsRatio') ?? _carbsRatio;
    _fatRatio = _preferences!.getDouble('fatRatio') ?? _fatRatio;

    _isMealGroupingActivated =
        _preferences!.getBool('isMealGroupingActivated') ?? false;

    _backupServerUrl =
        _preferences!.getString('backupServerUrl') ?? _backupServerUrl;
    _backupUsername =
        _preferences!.getString('backupUsername') ?? _backupUsername;
    _backupPathAndFilename = _preferences!.getString('backupPathAndFilename') ??
        _backupPathAndFilename;

    _isProviderOpenFoodFactsActivated =
        _preferences!.getBool('isProviderOpenFoodFactsActivated') ?? true;
    _isProviderSndbActivated =
        _preferences!.getBool('isProviderSndbActivated') ?? true;
    _isProviderUsdaActivated =
        _preferences!.getBool('isProviderUsdaActivated') ?? true;

    _caloriesTarget =
        _preferences!.getDouble('caloriesTarget') ?? _caloriesTarget;
    _proteinTarget = _preferences!.getDouble('proteinTarget') ?? _proteinTarget;
    _carbsTarget = _preferences!.getDouble('carbsTarget') ?? _carbsTarget;
    _fatTarget = _preferences!.getDouble('fatTarget') ?? _fatTarget;
    _vitaminATarget =
        _preferences!.getDouble('vitaminATarget') ?? _vitaminATarget;
    _vitaminB1Target =
        _preferences!.getDouble('vitaminB1Target') ?? _vitaminB1Target;
    _vitaminB2Target =
        _preferences!.getDouble('vitaminB2Target') ?? _vitaminB2Target;
    _vitaminB3Target =
        _preferences!.getDouble('vitaminB3Target') ?? _vitaminB3Target;
    _vitaminB5Target =
        _preferences!.getDouble('vitaminB5Target') ?? _vitaminB5Target;
    _vitaminB6Target =
        _preferences!.getDouble('vitaminB6Target') ?? _vitaminB6Target;
    _vitaminB7Target =
        _preferences!.getDouble('vitaminB7Target') ?? _vitaminB7Target;
    _vitaminB9Target =
        _preferences!.getDouble('vitaminB9Target') ?? _vitaminB9Target;
    _vitaminB12Target =
        _preferences!.getDouble('vitaminB12Target') ?? _vitaminB12Target;
    _vitaminCTarget =
        _preferences!.getDouble('vitaminCTarget') ?? _vitaminCTarget;
    _vitaminDTarget =
        _preferences!.getDouble('vitaminDTarget') ?? _vitaminDTarget;
    _vitaminETarget =
        _preferences!.getDouble('vitaminETarget') ?? _vitaminETarget;
    _vitaminKTarget =
        _preferences!.getDouble('vitaminKTarget') ?? _vitaminKTarget;
    _calciumTarget = _preferences!.getDouble('calciumTarget') ?? _calciumTarget;
    _chlorideTarget =
        _preferences!.getDouble('chlorideTarget') ?? _chlorideTarget;
    _magnesiumTarget =
        _preferences!.getDouble('magnesiumTarget') ?? _magnesiumTarget;
    _phosphorusTarget =
        _preferences!.getDouble('phosphorusTarget') ?? _phosphorusTarget;
    _potassiumTarget =
        _preferences!.getDouble('potassiumTarget') ?? _potassiumTarget;
    _sodiumTarget = _preferences!.getDouble('sodiumTarget') ?? _sodiumTarget;
    _chromiumTarget =
        _preferences!.getDouble('chromiumTarget') ?? _chromiumTarget;
    _ironTarget = _preferences!.getDouble('ironTarget') ?? _ironTarget;
    _fluorineTarget =
        _preferences!.getDouble('fluorineTarget') ?? _fluorineTarget;
    _iodineTarget = _preferences!.getDouble('iodineTarget') ?? _iodineTarget;
    _copperTarget = _preferences!.getDouble('copperTarget') ?? _copperTarget;
    _manganeseTarget =
        _preferences!.getDouble('manganeseTarget') ?? _manganeseTarget;
    _molybdenumTarget =
        _preferences!.getDouble('molybdenumTarget') ?? _molybdenumTarget;
    _seleniumTarget =
        _preferences!.getDouble('seleniumTarget') ?? _seleniumTarget;
    _zincTarget = _preferences!.getDouble('zincTarget') ?? _zincTarget;
    _monounsaturatedFatTarget =
        _preferences!.getDouble('monounsaturatedFatTarget') ??
            _monounsaturatedFatTarget;
    _polyunsaturatedFatTarget =
        _preferences!.getDouble('polyunsaturatedFatTarget') ??
            _polyunsaturatedFatTarget;
    _omega3Target = _preferences!.getDouble('omega3Target') ?? _omega3Target;
    _omega6Target = _preferences!.getDouble('omega6Target') ?? _omega6Target;
    _saturatedFatTarget =
        _preferences!.getDouble('saturatedFatTarget') ?? _saturatedFatTarget;
    _transFatTarget =
        _preferences!.getDouble('transFatTarget') ?? _transFatTarget;
    _cholesterolTarget =
        _preferences!.getDouble('cholesterolTarget') ?? _cholesterolTarget;
    _fiberTarget = _preferences!.getDouble('fiberTarget') ?? _fiberTarget;
    _sugarTarget = _preferences!.getDouble('sugarTarget') ?? _sugarTarget;
    _sugarAlcoholTarget =
        _preferences!.getDouble('sugarAlcoholTarget') ?? _sugarAlcoholTarget;
    _starchTarget = _preferences!.getDouble('starchTarget') ?? _starchTarget;
    _waterTarget = _preferences!.getDouble('waterTarget') ?? _waterTarget;
    _caffeineTarget =
        _preferences!.getDouble('caffeineTarget') ?? _caffeineTarget;
    _alcoholTarget = _preferences!.getDouble('alcoholTarget') ?? _alcoholTarget;

    notifyListeners();
  }

  void resetMicros() async {
    await _initPreferences();

    unawaited(_preferences!.remove('vitaminATarget'));
    unawaited(_preferences!.remove('vitaminB1Target'));
    unawaited(_preferences!.remove('vitaminB2Target'));
    unawaited(_preferences!.remove('vitaminB3Target'));
    unawaited(_preferences!.remove('vitaminB5Target'));
    unawaited(_preferences!.remove('vitaminB6Target'));
    unawaited(_preferences!.remove('vitaminB7Target'));
    unawaited(_preferences!.remove('vitaminB9Target'));
    unawaited(_preferences!.remove('vitaminB12Target'));
    unawaited(_preferences!.remove('vitaminCTarget'));
    unawaited(_preferences!.remove('vitaminDTarget'));
    unawaited(_preferences!.remove('vitaminETarget'));
    unawaited(_preferences!.remove('vitaminKTarget'));
    unawaited(_preferences!.remove('calciumTarget'));
    unawaited(_preferences!.remove('calciumTarget'));
    unawaited(_preferences!.remove('chlorideTarget'));
    unawaited(_preferences!.remove('magnesiumTarget'));
    unawaited(_preferences!.remove('phosphorusTarget'));
    unawaited(_preferences!.remove('potassiumTarget'));
    unawaited(_preferences!.remove('sodiumTarget'));
    unawaited(_preferences!.remove('chromiumTarget'));
    unawaited(_preferences!.remove('ironTarget'));
    unawaited(_preferences!.remove('fluorineTarget'));
    unawaited(_preferences!.remove('iodineTarget'));
    unawaited(_preferences!.remove('copperTarget'));
    unawaited(_preferences!.remove('manganeseTarget'));
    unawaited(_preferences!.remove('molybdenumTarget'));
    unawaited(_preferences!.remove('seleniumTarget'));
    unawaited(_preferences!.remove('zincTarget'));
    unawaited(_preferences!.remove('monounsaturatedFatTarget'));
    unawaited(_preferences!.remove('polyunsaturatedFatTarget'));
    unawaited(_preferences!.remove('omega3Target'));
    unawaited(_preferences!.remove('omega6Target'));
    unawaited(_preferences!.remove('saturatedFatTarget'));
    unawaited(_preferences!.remove('transFatTarget'));
    unawaited(_preferences!.remove('cholesterolTarget'));
    unawaited(_preferences!.remove('fiberTarget'));
    unawaited(_preferences!.remove('sugarTarget'));
    unawaited(_preferences!.remove('sugarAlcoholTarget'));
    unawaited(_preferences!.remove('starchTarget'));
    unawaited(_preferences!.remove('waterTarget'));
    unawaited(_preferences!.remove('caffeineTarget'));
    unawaited(_preferences!.remove('alcoholTarget'));
  }

  // Save int, double, String, or bool to shared preferences
  _saveToPreferences(String key, var value) async {
    await _initPreferences();

    if (value is int) {
      unawaited(_preferences!.setInt(key, value));
    } else if (value is double) {
      unawaited(_preferences!.setDouble(key, value));
    } else if (value is String) {
      unawaited(_preferences!.setString(key, value));
    } else if (value is bool) {
      unawaited(_preferences!.setBool(key, value));
    }
  }

  set caloriesTarget(double value) {
    _caloriesTarget = value;
    notifyListeners();
    _saveToPreferences('caloriesTarget', value);
  }

  set proteinTarget(double value) {
    _proteinTarget = value;
    notifyListeners();
    _saveToPreferences('proteinTarget', value);
  }

  set carbsTarget(double value) {
    _carbsTarget = value;
    notifyListeners();
    _saveToPreferences('carbsTarget', value);
  }

  set fatTarget(double value) {
    _fatTarget = value;
    notifyListeners();
    _saveToPreferences('fatTarget', value);
  }

  set vitaminATarget(double value) {
    _vitaminATarget = value;
    notifyListeners();
    _saveToPreferences('vitaminATarget', value);
  }

  set vitaminB1Target(double value) {
    _vitaminB1Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB1Target', value);
  }

  set vitaminB2Target(double value) {
    _vitaminB2Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB2Target', value);
  }

  set vitaminB3Target(double value) {
    _vitaminB3Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB3Target', value);
  }

  set vitaminB5Target(double value) {
    _vitaminB5Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB5Target', value);
  }

  set vitaminB6Target(double value) {
    _vitaminB6Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB6Target', value);
  }

  set vitaminB7Target(double value) {
    _vitaminB7Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB7Target', value);
  }

  set vitaminB9Target(double value) {
    _vitaminB9Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB9Target', value);
  }

  set vitaminB12Target(double value) {
    _vitaminB12Target = value;
    notifyListeners();
    _saveToPreferences('vitaminB12Target', value);
  }

  set vitaminCTarget(double value) {
    _vitaminCTarget = value;
    notifyListeners();
    _saveToPreferences('vitaminCTarget', value);
  }

  set vitaminDTarget(double value) {
    _vitaminDTarget = value;
    notifyListeners();
    _saveToPreferences('vitaminDTarget', value);
  }

  set vitaminETarget(double value) {
    _vitaminETarget = value;
    notifyListeners();
    _saveToPreferences('vitaminETarget', value);
  }

  set vitaminKTarget(double value) {
    _vitaminKTarget = value;
    notifyListeners();
    _saveToPreferences('vitaminKTarget', value);
  }

  set calciumTarget(double value) {
    _calciumTarget = value;
    notifyListeners();
    _saveToPreferences('calciumTarget', value);
  }

  set chlorideTarget(double value) {
    _chlorideTarget = value;
    notifyListeners();
    _saveToPreferences('chlorideTarget', value);
  }

  set magnesiumTarget(double value) {
    _magnesiumTarget = value;
    notifyListeners();
    _saveToPreferences('magnesiumTarget', value);
  }

  set phosphorusTarget(double value) {
    _phosphorusTarget = value;
    notifyListeners();
    _saveToPreferences('phosphorusTarget', value);
  }

  set potassiumTarget(double value) {
    _potassiumTarget = value;
    notifyListeners();
    _saveToPreferences('potassiumTarget', value);
  }

  set sodiumTarget(double value) {
    _sodiumTarget = value;
    notifyListeners();
    _saveToPreferences('sodiumTarget', value);
  }

  set chromiumTarget(double value) {
    _chromiumTarget = value;
    notifyListeners();
    _saveToPreferences('chromiumTarget', value);
  }

  set ironTarget(double value) {
    _ironTarget = value;
    notifyListeners();
    _saveToPreferences('ironTarget', value);
  }

  set fluorineTarget(double value) {
    _fluorineTarget = value;
    notifyListeners();
    _saveToPreferences('fluorineTarget', value);
  }

  set iodineTarget(double value) {
    _iodineTarget = value;
    notifyListeners();
    _saveToPreferences('iodineTarget', value);
  }

  set copperTarget(double value) {
    _copperTarget = value;
    notifyListeners();
    _saveToPreferences('copperTarget', value);
  }

  set manganeseTarget(double value) {
    _manganeseTarget = value;
    notifyListeners();
    _saveToPreferences('manganeseTarget', value);
  }

  set molybdenumTarget(double value) {
    _molybdenumTarget = value;
    notifyListeners();
    _saveToPreferences('molybdenumTarget', value);
  }

  set seleniumTarget(double value) {
    _seleniumTarget = value;
    notifyListeners();
    _saveToPreferences('seleniumTarget', value);
  }

  set zincTarget(double value) {
    _zincTarget = value;
    notifyListeners();
    _saveToPreferences('zincTarget', value);
  }

  set monounsaturatedFatTarget(double value) {
    _monounsaturatedFatTarget = value;
    notifyListeners();
    _saveToPreferences('monounsaturatedFatTarget', value);
  }

  set polyunsaturatedFatTarget(double value) {
    _polyunsaturatedFatTarget = value;
    notifyListeners();
    _saveToPreferences('polyunsaturatedFatTarget', value);
  }

  set omega3Target(double value) {
    _omega3Target = value;
    notifyListeners();
    _saveToPreferences('omega3Target', value);
  }

  set omega6Target(double value) {
    _omega6Target = value;
    notifyListeners();
    _saveToPreferences('omega6Target', value);
  }

  set saturatedFatTarget(double value) {
    _saturatedFatTarget = value;
    notifyListeners();
    _saveToPreferences('saturatedFatTarget', value);
  }

  set transFatTarget(double value) {
    _transFatTarget = value;
    notifyListeners();
    _saveToPreferences('transFatTarget', value);
  }

  set cholesterolTarget(double value) {
    _cholesterolTarget = value;
    notifyListeners();
    _saveToPreferences('cholesterolTarget', value);
  }

  set fiberTarget(double value) {
    _fiberTarget = value;
    notifyListeners();
    _saveToPreferences('fiberTarget', value);
  }

  set sugarTarget(double value) {
    _sugarTarget = value;
    notifyListeners();
    _saveToPreferences('sugarTarget', value);
  }

  set sugarAlcoholTarget(double value) {
    _sugarAlcoholTarget = value;
    notifyListeners();
    _saveToPreferences('sugarAlcoholTarget', value);
  }

  set starchTarget(double value) {
    _starchTarget = value;
    notifyListeners();
    _saveToPreferences('starchTarget', value);
  }

  set waterTarget(double value) {
    _waterTarget = value;
    notifyListeners();
    _saveToPreferences('waterTarget', value);
  }

  set caffeineTarget(double value) {
    _caffeineTarget = value;
    notifyListeners();
    _saveToPreferences('caffeineTarget', value);
  }

  set alcoholTarget(double value) {
    _alcoholTarget = value;
    notifyListeners();
    _saveToPreferences('alcoholTarget', value);
  }

  set isMealGroupingActivated(bool value) {
    _isMealGroupingActivated = value;
    notifyListeners();
    _saveToPreferences('isMealGroupingActivated', value);
  }

  set isProviderOpenFoodFactsActivated(bool value) {
    _isProviderOpenFoodFactsActivated = value;
    notifyListeners();
    _saveToPreferences('isProviderOpenFoodFactsActivated', value);
  }

  set isProviderSndbActivated(bool value) {
    _isProviderSndbActivated = value;
    notifyListeners();
    _saveToPreferences('isProviderSndbActivated', value);
  }

  set isProviderUsdaActivated(bool value) {
    _isProviderUsdaActivated = value;
    notifyListeners();
    _saveToPreferences('isProviderUsdaActivated', value);
  }

  set age(int value) {
    _age = value;
    notifyListeners();
    _saveToPreferences('age', value);
  }

  set sex(String value) {
    _sex = value;
    notifyListeners();
    _saveToPreferences('sex', value);
  }

  set weight(int value) {
    _weight = value;
    notifyListeners();
    _saveToPreferences('weight', value);
  }

  set height(int value) {
    _height = value;
    notifyListeners();
    _saveToPreferences('height', value);
  }

  set activityLevel(double value) {
    _activityLevel = value;
    notifyListeners();
    _saveToPreferences('activityLevel', value);
  }

  set weightTarget(WeightTarget value) {
    _weightTarget = value;
    notifyListeners();
    _saveToPreferences('weightTarget', value.toString());
  }

  set proteinRatio(double value) {
    _proteinRatio = value;
    notifyListeners();
    _saveToPreferences('proteinRatio', value);
  }

  set carbsRatio(double value) {
    _carbsRatio = value;
    notifyListeners();
    _saveToPreferences('carbsRatio', value);
  }

  set fatRatio(double value) {
    _fatRatio = value;
    notifyListeners();
    _saveToPreferences('fatRatio', value);
  }

  set backupServerUrl(String value) {
    _backupServerUrl = value;
    notifyListeners();
    _saveToPreferences('backupServerUrl', value);
  }

  set backupUsername(String value) {
    _backupUsername = value;
    notifyListeners();
    _saveToPreferences('backupUsername', value);
  }

  set backupPathAndFilename(String value) {
    _backupPathAndFilename = value;
    notifyListeners();
    _saveToPreferences('backupPathAndFilename', value);
  }

  void clearBackupServerUrl() async {
    await _initPreferences();
    unawaited(_preferences!.remove('backupServerUrl'));

    _backupServerUrl = '';
  }

  void clearBackupUsername() async {
    await _initPreferences();
    unawaited(_preferences!.remove('backupUsername'));

    _backupUsername = '';
  }

  void clearBackupPathAndFilename() async {
    await _initPreferences();
    unawaited(_preferences!.remove('backupPathAndFilename'));

    _backupPathAndFilename = '/Energize/backup.json.aes';
  }
}
