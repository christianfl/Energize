import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../l10n/app_localizations.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  /// Must contain all system-defined (translatable) serving size keys.
  ///
  /// Needs matching entries in the .arb files, e.g.:
  ///
  /// "servingSize": "{name, select, l10nServing{Srv.} l10nPackage{Pck.} other{}}",
  ///
  /// l10nServing will be translated to "Srv." with en locale.
  /// l10nPackage will be translated to "Pck." with en locale.
  static const _systemServingSizes = {'l10nServing', 'l10nPackage'};

  // #################### Metadata ####################
  String id;
  String title;
  String origin;

  /// Can be any barcode (UPC, EAN, custom)
  String? ean;
  String? imageUrl;
  String? imageThumbnailUrl;

  /// Serving size such as "portion" and amount in g per serving size.
  ///
  /// String: Serving name
  /// double: Amount in g per serving name
  ///
  /// Serving name can either be system-defined (translatable) or user input.
  /// See [_systemServingSizes] for all system-defined serving size names.
  Map<String, double>? _servingSizes;

  /// Get [_servingSizes] with custom validation.
  @JsonKey(fromJson: nullableMapFromJson, toJson: nullableMapToJson)
  Map<String, double>? get servingSizes {
    if (_servingSizes != null) {
      if (_servingSizes!.isNotEmpty) {
        return _servingSizes;
      }
    }

    return null;
  }

  /// Set [_servingSizes] with custom validation.
  set servingSizes(Map<String, double>? value) {
    if (value != null) {
      if (value.isEmpty) {
        throw ArgumentError('servingSizes must not be empty.');
      }
    }

    _servingSizes = value;
  }

  // #################### Calories ####################

  /// In kcal/100 (g or ml)
  double? calories;

  // #################### Macronutrients ####################

  /// In g/100 (g or ml)
  double? protein;

  /// In g/100 (g or ml)
  double? carbs;

  /// In g/100 (g or ml)
  double? fat;

  // #################### Vitamins ####################

  /// In mg/100 (g or ml) RAE
  double? vitaminA;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Thiamine
  double? vitaminB1;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Riboflavin
  double? vitaminB2;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Niacin
  double? vitaminB3;

  /// In mg/100 (g or ml)
  ///
  /// Alt name: Pantothenic acid
  double? vitaminB5;

  /// In mg/100 (g or ml)
  double? vitaminB6;

  /// In μg/100 (g or ml)
  ///
  /// Alt name: Biotin
  double? vitaminB7;

  /// In μg/100 (g or ml)
  ///
  /// Alt name: Folate
  double? vitaminB9;

  /// In μg/100 (g or ml)
  ///
  /// Alt name: Cobalamin
  double? vitaminB12;

  /// In mg/100 (g or ml)
  double? vitaminC;

  /// In μg/100 (g or ml)
  double? vitaminD;

  /// In mg/100 (g or ml)
  double? vitaminE;

  /// In μg/100 (g or ml)
  double? vitaminK;

  // #################### Major minerals ####################

  /// In mg/100 (g or ml)
  double? calcium;

  /// In mg/100 (g or ml)
  double? chloride;

  /// In mg/100 (g or ml)
  double? magnesium;

  /// In mg/100 (g or ml)
  double? phosphorus;

  /// In mg/100 (g or ml)
  double? potassium;

  /// In mg/100 (g or ml)
  double? sodium;

  // #################### Trace elements ####################

  /// In μg/100 (g or ml)
  double? chromium;

  /// In mg/100 (g or ml)
  double? iron;

  /// In mg/100 (g or ml)
  double? fluorine;

  /// In μg/100 (g or ml)
  double? iodine;

  /// In mg/100 (g or ml)
  double? copper;

  /// In mg/100 (g or ml)
  double? manganese;

  /// In μg/100 (g or ml)
  double? molybdenum;

  /// In μg/100 (g or ml)
  double? selenium;

  /// In mg/100 (g or ml)
  double? zinc;

  // #################### Fats ####################

  /// In g/100 (g or ml)
  double? monounsaturatedFat;

  /// In g/100 (g or ml)
  double? polyunsaturatedFat;

  /// In g/100 (g or ml)
  double? omega3;

  /// In g/100 (g or ml)
  double? omega6;

  /// In g/100 (g or ml)
  double? saturatedFat;

  /// In g/100 (g or ml)
  double? transFat;

  /// In mg/100 (g or ml)
  double? cholesterol;

  // #################### Carbs ####################

  /// In g/100 (g or ml)
  double? fiber;

  /// In g/100 (g or ml)
  double? sugar;

  /// In g/100 (g or ml)
  double? sugarAlcohol;

  /// In g/100 (g or ml)
  double? starch;

  // #################### Other ####################

  /// In ml/100 (g or ml)
  double? water;

  /// In mg/100 (g or ml)
  double? caffeine;

  /// In g/100 (g or ml)
  double? alcohol;

  Food({
    required this.id,
    required this.title,
    required this.origin,
    this.ean,
    this.imageUrl,
    this.imageThumbnailUrl,
    Map<String, double>? servingSizes,
    this.calories,
    this.protein,
    this.carbs,
    this.fat,
    this.vitaminA,
    this.vitaminB1,
    this.vitaminB2,
    this.vitaminB3,
    this.vitaminB5,
    this.vitaminB6,
    this.vitaminB7,
    this.vitaminB9,
    this.vitaminB12,
    this.vitaminC,
    this.vitaminD,
    this.vitaminE,
    this.vitaminK,
    this.calcium,
    this.chloride,
    this.magnesium,
    this.phosphorus,
    this.potassium,
    this.sodium,
    this.chromium,
    this.iron,
    this.fluorine,
    this.iodine,
    this.copper,
    this.manganese,
    this.molybdenum,
    this.selenium,
    this.zinc,
    this.monounsaturatedFat,
    this.polyunsaturatedFat,
    this.omega3,
    this.omega6,
    this.saturatedFat,
    this.transFat,
    this.cholesterol,
    this.fiber,
    this.sugar,
    this.sugarAlcohol,
    this.starch,
    this.water,
    this.caffeine,
    this.alcohol,
  }) {
    this.servingSizes = servingSizes;
  }

  int get nutrientCount {
    int count = 0;

    count += calories != null && calories != 0 ? 1 : 0;
    count += protein != null && protein != 0 ? 1 : 0;
    count += carbs != null && carbs != 0 ? 1 : 0;
    count += fat != null && fat != 0 ? 1 : 0;
    count += vitaminA != null && vitaminA != 0 ? 1 : 0;
    count += vitaminB1 != null && vitaminB1 != 0 ? 1 : 0;
    count += vitaminB2 != null && vitaminB2 != 0 ? 1 : 0;
    count += vitaminB3 != null && vitaminB3 != 0 ? 1 : 0;
    count += vitaminB5 != null && vitaminB5 != 0 ? 1 : 0;
    count += vitaminB6 != null && vitaminB6 != 0 ? 1 : 0;
    count += vitaminB7 != null && vitaminB7 != 0 ? 1 : 0;
    count += vitaminB9 != null && vitaminB9 != 0 ? 1 : 0;
    count += vitaminB12 != null && vitaminB12 != 0 ? 1 : 0;
    count += vitaminC != null && vitaminC != 0 ? 1 : 0;
    count += vitaminD != null && vitaminD != 0 ? 1 : 0;
    count += vitaminE != null && vitaminE != 0 ? 1 : 0;
    count += vitaminK != null && vitaminK != 0 ? 1 : 0;
    count += calcium != null && calcium != 0 ? 1 : 0;
    count += chloride != null && chloride != 0 ? 1 : 0;
    count += magnesium != null && magnesium != 0 ? 1 : 0;
    count += phosphorus != null && phosphorus != 0 ? 1 : 0;
    count += potassium != null && potassium != 0 ? 1 : 0;
    count += sodium != null && sodium != 0 ? 1 : 0;
    count += chromium != null && chromium != 0 ? 1 : 0;
    count += iron != null && iron != 0 ? 1 : 0;
    count += fluorine != null && fluorine != 0 ? 1 : 0;
    count += iodine != null && iodine != 0 ? 1 : 0;
    count += copper != null && copper != 0 ? 1 : 0;
    count += manganese != null && manganese != 0 ? 1 : 0;
    count += molybdenum != null && molybdenum != 0 ? 1 : 0;
    count += selenium != null && selenium != 0 ? 1 : 0;
    count += zinc != null && zinc != 0 ? 1 : 0;
    count += monounsaturatedFat != null && monounsaturatedFat != 0 ? 1 : 0;
    count += polyunsaturatedFat != null && polyunsaturatedFat != 0 ? 1 : 0;
    count += omega3 != null && omega3 != 0 ? 1 : 0;
    count += omega6 != null && omega6 != 0 ? 1 : 0;
    count += saturatedFat != null && saturatedFat != 0 ? 1 : 0;
    count += transFat != null && transFat != 0 ? 1 : 0;
    count += cholesterol != null && cholesterol != 0 ? 1 : 0;
    count += fiber != null && fiber != 0 ? 1 : 0;
    count += sugar != null && sugar != 0 ? 1 : 0;
    count += sugarAlcohol != null && sugarAlcohol != 0 ? 1 : 0;
    count += starch != null && starch != 0 ? 1 : 0;
    count += water != null && water != 0 ? 1 : 0;
    count += caffeine != null && caffeine != 0 ? 1 : 0;
    count += alcohol != null && alcohol != 0 ? 1 : 0;

    return count;
  }

  static String get generatedId {
    return const Uuid().v4();
  }

  /// Returns hashCode based on all properties except:
  /// id, origin, ean, imageUrl, imageThumbnailUrl
  /// For food_input.dart in order to remove duplicate food entries.
  /// Did not override hashCode because these objects are not really the same
  /// and that could have introduced unwanted behaviour on other places
  int get customHashCode {
    final attributes = [
      title,
      calories,
      protein,
      carbs,
      fat,
      // servingSizes should produce the same hash for same key/value pairs.
      jsonEncode(servingSizes),
      vitaminA,
      vitaminB1,
      vitaminB2,
      vitaminB3,
      vitaminB5,
      vitaminB6,
      vitaminB7,
      vitaminB9,
      vitaminB12,
      vitaminC,
      vitaminD,
      vitaminE,
      vitaminK,
      calcium,
      chloride,
      magnesium,
      phosphorus,
      potassium,
      sodium,
      chromium,
      iron,
      fluorine,
      iodine,
      copper,
      manganese,
      molybdenum,
      selenium,
      zinc,
      monounsaturatedFat,
      polyunsaturatedFat,
      omega3,
      omega6,
      saturatedFat,
      transFat,
      cholesterol,
      fiber,
      sugar,
      sugarAlcohol,
      starch,
      water,
      caffeine,
      alcohol,
    ];

    return Object.hashAll(attributes);
  }

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FoodToJson(this);

  /// Returns a localized serving size name if system-defined.
  ///
  /// Else returns original [servingSizeName].
  static String getLocalizedServingSizeName(
    BuildContext context,
    String servingSizeName,
  ) {
    if (_systemServingSizes.contains(servingSizeName)) {
      // The key is translatable
      return AppLocalizations.of(
        context,
      )!.translatableServingSizeNames(servingSizeName);
    } else {
      return servingSizeName;
    }
  }

  /// Returns a Map of all [_systemServingSizes] and their localized names.
  ///
  /// E.g.: {'l10nPackage': 'Pck.', ...}
  static Map<String, String> getLocalizedSystemServingSizes(
    BuildContext context,
  ) {
    return {
      for (final sizeKey in _systemServingSizes)
        sizeKey: getLocalizedServingSizeName(context, sizeKey),
    };
  }

  /// Returns [_systemServingSizes]
  static Set<String> get systemServingSizes {
    return _systemServingSizes;
  }

  /// FromJson helper to deserialize the [servingSizes] Map.
  ///
  /// Needed for e. g. sqlite persistence and Backup creation.
  ///
  /// Empty map is threated as null value.
  static Map<String, double>? nullableMapFromJson(String? jsonString) {
    if (jsonString == null) return null;

    final Map<String, dynamic> decoded = jsonDecode(jsonString);

    if (decoded.isEmpty) {
      return null;
    }

    return decoded.map(
      (key, value) => MapEntry(key, (value as num).toDouble()),
    );
  }

  /// ToJson helper to serialize the [servingSizes] Map.
  ///
  /// Needed for e. g. sqlite persistence and Backup creation.
  ///
  /// Empty map is threated as null value.
  static String? nullableMapToJson(Map<String, double>? map) {
    if (map != null) {
      if (map.isNotEmpty) {
        return jsonEncode(map);
      }
    }

    return null;
  }
}
