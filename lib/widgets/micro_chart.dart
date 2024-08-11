import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/food/food_tracked.dart';
import '../providers/app_settings.dart';
import '../theme/energize_theme.dart';
import './chart_bar.dart';

class MicroChart extends StatelessWidget {
  final List<FoodTracked> foods;
  final bool showZero;
  final bool scrollable;

  const MicroChart(
    this.foods, {
    super.key,
    required this.showZero,
    required this.scrollable,
  });

  double _totalVitaminA(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminA, f.amount));
  }

  double _totalVitaminB1(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB1, f.amount));
  }

  double _totalVitaminB2(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB2, f.amount));
  }

  double _totalVitaminB3(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB3, f.amount));
  }

  double _totalVitaminB5(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB5, f.amount));
  }

  double _totalVitaminB6(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB6, f.amount));
  }

  double _totalVitaminB7(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB7, f.amount));
  }

  double _totalVitaminB9(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB9, f.amount));
  }

  double _totalVitaminB12(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminB12, f.amount));
  }

  double _totalVitaminC(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminC, f.amount));
  }

  double _totalVitaminD(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminD, f.amount));
  }

  double _totalVitaminE(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminE, f.amount));
  }

  double _totalVitaminK(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.vitaminK, f.amount));
  }

  double _totalCalcium(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.calcium, f.amount));
  }

  double _totalChloride(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.chloride, f.amount));
  }

  double _totalMagnesium(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.magnesium, f.amount));
  }

  double _totalPhosphorus(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.phosphorus, f.amount));
  }

  double _totalPotassium(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.potassium, f.amount));
  }

  double _totalSodium(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.sodium, f.amount));
  }

  double _totalChromium(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.chromium, f.amount));
  }

  double _totalIron(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.iron, f.amount));
  }

  double _totalFluorine(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.fluorine, f.amount));
  }

  double _totalIodine(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.iodine, f.amount));
  }

  double _totalCopper(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.copper, f.amount));
  }

  double _totalManganese(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.manganese, f.amount));
  }

  double _totalMolybdenum(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.molybdenum, f.amount));
  }

  double _totalSelenium(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.selenium, f.amount));
  }

  double _totalZinc(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.zinc, f.amount));
  }

  double _totalMonounsaturatedFat(List<FoodTracked> foods) {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.monounsaturatedFat, f.amount),
    );
  }

  double _totalPolyunsaturatedFat(List<FoodTracked> foods) {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.polyunsaturatedFat, f.amount),
    );
  }

  double _totalOmega3(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.omega3, f.amount));
  }

  double _totalOmega6(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.omega6, f.amount));
  }

  double _totalSaturatedFat(List<FoodTracked> foods) {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.saturatedFat, f.amount),
    );
  }

  double _totalTransFat(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.transFat, f.amount));
  }

  double _totalCholesterol(List<FoodTracked> foods) {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.cholesterol, f.amount),
    );
  }

  double _totalFiber(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.fiber, f.amount));
  }

  double _totalSugar(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.sugar, f.amount));
  }

  double _totalSugarAlcohol(List<FoodTracked> foods) {
    return foods.fold(
      0,
      (sum, f) => sum + _calcAmount(f.sugarAlcohol, f.amount),
    );
  }

  double _totalStarch(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.starch, f.amount));
  }

  double _totalWater(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.water, f.amount));
  }

  double _totalCaffeine(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.caffeine, f.amount));
  }

  double _totalAlcohol(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.alcohol, f.amount));
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
    final microNutrientsContainerColor =
        Theme.of(context).microNutrientsContainer;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              AppLocalizations.of(context)!.vitamins,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        if (showZero || (!showZero && _totalVitaminA(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminA,
            value: _totalVitaminA(foods),
            target: appSettings.vitaminATarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB1(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB1,
            value: _totalVitaminB1(foods),
            target: appSettings.vitaminB1Target,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB2(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB2,
            value: _totalVitaminB2(foods),
            target: appSettings.vitaminB2Target,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB3(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB3,
            value: _totalVitaminB3(foods),
            target: appSettings.vitaminB3Target,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB5(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB5,
            value: _totalVitaminB5(foods),
            target: appSettings.vitaminB5Target,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB6(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB6,
            value: _totalVitaminB6(foods),
            target: appSettings.vitaminB6Target,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB7(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB7,
            value: _totalVitaminB7(foods),
            target: appSettings.vitaminB7Target,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminB9(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB9,
            value: _totalVitaminB9(foods),
            target: appSettings.vitaminB9Target,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminB12(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminB12,
            value: _totalVitaminB12(foods),
            target: appSettings.vitaminB12Target,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminC(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminC,
            value: _totalVitaminC(foods),
            target: appSettings.vitaminCTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminD(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminD,
            value: _totalVitaminD(foods),
            target: appSettings.vitaminDTarget,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminE(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminE,
            value: _totalVitaminE(foods),
            target: appSettings.vitaminETarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminK(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.vitaminK,
            value: _totalVitaminK(foods),
            target: appSettings.vitaminKTarget,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              AppLocalizations.of(context)!.minerals,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              AppLocalizations.of(context)!.majorMinerals,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        if (showZero || (!showZero && _totalCalcium(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.calcium,
            value: _totalCalcium(foods),
            target: appSettings.calciumTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalChloride(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.chloride,
            value: _totalChloride(foods),
            target: appSettings.chlorideTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalMagnesium(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.magnesium,
            value: _totalMagnesium(foods),
            target: appSettings.magnesiumTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalPhosphorus(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.phosphorous,
            value: _totalPhosphorus(foods),
            target: appSettings.phosphorusTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalPotassium(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.potassium,
            value: _totalPotassium(foods),
            target: appSettings.potassiumTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalSodium(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.sodium,
            value: _totalSodium(foods),
            target: appSettings.sodiumTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              AppLocalizations.of(context)!.traceElements,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        if (showZero || (!showZero && _totalChromium(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.chromium,
            value: _totalChromium(foods),
            target: appSettings.chromiumTarget,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalIron(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.iron,
            value: _totalIron(foods),
            target: appSettings.ironTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalFluorine(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.fluorine,
            value: _totalFluorine(foods),
            target: appSettings.fluorineTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalIodine(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.iodine,
            value: _totalIodine(foods),
            target: appSettings.iodineTarget,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalCopper(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.copper,
            value: _totalCopper(foods),
            target: appSettings.copperTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalManganese(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.manganese,
            value: _totalManganese(foods),
            target: appSettings.manganeseTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalMolybdenum(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.molybdenum,
            value: _totalMolybdenum(foods),
            target: appSettings.molybdenumTarget,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalSelenium(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.selenium,
            value: _totalSelenium(foods),
            target: appSettings.seleniumTarget,
            color: microNutrientsContainerColor,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalZinc(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.zinc,
            value: _totalZinc(foods),
            target: appSettings.zincTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              AppLocalizations.of(context)!.fats,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        if (showZero || (!showZero && _totalMonounsaturatedFat(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.monounsaturatedFat,
            value: _totalMonounsaturatedFat(foods),
            target: appSettings.monounsaturatedFatTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalPolyunsaturatedFat(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.polyunsaturatedFat,
            value: _totalPolyunsaturatedFat(foods),
            target: appSettings.polyunsaturatedFatTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalOmega3(foods) != 0))
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ChartBar(
              title: AppLocalizations.of(context)!.omega3,
              value: _totalOmega3(foods),
              target: appSettings.omega3Target,
              color: microNutrientsContainerColor,
              unit: 'g',
            ),
          ),
        if (showZero || (!showZero && _totalOmega6(foods) != 0))
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ChartBar(
              title: AppLocalizations.of(context)!.omega6,
              value: _totalOmega6(foods),
              target: appSettings.omega6Target,
              color: microNutrientsContainerColor,
              unit: 'g',
            ),
          ),
        if (showZero || (!showZero && _totalSaturatedFat(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.saturatedFat,
            value: _totalSaturatedFat(foods),
            target: appSettings.saturatedFatTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalTransFat(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.transfat,
            value: _totalTransFat(foods),
            target: appSettings.transFatTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalCholesterol(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.cholesterol,
            value: _totalCholesterol(foods),
            target: appSettings.cholesterolTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              AppLocalizations.of(context)!.carbs,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        if (showZero || (!showZero && _totalFiber(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.fiber,
            value: _totalFiber(foods),
            target: appSettings.fiberTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalSugar(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.sugar,
            value: _totalSugar(foods),
            target: appSettings.sugarTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalSugarAlcohol(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.sugarAlcohol,
            value: _totalSugarAlcohol(foods),
            target: appSettings.sugarAlcoholTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalStarch(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.starch,
            value: _totalStarch(foods),
            target: appSettings.starchTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              AppLocalizations.of(context)!.other,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        if (showZero || (!showZero && _totalWater(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.water,
            value: _totalWater(foods),
            target: appSettings.waterTarget,
            color: microNutrientsContainerColor,
            unit: 'ml',
          ),
        if (showZero || (!showZero && _totalCaffeine(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.caffeine,
            value: _totalCaffeine(foods),
            target: appSettings.caffeineTarget,
            color: microNutrientsContainerColor,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalAlcohol(foods) != 0))
          ChartBar(
            title: AppLocalizations.of(context)!.alcohol,
            value: _totalAlcohol(foods),
            target: appSettings.alcoholTarget,
            color: microNutrientsContainerColor,
            unit: 'g',
          ),
      ],
    );
  }
}
