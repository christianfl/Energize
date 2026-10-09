import 'dart:io';
import 'dart:ui' show Locale;

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/food/food.dart';
import '../../log_service_interface.dart';
import '../food_database_binding_interface.dart';
import '../food_database_binding_metadata.dart';
import 'open_food_facts_mapper.dart';
import 'product_not_found_exception.dart';
import 'status_aware_product_search_query_configuration.dart';

class OpenFoodFactsBinding implements FoodDatabaseBindingInterface {
  /// See [FoodDatabaseBindingMetadata.originId].
  static const originId = 'OFF';

  @override
  final metadata = const FoodDatabaseBindingMetadata(
    originId: originId,
    imageUrl: imageUrl,
    privacyUrl: privacyUrl,
    termsUrl: termsUrl,
    displayName: _displayName,
    requiresActivationConfirmation: true,
    isOnline: true,
    supportedLanguages: null,
    contentsLabel: _contentsLabel,
  );

  static String _displayName(AppLocalizations localizations) =>
      'Open Food Facts';

  static String _contentsLabel(AppLocalizations localizations) =>
      localizations.databaseOffContentsShort;

  /// Maximum number of products requested for a text search.
  static const searchPageSize = 10;

  static const imageUrl = 'assets/food_databases/open-food-facts.png';
  static const termsUrl = 'https://world.openfoodfacts.org/terms-of-use';
  static const contributeUrl = 'https://world.openfoodfacts.org/contribute';
  static const privacyUrl = 'https://world.openfoodfacts.org/privacy';
  static const productUrl = 'https://openfoodfacts.org/product/';

  OpenFoodFactsBinding._privateConstructor();

  /// Fetch Energize app version and set OFF UserAgent with correct version
  Future<void> _prepareUserAgent() async {
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

  /// Cached initialization future to ensure the user agent is configured only once.
  Future<void>? _prepareUserAgentFuture;

  /// Initializes the Open Food Facts user agent on first use and reuses the same future.
  Future<void> _ensureInitialized() {
    return _prepareUserAgentFuture ??= _prepareUserAgent();
  }

  /// Query OpenFoodFacts for food by barcode.
  ///
  /// Works with 12 digit (UPC) and 13 digit (EAN) codes
  Future<Food> getFoodByBarcode(String barcode) async {
    await _ensureInitialized();

    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: _queryLanguage,
      fields: [ProductField.ALL],
      version: const ProductQueryVersion(3),
    );
    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
      configuration,
    );

    if (result.status == ProductResultV3.statusSuccess) {
      return foodFromOpenFoodFactsProduct(result.product!);
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

      final ProductResultV3 newResult = await OpenFoodAPIClient.getProductV3(
        upgradedConfiguration,
      );

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
        return foodFromOpenFoodFactsProduct(product);
      }
    }

    // If no product was found
    throw ProductNotFoundException(barcode);
  }

  @override
  Future<List<Food>> searchFood(
    String searchText, {
    required Locale locale,
    LogServiceInterface? logger,
  }) async {
    final normalizedSearchText = searchText.trim();
    if (normalizedSearchText.isEmpty) return [];

    await _ensureInitialized();
    final parameters = <Parameter>[
      const PageNumber(page: 1),
      const PageSize(size: searchPageSize),
      const SortBy(option: SortOption.POPULARITY),
      SearchTerms(terms: [normalizedSearchText]),
    ];

    final ProductSearchQueryConfiguration configuration =
        StatusAwareProductSearchQueryConfiguration(
          parametersList: parameters,
          language: LanguageHelper.fromJson(locale.languageCode),
          country: _queryCountry,
          version: const ProductQueryVersion(3),
        );

    final SearchResult result = await OpenFoodAPIClient.searchProducts(
      null,
      configuration,
    );

    final List<Food> transformedProducts = [];

    if (result.products != null) {
      for (var product in result.products!) {
        transformedProducts.add(foodFromOpenFoodFactsProduct(product));
      }
    }

    return transformedProducts;
  }

  /// Returns the [OpenFoodFactsLanguage] based on the system locale.
  static OpenFoodFactsLanguage get _queryLanguage {
    final String locale = Platform.localeName.split('_')[0];
    return LanguageHelper.fromJson(locale);
  }

  /// Returns the [OpenFoodFactsCountry] based on the system locale.
  static OpenFoodFactsCountry? get _queryCountry {
    final String locale = Platform.localeName.split('_')[1];
    return OpenFoodFactsCountry.fromOffTag(locale);
  }
}
