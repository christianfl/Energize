import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/food/food.dart';
import '../../models/food/food_tracked.dart';
import '../../pages/tab_food/add_edit_custom_food_modal.dart';
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

      return returnValue;
    } else {
      final parsedAmount = double.tryParse(amount);
      return parsedAmount ?? 0.0;
    }
  }

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
      );

      trackedFoodProvider.addEatenFood(foodToAdd);
    } else if (args.mode == ModalMode.edit) {
      // We are in edit mode, so we can safely assume args.food is a FoodTracked
      trackedFoodProvider.editEatenFood(
        food: args.food as FoodTracked,
        amount: amount,
        dateEaten: _foodTrackDate,
      );
    }
    // Pop page and tell that the previous page should stay open
    Navigator.pop(context, true);
  }

  double _getAmount(Food food) {
    if (food is FoodTracked) {
      return food.amount;
    }
    // TODO: Issue #1: After serving sizes have been implemented, default to serving size
    return 100.0;
  }

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

  void _launchOpenFoodFactsUrl(String ean) async {
    final uri = Uri.parse('${OpenFoodFactsBinding.productUrl}$ean');
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch url';
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

  TextField _getAmountInput({
    VoidCallback? onEditingComplete,
    required Food food,
  }) {
    return TextField(
      onEditingComplete: onEditingComplete,
      expands: true,
      maxLines: null,
      onChanged: (_) {
        // Set state to immediately show chart changes
        setState(() {});
      },
      textAlignVertical: TextAlignVertical.center,
      controller: _amountCtrl,
      focusNode: _amountCtrlFocusNode,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.edit),
        hintText: _getAmount(food).toString(),
        filled: true,
        suffixText: 'g',
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
                const SizedBox(width: _fabPadding),
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
