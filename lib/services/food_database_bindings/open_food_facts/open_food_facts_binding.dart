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
        country: _queryCountry,
        fields: [ProductField.ALL],
        version: const ProductQueryVersion(3),
      );

      final ProductResultV3 newResult =
          await OpenFoodAPIClient.getProductV3(upgradedConfiguration);

      if (newResult.status == ProductResultV3.statusSuccess) {
        // Product was found with leading 0 for barcode (12 -> 13 digits)

        // Save product with original scanned barcode (12 digits) for 2 reasons:
        //
        // 1) Creating custom food out of this OFF food: Scanning the 12 digit
        //    barcode again should match with custom food that was created with
        //    12 digit barcode
        // 2) Matching between scanned barcode and previously tracked food can
        //    be supported at some time in order to pre-fill with previously
        //    tracked amount.
        //
        // It should be avoided to include this 12 / 13 digit logic in other
        // parts of Energize than here to not produce unwanted behavior

        final product = result.product!;
        product.barcode = barcode;
        return Food.fromOpenFoodFactsProduct(product);
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
      country: _queryCountry,
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

  /// Returns the [OpenFoodFactsLanguage] based on the system locale.
  static get _queryLanguage {
    final String locale = Platform.localeName.split('_')[0];
    return LanguageHelper.fromJson(locale);
  }

  /// Returns the [OpenFoodFactsCountry] based on the system locale.
  static OpenFoodFactsCountry? get _queryCountry {
    final String locale = Platform.localeName.split('_')[1];
    return OpenFoodFactsCountry.fromOffTag(locale);
  }
}
