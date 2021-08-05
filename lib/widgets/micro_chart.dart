import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './chart_bar.dart';
import '../models/food_tracked.dart';
import '../providers/app_settings.dart';

class MicroChart extends StatelessWidget {
  final List<FoodTracked> foods;
  final bool showZero;
  final bool scrollable;

  MicroChart(
    this.foods, {
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
        0, (sum, f) => sum + _calcAmount(f.monounsaturatedFat, f.amount));
  }

  double _totalPolyunsaturatedFat(List<FoodTracked> foods) {
    return foods.fold(
        0, (sum, f) => sum + _calcAmount(f.polyunsaturatedFat, f.amount));
  }

  double _totalOmega3(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.omega3, f.amount));
  }

  double _totalOmega6(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.omega6, f.amount));
  }

  double _totalSaturatedFat(List<FoodTracked> foods) {
    return foods.fold(
        0, (sum, f) => sum + _calcAmount(f.saturatedFat, f.amount));
  }

  double _totalTransFat(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.transFat, f.amount));
  }

  double _totalCholesterol(List<FoodTracked> foods) {
    return foods.fold(
        0, (sum, f) => sum + _calcAmount(f.cholesterol, f.amount));
  }

  double _totalFiber(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.fiber, f.amount));
  }

  double _totalSugar(List<FoodTracked> foods) {
    return foods.fold(0, (sum, f) => sum + _calcAmount(f.sugar, f.amount));
  }

  double _totalSugarAlcohol(List<FoodTracked> foods) {
    return foods.fold(
        0, (sum, f) => sum + _calcAmount(f.sugarAlcohol, f.amount));
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: Issue #10: For adding a new food there should be a difference for null values (because the count of micros differs from the shown micro charts)
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Vitamins',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (showZero || (!showZero && _totalVitaminA(foods) != 0))
          ChartBar(
            title: 'Vitamin A',
            value: _totalVitaminA(foods),
            target: appSettings.vitaminATarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB1(foods) != 0))
          ChartBar(
            title: 'Vitamin B1',
            value: _totalVitaminB1(foods),
            target: appSettings.vitaminB1Target,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB2(foods) != 0))
          ChartBar(
            title: 'Vitamin B2',
            value: _totalVitaminB2(foods),
            target: appSettings.vitaminB2Target,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB3(foods) != 0))
          ChartBar(
            title: 'Vitamin B3',
            value: _totalVitaminB3(foods),
            target: appSettings.vitaminB3Target,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB5(foods) != 0))
          ChartBar(
            title: 'Vitamin B5',
            value: _totalVitaminB5(foods),
            target: appSettings.vitaminB5Target,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB6(foods) != 0))
          ChartBar(
            title: 'Vitamin B6',
            value: _totalVitaminB6(foods),
            target: appSettings.vitaminB6Target,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminB7(foods) != 0))
          ChartBar(
            title: 'Vitamin B7',
            value: _totalVitaminB7(foods),
            target: appSettings.vitaminB7Target,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminB9(foods) != 0))
          ChartBar(
            title: 'Vitamin B9',
            value: _totalVitaminB9(foods),
            target: appSettings.vitaminB9Target,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminB12(foods) != 0))
          ChartBar(
            title: 'Vitamin B12',
            value: _totalVitaminB12(foods),
            target: appSettings.vitaminB12Target,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminC(foods) != 0))
          ChartBar(
            title: 'Vitamin C',
            value: _totalVitaminC(foods),
            target: appSettings.vitaminCTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminD(foods) != 0))
          ChartBar(
            title: 'Vitamin D',
            value: _totalVitaminD(foods),
            target: appSettings.vitaminDTarget,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalVitaminE(foods) != 0))
          ChartBar(
            title: 'Vitamin E',
            value: _totalVitaminE(foods),
            target: appSettings.vitaminETarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalVitaminK(foods) != 0))
          ChartBar(
            title: 'Vitamin K',
            value: _totalVitaminK(foods),
            target: appSettings.vitaminKTarget,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              'Minerals',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (showZero || (!showZero && _totalCalcium(foods) != 0))
          ChartBar(
            title: 'Calcium',
            value: _totalCalcium(foods),
            target: appSettings.calciumTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalChloride(foods) != 0))
          ChartBar(
            title: 'Chloride',
            value: _totalChloride(foods),
            target: appSettings.chlorideTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalMagnesium(foods) != 0))
          ChartBar(
            title: 'Magnesium',
            value: _totalMagnesium(foods),
            target: appSettings.magnesiumTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalPhosphorus(foods) != 0))
          ChartBar(
            title: 'Phosphorous',
            value: _totalPhosphorus(foods),
            target: appSettings.phosphorusTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalPotassium(foods) != 0))
          ChartBar(
            title: 'Potassium',
            value: _totalPotassium(foods),
            target: appSettings.potassiumTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalSodium(foods) != 0))
          ChartBar(
            title: 'Sodium',
            value: _totalSodium(foods),
            target: appSettings.sodiumTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalChromium(foods) != 0))
          ChartBar(
            title: 'Chromium',
            value: _totalChromium(foods),
            target: appSettings.chromiumTarget,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalIron(foods) != 0))
          ChartBar(
            title: 'Iron',
            value: _totalIron(foods),
            target: appSettings.ironTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalFluorine(foods) != 0))
          ChartBar(
            title: 'Fluorine',
            value: _totalFluorine(foods),
            target: appSettings.fluorineTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalIodine(foods) != 0))
          ChartBar(
            title: 'Iodine',
            value: _totalIodine(foods),
            target: appSettings.iodineTarget,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalCopper(foods) != 0))
          ChartBar(
            title: 'Copper',
            value: _totalCopper(foods),
            target: appSettings.copperTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalManganese(foods) != 0))
          ChartBar(
            title: 'Manganese',
            value: _totalManganese(foods),
            target: appSettings.manganeseTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalMolybdenum(foods) != 0))
          ChartBar(
            title: 'Molybdenum',
            value: _totalMolybdenum(foods),
            target: appSettings.molybdenumTarget,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalSelenium(foods) != 0))
          ChartBar(
            title: 'Selenium',
            value: _totalSelenium(foods),
            target: appSettings.seleniumTarget,
            color: Colors.blue,
            unit: 'μg',
          ),
        if (showZero || (!showZero && _totalZinc(foods) != 0))
          ChartBar(
            title: 'Zinc',
            value: _totalZinc(foods),
            target: appSettings.zincTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              'Fats',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (showZero || (!showZero && _totalMonounsaturatedFat(foods) != 0))
          ChartBar(
            title: 'Monounsaturated Fat',
            value: _totalMonounsaturatedFat(foods),
            target: appSettings.monounsaturatedFatTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalPolyunsaturatedFat(foods) != 0))
          ChartBar(
            title: 'Polyunsaturated Fat',
            value: _totalPolyunsaturatedFat(foods),
            target: appSettings.polyunsaturatedFatTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalOmega3(foods) != 0))
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ChartBar(
              title: 'Omega 3',
              value: _totalOmega3(foods),
              target: appSettings.omega3Target,
              color: Colors.blue,
              unit: 'g',
            ),
          ),
        if (showZero || (!showZero && _totalOmega6(foods) != 0))
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ChartBar(
              title: 'Omega 6',
              value: _totalOmega6(foods),
              target: appSettings.omega6Target,
              color: Colors.blue,
              unit: 'g',
            ),
          ),
        if (showZero || (!showZero && _totalSaturatedFat(foods) != 0))
          ChartBar(
            title: 'Saturated Fat',
            value: _totalSaturatedFat(foods),
            target: appSettings.saturatedFatTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalTransFat(foods) != 0))
          ChartBar(
            title: 'Transfat',
            value: _totalTransFat(foods),
            target: appSettings.transFatTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalCholesterol(foods) != 0))
          ChartBar(
            title: 'Cholesterol',
            value: _totalCholesterol(foods),
            target: appSettings.cholesterolTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              'Carbs',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (showZero || (!showZero && _totalFiber(foods) != 0))
          ChartBar(
            title: 'Fiber',
            value: _totalFiber(foods),
            target: appSettings.fiberTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalSugar(foods) != 0))
          ChartBar(
            title: 'Sugar',
            value: _totalSugar(foods),
            target: appSettings.sugarTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalSugarAlcohol(foods) != 0))
          ChartBar(
            title: 'Sugar Alcohol',
            value: _totalSugarAlcohol(foods),
            target: appSettings.sugarAlcoholTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero || (!showZero && _totalStarch(foods) != 0))
          ChartBar(
            title: 'Starch',
            value: _totalStarch(foods),
            target: appSettings.starchTarget,
            color: Colors.blue,
            unit: 'g',
          ),
        if (showZero)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              'Other',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (showZero || (!showZero && _totalWater(foods) != 0))
          ChartBar(
            title: 'Water',
            value: _totalWater(foods),
            target: appSettings.waterTarget,
            color: Colors.blue,
            unit: 'ml',
          ),
        if (showZero || (!showZero && _totalCaffeine(foods) != 0))
          ChartBar(
            title: 'Caffeine',
            value: _totalCaffeine(foods),
            target: appSettings.caffeineTarget,
            color: Colors.blue,
            unit: 'mg',
          ),
        if (showZero || (!showZero && _totalAlcohol(foods) != 0))
          ChartBar(
            title: 'Alcohol',
            value: _totalAlcohol(foods),
            target: appSettings.alcoholTarget,
            color: Colors.blue,
            unit: 'g',
          ),
      ],
    );
  }
}
