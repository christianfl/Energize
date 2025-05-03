import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/food/food.dart';
import '../../models/food/food_tracked.dart';
import '../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../providers/app_settings_provider.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../../theme/energize_theme.dart';
import '../../utils/date_util.dart';
import '../../utils/time_util.dart';
import '../../widgets/food_micro_count_pill.dart';
import '../../widgets/food_origin_logo_pill.dart';
import '../../widgets/keyboard_margin.dart';
import '../../widgets/macro_chart.dart';
import '../../widgets/micro_chart.dart';
import '../../widgets/moving_end_contained_fab_location.dart';
import '../../widgets/nutrition_facts_label_eu.dart';
import 'tracking_page.dart';

enum ModalMode { add, edit }

const double _fabSize = 56.0;
const double _fabPadding = 16.0;

class ModalArguments {
  Food food;
  final ModalMode mode;
  final DateTime? foodAddingDate;

  ModalArguments(this.food, this.mode, [this.foodAddingDate]);
}

/// This page can be opened in two modes: 1) Add new food 2) Edit tracked food
class TrackFood extends StatefulWidget {
  static const routeName = '/tracking/add-food';

  static const _foodAvatarRadius = 48.0;

  const TrackFood({super.key});

  @override
  TrackFoodState createState() => TrackFoodState();
}

