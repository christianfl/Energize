import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../providers/tracked_food_provider.dart';
import '../../../models/food/food_tracked.dart';
import '../../../providers/app_settings.dart';
import '../../../theme/energize_theme.dart';
import '../track_food_modal.dart';
import 'tracked_food_list_item.dart';
import 'tracked_food_list_item_grouper.dart';

/// List which contains tracked food for the current selected day.
///
/// Can also contain [TrackedFoodListItemGrouper] if a user activated grouping.
class TrackedFoodList extends StatelessWidget {
  final ScrollController _scrollController;
  final Function _setIsFabExplicitelyVisible;

  const TrackedFoodList(
    this._scrollController,
    this._setIsFabExplicitelyVisible, {
    super.key,
  });

  /// Wraps a [TrackedFoodListItem] in a [Dismissible].
  ///
  /// Deletes the item on swipe.
  ///
  /// onTapCallback: [_navigateToEditFood].
  Widget _foodItemDismissibleWrapper(
    AppSettings appSettings,
    FoodTracked foodTracked,
    BuildContext context,
    TrackedFoodProvider trackedFood, {
    bool? partOfGroup,
  }) {
    return Dismissible(
      key: Key(foodTracked.id),
      background: Container(
        color: Theme.of(context).dangerContainer,
        child: Icon(
          Icons.delete,
          color: Theme.of(context).onDangerContainer,
        ),
      ),
      onDismissed: (direction) {
        final swipedFood = foodTracked;
        trackedFood.removeEatenFood(foodTracked.id);
        _setIsFabExplicitelyVisible(true);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${foodTracked.title} ${AppLocalizations.of(context)!.deleted}',
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
      child: Stack(
        children: [
          if (partOfGroup == true && appSettings.isMealGroupingActivated)
            Container(
              color: Theme.of(context).decentHighlightColor,
              width: 4,
              height: TrackedFoodListItem.height,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TrackedFoodListItem(
              foodTracked,
              onTapCallback: _navigateToEditFood,
            ),
          ),
        ],
      ),
    );
  }

  /// Groups tracked foods into sublists by dateEaten within the given [range].
  List<List<FoodTracked>> _groupFoodTrackedByDateEaten(
    List<FoodTracked> trackedFoods,
    Duration range,
  ) {
    // Sort trackedFood by dateEaten and then dateAdded descending
    trackedFoods.sort((a, b) {
      // Sort by dateEaten descending
      final sortByDateEaten = b.dateEaten.compareTo(a.dateEaten);

      // If dateEaten are different, sort only by dateEaten
      if (sortByDateEaten != 0) {
        return sortByDateEaten;
      }

      // If dateEaten are the same, sort by dateAdded as next attribute
      return b.dateAdded.compareTo(a.dateAdded);
    });

    // Prepare variables needed for grouping
    final List<List<FoodTracked>> groupedItems = [];
    List<FoodTracked> currentGroup = [];
    DateTime? anchorTime;

    for (final trackedFood in trackedFoods) {
      if (currentGroup.isEmpty) {
        // Start a new group
        currentGroup.add(trackedFood);
        anchorTime = trackedFood.dateEaten;
      } else {
        // Calculate the time difference between the item and the anchor
        final timeDifference =
            trackedFood.dateEaten.difference(anchorTime!).abs();

        if (timeDifference <= range) {
          // Add to the current group
          currentGroup.add(trackedFood);

          // Update the anchor to maintain the earliest time in the group
          anchorTime = currentGroup
              .map((e) => e.dateEaten)
              .reduce((a, b) => a.isBefore(b) ? a : b);
        } else {
          // Save the current group
          groupedItems.add(List.from(currentGroup));

          // Start a new group
          currentGroup = [trackedFood];
          anchorTime = trackedFood.dateEaten;
        }
      }
    }

    // Add the last item
    groupedItems.add(
      currentGroup,
    );

    return groupedItems;
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);
    final trackedFood = Provider.of<TrackedFoodProvider>(context);
    final foods = trackedFood.foods;
    final List<List<FoodTracked>> groupedFoods = _groupFoodTrackedByDateEaten(
      foods,
      const Duration(minutes: 2),
    );

    return Expanded(
      child: foods.isEmpty
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.no_food, size: 100),
              ],
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              controller: _scrollController,
              itemBuilder: (ctx, index) {
                int currentItemIndex = 0;

                for (var foods in groupedFoods) {
                  // Apply grouping only if user activated it in settings
                  if (appSettings.isMealGroupingActivated) {
                    if (foods.length > 1) {
                      // Show grouper only if group contains more than one item
                      if (currentItemIndex == index) {
                        return TrackedFoodListItemGrouper(foods);
                      }
                      currentItemIndex++;
                    }
                  }

                  // Single food entry
                  for (var food in foods) {
                    if (currentItemIndex == index) {
                      return _foodItemDismissibleWrapper(
                        appSettings,
                        food,
                        context,
                        trackedFood,
                        partOfGroup: foods.length > 1 ? true : false,
                      );
                    }
                    currentItemIndex++;
                  }
                }

                return null;
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
