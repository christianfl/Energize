import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../models/person/enums/sex.dart';
import '../../../../../models/person/enums/weight_target.dart';
import '../../../../../providers/app_settings.dart';
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

  void _showApplyDialog(BuildContext context, AppSettings appSettings) {
    void updateData({String? except}) {
      if (except != 'calories') {
        _caloriesTargetController.text =
            _calculateCalories(appSettings).toString();
      }

      _proteinTargetController.text =
          _calculateMacros('protein', appSettings).toString();
      _carbsTargetController.text =
          _calculateMacros('carbs', appSettings).toString();
      _fatTargetController.text =
          _calculateMacros('fat', appSettings).toString();
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
                            initialValue: appSettings.proteinRatio.toString(),
                            onChanged: (val) => {
                              appSettings.proteinRatio =
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
                            initialValue: appSettings.carbsRatio.toString(),
                            onChanged: (val) => {
                              appSettings.carbsRatio =
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
                            initialValue: appSettings.fatRatio.toString(),
                            onChanged: (val) => {
                              appSettings.fatRatio =
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
                  onPressed: () => _applyTargets(context, appSettings),
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

  double _calculateCalories(AppSettings appSettings) {
    if (_caloriesTargetController.text != '') {
      return double.parse(_caloriesTargetController.text);
    }

    // Standard value: females
    var sexFactor = -161;
    if (appSettings.sex == 'Male') sexFactor = 5;

    // Basal metabolic rate
    final bmr = ((10 * appSettings.weight) +
        (6.25 * appSettings.height) -
        (5 * appSettings.age) +
        sexFactor);

    // Power conversion
    final pc = bmr * appSettings.activityLevel;

    final weightTargetFactor = appSettings.weightTarget.toValue();
    final targetCalories = pc * weightTargetFactor;

    return double.parse((targetCalories).toStringAsFixed(1));
  }

  double _calculateMacros(String targetMacro, AppSettings appSettings) {
    double caloriesToDistribute;

    if (_caloriesTargetController.text == '') {
      caloriesToDistribute = _calculateCalories(appSettings);
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
            (appSettings.proteinRatio / 100);
        break;
      case 'carbs':
        target = caloriesToDistribute /
            carbsKcalPerG *
            (appSettings.carbsRatio / 100);
        break;
      case 'fat':
        target =
            caloriesToDistribute / fatKcalPerG * (appSettings.fatRatio / 100);
        break;
    }

    return double.parse((target).toStringAsFixed(1));
  }

  void _applyTargets(BuildContext context, AppSettings appSettings) {
    String snackbarText = AppLocalizations.of(context)!.targetsApplied;

    try {
      // Calories and macros
      appSettings.caloriesTarget = double.parse(_caloriesTargetController.text);
      appSettings.proteinTarget = double.parse(_proteinTargetController.text);
      appSettings.carbsTarget = double.parse(_carbsTargetController.text);
      appSettings.fatTarget = double.parse(_fatTargetController.text);

      // Micros if checkbox is true
      if (_setMicronutrientsBasedOnAgeAndSex) {
        // Get nutrient recommendations
        final int age = appSettings.age;
        final Sex sex = appSettings.sex == 'Male' ? Sex.male : Sex.female;

        MicronutrientsRecommendations.setRecommendedNutritionAsTargets(
          appSettings,
          age,
          sex,
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
    final appSettings = Provider.of<AppSettings>(context);

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
                          initialValue: appSettings.age.toString(),
                          onChanged: (val) =>
                              appSettings.age = val == '' ? 20 : int.parse(val),
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
                        child: DropdownButtonFormField<String>(
                          value: appSettings.sex,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            appSettings.sex = newValue!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            labelText: AppLocalizations.of(context)!.sex,
                          ),
                          items: Sex.values
                              .map<DropdownMenuItem<String>>((Sex sex) {
                            return DropdownMenuItem<String>(
                              value: sex.fromValue(),
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
                          initialValue: appSettings.weight.toString(),
                          onChanged: (val) => appSettings.weight =
                              val == '' ? 80 : int.parse(val),
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
                          initialValue: appSettings.height.toString(),
                          onChanged: (val) => appSettings.height =
                              val == '' ? 180 : int.parse(val),
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
                        value: appSettings.activityLevel,
                        min: 1.0,
                        max: 2.0,
                        divisions: 10,
                        label: appSettings.activityLevel.toString(),
                        onChanged: (double value) {
                          appSettings.activityLevel = value;
                        },
                      ),
                      _getActivityDescription(appSettings.activityLevel),
                    ],
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<WeightTarget>(
                    value: appSettings.weightTarget,
                    isExpanded: true,
                    onChanged: (WeightTarget? newValue) {
                      appSettings.weightTarget = newValue!;
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
                  onPressed: () => _showApplyDialog(context, appSettings),
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
