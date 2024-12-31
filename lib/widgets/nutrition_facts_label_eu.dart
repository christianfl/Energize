import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/food/food_tracked.dart';
import '../providers/app_settings.dart';
import '../theme/energize_theme.dart';
import './chart_bar.dart';

class NutritionFactsLabelEU extends StatelessWidget {
  final List<FoodTracked> foods;

  static const double sodiumToSaltFacor = 2.54;

  const NutritionFactsLabelEU(
    this.foods, {
    super.key,
  });

  double get _totalCalories {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.calories, f.amount));
  }

  double get _amount {
    return foods.fold(0, (sum, f) => sum + f.amount);
  }

  double get _totalFat {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.fat, f.amount));
  }

  double get _totalSaturatedFat {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.saturatedFat, f.amount),
    );
  }

  double get _totalCarbs {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.carbs, f.amount));
  }

  double get _totalSugar {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.sugar, f.amount));
  }

  double get _totalFiber {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.fiber, f.amount));
  }

  double get _totalProtein {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.protein, f.amount));
  }

  double get _totalSalt {
    final double sodium =
        foods.fold(0, (sum, f) => sum + _calcAmount(f.sodium, f.amount));

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

  _getChart(BuildContext context, AppSettings appSettings) {
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
          target: appSettings.caloriesTarget,
          unit: 'kcal',
          color: Theme.of(context).energyContainer,
          maxFractionDigits: 1,
        ),
        const SizedBox(height: 12.0),
        ChartBar(
          title: AppLocalizations.of(context)!.fat,
          value: _totalFat,
          target: appSettings.fatTarget,
          unit: 'g',
          color: Theme.of(context).fatContainer,
          maxFractionDigits: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ChartBar(
            title: AppLocalizations.of(context)!.saturatedFat,
            value: _totalSaturatedFat,
            target: appSettings.saturatedFatTarget,
            unit: 'g',
            color: Theme.of(context).fatContainer,
            maxFractionDigits: 1,
          ),
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.carbs,
          value: _totalCarbs,
          target: appSettings.carbsTarget,
          unit: 'g',
          color: Theme.of(context).carbsContainer,
          maxFractionDigits: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ChartBar(
            title: AppLocalizations.of(context)!.sugar,
            value: _totalSugar,
            target: appSettings.sugarTarget,
            unit: 'g',
            color: Theme.of(context).carbsContainer,
            maxFractionDigits: 1,
          ),
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.fiber,
          value: _totalFiber,
          target: appSettings.fiberTarget,
          unit: 'g',
          color: Theme.of(context).microNutrientsContainer,
          maxFractionDigits: 1,
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.protein,
          value: _totalProtein,
          target: appSettings.proteinTarget,
          unit: 'g',
          color: Theme.of(context).proteinContainer,
          maxFractionDigits: 1,
        ),
        ChartBar(
          title: '${AppLocalizations.of(context)!.salt}*',
          value: _totalSalt,
          target: appSettings.sodiumTarget != 0
              ? appSettings.sodiumTarget / 1000 * sodiumToSaltFacor
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
    final appSettings = Provider.of<AppSettings>(context);

    return _getChart(context, appSettings);
  }
}
