import 'package:flutter/material.dart';

import '../../../models/food/food_tracked.dart';
import '../../../theme/energize_theme.dart';
import 'macro_nutrients_breakdown.dart';

/// Card-formed item which represents a single tracked food on the TrackingPage
class TrackedFoodListItem extends StatelessWidget {
  static const double height = 58;
  static const double _cardMargin = 4.0;

  final FoodTracked trackedFood;
  final Function? onTapCallback;

  const TrackedFoodListItem(
    this.trackedFood, {
    super.key,
    this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(_cardMargin),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTapCallback != null
            ? () => onTapCallback!(context, trackedFood)
            : null,
        child: Container(
          height: height - 2 * _cardMargin,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
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
                          '${trackedFood.amount.toStringAsFixed(0)} g',
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
                  '${trackedFood.caloriesPerAmount.toStringAsFixed(0)} kcal',
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
    );
  }
}
