import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../models/person/enums/sex.dart';
import '../../../../../models/person/enums/weight_target.dart';
import '../../../../../providers/app_settings.dart';
import '../../../../../services/micronutrients_recommendations/micronutrients_recommendations.dart';
import 'custom_track_shape.dart';

class CalculationTab extends StatefulWidget {
  static const routeName = '/settings/personalization';

  const CalculationTab({
    Key? key,
  }) : super(key: key);

  @override
  _CalculationTabState createState() => _CalculationTabState();
}

class _CalculationTabState extends State<CalculationTab> {
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
          title: const Text('Calculation info'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    'The calorie intake calculation is based on the Mifflin-St.Jeor formula. Please be aware that it can only act as an approximation to the real world values. These differ from person to person as their body conditions can diverge more or less.'),
                const SizedBox(height: 20),
                Text(
                  'Calculation for females',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                const Text(
                    '(10 * Weight in kg) + (6.25 * Height in cm) – (5 * Age in years) - 161'),
                const SizedBox(height: 20),
                Text(
                  'Calculation for males',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                const Text(
                    '(10 * Weight in kg) + (6.25 * Height in cm) – (5 * Age in years) + 5'),
                const SizedBox(height: 10),
                const Text(
                    'The output of this calculation is defined as the basal metabolic rate (BMR). It gets multiplied with your activity factor to receive your total power conversion. This is your calculated energy intake in kcal.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  void _showApplyDialog(BuildContext context, AppSettings appSettings) {
    void _updateData({String? except}) {
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
    _updateData();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Calculated targets'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      'Feel free to edit the calculated targets according to your needs before applying them.'),
                  TextFormField(
                    controller: _caloriesTargetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: 'kcal',
                      labelText: 'Energy',
                    ),
                    onChanged: (val) => {
                      _updateData(except: 'calories'),
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: appSettings.proteinRatio.toString(),
                          onChanged: (val) => {
                            appSettings.proteinRatio =
                                val == '' ? 20 : double.parse(val),
                            _updateData(),
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixText: '% of kcal',
                            labelText: 'Protein ratio',
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: _proteinTargetController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixText: 'g',
                            labelText: 'Protein',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: appSettings.carbsRatio.toString(),
                          onChanged: (val) => {
                            appSettings.carbsRatio =
                                val == '' ? 50 : double.parse(val),
                            _updateData(),
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixText: '% of kcal',
                            labelText: 'Carbs ratio',
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: _carbsTargetController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixText: 'g',
                            labelText: 'Carbs',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: appSettings.fatRatio.toString(),
                          onChanged: (val) => {
                            appSettings.fatRatio =
                                val == '' ? 30 : double.parse(val),
                            _updateData(),
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixText: '% of kcal',
                            labelText: 'Fat ratio',
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: _fatTargetController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixText: 'g',
                            labelText: 'Fat',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: const Text(
                        'Also set micronutrient targets based on age and sex'),
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
              ElevatedButton.icon(
                  onPressed: () => _applyTargets(context, appSettings),
                  icon: const Icon(Icons.save),
                  label: const Text('Apply')),
              TextButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: const Text('Close'),
              )
            ],
          );
        });
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
    String snackbarText = 'Targets applied successfully';
    Color? snackbarColor;

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
            appSettings, age, sex);
      }
    } catch (e) {
      snackbarText = 'Error setting targets';
      snackbarColor = Colors.red;
    } finally {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(snackbarText),
          backgroundColor: snackbarColor,
        ),
      );
    }
  }

  Widget _getActivityDescription(double activityLevel) {
    final activityLevelString = activityLevel.toString();
    var description = 'No activity level description!';

    switch (activityLevelString) {
      case '1.0':
        description = 'You do basically nothing than sleep';
        break;
      case '1.1':
        description = 'You are laying in your bed the whole day';
        break;
      case '1.2':
        description = 'You are sitting in your bed the whole day';
        break;
      case '1.3':
        description = 'You don\'t really go outside very often';
        break;
      case '1.4':
        description = 'You are not that active at all';
        break;
      case '1.5':
        description = 'You do an office work';
        break;
      case '1.6':
        description = 'You are a bit active, work and sometimes do sports';
        break;
      case '1.7':
        description = 'You do workout often';
        break;
      case '1.8':
        description = 'You do workout hard regularly';
        break;
      case '1.9':
        description =
            'You are very active, workout and don\'t have an office job';
        break;
      case '2.0':
        description =
            'You do a physically active job and workout hard regularly';
        break;
    }

    return Text(description);
  }

  String _getWeightTargetRelativePercent(WeightTarget weightTarget) {
    if (weightTarget == WeightTarget.maintaining) {
      return '';
    }

    String absolutePercent = (weightTarget.toValue() * 100).toStringAsFixed(0);
    int absolutePercentInt = int.parse(absolutePercent);
    int relativePercentInt = absolutePercentInt - 100;

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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Your Body',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: TextFormField(
                            initialValue: appSettings.age.toString(),
                            onChanged: (val) => appSettings.age =
                                val == '' ? 20 : int.parse(val),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              suffixText: 'years',
                              labelText: 'Age',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: DropdownButtonFormField<String>(
                            value: appSettings.sex,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              appSettings.sex = newValue!;
                            },
                            decoration: InputDecoration(
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
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: TextFormField(
                            initialValue: appSettings.weight.toString(),
                            onChanged: (val) => appSettings.weight =
                                val == '' ? 80 : int.parse(val),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              suffixText: 'kg',
                              labelText: 'Weight',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: TextFormField(
                            initialValue: appSettings.height.toString(),
                            onChanged: (val) => appSettings.height =
                                val == '' ? 180 : int.parse(val),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              suffixText: 'cm',
                              labelText: 'Height',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Behaviour and target',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  ListTile(
                    subtitle:
                        _getActivityDescription(appSettings.activityLevel),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Activity level'),
                        SliderTheme(
                          data: SliderThemeData(
                            trackShape: CustomTrackShape(),
                          ),
                          child: Slider(
                            value: appSettings.activityLevel,
                            min: 1.0,
                            max: 2.0,
                            divisions: 10,
                            label: appSettings.activityLevel.toString(),
                            onChanged: (double value) {
                              appSettings.activityLevel = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.adjust),
                    title: DropdownButtonFormField<WeightTarget>(
                      value: appSettings.weightTarget,
                      isExpanded: true,
                      onChanged: (WeightTarget? newValue) {
                        appSettings.weightTarget = newValue!;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Weight target',
                      ),
                      items:
                          WeightTarget.values.map((WeightTarget weightTarget) {
                        return DropdownMenuItem<WeightTarget>(
                          value: weightTarget,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(weightTarget.toLocalizedString(context)),
                              Text(_getWeightTargetRelativePercent(
                                  weightTarget)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
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
                child: ElevatedButton.icon(
                  onPressed: () => _showApplyDialog(context, appSettings),
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calculate nutrition targets'),
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
