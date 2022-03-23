import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/food.dart';
import '../../models/food_tracked.dart';
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

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
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
              AddEditCustomFoodModalMode.addFrom, food),
        )
        .then(
          (value) => {
            setState(() {
              final args =
                  ModalRoute.of(context)!.settings.arguments as ModalArguments;
              args.food = value as Food;

              // TODO: Issue #8: Bug, when adding a custom food out of some existing and then going back to the food input, the value/names of the existing one are changing
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

  bool get _isAppBarCollapsed {
    final double maxHeaderHeight = _expandedHeight - kToolbarHeight;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;

      if (offset < maxHeaderHeight) {
        // Not collapsed, starts with offset = 0 which gets bigger by scrolling
      } else {
        // Fully collapsed
        return true;
      }
    }

    return false;
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
        color: Theme.of(context).highlightColor.withAlpha(220),
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
                items: <String>['g', 'serving (60 g)']
                    .map<DropdownMenuItem<String>>((String value) {
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
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  expandedHeight: _expandedHeight,
                  floating: false,
                  pinned: true,
                  actions: [_getActions(food)],
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return FlexibleSpaceBar(
                      title: Text(
                        _getPageTitle(modalMode),
                        overflow:
                            _isAppBarCollapsed ? TextOverflow.ellipsis : null,
                      ),
                      background: food.imageUrl != null
                          ? Image.network(
                              food.imageUrl!,
                              color: Colors.transparent.withOpacity(0.2),
                              colorBlendMode: BlendMode.luminosity,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/placeholder.png',
                              color: Colors.transparent.withOpacity(0.2),
                              colorBlendMode: BlendMode.luminosity,
                              fit: BoxFit.cover,
                            ),
                    );
                  }),
                ),
              ),
            )
          ];
        },
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, false);
            return true;
          },
          child: Stack(
            children: [
              Column(
                children: [
                  TabBar(controller: _tabController, tabs: [
                    Tab(
                      icon: const Icon(Icons.info),
                      text: AppLocalizations.of(context)!.general,
                    ),
                    Tab(
                      icon: const Icon(Icons.biotech),
                      text: AppLocalizations.of(context)!.micronutrients,
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
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
                                          ? () =>
                                              _launchOpenFoodFactsUrl(food.ean!)
                                          : null,
                                      child: FoodOriginLogoPill(
                                        food.origin,
                                        width: 100,
                                        height: _pillHeight,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                MacroChart([_getConvertedFoodForChart(food)]),
                              ],
                            ),
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
                      ].map((tab) => tab).toList(),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 14, bottom: 14, right: 85),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(220),
        child: Icon(Icons.save),
        onPressed: () => _addOrEditFood(args, trackedFood),
      ),
    );
  }
}
