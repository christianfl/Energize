import 'dart:io';

import 'package:openfoodfacts/model/UserAgent.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';

import '../../models/food/food.dart';

class ProductNotFoundException implements Exception {
  String ean;
  ProductNotFoundException(this.ean);

  @override
  String toString() {
    return ean;
  }
}

class OpenFoodFactsBinding {
  OpenFoodFactsBinding._privateConstructor() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'Energize',
      version: '0.1.5',
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
      const Page(page: 1),
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
