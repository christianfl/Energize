import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../providers/tracked_food_provider.dart';
import '../../../models/food/food_tracked.dart';
import '../../../theme/energize_theme.dart';
import '../track_food_modal.dart';

class TrackedFoodList extends StatelessWidget {
  final ScrollController _scrollController;
  final Function _setIsFabExplicitelyVisible;
  final double _entryHeight = 50;

  const TrackedFoodList(
    this._scrollController,
    this._setIsFabExplicitelyVisible, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final trackedFood = Provider.of<TrackedFoodProvider>(context);
    final foods = trackedFood.foods;

    // Sort trackedFood in the UI, so it gets updated on each build
    foods.sort((a, b) => b.dateEaten.compareTo(a.dateEaten));

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
                    color: Theme.of(context).dangerContainer,
                    child: Icon(
                      Icons.delete,
                      color: Theme.of(context).onDangerContainer,
                    ),
                  ),
                  onDismissed: (direction) {
                    final swipedFood = food;
                    trackedFood.removeEatenFood(food.id);
                    _setIsFabExplicitelyVisible(true);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${food.title} ${AppLocalizations.of(context)!.deleted}',
                        ),
                        action: SnackBarAction(
                          label: AppLocalizations.of(context)!.undo,
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${food.amount.toStringAsFixed(0)} g',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '[${AppLocalizations.of(context)!.protein.substring(0, 1)} ${food.proteinPerAmount.toStringAsFixed(0)}]',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .proteinContainer,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '[${AppLocalizations.of(context)!.carbs.substring(0, 1)} ${food.carbsPerAmount.toStringAsFixed(0)}]',
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).carbsContainer,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '[${AppLocalizations.of(context)!.fat.substring(0, 1)} ${food.fatPerAmount.toStringAsFixed(0)}]',
                                        style: TextStyle(
                                          color: Theme.of(context).fatContainer,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).extraHighlightColor,
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
                                  color: Theme.of(context).extraHighlightColor,
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
}
