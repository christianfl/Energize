import 'dart:io';

import 'package:openfoodfacts/model/UserAgent.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';

import '../../../models/food/food.dart';
import 'product_not_found_exception.dart';

class OpenFoodFactsBinding {
  static const originName = 'OFF';

  static const imageUrl = 'assets/food_databases/off.png';
  static const termsUrl = 'https://world.openfoodfacts.org/terms-of-use';
  static const contributeUrl = 'https://world.openfoodfacts.org/contribute';
  static const productUrl = 'https://openfoodfacts.org/product/';

  OpenFoodFactsBinding._privateConstructor() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'Energize',
      version: '0.4.0',
      url: 'https://codeberg.org/epinez/Energize',
    );
  }
  static final OpenFoodFactsBinding instance =
      OpenFoodFactsBinding._privateConstructor();

  static Future<Food> getFoodByEan(String barcode) async {
    ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: _queryLanguage,
      fields: [ProductField.ALL],
    );
    ProductResult result = await OpenFoodAPIClient.getProduct(configuration);

    if (result.status == 1) {
      return Food.fromOpenFoodFactsProduct(result.product!);
    } else {
      throw ProductNotFoundException(barcode);
    }
  }

  static Future<List<Food>?> searchFood(String searchText) async {
    if (searchText.isEmpty) return null;
    var parameters = <Parameter>[
      const PageNumber(page: 1),
      const PageSize(size: 10),
      const SortBy(option: SortOption.POPULARITY),
      SearchTerms(terms: [searchText]),
    ];

    ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
            parametersList: parameters, language: _queryLanguage);

    SearchResult result =
        await OpenFoodAPIClient.searchProducts(null, configuration);

    List<Food> transformedProducts = [];

    if (result.products != null) {
      for (var product in result.products!) {
        transformedProducts.add(Food.fromOpenFoodFactsProduct(product));
      }
    }

    return transformedProducts;
  }

  static get _queryLanguage {
    final String locale = Platform.localeName.split('_')[0];
    return LanguageHelper.fromJson(locale);
  }
}
