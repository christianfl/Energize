import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/food/food_tracked.dart';
import '../../../theme/energize_theme.dart';

/// Small breakdown of combined macros of [trackedFood].
class MacroNutrientsBreakdown extends StatelessWidget {
  final List<FoodTracked> trackedFood;

  const MacroNutrientsBreakdown(
    this.trackedFood, {
    super.key,
  });

  /// Returns the total proteinPerAmount of all elements in [trackedFood]
  double get _totalProteinPerAmount {
    return trackedFood.fold(
      0,
      (previousValue, element) => previousValue + element.proteinPerAmount,
    );
  }

  /// Returns the total carbsPerAmount of all elements in [trackedFood]
  double get _totalCarbsPerAmount {
    return trackedFood.fold(
      0,
      (previousValue, element) => previousValue + element.carbsPerAmount,
    );
  }

  /// Returns the total fatPerAmount of all elements in [trackedFood]
  double get _totalFatPerAmount {
    return trackedFood.fold(
      0,
      (previousValue, element) => previousValue + element.fatPerAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(
          '[${AppLocalizations.of(context)!.protein.substring(0, 1)} ${_totalProteinPerAmount.toStringAsFixed(0)}]',
          style: TextStyle(
            color: Theme.of(context).proteinContainer,
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),
        ),
        Text(
          '[${AppLocalizations.of(context)!.carbs.substring(0, 1)} ${_totalCarbsPerAmount.toStringAsFixed(0)}]',
          style: TextStyle(
            color: Theme.of(context).carbsContainer,
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),
        ),
        Text(
          '[${AppLocalizations.of(context)!.fat.substring(0, 1)} ${_totalFatPerAmount.toStringAsFixed(0)}]',
          style: TextStyle(
            color: Theme.of(context).fatContainer,
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
