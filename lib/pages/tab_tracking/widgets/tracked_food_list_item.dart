import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/food/food_tracked.dart';
import '../../../theme/energize_theme.dart';

/// Card-formed item which represents a single tracked food on the TrackingPage
class TrackedFoodListItem extends StatelessWidget {
  static const double _height = 50;

  final FoodTracked trackedFood;
  final Function? onTapCallback;

  const TrackedFoodListItem(
    this.trackedFood, {
    super.key,
    this.onTapCallback,
  });

  double _caloriesPerAmount(FoodTracked food) {
    if (food.calories != null) {
      return food.calories! / 100 * food.amount;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTapCallback != null
            ? () => onTapCallback!(context, trackedFood)
            : null,
        child: Container(
          height: _height,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: <Widget>[
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
                        Text(
                          '[${AppLocalizations.of(context)!.protein.substring(0, 1)} ${trackedFood.proteinPerAmount.toStringAsFixed(0)}]',
                          style: TextStyle(
                            color: Theme.of(context).proteinContainer,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '[${AppLocalizations.of(context)!.carbs.substring(0, 1)} ${trackedFood.carbsPerAmount.toStringAsFixed(0)}]',
                          style: TextStyle(
                            color: Theme.of(context).carbsContainer,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '[${AppLocalizations.of(context)!.fat.substring(0, 1)} ${trackedFood.fatPerAmount.toStringAsFixed(0)}]',
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
                  '${_caloriesPerAmount(trackedFood).toStringAsFixed(0)} kcal',
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
