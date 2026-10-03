import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../models/person/enums/sex.dart';
import '../../../../../models/person/enums/weight_target.dart';
import '../../../../../providers/body_targets_provider.dart';
import '../../../../../services/micronutrients_recommendations/micronutrients_recommendations.dart';
import '../../../../../services/nutrition_targets_calculator/nutrition_targets_calculator.dart';
import '../../../../../utils/activity_level_description.dart';

class CalculationTab extends StatefulWidget {
  static const routeName = '/settings/personalization';

  const CalculationTab({super.key});

  @override
  CalculationTabState createState() => CalculationTabState();
}

class CalculationTabState extends State<CalculationTab> {
  final _caloriesTargetController = TextEditingController();
  final _proteinTargetController = TextEditingController();
  final _carbsTargetController = TextEditingController();
  final _fatTargetController = TextEditingController();
  bool _setMicronutrientsBasedOnAgeAndSex = false;

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(12.0),
          title: Text(AppLocalizations.of(context)!.calculationInfo),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.calculationInfoText1),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.formulaForFemales,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  '(10 * ${AppLocalizations.of(context)!.weightInKg}) + (6.25 * ${AppLocalizations.of(context)!.heightInCm}) – (5 * ${AppLocalizations.of(context)!.ageInYears}) - 161',
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.formulaForMales,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  '(10 * ${AppLocalizations.of(context)!.weightInKg}) + (6.25 * ${AppLocalizations.of(context)!.heightInCm}) – (5 * ${AppLocalizations.of(context)!.ageInYears}) + 5',
                ),
                const SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.calculationInfoText2),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showApplyDialog(BuildContext context, BodyTargetsProvider bodyTargets) {
    void updateData({String? except}) {
      if (except != 'calories') {
        _caloriesTargetController.text = _calculateCalories(
          bodyTargets,
        ).toString();
      }

      _proteinTargetController.text = _calculateMacros(
        'protein',
        bodyTargets,
      ).toString();
      _carbsTargetController.text = _calculateMacros(
        'carbs',
        bodyTargets,
      ).toString();
      _fatTargetController.text = _calculateMacros(
        'fat',
        bodyTargets,
      ).toString();
    }

    _caloriesTargetController.text = '';
    updateData();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: const EdgeInsets.all(12.0),
              title: Text(
                AppLocalizations.of(context)!.calculatedNutritionTargets,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.calculatedNutritionTargetsHint,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _caloriesTargetController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        suffixText: 'kcal',
                        labelText: AppLocalizations.of(context)!.energy,
                      ),
                      onChanged: (val) => {updateData(except: 'calories')},
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: bodyTargets.proteinRatio.toString(),
                            onChanged: (val) => {
                              bodyTargets.proteinRatio = val == ''
                                  ? 20
                                  : double.parse(val),
                              updateData(),
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: AppLocalizations.of(
                                context,
                              )!.percentOfCalories,
                              labelText: AppLocalizations.of(
                                context,
                              )!.proteinRatio,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _proteinTargetController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: 'g',
                              labelText: AppLocalizations.of(context)!.protein,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: bodyTargets.carbsRatio.toString(),
                            onChanged: (val) => {
                              bodyTargets.carbsRatio = val == ''
                                  ? 50
                                  : double.parse(val),
                              updateData(),
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: AppLocalizations.of(
                                context,
                              )!.percentOfCalories,
                              labelText: AppLocalizations.of(
                                context,
                              )!.carbsRatio,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _carbsTargetController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: 'g',
                              labelText: AppLocalizations.of(context)!.carbs,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: bodyTargets.fatRatio.toString(),
                            onChanged: (val) => {
                              bodyTargets.fatRatio = val == ''
                                  ? 30
                                  : double.parse(val),
                              updateData(),
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: AppLocalizations.of(
                                context,
                              )!.percentOfCalories,
                              labelText: AppLocalizations.of(context)!.fatRatio,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _fatTargetController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: 'g',
                              labelText: AppLocalizations.of(context)!.fat,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CheckboxListTile(
                      title: Text(
                        '${AppLocalizations.of(context)!.alsoSetMicronutrientsSwitch}*',
                      ),
                      value: _setMicronutrientsBasedOnAgeAndSex,
                      onChanged: (val) {
                        setState(() {
                          _setMicronutrientsBasedOnAgeAndSex = val!;
                        });
                      },
                    ),
                    Text(
                      '*${AppLocalizations.of(context)!.alsoSetMicronutrientsHint}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              actions: [
                FilledButton.icon(
                  onPressed: () => _applyTargets(context, bodyTargets),
                  icon: const Icon(Icons.save),
                  label: Text(AppLocalizations.of(context)!.apply),
                ),
                TextButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: Text(
                    MaterialLocalizations.of(context).cancelButtonLabel,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  double _calculateCalories(BodyTargetsProvider bodyTargets) {
    if (_caloriesTargetController.text != '') {
      return double.parse(_caloriesTargetController.text);
    }

    final age = bodyTargets.age;
    final weight = bodyTargets.weight;
    final height = bodyTargets.height;
    final sex = bodyTargets.sex;

    if (age == null || weight == null || height == null) {
      throw StateError('Body values required for target calculation');
    }
    if (sex != Sex.female && sex != Sex.male) {
      throw StateError('Selected sex has no target calculation reference');
    }

    return NutritionTargetsCalculator.calculateCalories(
      age: age,
      sex: sex,
      weight: weight,
      height: height,
      activityLevel: bodyTargets.activityLevel,
      weightTarget: bodyTargets.weightTarget,
    );
  }

  double _calculateMacros(String targetMacro, BodyTargetsProvider bodyTargets) {
    double caloriesToDistribute;

    if (_caloriesTargetController.text == '') {
      caloriesToDistribute = _calculateCalories(bodyTargets);
    } else {
      caloriesToDistribute = double.parse(_caloriesTargetController.text);
    }

    final (ratio, kilocaloriesPerGram) = switch (targetMacro) {
      'protein' => (bodyTargets.proteinRatio, 4.0),
      'carbs' => (bodyTargets.carbsRatio, 4.0),
      'fat' => (bodyTargets.fatRatio, 9.0),
      _ => (0.0, 1.0),
    };

    return NutritionTargetsCalculator.calculateMacroTarget(
      calories: caloriesToDistribute,
      ratio: ratio,
      kilocaloriesPerGram: kilocaloriesPerGram,
    );
  }

  void _applyTargets(BuildContext context, BodyTargetsProvider bodyTargets) {
    String snackbarText = AppLocalizations.of(context)!.targetsApplied;

    try {
      // Calories and macros
      bodyTargets.caloriesTarget = double.parse(_caloriesTargetController.text);
      bodyTargets.proteinTarget = double.parse(_proteinTargetController.text);
      bodyTargets.carbsTarget = double.parse(_carbsTargetController.text);
      bodyTargets.fatTarget = double.parse(_fatTargetController.text);

      // Micros if checkbox is true
      if (_setMicronutrientsBasedOnAgeAndSex) {
        final age = bodyTargets.age;
        if (age == null || !_isBinarySex(bodyTargets.sex)) {
          throw StateError('Age and sex reference required');
        }
        MicronutrientsRecommendations.setRecommendedNutritionAsTargets(
          bodyTargets,
          age,
          bodyTargets.sex,
        );
      }
    } catch (e) {
      snackbarText = AppLocalizations.of(context)!.targetsApplyError;
    } finally {
      Navigator.pop(context);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(snackbarText)));
    }
  }

  String _getWeightTargetRelativePercent(WeightTarget weightTarget) {
    if (weightTarget == WeightTarget.maintaining) {
      return '';
    }

    final String absolutePercent = (weightTarget.toValue() * 100)
        .toStringAsFixed(0);
    final int absolutePercentInt = int.parse(absolutePercent);
    final int relativePercentInt = absolutePercentInt - 100;

    String relativePercent = '$relativePercentInt %';

    // If value is positive
    if (relativePercentInt.sign == 1) {
      relativePercent = '+$relativePercent';
    }

    return '($relativePercent)';
  }

  /// Whether automatic calculations have all required reference values.
  bool _canCalculateTargets(BodyTargetsProvider bodyTargets) {
    return bodyTargets.age != null &&
        bodyTargets.weight != null &&
        bodyTargets.height != null &&
        _isBinarySex(bodyTargets.sex);
  }

  /// Whether [sex] is either [Sex.female] or [Sex.male].
  bool _isBinarySex(Sex sex) {
    return sex == Sex.female || sex == Sex.male;
  }

  @override
  Widget build(BuildContext context) {
    final bodyTargets = Provider.of<BodyTargetsProvider>(context);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      AppLocalizations.of(context)!.yourBody,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: bodyTargets.age?.toString(),
                          onChanged: (val) =>
                              bodyTargets.age = int.tryParse(val),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            suffixText: AppLocalizations.of(context)!.years,
                            labelText: AppLocalizations.of(context)!.age,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<Sex>(
                          initialValue: bodyTargets.sex,
                          isExpanded: true,
                          onChanged: (Sex? newValue) {
                            if (newValue != null) {
                              bodyTargets.sex = newValue;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            labelText: AppLocalizations.of(context)!.sex,
                          ),
                          items: Sex.values.map<DropdownMenuItem<Sex>>((
                            Sex sex,
                          ) {
                            return DropdownMenuItem<Sex>(
                              value: sex,
                              child: Text(sex.toLocalizedString(context)),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: bodyTargets.weight?.toString(),
                          onChanged: (val) =>
                              bodyTargets.weight = int.tryParse(val),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            suffixText: 'kg',
                            labelText: AppLocalizations.of(context)!.weight,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          initialValue: bodyTargets.height?.toString(),
                          onChanged: (val) =>
                              bodyTargets.height = int.tryParse(val),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            suffixText: 'cm',
                            labelText: AppLocalizations.of(context)!.height,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      AppLocalizations.of(context)!.behaviourAndTarget,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.activityLevel),
                      Slider(
                        value: bodyTargets.activityLevel,
                        min: 1.0,
                        max: 2.0,
                        divisions: 10,
                        label: bodyTargets.activityLevel.toString(),
                        onChanged: (double value) {
                          bodyTargets.activityLevel = value;
                        },
                      ),
                      Text(
                        activityLevelDescription(
                          AppLocalizations.of(context)!,
                          bodyTargets.activityLevel,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<WeightTarget>(
                    initialValue: bodyTargets.weightTarget,
                    isExpanded: true,
                    onChanged: (WeightTarget? newValue) {
                      bodyTargets.weightTarget = newValue!;
                    },
                    decoration: InputDecoration(
                      icon: const Icon(Icons.adjust),
                      filled: true,
                      labelText: AppLocalizations.of(context)!.weightTarget,
                    ),
                    items: WeightTarget.values.map((WeightTarget weightTarget) {
                      return DropdownMenuItem<WeightTarget>(
                        value: weightTarget,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(weightTarget.toLocalizedString(context)),
                            Text(_getWeightTargetRelativePercent(weightTarget)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (!_canCalculateTargets(bodyTargets))
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    AppLocalizations.of(
                      context,
                    )!.targetCalculationRequirementsText(
                      AppLocalizations.of(context)!.age,
                      AppLocalizations.of(context)!.weight,
                      AppLocalizations.of(context)!.height,
                      AppLocalizations.of(context)!.female,
                      AppLocalizations.of(context)!.male,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: _canCalculateTargets(bodyTargets)
                          ? () => _showApplyDialog(context, bodyTargets)
                          : null,
                      child: Text(
                        AppLocalizations.of(context)!.calculateNutritionTargets,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => {_showInfoDialog(context)},
                    icon: const Icon(Icons.info),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
