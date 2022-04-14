import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import './chart_bar.dart';
import '../models/food/food_tracked.dart';
import '../providers/app_settings.dart';

class MacroChart extends StatelessWidget {
  final List<FoodTracked> foods;

  MacroChart(this.foods);

  double get _totalCalories {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.calories, f.amount));
  }

  double get _totalProtein {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.protein, f.amount));
  }

  double get _totalCarbs {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.carbs, f.amount));
  }

  double get _totalFat {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.fat, f.amount));
  }

  double _calcAmount(double? property, double foodAmount) {
    if (property != null) {
      if (property > 0) {
        return property / 100 * foodAmount;
      }
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);
    return Container(
      width: double.infinity,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            ChartBar(
              title: AppLocalizations.of(context)!.energy,
              value: _totalCalories,
              target: appSettings.caloriesTarget,
              unit: 'kcal',
              decimalPlaces: 0,
            ),
            ChartBar(
              title: AppLocalizations.of(context)!.protein,
              value: _totalProtein,
              target: appSettings.proteinTarget,
              unit: 'g',
              decimalPlaces: 0,
            ),
            ChartBar(
              title: AppLocalizations.of(context)!.carbs,
              value: _totalCarbs,
              target: appSettings.carbsTarget,
              unit: 'g',
              decimalPlaces: 0,
            ),
            ChartBar(
              title: AppLocalizations.of(context)!.fat,
              value: _totalFat,
              target: appSettings.fatTarget,
              unit: 'g',
              decimalPlaces: 0,
            ),
          ]),
        ),
      ),
    );
  }
}
