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

  /// Query OpenFoodFacts for food by barcode.
  ///
  /// Works with 12 digit (UPC) and 13 digit (EAN) codes
  Future<Food> getFoodByBarcode(String barcode) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: _queryLanguage,
      fields: [ProductField.ALL],
      version: const ProductQueryVersion(3),
    );
    final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);

    if (result.status == ProductResultV3.statusSuccess) {
      return Food.fromOpenFoodFactsProduct(result.product!);
    } else if (barcode.length == 12) {
      // Product uses UPC instead of EAN, try with leading '0'
      final upgradedBarcode = '0$barcode';

      final ProductQueryConfiguration upgradedConfiguration =
          ProductQueryConfiguration(
        upgradedBarcode,
        language: _queryLanguage,
        fields: [ProductField.ALL],
        version: const ProductQueryVersion(3),
      );

      final ProductResultV3 newResult =
          await OpenFoodAPIClient.getProductV3(upgradedConfiguration);

      if (newResult.status == ProductResultV3.statusSuccess) {
        return Food.fromOpenFoodFactsProduct(result.product!);
      }
    }

    // If no product was found
    throw ProductNotFoundException(barcode);
  }

  Future<List<Food>?> searchFood(String searchText) async {
    if (searchText.isEmpty) return null;
    final parameters = <Parameter>[
      const PageNumber(page: 1),
      const PageSize(size: 10),
      const SortBy(option: SortOption.POPULARITY),
      SearchTerms(terms: [searchText]),
    ];

    final ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
      parametersList: parameters,
      language: _queryLanguage,
      version: const ProductQueryVersion(3),
    );

    final SearchResult result =
        await OpenFoodAPIClient.searchProducts(null, configuration);

    final List<Food> transformedProducts = [];

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
