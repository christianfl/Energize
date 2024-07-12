import 'dart:io';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../models/food/food.dart';
import 'product_not_found_exception.dart';

class OpenFoodFactsBinding {
  static const originName = 'OFF';

  static const imageUrl = 'assets/food_databases/off.png';
  static const termsUrl = 'https://world.openfoodfacts.org/terms-of-use';
  static const contributeUrl = 'https://world.openfoodfacts.org/contribute';
  static const productUrl = 'https://openfoodfacts.org/product/';

  OpenFoodFactsBinding._privateConstructor() {
    _prepareUserAgent();
  }

  /// Fetch Energize app version and set OFF UserAgent with correct version
  void _prepareUserAgent() async {
    final packageInfo = await PackageInfo.fromPlatform();

    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'Energize',
      version: packageInfo.version,
      url: 'https://codeberg.org/epinez/Energize',
    );
  }

  static final OpenFoodFactsBinding _instance =
      OpenFoodFactsBinding._privateConstructor();

  factory OpenFoodFactsBinding() {
    return _instance;
  }

  Future<Food> getFoodByEan(String barcode) async {
    ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: _queryLanguage,
      fields: [ProductField.ALL],
      version: const ProductQueryVersion(3),
    );
    ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);

    if (result.status == ProductResultV3.statusSuccess) {
      return Food.fromOpenFoodFactsProduct(result.product!);
    } else {
      throw ProductNotFoundException(barcode);
    }
  }

  Future<List<Food>?> searchFood(String searchText) async {
    if (searchText.isEmpty) return null;
    var parameters = <Parameter>[
      const PageNumber(page: 1),
      const PageSize(size: 10),
      const SortBy(option: SortOption.POPULARITY),
      SearchTerms(terms: [searchText]),
    ];

    ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
      parametersList: parameters,
      language: _queryLanguage,
      version: const ProductQueryVersion(3),
    );

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
