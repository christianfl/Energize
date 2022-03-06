import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../providers/app_settings.dart';
import '../../providers/custom_food_provider.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/tracked_foods_database_service.dart';
import '../../widgets/food_list_item.dart';
import '../models/food.dart';
import '../models/food_tracked.dart';
import '../pages/tab_tracking/track_food_modal.dart';
import '../services/open_food_facts_api_service.dart';

enum SheetModalMode { search, ean }

class FoodInput extends StatefulWidget {
  final DateTime _foodAddingDate;
  final SheetModalMode _sheetModalMode;
  final double _entryPillHeight = 35;
  final double _entryHeight = 50;

  FoodInput(this._foodAddingDate, this._sheetModalMode);

  @override
  _FoodInputState createState() => _FoodInputState();
}

class _FoodInputState extends State<FoodInput>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrController;
  var _searchInputController = TextEditingController();
  Barcode? _scannedCode;
  var _awaitingApiResponse = false;
  String? _productNotFoundExceptionEan;
  final List<Food> foodsFromSndb = Food.foodFromSndb;
  List<Food> searchResultFood = [];
  Timer? _searchFieldDebounceTimer;
  static const Duration _defaultInputDebounceDuration =
      Duration(milliseconds: 500);
  static const _foodInputSuggestionsFromLastXDays = 21;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    populateSearchedFoodList('', false);
  }

  void _navigateToAddFood(BuildContext context, Food foodToBeAdded) {
    Navigator.of(context)
        .pushNamed(
          TrackFood.routeName,
          arguments: ModalArguments(
              foodToBeAdded, ModalMode.add, widget._foodAddingDate),
        )
        .then(
          (shouldClose) => {
            setState(() {
              _scannedCode = null;
              _productNotFoundExceptionEan = null;
            }),
            if (shouldClose == true) Navigator.pop(context),
          },
        );
  }

  void _navigateToAddCustomFood(BuildContext context, {String? ean}) {
    if (ean != null) print(ean);
    // TODO: Issue #6: Use scanned ean code

    Navigator.of(context)
        .pushNamed(
          AddEditCustomFoodModal.routeName,
          arguments: AddEditCustomFoodModalArguments(
              AddEditCustomFoodModalMode.addNew, null),
        )
        .then(
          (value) => {
            print(value),
            Navigator.pop(context),
            // TODO: Issue #6: Get returned created food and_navigateToAddFood!
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

  void _onQRViewCreated(QRViewController controller) {
    this._qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      // Catch multiple scan trials of same code
      if (_scannedCode?.code == scanData.code) return;
      setState(() {
        _scannedCode = scanData;
      });
      if (_scannedCode?.code != null) {
        OpenFoodFactsApiService.getFoodByEan(_scannedCode!.code!).then((food) {
          flashStatus.then((isFlashOn) =>
              {if (isFlashOn != null && isFlashOn == true) _toggleFlash()});

          _navigateToAddFood(context, food);
        }).catchError((error) {
          setState(() {
            _productNotFoundExceptionEan = error.toString();
          });
        });
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

  void populateSearchedFoodList(String searchText, bool debounce) {
    // Method wrapped in debounce so that API calls are triggered after
    // user has finished typing
    if (_searchFieldDebounceTimer?.isActive ?? false) {
      _searchFieldDebounceTimer!.cancel();
    }

    Duration debounceDuration = _defaultInputDebounceDuration;

    if (!debounce) {
      debounceDuration = Duration(milliseconds: 0);
    }

    _searchFieldDebounceTimer = Timer(debounceDuration, () async {
      final appSettings = Provider.of<AppSettings>(context, listen: false);
      final customFoodProvider =
          Provider.of<CustomFoodProvider>(context, listen: false);

      // Non duplicate list of the food tracked the last X days
      var foodFromLastXDays = List<Food>.of(
        await TrackedFoodDatabaseService.trackedFoodByDateRange(
          startDate: DateTime.now()
              .subtract(Duration(days: _foodInputSuggestionsFromLastXDays)),
          endDate: DateTime.now(),
        ),
      );

      // TODO: Issue #9: List.of() is not good here because it does not create a list of food entries but of TrackedFood so that a db exception is thrown when inserting custom food based out of suggested food which was tracked before

      // Initial fill of the suggestions list (and when searched for empty string)
      setState(() {
        // Fill with previously tracked foods, newest first
        searchResultFood = foodFromLastXDays.reversed.toList();

        // Fill with custom foods
        searchResultFood += customFoodProvider.foods;

        // Remove duplicates
        _removeDuplicateSuggestions();

        if (searchText.length != 0) {
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

      // Database: Open Food Facts
      if (appSettings.isProviderOpenFoodFactsActivated) {
        setState(() {
          _awaitingApiResponse = true;
        });

        OpenFoodFactsApiService.searchFood(searchText).then((products) => {
              setState(() {
                if (products != null) searchResultFood += products;
                _awaitingApiResponse = false;

                // Remove duplicates again (with added food from OFF)
                _removeDuplicateSuggestions();
              }),
            });
      }
    });
  }

  Future<void> _toggleFlash() async {
    await _qrController!.toggleFlash();
  }

  Future<bool?> get flashStatus async {
    return await _qrController!.getFlashStatus();
  }

  @override
  void dispose() {
    _qrController?.dispose();
    _searchFieldDebounceTimer?.cancel();
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
                hintText: 'Search for product name or brand',
                prefixIcon: _awaitingApiResponse
                    ? Transform.scale(
                        scale: 0.5,
                        child: CircularProgressIndicator(),
                      )
                    : Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () => {
                    _searchInputController.clear(),
                    populateSearchedFoodList('', false),
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Expanded(
            child: (searchResultFood.length != 0)
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
                        ? CircularProgressIndicator()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.no_food, size: 100),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                  onPressed: () =>
                                      _navigateToAddCustomFood(context),
                                  child: Text('Add custom food')),
                            ],
                          ),
                  ),
          ),
        ],
      );
    } else if (widget._sheetModalMode == SheetModalMode.ean) {
      return Container(
        margin: EdgeInsets.all(12.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.bottomCenter,
                      child: _productNotFoundExceptionEan != null
                          ? Container(
                              decoration: new BoxDecoration(
                                color: Colors.grey.withAlpha(150),
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              padding: EdgeInsets.all(8.0),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        'Sorry! No product found for barcode ${_productNotFoundExceptionEan!}'),
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () => _navigateToAddCustomFood(
                                          context,
                                          ean: _productNotFoundExceptionEan!),
                                      icon: Icon(Icons.add),
                                      label: Text('Add custom food')),
                                ],
                              ))
                          : Container(
                              width: double.infinity,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator()),
                            ),
                    )
                  ],
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: _toggleFlash,
              icon: Icon(Icons.bolt),
              label: Text('Toogle flash'),
            ),
          ],
        ),
      );
    } else
      return Container();
  }
}
