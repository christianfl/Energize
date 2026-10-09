import 'dart:convert';
import 'dart:ui' show Locale;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../l10n/app_localizations.dart';
import '../../../models/food/food.dart';
import '../../log_service_interface.dart';
import '../food_database_binding_interface.dart';
import '../food_database_binding_metadata.dart';
import 'models/usda_food.dart';
import 'usda_food_mapper.dart';

class USDABinding implements FoodDatabaseBindingInterface {
  const USDABinding();

  /// See [FoodDatabaseBindingMetadata.originId].
  static const originId = 'USDA';

  @override
  final metadata = const FoodDatabaseBindingMetadata(
    originId: originId,
    imageUrl: 'assets/food_databases/us-department-of-agriculture.png',
    privacyUrl: 'https://www.usda.gov/privacy-policy',
    displayName: _displayName,
    requiresActivationConfirmation: true,
    isOnline: true,
    supportedLanguages: ['en'],
    contentsLabel: _contentsLabel,
    publisher: _publisher,
    description: _description,
    languageDescription: _languageDescription,
    sourceUrl: 'https://fdc.nal.usda.gov/index.html',
  );

  static String _publisher(AppLocalizations localizations) =>
      'U.S. Department of Agriculture, Agricultural Research Service. FoodData Central, 2019. fdc.nal.usda.gov.';

  static String _description(AppLocalizations localizations) =>
      localizations.usdaFoodDataCentralGeneralInformationText;

  static String _languageDescription(AppLocalizations localizations) =>
      localizations.english;

  static String _displayName(AppLocalizations localizations) =>
      'USDA FoodData Central';

  static String _contentsLabel(AppLocalizations localizations) =>
      localizations.databaseUsdaContentsShort;

  /// Maximum number of foods returned from a text search.
  static const _searchResultLimit = 10;

  static final _apiKey = dotenv.env['API_KEY_USDA'];

  @override
  Future<List<Food>> searchFood(
    String searchText, {
    required Locale locale,
    LogServiceInterface? logger,
  }) async {
    final normalizedSearchText = searchText.trim();
    if (normalizedSearchText.isEmpty) return [];

    final url =
        'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=$_apiKey&query=$searchText';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      final List<dynamic> foods = decodedResponse['foods'];
      final List<Food> foodReturn = [];

      int counter = _searchResultLimit;
      if (foods.length < _searchResultLimit) {
        counter = foods.length;
      }

      for (int i = 0; i < counter; i++) {
        final usdaFood = USDAFood.fromJson(foods[i]);
        foodReturn.add(foodFromUSDAFoodProduct(usdaFood));
      }

      return foodReturn;
    } else {
      throw Exception(
        'USDA search returned HTTP ${response.statusCode}: ${response.body}',
      );
    }
  }
}