class TrackFoodState extends State<TrackFood>
    with SingleTickerProviderStateMixin {
  final _amountCtrl = TextEditingController();
  final double _pillHeight = 35;
  String? _selectedServingSize;

  late TabController _tabController;

  /// UI-reflected adding date.
  /// Gets initialized and is used for setting the new desired value
  /// Is non-null after first call of didChangeDependencies
  DateTime? _foodTrackDate;
  final _amountCtrlFocusNode = FocusNode();

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Get the Food or FoodTracked
    final args = ModalRoute.of(context)!.settings.arguments as ModalArguments;
    final food = args.food;

    if (_foodTrackDate == null) {
      // _foodTrackDate is initialized only once, so this can be used
      // to also initialize the _selectedServingSize so that is does not
      // change during every new build

      if (food is FoodTracked) {
        if (food.selectedServingSize != null) {
          _selectedServingSize = food.selectedServingSize;
        }

        // Initialize _amountCtrl.text with food.amount value
        _amountCtrl.text = _doubleToCleanString(food.amount);
      } else {
        if (_selectedServingSize == null &&
            food.servingSizes?.isNotEmpty == true) {
          // The food has at least one serving size

          try {
            final appSettings =
                Provider.of<AppSettingsProvider>(context, listen: false);
            final isServingSizePreferred = appSettings.isServingSizePreferred;

            if (isServingSizePreferred) {
              // Serving has the highest priority, default to that.
              // If that is not present, use the first key
              _selectedServingSize = food.servingSizes!.keys.firstWhere(
                (keyName) => keyName == 'l10nServing',
                orElse: () => food.servingSizes!.keys.first,
              );

              // Set amount to 1 as this should be the desired behavior for serving sizes
              _amountCtrl.text = '1';
            } else {
              // User does not want to use serving sizes, don't change anything
            }
          } catch (e) {
            if (kDebugMode) {
              debugPrint('Error processing serving size selection: $e');
            }
          }
        }
      }
    }

    if (args.mode == ModalMode.edit) {
      // Editing previous tracked food

      // Initialize _foodTrackDate once, otherwise it would get overwritten
      _foodTrackDate ??= (food as FoodTracked).dateEaten;
    } else if (args.foodAddingDate != null) {
      // Tracking a new item with given date
      _foodTrackDate ??= args.foodAddingDate!;
    } else {
      // Fallback, should not be reached
      _foodTrackDate ??= DateTime.now();
    }

    super.didChangeDependencies();
  }

  /// Returns a String from a double without fractional ".0".
  String _doubleToCleanString(double double) {
    return (double % 1 == 0) ? double.toInt().toString() : double.toString();
  }

  /// Returns [_amountCtrl] text parsed as double.
  ///
  /// Supports substraction calculations.
  double _getParsedAmount(Food food) {
    final String amount = _amountCtrl.text.replaceAll(',', '.');

    if (amount.contains('-')) {
      // Substract the substrings
      final splittedAmount = amount.split('-');

      final firstValue = double.tryParse(splittedAmount[0]);
      if (firstValue == null) {
        return _getAmount(food);
      }

      double returnValue = firstValue;

      for (int i = 1; i < splittedAmount.length; i++) {
        final value = double.tryParse(splittedAmount[i]);
        if (value != null) {
          returnValue -= value;
        }
      }

      // Ensure no negative values are allowed
      returnValue = returnValue > 0 ? returnValue : 0;

      return returnValue;
    } else {
      final parsedAmount = double.tryParse(amount);
      return parsedAmount ?? 0;
    }
  }

  /// Persists the new Food or the changes on the existing Food.
  ///
  /// Also closes the current page.
  void _addOrEditFood(
    ModalArguments args,
    TrackedFoodProvider trackedFoodProvider,
  ) {
    double amount;

    if (_amountCtrl.text != '') {
      amount = _getParsedAmount(args.food);
    } else {
      amount = _getAmount(args.food);
    }

    if (args.mode == ModalMode.add) {
      final DateTime dateAdded = DateTime.now();
      final String id = FoodTracked.generatedId;
      final FoodTracked foodToAdd = FoodTracked.fromFood(
        args.food,
        id,
        amount,
        _foodTrackDate!,
        dateAdded,
        selectedServingSize: _selectedServingSize,
      );

      trackedFoodProvider.addTrackedFood(foodToAdd);
    } else if (args.mode == ModalMode.edit) {
      // We are in edit mode, so we can safely assume args.food is a FoodTracked

      trackedFoodProvider.editTrackedFood(
        food: (args.food as FoodTracked),
        amount: amount,
        dateEaten: _foodTrackDate,
        selectedServingSize: _selectedServingSize,
      );
    }
    // Pop page and tell that the previous page should stay open
    Navigator.pop(context, true);
  }

  /// Returns the suggested amount for the Food to track.
  ///
  /// Used e.g. if the amount input is empty.
  ///
  /// For previously tracked Food:
  /// - if selected serving size matches with tracked food: previous amount
  /// - if a new serving size was selected: 1 (serving)
  ///
  /// For new Food:
  /// - if serving size selected: 1 (serving)
  /// - if no serving size selected: 100 (g)
  double _getAmount(Food food) {
    if (food is FoodTracked) {
      if (_selectedServingSize == null) {
        // g is now selected

        if (food.selectedServingSize != null) {
          // Food was previously tracked with a serving size
          return 100; // (g)
        } else {
          // Food was previously tracked with g
          // Use the same amount (in g as previously tracked
          return food.amount;
        }
      } else {
        // A serving size was selected

        if (_selectedServingSize == food.selectedServingSize) {
          // Use the same amount as previously tracked for serving sizes
          // only if the selected serving size matches with the tracked one
          return food.amount;
        } else {
          // A new serving size was selected. Return default amount: 1 (serving)
          return 1;
        }
      }
    }

    // Food was not tracked previously
    // Default to: 1 serving or 100 g
    return _selectedServingSize != null ? 1 : 100;
  }

  /// Returns a temporary [FoodTracked] which is just used to be passed to the chart.
  ///
  /// This ensures the chart shows values for the current Food amount.
  FoodTracked _getConvertedFoodForChart(Food food) {
    double amount;

    if (_amountCtrl.text != '') {
      amount = _getParsedAmount(food);
    } else {
      amount = _getAmount(food);
    }

    final DateTime tempDate = DateTime.now();
    return FoodTracked.fromFood(
      food,
      'TEMP_FOR_CHART',
      amount,
      tempDate,
      tempDate,
      selectedServingSize: _selectedServingSize,
    );
  }

  void createCustomFoodFromThis(Food food) {
    Navigator.of(context)
        .pushNamed(
          AddEditCustomFoodModal.routeName,
          arguments: AddEditCustomFoodModalArguments(
            AddEditCustomFoodModalMode.addFrom,
            Food.fromJson(
              food.toJson(),
            ),
          ),
        )
        .then(
          (value) => {
            setState(() {
              final args =
                  ModalRoute.of(context)!.settings.arguments as ModalArguments;
              args.food = value as Food;
            }),
          },
        );
  }

  Future<void> _openFoodTrackedInfoDialog(Food food) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.additionalInformation),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  isThreeLine: true,
                  title: Text(
                    AppLocalizations.of(context)!.completeProductName,
                  ),
                  subtitle: Text(food.title),
                ),
                if (food is FoodTracked)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.addedDate),
                        subtitle: Text(
                          '${DateUtil.getDate(food.dateAdded, context)} @ ${TimeUtil.getTime(food.dateAdded, context)}',
                        ),
                      ),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.consumedDate),
                        subtitle: Text(
                          '${DateUtil.getDate(food.dateEaten, context)} @ ${TimeUtil.getTime(food.dateEaten, context)}',
                        ),
                      ),
                      if (food.ean != null)
                        if (food.ean!.isNotEmpty)
                          ListTile(
                            title: Text(AppLocalizations.of(context)!.barcode),
                            subtitle: Text(food.ean!),
                          ),
                    ],
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _launchOpenFoodFactsUrl(String ean) {
    final uri = Uri.parse('${OpenFoodFactsBinding.productUrl}$ean');

    try {
      launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Could not launch url: $e');
      }
    }
  }

  Widget _getActions(Food food, ModalMode modalMode) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case 0:
            {
              createCustomFoodFromThis(food);
            }
            break;
          case 1:
            {
              _openFoodTrackedInfoDialog(food);
            }
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Text(AppLocalizations.of(context)!.useAsTemplateForCustomFood),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(AppLocalizations.of(context)!.additionalInformation),
        ),
      ],
    );
  }

  String _getPageTitle(ModalMode modalMode) {
    if (modalMode == ModalMode.add) {
      return AppLocalizations.of(context)!.trackFood;
    } else if (modalMode == ModalMode.edit) {
      return AppLocalizations.of(context)!.editTrackedFood;
    } else {
      return '';
    }
  }

  void _selectTrackedTime() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (selectedTime != null) {
      setState(() {
        _foodTrackDate = _foodTrackDate!.copyWith(
          hour: selectedTime.hour,
          minute: selectedTime.minute,
        );
      });
    }
  }

  /// Manipulates the amount TextField when the serving size is changed.
  void _onServingSizeChanged(
    String? newKey,
    Map<String, double>? servingSizes,
  ) {
    if (!((newKey == _selectedServingSize) ||
        (_selectedServingSize == null && newKey == 'g'))) {
      // Only for changes of the current value
      setState(() {
        if (newKey == 'g') {
          _selectedServingSize = null;
          _amountCtrl.text = '100'; // Reset input for g
        } else if (servingSizes?.containsKey(newKey) == true) {
          _selectedServingSize = newKey;
          _amountCtrl.text = '1'; // Default to 1 serving
        }
      });
    }
  }

  /// Returns the amount TextField and serving size Dropdown.
  Widget _getAmountInput({
    VoidCallback? onEditingComplete,
    required Food food,
  }) {
    final servingSizes = food.servingSizes;

    // Serving sizes
    final servingSizeKeys = servingSizes?.keys.toList() ?? [];

    // Combine both lists but keep them conceptually separate
    final dropdownOptions = [
      'g',
      ...servingSizeKeys,
    ];

    return Row(
      children: [
        SizedBox(
          width: 65,
          child: _amountTextField(onEditingComplete, food),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: DropdownMenu<String>(
            enabled: servingSizeKeys.isNotEmpty,
            initialSelection: _selectedServingSize ?? 'g',
            onSelected: (newKey) => _onServingSizeChanged(newKey, servingSizes),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              isDense: true,
              suffixIconConstraints: BoxConstraints(maxWidth: 0, minHeight: 48),
            ),
            trailingIcon: Container(),
            selectedTrailingIcon: Container(),
            dropdownMenuEntries: dropdownOptions.map((key) {
              final amountInGPerServingSize = key == 'g'
                  ? '' // Don't show "(x g)" for units
                  : ' (${servingSizes![key]!.toStringAsFixed(0)} g)';

              return DropdownMenuEntry(
                value: key,
                label:
                    '${Food.getLocalizedServingSizeName(context, key)}$amountInGPerServingSize',
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// TextField which lets the user view and update the food amount.
  TextField _amountTextField(VoidCallback? onEditingComplete, Food food) {
    return TextField(
      key: const Key('amountInputTextField'),
      onEditingComplete: onEditingComplete,
      expands: true,
      maxLines: null,
      onChanged: (_) {
        setState(() {}); // Update UI when user types
      },
      onTap: () {
        // Select whole input
        _amountCtrl.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _amountCtrl.value.text.length,
        );
      },
      textAlignVertical: TextAlignVertical.center,
      controller: _amountCtrl,
      focusNode: _amountCtrlFocusNode,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: _doubleToCleanString(_getAmount(food)),
        filled: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trackedFood = Provider.of<TrackedFoodProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as ModalArguments;
    final food = args.food;
    final modalMode = args.mode;

    return Scaffold(
      appBar: AppBar(
        title: Text(_getPageTitle(modalMode), overflow: TextOverflow.ellipsis),
        actions: [_getActions(food, modalMode)],
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.surfaceContainer,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
              child: Row(
                children: [
                  (food.imageUrl != null)
                      ? CircleAvatar(
                          radius: TrackFood._foodAvatarRadius,
                          foregroundImage: NetworkImage(
                            food.imageUrl!,
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor:
                              Theme.of(context).noPictureBackground,
                          radius: TrackFood._foodAvatarRadius,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: TrackFood._foodAvatarRadius * 1.8,
                            color: Theme.of(context).onNoPictureBackground,
                          ),
                        ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            food.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FoodMicroCountPill(
                                food.nutrientCount,
                                height: _pillHeight,
                                showText: true,
                              ),
                              const SizedBox(width: 10),
                              FoodOriginLogoPill(
                                food.origin,
                                height: _pillHeight,
                                isConstrained: false,
                                onTapCallback: food.origin ==
                                        OpenFoodFactsBinding.originName
                                    ? () => _launchOpenFoodFactsUrl(food.ean!)
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: [
              // Change length of TabController in initState() when adding tabs
              Tab(
                icon: const Icon(Icons.public),
                text: AppLocalizations.of(context)!.labelingEu,
              ),
              Tab(
                icon: const Icon(Icons.info),
                text: AppLocalizations.of(context)!.general,
              ),
              Tab(
                icon: const Icon(Icons.biotech),
                text: AppLocalizations.of(context)!.micronutrients,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                NutritionFactsLabelEU([_getConvertedFoodForChart(food)]),
                MacroChart(
                  [_getConvertedFoodForChart(food)],
                  hideCard: true,
                  fractionDigits: 1,
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: MicroChart(
                    [_getConvertedFoodForChart(food)],
                    showZero: false,
                    scrollable: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: KeyboardMargin(
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(right: _fabSize + _fabPadding),
            child: Row(
              children: [
                Expanded(
                  child: _getAmountInput(
                    onEditingComplete: () => _addOrEditFood(args, trackedFood),
                    food: food,
                  ),
                ),
                const SizedBox(width: 4.0),
                TextButton.icon(
                  icon: const Icon(Icons.schedule),
                  onPressed: () => _selectTrackedTime(),
                  label: Text(
                    TimeUtil.getTime(_foodTrackDate!, context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: const MovingEndContainedFabLocation(),
      floatingActionButton: FloatingActionButton(
        heroTag: trackingFabTag,
        child: const Icon(Icons.save),
        onPressed: () => _addOrEditFood(args, trackedFood),
      ),
    );
  }
}
