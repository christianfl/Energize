import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/tracked_food_provider.dart';
import '../models/food/food_tracked.dart';
import '../pages/tab_tracking/track_food_modal.dart';

class TrackedFoodList extends StatelessWidget {
  final ScrollController _scrollController;
  final Function _setIsFabExplicitelyVisible;
  final double _entryHeight = 50;

  const TrackedFoodList(
      this._scrollController, this._setIsFabExplicitelyVisible,
      {super.key});

  double _caloriesPerAmount(FoodTracked food) {
    if (food.calories != null) {
      return food.calories! / 100 * food.amount;
    } else {
      return 0;
    }
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
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.no_food, size: 100),
              ],
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              controller: _scrollController,
              itemBuilder: (ctx, index) {
                final food = foods[index];
                return Dismissible(
                  key: Key(food.id),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                    ),
                  ),
                  onDismissed: (direction) {
                    final swipedFood = food;
                    trackedFood.removeEatenFood(food.id);
                    _setIsFabExplicitelyVisible(true);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        content: Text(
                            '${food.title} ${AppLocalizations.of(context)!.deleted}'),
                        action: SnackBarAction(
                          label: AppLocalizations.of(context)!.undo,
                          textColor: Theme.of(context).colorScheme.onSecondary,
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
                        margin: const EdgeInsets.only(left: 10, right: 10),
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
                                  Row(
                                    children: [
                                      Text(
                                        '${food.amount} g',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '[${AppLocalizations.of(context)!.protein.substring(0, 1)} ${food.proteinPerAmount.toStringAsFixed(0)}]',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '[${AppLocalizations.of(context)!.carbs.substring(0, 1)} ${food.carbsPerAmount.toStringAsFixed(0)}]',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '[${AppLocalizations.of(context)!.fat.substring(0, 1)} ${food.fatPerAmount.toStringAsFixed(0)}]',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
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
                              padding: const EdgeInsets.all(4),
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
