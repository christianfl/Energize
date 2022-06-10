import 'package:energize/models/person/enums/sex.dart';
import 'package:energize/models/person/enums/weight_target.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../../providers/app_settings.dart';
import '../../services/micronutrients_recommendations/micronutrients_recommendations.dart';

// In order to make the slider full width
class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class PersonalizationSubPage extends StatefulWidget {
  static const routeName = '/settings/personalization';

  @override
  _PersonalizationSubPageState createState() => _PersonalizationSubPageState();
}

class _PersonalizationSubPageState extends State<PersonalizationSubPage> {
  var _caloriesTargetController = TextEditingController();
  var _proteinTargetController = TextEditingController();
  var _carbsTargetController = TextEditingController();
  var _fatTargetController = TextEditingController();
  bool _setMicronutrientsBasedOnAgeAndSex = false;

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calculation info'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                    'This calculation is based on the Mifflin-St.Jeor formula. Please be aware that it can only act as an approximation to the real world values. These differ from person to person as their body conditions can diverge more or less.'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Female',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                    '(10 * Weight in kg) + (6.25 * Height in cm) – (5 * Age in years) - 161'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Male',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                    '(10 * Weight in kg) + (6.25 * Height in cm) – (5 * Age in years) + 5'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
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
            title: Text('Calculated targets'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
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
                          decoration: new InputDecoration(
                            suffixText: '% of kcal',
                            labelText: 'Protein ratio',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _proteinTargetController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
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
                          decoration: new InputDecoration(
                            suffixText: '% of kcal',
                            labelText: 'Carbs ratio',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _carbsTargetController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
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
                          decoration: new InputDecoration(
                            suffixText: '% of kcal',
                            labelText: 'Fat ratio',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _fatTargetController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                            labelText: 'Fat',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.all(8.0),
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
                  icon: Icon(Icons.save),
                  label: Text('Apply')),
              TextButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: Text('Close'),
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
    var caloriesToDistribute;

    if (_caloriesTargetController.text == '') {
      caloriesToDistribute = _calculateCalories(appSettings);
    } else {
      caloriesToDistribute = double.parse(_caloriesTargetController.text);
    }

    final double proteinKcalPerG = 4.0;
    final double carbsKcalPerG = 4.0;
    final double fatKcalPerG = 9.0;

    var target = 0.0;

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

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.personalization),
        actions: [
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () => _showInfoDialog(context)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Body',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.elderly),
            title: TextFormField(
              initialValue: appSettings.age.toString(),
              onChanged: (val) =>
                  appSettings.age = val == '' ? 20 : int.parse(val),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffixText: 'years',
                labelText: 'Age',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.female),
            title: DropdownButtonFormField<String>(
              value: appSettings.sex,
              isExpanded: true,
              onChanged: (String? newValue) {
                appSettings.sex = newValue!;
              },
              decoration: InputDecoration(
                labelText: 'Sex',
              ),
              items: <String>['Female', 'Male']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.monitor_weight),
            title: TextFormField(
              initialValue: appSettings.weight.toString(),
              onChanged: (val) =>
                  appSettings.weight = val == '' ? 80 : int.parse(val),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffixText: 'kg',
                labelText: 'Weight',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.height),
            title: TextFormField(
              initialValue: appSettings.height.toString(),
              onChanged: (val) =>
                  appSettings.height = val == '' ? 180 : int.parse(val),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffixText: 'cm',
                labelText: 'Height',
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Behaviour',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.kitesurfing),
            subtitle: _getActivityDescription(appSettings.activityLevel),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Activity level'),
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
          ListTile(
            leading: const Icon(Icons.adjust),
            title: DropdownButtonFormField<WeightTarget>(
              value: appSettings.weightTarget,
              isExpanded: true,
              onChanged: (WeightTarget? newValue) {
                appSettings.weightTarget = newValue!;
              },
              decoration: InputDecoration(
                labelText: 'Weight target',
              ),
              items: WeightTarget.values.map((WeightTarget weightTarget) {
                return DropdownMenuItem<WeightTarget>(
                  value: weightTarget,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(weightTarget.toLocalizedString(context)),
                      Text('${_getWeightTargetRelativePercent(weightTarget)}'),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        onPress: () {
          _showApplyDialog(context, appSettings);
        },
        curve: Curves.linear,
        icon: Icons.settings_suggest,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
