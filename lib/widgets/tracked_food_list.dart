import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/tab_tracking/track_food_modal.dart';
import '../../providers/tracked_food_provider.dart';
import '../models/food_tracked.dart';

class TrackedFoodList extends StatelessWidget {
  final ScrollController _scrollController;
  final Function _setIsFabExplicitelyVisible;
  final double _entryHeight = 50;

  TrackedFoodList(this._scrollController, this._setIsFabExplicitelyVisible);

  double _caloriesPerAmount(FoodTracked food) {
    if (food.calories != null) {
      return food.calories! / 100 * food.amount;
    } else
      return 0;
  }

  void _navigateToEditFood(BuildContext context, FoodTracked foodToBeAdded) {
    Navigator.of(context).pushNamed(
      TrackFood.routeName,
      arguments: ModalArguments(foodToBeAdded, ModalMode.edit),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trackedFood = Provider.of<TrackedFoodProvider>(context);
    final foods = trackedFood.foods;
    foods.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));

    return Expanded(
      child: foods.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.no_food, size: 100),
              ],
            )
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              controller: _scrollController,
              itemBuilder: (ctx, index) {
                final food = foods[index];
                return Dismissible(
                  key: Key(food.id),
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                    ),
                  ),
                  onDismissed: (direction) {
                    final swipedFood = food;
                    trackedFood.removeEatenFood(food.id);
                    _setIsFabExplicitelyVisible(true);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).errorColor,
                        content: Text('${food.title} deleted!'),
                        action: SnackBarAction(
                          label: "Undo",
                          textColor: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            trackedFood.addEatenFood(swipedFood);
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: InkWell(
                      onTap: () => {
                        _navigateToEditFood(context, food),
                      },
                      child: Container(
                        height: _entryHeight,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    food.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${food.amount} g',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).highlightColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Text(
                                '${_caloriesPerAmount(food).toStringAsFixed(0)} kcal',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Theme.of(context).highlightColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: foods.length,
            ),
    );
  }
}
