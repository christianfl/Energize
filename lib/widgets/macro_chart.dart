import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/food/food_tracked.dart';
import '../providers/body_targets_provider.dart';
import '../theme/energize_theme.dart';
import './chart_bar.dart';

class MacroChart extends StatelessWidget {
  final List<FoodTracked> foods;
  final bool? hideCard;
  final int? fractionDigits;
  final double padding;

  const MacroChart(
    this.foods, {
    super.key,
    this.hideCard,
    this.fractionDigits = 0,
    this.padding = 16.0,
  });

  double get _totalCalories {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.calories, f.calculatedAmount),
    );
  }

  double get _totalProtein {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.protein, f.calculatedAmount),
    );
  }

  double get _totalCarbs {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.carbs, f.calculatedAmount),
    );
  }

  double get _totalFat {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.fat, f.calculatedAmount),
    );
  }

  double _calcAmount(double? property, double foodAmount) {
    if (property != null) {
      if (property > 0) {
        return property / 100 * foodAmount;
      }
    }

    return 0;
  }

  _getChart(BuildContext context, BodyTargetsProvider bodyTargets) {
    return ListView(
      padding: EdgeInsets.all(padding),
      shrinkWrap: true,
      children: [
        ChartBar(
          title: AppLocalizations.of(context)!.energy,
          value: _totalCalories,
          target: bodyTargets.caloriesTarget,
          unit: 'kcal',
          color: Theme.of(context).energyContainer,
          maxFractionDigits: fractionDigits,
        ),
        const SizedBox(height: 12.0),
        ChartBar(
          title: AppLocalizations.of(context)!.protein,
          value: _totalProtein,
          target: bodyTargets.proteinTarget,
          unit: 'g',
          color: Theme.of(context).proteinContainer,
          maxFractionDigits: fractionDigits,
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.carbs,
          value: _totalCarbs,
          target: bodyTargets.carbsTarget,
          unit: 'g',
          color: Theme.of(context).carbsContainer,
          maxFractionDigits: fractionDigits,
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.fat,
          value: _totalFat,
          target: bodyTargets.fatTarget,
          unit: 'g',
          color: Theme.of(context).fatContainer,
          maxFractionDigits: fractionDigits,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodyTargets = Provider.of<BodyTargetsProvider>(context);

    if (hideCard == true) {
      return _getChart(context, bodyTargets);
    } else {
      return Card(
        child: _getChart(context, bodyTargets),
      );
    }
  }
}
