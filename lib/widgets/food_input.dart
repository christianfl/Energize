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
import '../../widgets/food_list_item.dart';
import '../models/food/food.dart';
import '../models/food/food_tracked.dart';
import '../pages/tab_food/food_page.dart';
import '../pages/tab_tracking/track_food_modal.dart';
import '../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../services/food_database_bindings/usda/usda_binding.dart';
import '../services/sqlite/custom_foods_database_service.dart';

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
  final _barcodeFormKey = GlobalKey<FormState>();
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
      _offSearchResultFood =
          await OpenFoodFactsBinding().searchFood(searchText);
    } else {
      return;
    }
  }

  Future<void> _getUsdaSearchResultIfActivated(String searchText) async {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    if (appSettings.isProviderUsdaActivated) {
      _usdaSearchResultFood = await USDABinding.searchFood(searchText);
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
                IconButton(
                  onPressed: () => {
                    _searchInputController.clear(),
                    populateSearchedFoodList('', false),
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
                  child: Form(
                    key: _barcodeFormKey,
                    child: TextFormField(
                      controller: _searchBarcodeController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.fieldMandatory;
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        if (_barcodeFormKey.currentState!.validate()) {
                          searchBarcodeAndRedirect(
                            _searchBarcodeController.text,
                          );
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: AppLocalizations.of(context)!.barcode,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_barcodeFormKey.currentState!.validate()) {
                              searchBarcodeAndRedirect(
                                _searchBarcodeController.text,
                              );
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Builder(
                  builder: (BuildContext context) {
                    switch (_flashStatus) {
                      case null:
                        // Flash unsupported

                        return const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.bolt,
                          ),
                        );

                      case true:
                        // Offer possibility to turn flash off

                        return IconButton(
                          isSelected: true,
                          onPressed: () => _setFlash(false),
                          icon: const Icon(
                            Icons.bolt,
                          ),
                        );

                      case false:
                        // Offer possibility to turn flash on

                        return IconButton(
                          isSelected: false,
                          onPressed: () => _setFlash(true),
                          icon: const Icon(
                            Icons.bolt,
                          ),
                        );
                    }
                  },
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
