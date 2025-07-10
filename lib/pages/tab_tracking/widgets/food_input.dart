import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../../../providers/custom_food_provider.dart';
import '../../../../providers/tracked_food_provider.dart';
import '../../../../theme/energize_theme.dart';
import '../../../../widgets/food_list_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/food/food.dart';
import '../../../models/food/food_tracked.dart';
import '../../../providers/app_settings_provider.dart';
import '../../../providers/log_provider.dart';
import '../../../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../../../services/food_database_bindings/open_food_facts/product_not_found_exception.dart';
import '../../../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../../../services/food_database_bindings/usda/usda_binding.dart';
import '../../../widgets/food_origin_logo_pill.dart';
import '../../tab_food/food_page.dart';
import '../track_food_modal.dart';

class FoodInput extends StatefulWidget {
  final DateTime _foodAddingDate;
  final SheetModalMode _sheetModalMode;
  final double _entryPillHeight = 35;
  final double _entryHeight = 50;

  const FoodInput(
    this._foodAddingDate,
    this._sheetModalMode, {
    super.key,
  });

  @override
  FoodInputState createState() => FoodInputState();
}

class FoodInputState extends State<FoodInput>
    with SingleTickerProviderStateMixin {
  static const _foodInputSuggestionsFromLastXDays = 21;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrController;
  final _searchInputController = TextEditingController();
  final _searchBarcodeController = TextEditingController();
  Barcode? _scannedCode;
  var _awaitingApiResponse = false;
  String? _productNotFoundExceptionBarcode;
  String? _additionalProductNotFoundInfo;

  List<Food> searchResultFood = [];

  Timer? _searchFieldDebounceTimer;

  /// true = on, false = off, null = unsupported
  bool? _flashStatus = false;

  /// Whether the last food search threw an error with OFF binding.
  ///
  /// For indicating the user which binding(s) had errors.
  ///
  /// Cleared when clearing SearchBar or on widget dispose.
  bool _hasOffBindingError = false;

  /// Whether the last food search threw an error with USDA binding.
  ///
  /// For indicating the user which binding(s) had errors.
  ///
  /// Cleared when clearing SearchBar or on widget dispose.
  bool _hasUsdaBindingError = false;

  /// Returns true if flash is on, false if off and null if unsupported
  Future<bool?> get _getFlashStatus async {
    bool? flashStatus;

    try {
      flashStatus = await _qrController?.getFlashStatus();
    } catch (e) {
      // Flash unsupported
    }

    return flashStatus;
  }

  /// Returns whether any of the food database bindings raised errors when searching for food.
  bool get _hasAnyBindingError {
    return _hasOffBindingError || _hasUsdaBindingError;
  }

  /// Returns a centered message.
  ///
  /// Shown if systems do not support barcode scanning with device camera.
  ///
  /// If [_productNotFoundExceptionBarcode] != null, shows [_noProductForBarcodeFoundFrame].
  Widget get _barcodeScanningUnsupportedFrame {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.barcodeScanningUnsupported,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (_productNotFoundExceptionBarcode != null)
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: _noProductForBarcodeFoundFrame,
            ),
        ],
      ),
    );
  }

  /// Returns a frame which shows that the searched barcode could not be found.
  ///
  /// Gives a possibility to add a new custom food.
  Widget get _noProductForBarcodeFoundFrame {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withAlpha(150),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.somethingNotFound(
              _productNotFoundExceptionBarcode!,
            ),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (_additionalProductNotFoundInfo != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                Text(
                  _additionalProductNotFoundInfo!,
                ),
              ],
            ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: FilledButton.tonalIcon(
                  onPressed: () => _navigateToAddCustomFood(
                    context,
                    barcode: _productNotFoundExceptionBarcode!,
                  ),
                  icon: const Icon(Icons.add),
                  label: Text(
                    AppLocalizations.of(context)!.addCustomFood,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget._sheetModalMode == SheetModalMode.search) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SearchBar(
              controller: _searchInputController,
              onSubmitted: (_) => _submitFoodSearch(
                _searchInputController.text,
              ),
              hintText: AppLocalizations.of(context)!.productOrBrand,
              leading: _awaitingApiResponse
                  ? Transform.scale(
                      scale: 0.5,
                      child: const CircularProgressIndicator(),
                    )
                  : const Icon(Icons.search),
              trailing: [
                if (_hasAnyBindingError)
                  IconButton(
                    onPressed: () {
                      _showErrorRaisingFoodDatabaseBindingsDialog();
                    },
                    icon: Icon(
                      Icons.error,
                      color: Theme.of(context).warningContainer,
                    ),
                  ),
                IconButton(
                  onPressed: () => _resetFoodSearch(),
                  icon: const Icon(Icons.clear),
                ),
                IconButton(
                  onPressed: () => _submitFoodSearch(
                    _searchInputController.text,
                  ),
                  icon: const Icon(Icons.send),
                ),
              ],
              elevation: WidgetStateProperty.all(0.0),
            ),
          ),
          Expanded(
            child: (searchResultFood.isNotEmpty)
                ? ListView.builder(
                    itemBuilder: (ctx, index) {
                      return FoodListItem(
                        searchResultFood[index],
                        onTapCallback: _navigateToAddFood,
                        quickAddFoodCallback: _quickAddFood,
                        getQuickAddFoodAmountCallback: _getQuickFoodAmount,
                        height: widget._entryHeight,
                        pillHeight: widget._entryPillHeight,
                      );
                    },
                    itemCount: searchResultFood.length,
                  )
                : Center(
                    child: _awaitingApiResponse
                        ? const CircularProgressIndicator()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.no_food, size: 100),
                              const SizedBox(height: 30),
                              FilledButton.tonalIcon(
                                onPressed: () =>
                                    _navigateToAddCustomFood(context),
                                icon: const Icon(Icons.add),
                                label: Text(
                                  AppLocalizations.of(context)!.addCustomFood,
                                ),
                              ),
                            ],
                          ),
                  ),
          ),
        ],
      );
    } else if (widget._sheetModalMode == SheetModalMode.barcode) {
      return Container(
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchBar(
                    elevation: WidgetStateProperty.all(0.0),
                    controller: _searchBarcodeController,
                    onSubmitted: (_) => _submitBarcodeSearch(
                      _searchBarcodeController.text,
                    ),
                    keyboardType: TextInputType.number,
                    hintText: AppLocalizations.of(context)!.barcode,
                    leading: const Icon(Icons.search),
                    trailing: [
                      IconButton(
                        onPressed: () => _submitBarcodeSearch(
                          _searchBarcodeController.text,
                        ),
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (!kIsWeb)
              if (!Platform.isAndroid)
                _barcodeScanningUnsupportedFrame
              else
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(
                      children: [
                        QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(2.0),
                          child: IconButton.filled(
                            isSelected: _flashStatus,
                            onPressed: () =>
                                _setFlash(_flashStatus == false ? true : false),
                            icon: const Icon(
                              Icons.bolt,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.bottomCenter,
                          child: _productNotFoundExceptionBarcode != null
                              ? _noProductForBarcodeFoundFrame
                              : SizedBox(
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: const LinearProgressIndicator(),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                )
            else
              // We are on Web
              _barcodeScanningUnsupportedFrame,
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _populateSearchedFoodList('');
  }

  @override
  void dispose() {
    _qrController?.dispose();
    _searchFieldDebounceTimer?.cancel();
    _searchInputController.dispose();
    _searchBarcodeController.dispose();

    // Re-enable all device screen orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  /// Only when opening this widget with barcode mode, block landscape orientation to improve scanning experience
  @override
  void initState() {
    super.initState();

    if (widget._sheetModalMode == SheetModalMode.barcode) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  /// Calls [searchBarcodeAndRedirect] and closes keyboard (if opened).
  ///
  /// Resets [_productNotFoundExceptionBarcode] if [searchBarcode] is empty.
  void _submitBarcodeSearch(String searchBarcode) {
    if (searchBarcode.isEmpty) {
      setState(() {
        _productNotFoundExceptionBarcode = null;
      });
    } else {
      searchBarcodeAndRedirect(searchBarcode);
    }

    // Close keyboard if opened
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// Calls [_populateSearchedFoodList] and closes keyboard (if opened).
  void _submitFoodSearch(String searchText) {
    _populateSearchedFoodList(searchText);

    // Close keyboard if opened
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// Fill the list of possible food to track depending on the search string.
  ///
  /// If nothing was searched, pre-fill with on device-stored data:
  /// - tracked food from last X days
  /// - all custom food
  ///
  /// If something was searched, the pre-filled data is filtered by containing
  /// the search string in the food title. Also, the API-based food composition
  /// databases get queried and their results are appended to the list
  void _populateSearchedFoodList(String searchText) async {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);
    final customFoodProvider =
        Provider.of<CustomFoodProvider>(context, listen: false);
    final trackedFoodProvider =
        Provider.of<TrackedFoodProvider>(context, listen: false);

    final foodFromLastXDays = List<Food>.of(
      await trackedFoodProvider
          .getTrackedFoodFromUntilNow(_foodInputSuggestionsFromLastXDays),
    );

    // Initial fill of the suggestions list (and when searched for empty string)
    setState(() {
      // Fill with previously tracked foods, newest first
      searchResultFood = foodFromLastXDays.reversed.toList();

      // Fill with custom foods
      searchResultFood += customFoodProvider.foods;

      // Remove duplicates
      _removeDuplicateSuggestions();

      // When searched for anything, filter the previously generated
      // suggestion list so that it only shows matching entries
      if (searchText.isNotEmpty) {
        searchResultFood = searchResultFood
            .where(
              (food) =>
                  food.title.toLowerCase().contains(searchText.toLowerCase()),
            )
            .toList();
      }
    });

    // If at least one of the food composition databases is activated
    // Doesn't matter whether it is stored offline or API-based
    if ((appSettings.isProviderOpenFoodFactsActivated ||
        appSettings.isProviderUsdaActivated ||
        appSettings.isProviderSndbActivated)) {
      setState(() {
        _awaitingApiResponse = true;
      });

      // Search in food composition databases (in parallel)
      await Future.wait([
        _getSFCDSearchResultIfActivated(searchText),
        _getOpenFoodFactsSearchResultIfActivated(searchText),
        _getUsdaSearchResultIfActivated(searchText),
      ]);

      setState(() {
        _removeDuplicateSuggestions();
        _awaitingApiResponse = false;
      });
    }
  }

  // This method is just for hot reloading to work
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      _qrController?.resumeCamera();
    }
  }

  /// Query databases/API for food by barcode and navigate to track food modal.
  ///
  /// Queries (in this order):
  /// 1. Custom foods
  /// 2. Open Food Facts
  ///
  /// If no food was found, shows error based on whether
  /// Open Food Facts database is activated or not
  /// or if there were errors fetching the Open Food Facts API
  void searchBarcodeAndRedirect(String barcode) {
    // Try to look up the barcode in the custom foods at first
    final customFoodProvider =
        Provider.of<CustomFoodProvider>(context, listen: false);

    customFoodProvider
        .getCustomFoodByBarcode(barcode)
        .then((customFoodIfFound) {
      if (customFoodIfFound != null) {
        // Custom food with this barcode was found

        if (!mounted) return;
        _navigateToAddFood(context, customFoodIfFound, popAfterReturn: true);
      } else {
        if (!mounted) return;

        final appSettings =
            Provider.of<AppSettingsProvider>(context, listen: false);

        // Look up on Open Food Facts if that is activated
        if (appSettings.isProviderOpenFoodFactsActivated) {
          OpenFoodFactsBinding().getFoodByBarcode(barcode).then((food) {
            if (!mounted) return;

            _navigateToAddFood(context, food, popAfterReturn: true);
          }).catchError((error) {
            setState(() {
              // Set barcode for which a product was not found on OFF
              _productNotFoundExceptionBarcode = barcode;

              // Set additional info
              if (error is ProductNotFoundException) {
                // Also not found in Open Food Facts Database
                _additionalProductNotFoundInfo = AppLocalizations.of(context)!
                    .notFoundInCustomFoodsOrOpenFoodFacts;
              } else if (error is ClientException) {
                // Probably no network connection
                _additionalProductNotFoundInfo = AppLocalizations.of(context)!
                    .notFoundInCustomFoodsOpenFoodFactsNeedsInternet;
              } else {
                // Another error while searching food on Open Food Facts
                _additionalProductNotFoundInfo = AppLocalizations.of(context)!
                    .notFoundInCustomFoodsOpenFoodFactsHasError;
              }
            });
          });
        } else {
          setState(() {
            // Open Food Facts is not activated, set data accordingly

            _productNotFoundExceptionBarcode = barcode;
            _additionalProductNotFoundInfo = AppLocalizations.of(context)!
                .notFoundInCustomFoodsOpenFoodFactsNotActivated;
          });
        }
      }
    });
  }

  Future<void> _getOpenFoodFactsSearchResultIfActivated(
    String searchText,
  ) async {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);

    if (appSettings.isProviderOpenFoodFactsActivated) {
      try {
        final offSearchResultFood =
            await OpenFoodFactsBinding().searchFood(searchText);

        if (offSearchResultFood != null) {
          setState(() {
            searchResultFood += offSearchResultFood;
            _removeDuplicateSuggestions();
          });
        }
      } catch (e) {
        setState(() {
          _hasOffBindingError = true;
        });
      }
    } else {
      return;
    }
  }

  /// Returns the amount and serving size for quickly adding a new Food.
  ///
  /// Uses these values:
  ///
  /// - if previously tracked, use the same values
  /// - else if food has serving sizes, and appSettings.isServingSizePreferred
  ///   - set amount = 1
  ///   - if "Srv." (en) is present as serving size name, use this
  ///   - else use the first available serving size name
  /// - else default to 100 g
  ({
    double amount,
    String? selectedServingSize,
  }) _getQuickFoodAmount(Food food) {
    double amount = 100.0; // Default: 100 g
    String? selectedServingSize;

    if (food is FoodTracked) {
      // Set amount and serving size as previously tracked
      amount = food.amount;
      selectedServingSize = food.selectedServingSize;
    } else {
      // Food was not tracked before
      if (food.servingSizes != null) {
        try {
          final appSettings =
              Provider.of<AppSettingsProvider>(context, listen: false);
          final isServingSizePreferred = appSettings.isServingSizePreferred;

          if (isServingSizePreferred) {
            // Serving has the highest priority, default to that.
            // If that is not present, use the first key
            selectedServingSize = food.servingSizes!.keys.firstWhere(
              (keyName) => keyName == 'l10nServing',
              orElse: () => food.servingSizes!.keys.first,
            );

            // Default to 1 serving
            amount = 1;
          } else {
            // User does not want to use serving sizes, don't change anything
          }
        } catch (e, st) {
          final logger = Provider.of<LogProvider>(context, listen: false);
          logger.error(
            'Error processing serving size selection for quick add food',
            e,
            st,
          );
        }
      }
    }

    return (
      amount: amount,
      selectedServingSize: selectedServingSize,
    );
  }

  Future<void> _getUsdaSearchResultIfActivated(String searchText) async {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);

    if (appSettings.isProviderUsdaActivated) {
      try {
        final usdaSearchResultFood = await USDABinding.searchFood(searchText);

        if (usdaSearchResultFood != null) {
          setState(() {
            searchResultFood += usdaSearchResultFood;
            _removeDuplicateSuggestions();
          });
        }
      } catch (e) {
        setState(() {
          _hasUsdaBindingError = true;
        });
      }
    } else {
      return;
    }
  }

  /// Get food with matching title/synonym from Swiss Food Composition Database
  Future<void> _getSFCDSearchResultIfActivated(String searchText) async {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);

    if (appSettings.isProviderSndbActivated) {
      try {
        final sfcdSearchResultFood =
            await SwissFoodCompositionDatabaseBinding.searchFood(
          searchText,
          Localizations.localeOf(context),
        );

        if (sfcdSearchResultFood != null) {
          setState(() {
            searchResultFood += sfcdSearchResultFood;
            _removeDuplicateSuggestions();
          });
        }
      } catch (e) {
        // Data is saved offline, needless to catch exception
      }
    } else {
      return;
    }
  }

  void _navigateToAddCustomFood(BuildContext context, {String? barcode}) {
    _qrController?.pauseCamera();
    try {
      // Turn of flash
      _setFlash(false);
    } catch (e) {
      final logger = Provider.of<LogProvider>(context, listen: false);
      logger.warning('Could not turn off flash', e);
    }

    Navigator.of(context)
        .pushNamed(
      AddEditCustomFoodModal.routeName,
      arguments: AddEditCustomFoodModalArguments(
        AddEditCustomFoodModalMode.addNew,
        Food(
          id: Food.generatedId,
          origin: FoodPage.originName,
          title: '',
          ean: barcode,
        ),
      ),
    )
        .then(
      (createdFood) {
        if (createdFood is Food) {
          if (!context.mounted) return;
          _navigateToAddFood(context, createdFood, popAfterReturn: true);
        } else {
          // In case the custom food has not been created and another code wants to be scanned
          _qrController?.resumeCamera();
        }
      },
    );
  }

  void _navigateToAddFood(
    BuildContext context,
    Food foodToBeAdded, {
    /// After popping TrackFood.routeName, should THIS route be popped or not?
    ///
    /// When going back after scanning a product with barcode, it is desired
    /// behavior that this input field gets popped because scanning should
    /// immediately return to the desired product; if the user want to get back
    /// after landing on the product page, it is assumed that the user does not
    /// want to track this food anymore, resulting in popping the input field
    /// and returning to the tracking page
    bool popAfterReturn = false,
  }) {
    _qrController?.pauseCamera();
    try {
      // Turn of flash
      _setFlash(false);
    } catch (e) {
      final logger = Provider.of<LogProvider>(context, listen: false);
      logger.warning('Could not turn off flash', e);
    }

    Navigator.of(context)
        .pushNamed(
      TrackFood.routeName,
      arguments: ModalArguments(
        foodToBeAdded,
        ModalMode.add,
        widget._foodAddingDate,
      ),
    )
        .then((result) {
      setState(() {
        _scannedCode = null;
        _productNotFoundExceptionBarcode = null;
      });
      if (popAfterReturn) {
        if (!context.mounted) return;
        Navigator.of(context).pop();
      }
    });
  }

  /// Listen for the scanned stream until a barcode code is found
  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;
    _qrController!.resumeCamera();

    controller.scannedDataStream.listen((scanData) {
      if (_scannedCode == null) {
        _scannedCode = scanData;

        searchBarcodeAndRedirect(_scannedCode!.code!);
      }
    });
  }

  /// Directly track a Food with the same amount and serving size as previously.
  ///
  /// Closes the Food suggestions modal.
  void _quickAddFood(
    Food food,
    TrackedFoodProvider trackedFoodProvider,
  ) {
    final foodToBeTracked = FoodTracked.fromFood(
      food,
      FoodTracked.generatedId,
      _getQuickFoodAmount(food).amount,
      widget._foodAddingDate,
      DateTime.now(),
      selectedServingSize: _getQuickFoodAmount(food).selectedServingSize,
    );

    trackedFoodProvider.addTrackedFood(foodToBeTracked);
    // Close current ModalBottomSheet
    Navigator.pop(context);
  }

  /// This removes duplicate items in the food suggestions list.
  ///
  /// Using [Food.customHashCode], a [Food] is defined as a duplicate
  /// of another one, if the nutrition values and serving sizes match.
  void _removeDuplicateSuggestions() {
    final customHashCodes =
        searchResultFood.map((f) => f.customHashCode).toSet();
    searchResultFood
        .retainWhere((x) => customHashCodes.remove(x.customHashCode));
  }

  /// Resets the SearchBar which searches for food to track.
  ///
  /// Clears the controller, the searched food list and binding errors.
  void _resetFoodSearch() {
    _searchInputController.clear();
    _populateSearchedFoodList('');

    // Clear binding errors
    setState(() {
      _hasOffBindingError = false;
      _hasUsdaBindingError = false;
    });
  }

  /// Turns flash on if true ; off if false ; or leaves as is
  Future<void> _setFlash(bool newFlashStatus) async {
    final bool? flashStatus = await _getFlashStatus;

    if (flashStatus == null) {
      // Cannot set flash if unsupported (on web)
      setState(() {
        _flashStatus = null;
      });
    }

    if (newFlashStatus != flashStatus) {
      setState(() {
        _flashStatus = newFlashStatus;
      });

      return await _qrController?.toggleFlash();
    }
  }

  /// Shows a dialog which lists the food database binding(s) which raised an error during food search
  Future<void> _showErrorRaisingFoodDatabaseBindingsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.searchError),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(AppLocalizations.of(context)!.searchErrorHint),
                const SizedBox(height: 12),
                Text('${AppLocalizations.of(context)!.affectedDatabases}:'),
                const SizedBox(height: 12),
                if (_hasOffBindingError)
                  const ListTile(
                    title: Text('Open Food Facts'),
                    trailing: SizedBox(
                      width: 72,
                      height: 46,
                      child:
                          FoodOriginLogoPill(OpenFoodFactsBinding.originName),
                    ),
                  ),
                if (_hasUsdaBindingError)
                  const ListTile(
                    title: Text('USDA Food Data Central'),
                    trailing: SizedBox(
                      width: 72,
                      height: 46,
                      child: FoodOriginLogoPill(USDABinding.originName),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
            ),
          ],
        );
      },
    );
  }
}

enum SheetModalMode { search, barcode }
