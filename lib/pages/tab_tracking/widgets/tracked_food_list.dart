import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../providers/tracked_food_provider.dart';
import '../../../models/food/food_tracked.dart';
import '../../../theme/energize_theme.dart';
import '../track_food_modal.dart';
import 'tracked_food_list_item.dart';

class TrackedFoodList extends StatelessWidget {
  final ScrollController _scrollController;
  final Function _setIsFabExplicitelyVisible;

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
              itemCount: foods.length + 2,
              controller: _scrollController,
              itemBuilder: (ctx, index) {
                // Padding on top of the list
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  );
                } else if (index <= foods.length) {
                  final food = foods[index - 1];

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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TrackedFoodListItem(
                        food,
                        onTapCallback: _navigateToEditFood,
                      ),
                    ),
                  );
                } else {
                  // Padding on bottom of the list
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                  );
                }
              },
            ),
    );
  }

  void _navigateToEditFood(BuildContext context, FoodTracked foodToBeAdded) {
    Navigator.of(context).pushNamed(
      TrackFood.routeName,
      arguments: ModalArguments(foodToBeAdded, ModalMode.edit),
    );
  }
}
