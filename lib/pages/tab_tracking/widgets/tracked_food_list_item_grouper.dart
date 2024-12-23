import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/food/food_tracked.dart';
import '../../../theme/energize_theme.dart';
import '../../../utils/time_util.dart';
import 'macro_nutrients_breakdown.dart';

/// Acts as a summary/divider to group meals on the TrackingPage.
///
/// A user needs to activate grouping in the settings for this to get shown.
class TrackedFoodListItemGrouper extends StatelessWidget {
  final List<FoodTracked> trackedFoodGroup;

  const TrackedFoodListItemGrouper(
    this.trackedFoodGroup, {
    super.key,
  });

  /// Returns when a meal was consumed.
  ///
  /// Equals the date when the earliest item of [trackedFoodGroup] was consumed.
  DateTime get _mealDate {
    DateTime firstEatenFromList = trackedFoodGroup[0].dateEaten;

    for (final foodTracked in trackedFoodGroup) {
      if (foodTracked.dateEaten.isBefore(firstEatenFromList)) {
        firstEatenFromList = foodTracked.dateEaten;
      }
    }

    return firstEatenFromList;
  }

  /// Returns the total caloriesPerAmount of all elements in [trackedFoodGroup]
  double get _caloriesTotal {
    return trackedFoodGroup.fold(
      0,
      (previousValue, element) => previousValue + element.caloriesPerAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(
        color: Theme.of(context).decentHighlightColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.mealAt(
                TimeUtil.getTime(_mealDate, context),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MacroNutrientsBreakdown(
                trackedFoodGroup,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${_caloriesTotal.toStringAsFixed(0)} kcal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).extraHighlightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
