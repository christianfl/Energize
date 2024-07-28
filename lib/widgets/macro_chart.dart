import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import './chart_bar.dart';
import '../models/food/food_tracked.dart';
import '../providers/app_settings.dart';

class MacroChart extends StatelessWidget {
  final List<FoodTracked> foods;
  final bool? hideCard;
  final int? decimalPlaces;
  final double padding;
  final Function(BuildContext, String)? onChartBarTap;

  const MacroChart(
    this.foods, {
    super.key,
    this.hideCard,
    this.decimalPlaces = 0,
    this.padding = 16.0,
    this.onChartBarTap,
  });

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

  _getChart(BuildContext context, AppSettings appSettings) {
    return ListView(
      padding: EdgeInsets.all(padding),
      shrinkWrap: true,
      children: [
        ChartBar(
          title: AppLocalizations.of(context)!.energy,
          value: _totalCalories,
          target: appSettings.caloriesTarget,
          unit: 'kcal',
          color: Colors.yellow,
          decimalPlaces: decimalPlaces,
          onTap: onChartBarTap,
        ),
        const SizedBox(height: 12.0),
        ChartBar(
          title: AppLocalizations.of(context)!.protein,
          value: _totalProtein,
          target: appSettings.proteinTarget,
          unit: 'g',
          color: Colors.green,
          decimalPlaces: decimalPlaces,
          onTap: onChartBarTap,
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.carbs,
          value: _totalCarbs,
          target: appSettings.carbsTarget,
          unit: 'g',
          color: Colors.blue,
          decimalPlaces: decimalPlaces,
          onTap: onChartBarTap,
        ),
        ChartBar(
          title: AppLocalizations.of(context)!.fat,
          value: _totalFat,
          target: appSettings.fatTarget,
          unit: 'g',
          color: Colors.red,
          decimalPlaces: decimalPlaces,
          onTap: onChartBarTap,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    if (hideCard == true) {
      return _getChart(context, appSettings);
    } else {
      return Card(
        child: _getChart(context, appSettings),
      );
    }
  }
}
