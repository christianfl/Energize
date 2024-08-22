import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../providers/app_settings.dart';
import '../../providers/custom_food_provider.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/sqlite/tracked_foods_database_service.dart';
import '../../theme/energize_theme.dart';
import '../../widgets/food_list_item.dart';
import '../models/food/food.dart';
import '../models/food/food_tracked.dart';
import '../pages/tab_food/food_page.dart';
import '../pages/tab_tracking/track_food_modal.dart';
import '../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../services/food_database_bindings/usda/usda_binding.dart';
import '../services/sqlite/custom_foods_database_service.dart';
import 'food_origin_logo_pill.dart';

enum SheetModalMode { search, barcode }

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
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrController;
  final _searchInputController = TextEditingController();
  final _searchBarcodeController = TextEditingController();
  Barcode? _scannedCode;
  var _awaitingApiResponse = false;
  String? _productNotFoundExceptionBarcode;
  final List<Food> foodsFromSndb = SwissFoodCompositionDatabaseBinding.allFoods;
  List<Food> searchResultFood = [];
  Timer? _searchFieldDebounceTimer;

  /// true = on, false = off, null = unsupported
  bool? _flashStatus = false;

  static const Duration _defaultInputDebounceDuration =
      Duration(milliseconds: 500);
  static const _foodInputSuggestionsFromLastXDays = 21;

  List<Food>? _offSearchResultFood;
  List<Food>? _usdaSearchResultFood;

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    populateSearchedFoodList('', false);
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
      // Do nothing if that fails
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

  void _navigateToAddCustomFood(BuildContext context, {String? barcode}) {
    _qrController?.pauseCamera();
    try {
      // Turn of flash
      _setFlash(false);
    } catch (e) {
      // Do nothing if that fails
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

  /// Look up barcode code and redirect accordingly
  void searchBarcodeAndRedirect(String barcode) {
    // Try first to look up the barcode in the custom foods
    CustomFoodDatabaseService.getCustomFoodByEan(barcode)
        .then((customFoodIfFound) {
      if (customFoodIfFound != null) {
        // Custom food with this barcode was found

        if (!mounted) return;
        _navigateToAddFood(context, customFoodIfFound, popAfterReturn: true);
      } else {
        if (!mounted) return;

        // Look up on Open Food Facts if this is activated
        final appSettings = Provider.of<AppSettings>(context, listen: false);

        if (appSettings.isProviderOpenFoodFactsActivated) {
          OpenFoodFactsBinding().getFoodByBarcode(barcode).then((food) {
            if (!mounted) return;

            _navigateToAddFood(context, food, popAfterReturn: true);
          }).catchError((error) {
            // If there is also no match, show an error that no product could be found
            setState(() {
              _productNotFoundExceptionBarcode = '$error';
            });
          });
        } else {
          setState(() {
            _productNotFoundExceptionBarcode = barcode;
          });
        }
      }
    });
  }

  double _getQuickFoodAmount(Food food) {
    var amount = 100.0;
    // TODO: Issue #1: After serving sizes have been implemented, default to serving size

    if (food is FoodTracked) {
      amount = food.amount;
    }

    return amount;
  }

  void _quickAddFood(Food food, TrackedFoodProvider trackedFoodProvider) {
    final foodToBeTracked = FoodTracked.fromFood(
      food,
      FoodTracked.generatedId,
      _getQuickFoodAmount(food),
      widget._foodAddingDate,
      DateTime.now(),
    );

    trackedFoodProvider.addEatenFood(foodToBeTracked);
    // Close current ModalBottomSheet
    Navigator.pop(context);
  }

  void _removeDuplicateSuggestions() {
    final customHashCodes =
        searchResultFood.map((f) => f.customHashCode).toSet();
    searchResultFood
        .retainWhere((x) => customHashCodes.remove(x.customHashCode));
  }

  Future<void> _getOpenFoodFactsSearchResultIfActivated(
    String searchText,
  ) async {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    if (appSettings.isProviderOpenFoodFactsActivated) {
      try {
        _offSearchResultFood =
            await OpenFoodFactsBinding().searchFood(searchText);
      } catch (e) {
        setState(() {
          _hasOffBindingError = true;
        });
      }
    } else {
      return;
    }
  }

  Future<void> _getUsdaSearchResultIfActivated(String searchText) async {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    if (appSettings.isProviderUsdaActivated) {
      try {
        _usdaSearchResultFood = await USDABinding.searchFood(searchText);
      } catch (e) {
        setState(() {
          _hasUsdaBindingError = true;
        });
      }
    } else {
      return;
    }
  }

  void populateSearchedFoodList(String searchText, bool debounce) {
    // Method wrapped in debounce so that API calls are triggered after
    // user has finished typing
    if (_searchFieldDebounceTimer?.isActive ?? false) {
      _searchFieldDebounceTimer!.cancel();
    }

    Duration debounceDuration = _defaultInputDebounceDuration;

    if (!debounce) {
      debounceDuration = const Duration(milliseconds: 0);
    }

    _searchFieldDebounceTimer = Timer(debounceDuration, () async {
      final appSettings = Provider.of<AppSettings>(context, listen: false);
      final customFoodProvider =
          Provider.of<CustomFoodProvider>(context, listen: false);

      // Non duplicate list of the food tracked the last X days
      final foodFromLastXDays = List<Food>.of(
        await TrackedFoodDatabaseService.trackedFoodByDateRange(
          startDate: DateTime.now().subtract(
            const Duration(days: _foodInputSuggestionsFromLastXDays),
          ),
          endDate: DateTime.now(),
        ),
      );

      // Initial fill of the suggestions list (and when searched for empty string)
      setState(() {
        // Fill with previously tracked foods, newest first
        searchResultFood = foodFromLastXDays.reversed.toList();

        // Fill with custom foods
        searchResultFood += customFoodProvider.foods;

        // Remove duplicates
        _removeDuplicateSuggestions();

        if (searchText.isNotEmpty) {
          // Fill with foods from (offline) swiss nutrition database
          // only when searched for something
          if (appSettings.isProviderSndbActivated) {
            searchResultFood += foodsFromSndb;
          }

          searchResultFood = searchResultFood
              .where(
                (food) =>
                    food.title.toLowerCase().contains(searchText.toLowerCase()),
              )
              .toList();

          // Remove duplicates again (with added food from SNDB)
          _removeDuplicateSuggestions();
        }
      });

      if ((appSettings.isProviderOpenFoodFactsActivated ||
              appSettings.isProviderUsdaActivated) &&
          !kIsWeb) {
        setState(() {
          _awaitingApiResponse = true;
        });

        await Future.wait([
          _getOpenFoodFactsSearchResultIfActivated(searchText),
          _getUsdaSearchResultIfActivated(searchText),
        ]);

        setState(() {
          if (_offSearchResultFood != null) {
            searchResultFood += _offSearchResultFood!;
          }
          if (_usdaSearchResultFood != null) {
            searchResultFood += _usdaSearchResultFood!;
          }

          _removeDuplicateSuggestions();
          _awaitingApiResponse = false;
        });
      }
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

  /// Resets the SearchBar which searches for food to track.
  ///
  /// Clears the controller, the searched food list and binding errors.
  void _resetFoodSearch() {
    _searchInputController.clear();
    populateSearchedFoodList('', false);

    // Clear binding errors
    setState(() {
      _hasOffBindingError = false;
      _hasUsdaBindingError = false;
    });
  }

  /// Returns whether any of the food database bindings raised errors when searching for food.
  bool get _hasAnyBindingError {
    return _hasOffBindingError || _hasUsdaBindingError;
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

  @override
  Widget build(BuildContext context) {
    if (widget._sheetModalMode == SheetModalMode.search) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SearchBar(
              controller: _searchInputController,
              onChanged: (value) => populateSearchedFoodList(value, true),
              onSubmitted: (value) => populateSearchedFoodList(value, false),
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
                  onPressed: () {
                    _resetFoodSearch();
                  },
                  icon: const Icon(Icons.clear),
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
                              ElevatedButton(
                                onPressed: () =>
                                    _navigateToAddCustomFood(context),
                                child: Text(
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
                    onSubmitted: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _productNotFoundExceptionBarcode = null;
                        });
                      } else {
                        searchBarcodeAndRedirect(
                          _searchBarcodeController.text,
                        );
                      }
                    },
                    keyboardType: TextInputType.number,
                    hintText: AppLocalizations.of(context)!.barcode,
                    leading: const Icon(Icons.search),
                    trailing: [
                      IconButton(
                        onPressed: () {
                          if (_searchBarcodeController.text.isEmpty) {
                            setState(() {
                              _productNotFoundExceptionBarcode = null;
                            });
                          } else {
                            searchBarcodeAndRedirect(
                              _searchBarcodeController.text,
                            );
                          }
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
                          ? Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withAlpha(150),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '$_productNotFoundExceptionBarcode ${AppLocalizations.of(context)!.notFound}',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () => _navigateToAddCustomFood(
                                      context,
                                      barcode:
                                          _productNotFoundExceptionBarcode!,
                                    ),
                                    icon: const Icon(Icons.add),
                                    label: Text(
                                      AppLocalizations.of(context)!
                                          .addCustomFood,
                                    ),
                                  ),
                                ],
                              ),
                            )
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
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
