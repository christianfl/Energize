import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/food/food_tracked.dart';
import '../providers/body_targets_provider.dart';
import '../theme/energize_theme.dart';
import './chart_bar.dart';

class NutritionFactsLabelEU extends StatelessWidget {
  final List<FoodTracked> foods;

  static const double sodiumToSaltFacor = 2.54;

  const NutritionFactsLabelEU(this.foods, {super.key});

  double get _totalCalories {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.calories, f.calculatedAmount),
    );
  }

  double get _amount {
    return foods.fold(0, (sum, f) => sum + f.calculatedAmount);
  }

  double get _totalFat {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.fat, f.calculatedAmount),
    );
  }

  double get _totalSaturatedFat {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.saturatedFat, f.calculatedAmount),
    );
  }

  double get _totalCarbs {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.carbs, f.calculatedAmount),
    );
  }

  double get _totalSugar {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.sugar, f.calculatedAmount),
    );
  }

  double get _totalFiber {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.fiber, f.calculatedAmount),
    );
  }

  double get _totalProtein {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.protein, f.calculatedAmount),
    );
  }

  double get _totalSalt {
    final double sodium = foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.sodium, f.calculatedAmount),
    );

    if (sodium == 0) {
      return 0;
    }

    final double salt = sodium / 1000 * sodiumToSaltFacor;

    return salt;
  }

  double _calcAmount(double? property, double foodAmount) {
    if (property != null) {
      if (property > 0) {
        return property / 100 * foodAmount;
      }
    }

    return 0;
  }

  ListView _getChart(BuildContext context, BodyTargetsProvider bodyTargets) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      children: [
        Text(
          '${AppLocalizations.of(context)!.amountContain('${_amount.toStringAsFixed(0)} g')} / ${AppLocalizations.of(context)!.dailyTarget}',
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: 20),
        ChartBar(
          title: AppLocalizations.of(context)!.energy,
          value: _totalCalories,
          target: bodyTargets.caloriesTarget,
          unit: 'kcal',
          color: Theme.of(context).energyContainer,
          maxFractionDigits: 1,
        ),
        const SizedBox(height: 12.0),
        ChartBar(
          title: AppLocalizations.of(context)!.fat,
          value: _totalFat,
          target: bodyTargets.fatTarget,
          unit: 'g',
          color: Theme.of(context).fatContainer,
          maxFractionDigits: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ChartBar(
            title: AppLocalizations.of(context)!.saturatedFat,
            value: _totalSaturatedFat,
            target: bodyTargets.saturatedFatTarget,
            unit: 'g',
            color: Theme.of(context).fatContainer,
            maxFractionDigits: 1,
          ),
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.carbs,
          value: _totalCarbs,
          target: bodyTargets.carbsTarget,
          unit: 'g',
          color: Theme.of(context).carbsContainer,
          maxFractionDigits: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ChartBar(
            title: AppLocalizations.of(context)!.sugar,
            value: _totalSugar,
            target: bodyTargets.sugarTarget,
            unit: 'g',
            color: Theme.of(context).carbsContainer,
            maxFractionDigits: 1,
          ),
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.fiber,
          value: _totalFiber,
          target: bodyTargets.fiberTarget,
          unit: 'g',
          color: Theme.of(context).microNutrientsContainer,
          maxFractionDigits: 1,
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.protein,
          value: _totalProtein,
          target: bodyTargets.proteinTarget,
          unit: 'g',
          color: Theme.of(context).proteinContainer,
          maxFractionDigits: 1,
        ),
        ChartBar(
          title: '${AppLocalizations.of(context)!.salt}*',
          value: _totalSalt,
          target: bodyTargets.sodiumTarget != 0
              ? bodyTargets.sodiumTarget / 1000 * sodiumToSaltFacor
              : 0,
          unit: 'g',
          color: Theme.of(context).microNutrientsContainer,
          maxFractionDigits: 1,
        ),
        const SizedBox(height: 10),
        Text(
          '* ${AppLocalizations.of(context)!.sodium} × ${NumberFormat.decimalPattern(Localizations.localeOf(context).languageCode).format(sodiumToSaltFacor)}',
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodyTargets = Provider.of<BodyTargetsProvider>(context);

    return _getChart(context, bodyTargets);
  }
}
