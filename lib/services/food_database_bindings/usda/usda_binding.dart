import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../models/food/food.dart';
import 'models/usda_food.dart';

class USDABinding {
  static const originName = 'USDA';

  static const imageUrl =
      'assets/food_databases/us-department-of-agriculture.png';
  static const sourceUrl = 'https://fdc.nal.usda.gov/index.html';

  static final _apiKey = dotenv.env['API_KEY_USDA'];

  static Future<List<Food>?> searchFood(String searchText) async {
    if (searchText.isEmpty) return null;

    final url =
        'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=$_apiKey&query=$searchText';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      final List<dynamic> foods = decodedResponse['foods'];
      final List<Food> foodReturn = [];

      int counter = 10;
      if (foods.length < 10) {
        counter = foods.length;
      }

      for (int i = 0; i < counter; i++) {
        final usdaFood = USDAFood.fromJson(foods[i]);
        foodReturn.add(Food.fromUSDAFoodProduct(usdaFood));
      }

      return foodReturn;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
