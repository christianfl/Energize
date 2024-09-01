import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

import '../../../models/food/food.dart';

class SwissFoodCompositionDatabaseBinding {
  static const originName = 'SFCDB';

  static const imageUrl = 'assets/food_databases/sfcdb.png';
  static const sourceUrl = 'https://naehrwertdaten.ch/de/';
  static const databaseCsvUrl =
      'lib/services/food_database_bindings/swiss_food_composition_database/assets/sfcd.csv';

  /// Searches for matching food in the Swiss Food Composition Database.
  ///
  /// Supported languages: English, German, Italian, French (uses device locale)
  ///
  /// Fallback: English
  ///
  /// Reads data from local CSV file.
  static Future<List<Food>?> searchFood(
    String searchText,
    Locale locale,
  ) async {
    if (searchText.isEmpty) return null;

    final List<Food> foundFoods = [];

    // SFCDB supports four languages.
    // Use english as default or language of device if supported
    String csvLanguageIdentifier = 'Name_EN';
    String csvLanguageSynonymIdentifier = 'Synonyms_EN';

    final language = locale.languageCode;

    switch (language) {
      case 'de':
        csvLanguageIdentifier = 'Name_DE';
        csvLanguageSynonymIdentifier = 'Synonyms_DE';
      case 'it':
        csvLanguageIdentifier = 'Name_IT';
        csvLanguageSynonymIdentifier = 'Synonyms_IT';
      case 'fr':
        csvLanguageIdentifier = 'Name_FR';
        csvLanguageSynonymIdentifier = 'Synonyms_FR';
      default:
      // Do not change, it's already english
    }

    // Read data from CSV file
    final String csvAsString = await rootBundle.loadString(databaseCsvUrl);
    // Separate each line of the CSV file for iteration
    final List<String> csvLines = csvAsString.split('\n');

    List<String> csvHeader = [];

    for (final csvLine in csvLines) {
      if (csvLine == csvLines[0]) {
        // Fist line of the CSV defines the header
        csvHeader = csvLine.split('§');
      } else if (csvLine.isEmpty) {
        // Do nothing
      } else {
        final csvFoodRow = csvLine.split('§');
        String matchedTitle = '';

        // Check food title for match...
        final foodTitle = csvFoodRow[
            csvHeader.indexWhere((header) => header == csvLanguageIdentifier)];

        // Check food alternative title for match...
        final foodTitleSynonym = csvFoodRow[csvHeader
            .indexWhere((header) => header == csvLanguageSynonymIdentifier)];

        // Check for title match
        if ((foodTitle.toLowerCase().contains(searchText.toLowerCase()))) {
          // Match in title
          matchedTitle = foodTitle;
        } else if ((foodTitleSynonym
            .toLowerCase()
            .contains(searchText.toLowerCase()))) {
          // Match in alt title
          // Keep original title in brackets, because else, some food can't be distinguished
          matchedTitle = '$foodTitleSynonym ($foodTitle)';
        } else {
          // If the food of the current iteration does not match the search title
          // Continue to next iteration
          continue;
        }

        // Add food if title matched
        try {
          foundFoods.add(
            Food(
              // Metadata
              id: Food.generatedId,
              title: matchedTitle,
              origin: SwissFoodCompositionDatabaseBinding.originName,

              // Calories and macros
              calories: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Energy, kilocalories (kcal)',
              ),
              protein: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Protein (g)',
              ),
              carbs: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Carbohydrates, available (g)',
              ),
              fat: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Fat, total (g)',
              ),

              // Micros
              vitaminA: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin A activity, RAE (µg-RE)',
                divideBy: 1000,
              ),
              vitaminB1: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin B1 (thiamine) (mg)',
              ),
              vitaminB2: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin B2 (riboflavin) (mg)',
              ),
              vitaminB3: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Niacin (mg)',
              ),
              vitaminB5: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Panthotenic acid (mg)',
              ),
              vitaminB6: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin B6 (pyridoxine) (mg)',
              ),
              vitaminB9: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Folate (µg)',
              ),
              vitaminB12: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin B12 (cobalamin) (µg)',
              ),
              vitaminC: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin C (ascorbic acid) (mg)',
              ),
              vitaminD: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin D (calciferol) (µg)',
              ),
              vitaminE: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Vitamin E (α-tocopherol) (mg)',
              ),
              calcium: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Calcium (Ca) (mg)',
              ),
              chloride: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Chloride (Cl) (mg)',
              ),
              magnesium: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Magnesium (Mg) (mg)',
              ),
              phosphorus: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Phosphorus (P) (mg)',
              ),
              potassium: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Potassium (K) (mg)',
              ),
              sodium: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Sodium (Na) (mg)',
              ),
              iron: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Iron (Fe) (mg)',
              ),
              iodine: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Iodide (I) (µg)',
              ),
              selenium: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Selenium (Se) (µg)',
              ),
              zinc: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Zinc (Zn) (mg)',
              ),
              monounsaturatedFat: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Fatty acids, monounsaturated (g)',
              ),
              polyunsaturatedFat: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Fatty acids, polyunsaturated (g)',
              ),
              saturatedFat: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Fatty acids, saturated (g)',
              ),
              cholesterol: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Cholesterol (mg)',
              ),
              fiber: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Dietary fibres (g)',
              ),
              sugar: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Sugars (g)',
              ),
              starch: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Starch (g)',
              ),
              water: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Water (g)',
              ),
              alcohol: _getNutrientValueByColName(
                csvHeader,
                csvFoodRow,
                'Alcohol (g)',
              ),
            ),
          );
        } catch (e) {
          debugPrint(
            'Error while mapping row from CSV. Food title: $matchedTitle',
          );
          debugPrint(
            'Error: $e',
          );
        }
      }
    }

    return foundFoods;
  }

  /// Returns the double.tryParsed() value of a field in a CSV row
  /// by passing the column name within csvHeader
  ///
  /// If divideBy is set, the parsed value gets divided by this value
  /// in order to get matching units
  static double? _getNutrientValueByColName(
    List<String> csvHeader,
    List<String> csvRow,
    String colName, {
    int? divideBy,
  }) {
    assert(csvHeader.length == csvRow.length);

    double? value = double.tryParse(
      csvRow[csvHeader.indexWhere(
        (header) => header == colName,
      )],
    );

    // Divide value for matching units
    if (divideBy != null && value != null) {
      value /= 1000;
    }

    return value;
  }
}
