import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/food/food.dart';
import '../../models/food/food_tracked.dart';
import '../../pages/tab_food/add_edit_custom_food_modal.dart';
import '../../providers/tracked_food_provider.dart';
import '../../widgets/food_micro_count_pill.dart';
import '../../widgets/food_origin_logo_pill.dart';
import '../../widgets/macro_chart.dart';
import '../../widgets/micro_chart.dart';

enum ModalMode { add, edit }

class ModalArguments {
  Food food;
  final ModalMode mode;
  final DateTime? foodAddingDate;

  ModalArguments(this.food, this.mode, [this.foodAddingDate]);
}

class TrackFood extends StatefulWidget {
  static const routeName = '/tracking/add-food';

  static const _foodAvatarRadius = 48.0;

  @override
  _TrackFoodState createState() => _TrackFoodState();
}

class _TrackFoodState extends State<TrackFood>
    with SingleTickerProviderStateMixin {
  final amountCtrl = TextEditingController();
  final double _pillHeight = 35;
  var dropdownValue = 'g';
  final _scrollController = ScrollController();
  final _expandedHeight = 240.0;
  late TabController _tabController;
  final _amountCtrlFocusNode = FocusNode();

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    _amountCtrlFocusNode.addListener(() {
      print('bla');
      final double maxHeaderHeight = _expandedHeight - kToolbarHeight;
      _scrollController.animateTo(maxHeaderHeight,
          duration: Duration(seconds: 1), curve: Curves.bounceIn);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // final args = ModalRoute.of(context)!.settings.arguments as ModalArguments;
    // final food = args.food;
    // print(food);
    super.didChangeDependencies();
  }

  void _addOrEditFood(
      ModalArguments args, TrackedFoodProvider trackedFoodProvider) {
    double amount;

    if (amountCtrl.text != '') {
      amount = double.parse(amountCtrl.text);
    } else {
      amount = _getAmount(args.food);
    }

    if (args.mode == ModalMode.add) {
      DateTime dateAdded = DateTime.now();
      String id = FoodTracked.generatedId;
      FoodTracked foodToAdd = FoodTracked.fromFood(
          args.food, id, amount, args.foodAddingDate!, dateAdded);

      trackedFoodProvider.addEatenFood(foodToAdd);
    } else if (args.mode == ModalMode.edit) {
      // We are in edit mode, so we can safely assume args.food is a FoodTracked
      trackedFoodProvider.editEatenFood(
          food: args.food as FoodTracked, amount: amount);
    }
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

    if (amountCtrl.text != '') {
      amount = double.parse(amountCtrl.text);
    } else {
      amount = _getAmount(food);
    }

    DateTime tempDate = DateTime.now();
    return FoodTracked.fromFood(
        food, "TEMP_FOR_CHART", amount, tempDate, tempDate);
  }

  void createCustomFoodFromThis(Food food) {
    Navigator.of(context)
        .pushNamed(
          AddEditCustomFoodModal.routeName,
          arguments: AddEditCustomFoodModalArguments(
              AddEditCustomFoodModalMode.addFrom, Food.fromJson(food.toJson())),
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

  void _launchOpenFoodFactsUrl(String ean) async {
    var url = '${Food.openFoodFactsProductUrl}$ean';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch url';
    }
  }

  Widget _getActions(Food food) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case 0:
            {
              createCustomFoodFromThis(food);
            }
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text(AppLocalizations.of(context)!.useAsTemplateForCustomFood),
          value: 0,
        ),
      ],
    );
  }

  String _getPageTitle(ModalMode modalMode) {
    if (modalMode == ModalMode.add) {
      return AppLocalizations.of(context)!.trackFood;
    } else if (modalMode == ModalMode.edit) {
      return AppLocalizations.of(context)!.editTrackedFood;
    } else
      return '';
  }

  Widget _getAmountInput(
    ModalArguments args,
    TrackedFoodProvider trackedFood,
    Food food,
  ) {
    return Container(
      height: 56,
      decoration: new BoxDecoration(
        color: Colors.black45,
        borderRadius: new BorderRadius.all(Radius.circular(28)),
      ),
      child: Row(
        children: [
          Container(
            width: 140,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              onEditingComplete: () => _addOrEditFood(args, trackedFood),
              onChanged: (value) {
                // Set state to immediately show chart changes
                setState(() {});
              },
              controller: amountCtrl,
              focusNode: _amountCtrlFocusNode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit),
                hintText: _getAmount(food).toString(),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 50,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items:
                    <String>['g'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
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
        actions: [_getActions(food)],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          return true;
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black26,
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
                          backgroundColor: Colors.black,
                          radius: TrackFood._foodAvatarRadius,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: TrackFood._foodAvatarRadius * 1.8,
                            color: Colors.white,
                          ),
                        ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            FoodMicroCountPill(
                              food.nutrientCount,
                              height: _pillHeight,
                              showText: true,
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: food.origin == 'OFF'
                                  ? () => _launchOpenFoodFactsUrl(food.ean!)
                                  : null,
                              child: FoodOriginLogoPill(
                                food.origin,
                                width: 100,
                                height: _pillHeight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: [
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
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: MacroChart(
                      [_getConvertedFoodForChart(food)],
                      hideCard: true,
                    ),
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
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 85, 14),
                child: _getAmountInput(
                  args,
                  trackedFood,
                  food,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(220),
        child: Icon(Icons.save),
        onPressed: () => _addOrEditFood(args, trackedFood),
      ),
    );
  }
}
