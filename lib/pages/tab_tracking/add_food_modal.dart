import 'package:flutter/material.dart';
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

class AddFood extends StatefulWidget {
  static const routeName = '/tracking/add-food';

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final amountCtrl = TextEditingController();
  final double _thumbnailSize = 100;
  final double _pillHeight = 35;
  var dropdownValue = 'g';

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

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.network(
            imageUrl,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            )
          ],
        );
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

  @override
  Widget build(BuildContext context) {
    final trackedFood = Provider.of<TrackedFoodProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as ModalArguments;
    final food = args.food;
    final modalMode = args.mode;

    return Scaffold(
      appBar: AppBar(
        title: modalMode == ModalMode.add
            ? Text('Add food')
            : Text('Edit tracked food'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 0:
                  {
                    createCustomFoodFromThis(args.food);
                  }
                  break;

                case 1:
                  {
                    _launchOpenFoodFactsUrl(args.food.ean!);
                  }
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Create custom food out of this'),
                value: 0,
              ),
              if (food.origin == 'OFF')
                PopupMenuItem(
                  child: Text('Open or edit on Open Food Facts'),
                  value: 1,
                ),
            ],
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          return true;
        },
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      if (food.imageUrl != null)
                        InkWell(
                          onTap: () =>
                              _showImageDialog(context, food.imageUrl!),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            child: Image.network(
                              food.imageUrl!,
                              width: _thumbnailSize,
                              height: _thumbnailSize,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      else
                        Container(
                          width: _thumbnailSize,
                          height: _thumbnailSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200,
                          ),
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: _thumbnailSize,
                            color: Colors.black,
                          ),
                        ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Container(
                          height: _thumbnailSize,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                food.title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  FoodMicroCountPill(
                                    food.nutrientCount,
                                    height: _pillHeight,
                                    showText: true,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FoodOriginLogoPill(
                                    food.origin,
                                    width: 100,
                                    height: _pillHeight,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Energy and macronutrients',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      MacroChart([_getConvertedFoodForChart(food)]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Available micronutrients',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 14, right: 85),
                child: Container(
                  height: 56,
                  decoration: new BoxDecoration(
                    color: Theme.of(context).highlightColor.withAlpha(220),
                    borderRadius: new BorderRadius.all(Radius.circular(28)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          onEditingComplete: () =>
                              _addOrEditFood(args, trackedFood),
                          onChanged: (value) {
                            // Set state to immediately show chart changes
                            setState(() {});
                          },
                          // autofocus: true,
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
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor.withAlpha(220),
        child: Icon(Icons.save),
        onPressed: () => _addOrEditFood(args, trackedFood),
      ),
    );
  }
}
