import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/app_settings.dart';
import 'macro_chart_segment.dart';

class EnergyDistributionTab extends StatefulWidget {
  const EnergyDistributionTab({Key? key}) : super(key: key);

  @override
  State<EnergyDistributionTab> createState() => _EnergyDistributionTabState();
}

class _EnergyDistributionTabState extends State<EnergyDistributionTab> {
  Map<String, String> _chartSegmentDropdownItems = {
    'protein': 'protein',
    'carbs': 'carbs',
    'fat': 'fat',
  };
  String _selectedChartSegmentDropdownItem = 'protein';

  List<charts.Series<MacroChartSegment, String>> _createSampleData(
    BuildContext context,
    AppSettings appSettings,
  ) {
    double proteinPercentageOfCalories =
        _getProteinPercentageOfCalories(appSettings);

    double carbsPercentageOfCalories =
        _getCarbsPercentageOfCalories(appSettings);

    double fatPercentageOfCalories = _getFatPercentageOfCalories(appSettings);

    final List<MacroChartSegment> chartData = [
      MacroChartSegment(
        '${AppLocalizations.of(context)!.protein}\n(${proteinPercentageOfCalories.toStringAsFixed(1)}% *)',
        proteinPercentageOfCalories,
        charts.ColorUtil.fromDartColor(Colors.green),
      ),
      MacroChartSegment(
        '${AppLocalizations.of(context)!.carbs}\n(${carbsPercentageOfCalories.toStringAsFixed(1)}% *)',
        carbsPercentageOfCalories,
        charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      MacroChartSegment(
        '${AppLocalizations.of(context)!.fat}\n(${fatPercentageOfCalories.toStringAsFixed(1)}% *)',
        fatPercentageOfCalories,
        charts.ColorUtil.fromDartColor(Colors.red),
      ),
    ];

    return [
      charts.Series<MacroChartSegment, String>(
        id: 'MacroDistribution',
        domainFn: (MacroChartSegment macro, _) => macro.partName,
        measureFn: (MacroChartSegment macro, _) => macro.fraction,
        data: chartData,
        colorFn: (MacroChartSegment segment, _) => segment.color,
      )
    ];
  }

  double _getTotalCalories(AppSettings appSettings) {
    return appSettings.caloriesTarget;
  }

  double _getProteinPercentageOfCalories(AppSettings appSettings) {
    return appSettings.proteinTarget * 4 / _getTotalCalories(appSettings) * 100;
  }

  double _getCarbsPercentageOfCalories(AppSettings appSettings) {
    return appSettings.carbsTarget * 4 / _getTotalCalories(appSettings) * 100;
  }

  double _getFatPercentageOfCalories(AppSettings appSettings) {
    return appSettings.fatTarget * 9 / _getTotalCalories(appSettings) * 100;
  }

  /// Returns the sum of percentages of each macronutrient from the total calories, can be more than 100%
  double _getTotalCaloriesPercentage(AppSettings appSettings) {
    return _getProteinPercentageOfCalories(appSettings) +
        _getCarbsPercentageOfCalories(appSettings) +
        _getFatPercentageOfCalories(appSettings);
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    _chartSegmentDropdownItems = {
      'protein': AppLocalizations.of(context)!.protein,
      'carbs': AppLocalizations.of(context)!.carbs,
      'fat': AppLocalizations.of(context)!.fat,
    };

    return ListView(
      padding: const EdgeInsets.all(12.0),
      children: [
        Text(
          AppLocalizations.of(context)!.totalEnergy,
          style: Theme.of(context).textTheme.headline4,
        ),
        ListTile(
          leading: const Icon(Icons.bolt),
          title: TextFormField(
            initialValue: appSettings.caloriesTarget.toString(),
            onChanged: (val) =>
                appSettings.caloriesTarget = val == '' ? 0 : double.parse(val),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixText: 'kcal',
              labelText: AppLocalizations.of(context)!.energy,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(
                  '= ${_getTotalCaloriesPercentage(appSettings).toStringAsFixed(0)}%'),
              charts.PieChart<String>(
                _createSampleData(context, appSettings),
                animate: true,
                defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 100,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                      insideLabelStyleSpec: charts.TextStyleSpec(
                        color: charts.ColorUtil.fromDartColor(Colors.black),
                        fontSize: 14,
                      ),
                      outsideLabelStyleSpec: charts.TextStyleSpec(
                        color: charts.ColorUtil.fromDartColor(Colors.black),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                selectionModels: [
                  charts.SelectionModelConfig(
                    changedListener: (charts.SelectionModel model) {
                      final indexOfSelected = model.selectedDatum[0].index;

                      if (indexOfSelected != null) {
                        setState(() {
                          _selectedChartSegmentDropdownItem =
                              _chartSegmentDropdownItems.keys
                                  .toList()[indexOfSelected];
                        });
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        Text(
          '* ${AppLocalizations.of(context)!.percentOfTotalEnergy} (kcal)',
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.selectedMacronutrient,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 10),
        Card(
          color: _selectedChartSegmentDropdownItem == 'protein'
              ? Colors.green
              : _selectedChartSegmentDropdownItem == 'carbs'
                  ? Colors.blue
                  : _selectedChartSegmentDropdownItem == 'fat'
                      ? Colors.red
                      : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedChartSegmentDropdownItem,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedChartSegmentDropdownItem = newValue!;
                      });
                    },
                    items: _chartSegmentDropdownItems
                        .map((value, valueName) {
                          return MapEntry(
                              value,
                              DropdownMenuItem<String>(
                                value: value,
                                child: Text(valueName),
                              ));
                        })
                        .values
                        .toList(),
                  ),
                ),
                if (_selectedChartSegmentDropdownItem == 'protein')
                  Expanded(
                    child: ListTile(
                      title: TextFormField(
                        key: const Key('protein'),
                        initialValue: appSettings.proteinTarget.toString(),
                        onChanged: (val) {
                          setState(() {
                            appSettings.proteinTarget =
                                val == '' ? 0 : double.parse(val);
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          suffixText: 'g',
                        ),
                      ),
                    ),
                  )
                else if (_selectedChartSegmentDropdownItem == 'carbs')
                  Expanded(
                    child: ListTile(
                      title: TextFormField(
                        key: const Key('carbs'),
                        initialValue: appSettings.carbsTarget.toString(),
                        onChanged: (val) {
                          setState(() {
                            appSettings.carbsTarget =
                                val == '' ? 0 : double.parse(val);
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          suffixText: 'g',
                        ),
                      ),
                    ),
                  )
                else if (_selectedChartSegmentDropdownItem == 'fat')
                  Expanded(
                    child: ListTile(
                      title: TextFormField(
                        key: const Key('fat'),
                        initialValue: appSettings.fatTarget.toString(),
                        onChanged: (val) {
                          setState(() {
                            appSettings.fatTarget =
                                val == '' ? 0 : double.parse(val);
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          suffixText: 'g',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
