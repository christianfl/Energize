import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../providers/app_settings.dart';
import '../../providers/custom_food_provider.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/tracked_foods_database_service.dart';
import '../../widgets/food_list_item.dart';
import '../models/food/food.dart';
import '../models/food/food_tracked.dart';
import '../pages/tab_food/food_page.dart';
import '../pages/tab_tracking/track_food_modal.dart';
import '../services/custom_foods_database_service.dart';
import '../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../services/food_database_bindings/usda/usda_binding.dart';

enum SheetModalMode { search, ean }

class FoodInput extends StatefulWidget {
  final DateTime _foodAddingDate;
  final SheetModalMode _sheetModalMode;
  final double _entryPillHeight = 35;
  final double _entryHeight = 50;

  const FoodInput(
    this._foodAddingDate,
    this._sheetModalMode, {
    Key? key,
  }) : super(key: key);

  @override
  FoodInputState createState() => FoodInputState();
}

class FoodInputState extends State<FoodInput>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _eanCodeFormKey = GlobalKey<FormState>();
  QRViewController? _qrController;
  final _searchInputController = TextEditingController();
  final _searchEanController = TextEditingController();
  Barcode? _scannedCode;
  var _awaitingApiResponse = false;
  String? _productNotFoundExceptionEan;
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    populateSearchedFoodList('', false);
  }

  void _navigateToAddFood(
    BuildContext context,
    Food foodToBeAdded, {
    bool? forcePop,
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
        .then((shouldClose) {
      setState(() {
        _scannedCode = null;
        _productNotFoundExceptionEan = null;
      });
      if (shouldClose == true || forcePop == true) {
        Navigator.of(context).pop();
      }
    });
  }

  void _navigateToAddCustomFood(BuildContext context, {String? ean}) {
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
          ean: ean,
        ),
      ),
    )
        .then(
      (createdFood) {
        if (createdFood is Food) {
          _navigateToAddFood(context, createdFood, forcePop: true);
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

  /// Listen for the scanned stream until an EAN code is found
  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;
    _qrController!.resumeCamera();

    controller.scannedDataStream.listen((scanData) {
      if (_scannedCode == null) {
        _scannedCode = scanData;

        searchEanAndRedirect(_scannedCode!.code!);
      }
    });
  }

  /// Look up ean code and redirect accordingly
  void searchEanAndRedirect(String ean) {
    // Try first to look up the EAN in the custom foods
    CustomFoodDatabaseService.getCustomFoodByEan(ean).then((customFoodIfFound) {
      if (customFoodIfFound != null) {
        // Custom food with this EAN was found

        _navigateToAddFood(context, customFoodIfFound, forcePop: true);
      } else {
        // Look up on Open Food Facts if this is activated
        final appSettings = Provider.of<AppSettings>(context, listen: false);

        if (appSettings.isProviderOpenFoodFactsActivated) {
          OpenFoodFactsBinding.getFoodByEan(ean).then((food) {
            _navigateToAddFood(context, food, forcePop: true);
          }).catchError((error) {
            // If there is also no match, show an error that no product could be found
            setState(() {
              _productNotFoundExceptionEan = '$error';
            });
          });
        } else {
          setState(() {
            _productNotFoundExceptionEan = ean;
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
    var foodToBeTracked = FoodTracked.fromFood(
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
      String searchText) async {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    if (appSettings.isProviderOpenFoodFactsActivated) {
      _offSearchResultFood = await OpenFoodFactsBinding.searchFood(searchText);
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
      var foodFromLastXDays = List<Food>.of(
        await TrackedFoodDatabaseService.trackedFoodByDateRange(
          startDate: DateTime.now().subtract(
              const Duration(days: _foodInputSuggestionsFromLastXDays)),
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
              .where((food) =>
                  food.title.toLowerCase().contains(searchText.toLowerCase()))
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
    bool? flashStatus = await _getFlashStatus;

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
    _searchEanController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._sheetModalMode == SheetModalMode.search) {
      return Column(
        children: [
          Card(
            child: TextField(
              controller: _searchInputController,
              onChanged: (value) => populateSearchedFoodList(value, true),
              onSubmitted: (value) => populateSearchedFoodList(value, false),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    AppLocalizations.of(context)!.searchForProductNameOrBrand,
                prefixIcon: _awaitingApiResponse
                    ? Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator(),
                      )
                    : const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () => {
                    _searchInputController.clear(),
                    populateSearchedFoodList('', false),
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
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
    } else if (widget._sheetModalMode == SheetModalMode.ean) {
      return Container(
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Form(
                      key: _eanCodeFormKey,
                      child: TextFormField(
                        controller: _searchEanController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.fieldMandatory;
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if (_eanCodeFormKey.currentState!.validate()) {
                            searchEanAndRedirect(
                              _searchEanController.text,
                            );
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'EAN',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (_eanCodeFormKey.currentState!.validate()) {
                                searchEanAndRedirect(
                                  _searchEanController.text,
                                );
                              }
                            },
                            icon: const Icon(Icons.check),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IntrinsicHeight(
                  child: Builder(
                    builder: (BuildContext context) {
                      switch (_flashStatus) {
                        case null:
                          // Flash unsupported

                          return OutlinedButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.error),
                            label: Text(
                              AppLocalizations.of(context)!.flashUnsupported,
                            ),
                          );

                        case true:
                          // Offer possibility to turn flash off

                          return OutlinedButton.icon(
                            onPressed: () => _setFlash(false),
                            icon: const Icon(Icons.bolt),
                            label: Text(
                              AppLocalizations.of(context)!.turnFlashOff,
                            ),
                          );

                        case false:
                          // Offer possibility to turn flash on

                          return OutlinedButton.icon(
                            onPressed: () => _setFlash(true),
                            icon: const Icon(Icons.bolt),
                            label:
                                Text(AppLocalizations.of(context)!.turnFlashOn),
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                      child: _productNotFoundExceptionEan != null
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withAlpha(150),
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
                                      '$_productNotFoundExceptionEan ${AppLocalizations.of(context)!.notFound}',
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () => _navigateToAddCustomFood(
                                      context,
                                      ean: _productNotFoundExceptionEan!,
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
                    )
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
