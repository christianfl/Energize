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

class USDABinding implements FoodDatabaseBindingInterface {
  const USDABinding();

  static const originName = 'USDA';
  @override
  final metadata = const FoodDatabaseBindingMetadata(
    originName: originName,
    privacyUrl: privacyUrl,
    displayName: _displayName,
    requiresActivationConfirmation: true,
    isOnline: true,
    supportedLanguages: ['en'],
    contentsLabel: _contentsLabel,
  );

  static String _displayName(AppLocalizations localizations) =>
      'USDA FoodData Central';

  static String _contentsLabel(AppLocalizations localizations) =>
      localizations.databaseUsdaContentsShort;

  /// Maximum number of foods returned from a text search.
  static const searchResultLimit = 10;

  static const imageUrl =
      'assets/food_databases/us-department-of-agriculture.png';
  static const sourceUrl = 'https://fdc.nal.usda.gov/index.html';
  static const privacyUrl = 'https://www.usda.gov/privacy-policy';

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

      int counter = searchResultLimit;
      if (foods.length < searchResultLimit) {
        counter = foods.length;
      }

      for (int i = 0; i < counter; i++) {
        final usdaFood = USDAFood.fromJson(foods[i]);
        foodReturn.add(Food.fromUSDAFoodProduct(usdaFood));
      }

      return foodReturn;
    } else {
      throw Exception(
        'USDA search returned HTTP ${response.statusCode}: ${response.body}',
      );
    }
  }
}
