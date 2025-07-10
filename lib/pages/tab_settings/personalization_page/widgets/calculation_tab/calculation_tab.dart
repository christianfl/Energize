import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../models/person/body_targets.dart';
import '../../../../../models/person/enums/sex.dart';
import '../../../../../models/person/enums/weight_target.dart';
import '../../../../../providers/body_targets_provider.dart';
import '../../../../../services/micronutrients_recommendations/micronutrients_recommendations.dart';

class CalculationTab extends StatefulWidget {
  static const routeName = '/settings/personalization';

  const CalculationTab({
    super.key,
  });

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
        _caloriesTargetController.text =
            _calculateCalories(bodyTargets).toString();
      }

      _proteinTargetController.text =
          _calculateMacros('protein', bodyTargets).toString();
      _carbsTargetController.text =
          _calculateMacros('carbs', bodyTargets).toString();
      _fatTargetController.text =
          _calculateMacros('fat', bodyTargets).toString();
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
                      AppLocalizations.of(context)!
                          .calculatedNutritionTargetsHint,
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
                      onChanged: (val) => {
                        updateData(except: 'calories'),
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: bodyTargets.proteinRatio.toString(),
                            onChanged: (val) => {
                              bodyTargets.proteinRatio =
                                  val == '' ? 20 : double.parse(val),
                              updateData(),
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: AppLocalizations.of(context)!
                                  .percentOfCalories,
                              labelText:
                                  AppLocalizations.of(context)!.proteinRatio,
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
                              bodyTargets.carbsRatio =
                                  val == '' ? 50 : double.parse(val),
                              updateData(),
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: AppLocalizations.of(context)!
                                  .percentOfCalories,
                              labelText:
                                  AppLocalizations.of(context)!.carbsRatio,
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
                              bodyTargets.fatRatio =
                                  val == '' ? 30 : double.parse(val),
                              updateData(),
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              suffixText: AppLocalizations.of(context)!
                                  .percentOfCalories,
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
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(
                        AppLocalizations.of(context)!
                            .alsoSetMicronutrientsSwitch,
                      ),
                      value: _setMicronutrientsBasedOnAgeAndSex,
                      onChanged: (val) {
                        setState(() {
                          _setMicronutrientsBasedOnAgeAndSex = val!;
                        });
                      },
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
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  child:
                      Text(MaterialLocalizations.of(context).cancelButtonLabel),
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

    // Standard value: females
    var sexFactor = -161;
    if (bodyTargets.sex == Sex.male) sexFactor = 5;

    // Basal metabolic rate
    final bmr = ((10 * bodyTargets.weight) +
        (6.25 * bodyTargets.height) -
        (5 * bodyTargets.age) +
        sexFactor);

    // Power conversion
    final pc = bmr * bodyTargets.activityLevel;

    final weightTargetFactor = bodyTargets.weightTarget.toValue();
    final targetCalories = pc * weightTargetFactor;

    return double.parse((targetCalories).toStringAsFixed(1));
  }

  double _calculateMacros(String targetMacro, BodyTargetsProvider bodyTargets) {
    double caloriesToDistribute;

    if (_caloriesTargetController.text == '') {
      caloriesToDistribute = _calculateCalories(bodyTargets);
    } else {
      caloriesToDistribute = double.parse(_caloriesTargetController.text);
    }

    const double proteinKcalPerG = 4.0;
    const double carbsKcalPerG = 4.0;
    const double fatKcalPerG = 9.0;

    double target = 0.0;

    switch (targetMacro) {
      case 'protein':
        target = caloriesToDistribute /
            proteinKcalPerG *
            (bodyTargets.proteinRatio / 100);
        break;
      case 'carbs':
        target = caloriesToDistribute /
            carbsKcalPerG *
            (bodyTargets.carbsRatio / 100);
        break;
      case 'fat':
        target =
            caloriesToDistribute / fatKcalPerG * (bodyTargets.fatRatio / 100);
        break;
    }

    return double.parse((target).toStringAsFixed(1));
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
        MicronutrientsRecommendations.setRecommendedNutritionAsTargets(
          bodyTargets,
          bodyTargets.age,
          bodyTargets.sex,
        );
      }
    } catch (e) {
      snackbarText = AppLocalizations.of(context)!.targetsApplyError;
    } finally {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(snackbarText)),
      );
    }
  }

  Widget _getActivityDescription(double activityLevel) {
    final activityLevelString = activityLevel.toString();
    var description = AppLocalizations.of(context)!.noActivityLevelDescription;

    switch (activityLevelString) {
      case '1.0':
        description = AppLocalizations.of(context)!.activityLevel1_0;
        break;
      case '1.1':
        description = AppLocalizations.of(context)!.activityLevel1_1;
        break;
      case '1.2':
        description = AppLocalizations.of(context)!.activityLevel1_2;
        break;
      case '1.3':
        description = AppLocalizations.of(context)!.activityLevel1_3;
        break;
      case '1.4':
        description = AppLocalizations.of(context)!.activityLevel1_4;
        break;
      case '1.5':
        description = AppLocalizations.of(context)!.activityLevel1_5;
        break;
      case '1.6':
        description = AppLocalizations.of(context)!.activityLevel1_6;
        break;
      case '1.7':
        description = AppLocalizations.of(context)!.activityLevel1_7;
        break;
      case '1.8':
        description = AppLocalizations.of(context)!.activityLevel1_8;
        break;
      case '1.9':
        description = AppLocalizations.of(context)!.activityLevel1_9;
        break;
      case '2.0':
        description = AppLocalizations.of(context)!.activityLevel2_0;
        break;
    }

    return Text(description);
  }

  String _getWeightTargetRelativePercent(WeightTarget weightTarget) {
    if (weightTarget == WeightTarget.maintaining) {
      return '';
    }

    final String absolutePercent =
        (weightTarget.toValue() * 100).toStringAsFixed(0);
    final int absolutePercentInt = int.parse(absolutePercent);
    final int relativePercentInt = absolutePercentInt - 100;

    String relativePercent = '$relativePercentInt %';

    // If value is positive
    if (relativePercentInt.sign == 1) {
      relativePercent = '+$relativePercent';
    }

    return '($relativePercent)';
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
                          initialValue: bodyTargets.age.toString(),
                          onChanged: (val) => bodyTargets.age =
                              val == '' ? BodyTargets().age : int.parse(val),
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
                          value: bodyTargets.sex,
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
                          items:
                              Sex.values.map<DropdownMenuItem<Sex>>((Sex sex) {
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
                          initialValue: bodyTargets.weight.toString(),
                          onChanged: (val) => bodyTargets.weight =
                              val == '' ? BodyTargets().weight : int.parse(val),
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
                          initialValue: bodyTargets.height.toString(),
                          onChanged: (val) => bodyTargets.height =
                              val == '' ? BodyTargets().height : int.parse(val),
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
                      _getActivityDescription(bodyTargets.activityLevel),
                    ],
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<WeightTarget>(
                    value: bodyTargets.weightTarget,
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
                            Text(
                              _getWeightTargetRelativePercent(
                                weightTarget,
                              ),
                            ),
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
          child: Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () => _showApplyDialog(context, bodyTargets),
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
        ),
      ],
    );
  }
}
