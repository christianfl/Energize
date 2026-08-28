import 'package:flutter/material.dart';

import '../../../models/food/food_tracked.dart';
import '../../../theme/energize_theme.dart';
import 'macro_nutrients_breakdown.dart';

/// Card-formed item which represents a single tracked food on the TrackingPage
class TrackedFoodListItem extends StatelessWidget {
  static const double height = 58;
  static const double _cardMargin = 4.0;

  final FoodTracked trackedFood;
  final void Function(BuildContext, FoodTracked)? onTapCallback;
  final VoidCallback? onLongPressCallback;
  final bool selected;

  const TrackedFoodListItem(
    this.trackedFood, {
    super.key,
    this.onTapCallback,
    this.onLongPressCallback,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      child: Card(
        margin: const EdgeInsets.all(_cardMargin),
        clipBehavior: Clip.antiAlias,
        color: selected
            ? Theme.of(context).colorScheme.secondaryContainer
            : null,
        child: InkWell(
          onTap: onTapCallback != null
              ? () => onTapCallback!(context, trackedFood)
              : null,
          onLongPress: onLongPressCallback,
          child: Container(
            height: height - 2 * _cardMargin,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                if (selected) ...[
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        trackedFood.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            '${trackedFood.calculatedAmount.toStringAsFixed(0)} g',
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(width: 10),
                          MacroNutrientsBreakdown([trackedFood]),
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
                    '${trackedFood.caloriesPerTrackedAmount.toStringAsFixed(0)} kcal',
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
  }
}
