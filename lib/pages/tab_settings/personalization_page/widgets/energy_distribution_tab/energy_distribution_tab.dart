import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/body_targets_provider.dart';
import '../../../../../theme/energize_theme.dart';
import '../../../../../widgets/info_card.dart';

class EnergyDistributionTab extends StatefulWidget {
  const EnergyDistributionTab({super.key});

  @override
  State<EnergyDistributionTab> createState() => _EnergyDistributionTabState();
}

class _EnergyDistributionTabState extends State<EnergyDistributionTab> {
  /// 0 = protein, 1 = carbs, 2 = fat
  int _selectedMacroIndex = 0;

  double _getTotalCalories(BodyTargetsProvider bodyTargets) {
    return bodyTargets.caloriesTarget;
  }

  /// Hint: Calorie factor: 4
  double _getProteinPercentageOfCalories(BodyTargetsProvider bodyTargets) {
    return double.parse(
      (bodyTargets.proteinTarget * 4 / _getTotalCalories(bodyTargets) * 100)
          .toStringAsFixed(1),
    );
  }

  /// Hint: Calorie factor: 4
  double _getCarbsPercentageOfCalories(BodyTargetsProvider bodyTargets) {
    return double.parse(
      (bodyTargets.carbsTarget * 4 / _getTotalCalories(bodyTargets) * 100)
          .toStringAsFixed(1),
    );
  }

  /// Hint: Calorie factor: 9
  double _getFatPercentageOfCalories(BodyTargetsProvider bodyTargets) {
    return double.parse(
      (bodyTargets.fatTarget * 9 / _getTotalCalories(bodyTargets) * 100)
          .toStringAsFixed(1),
    );
  }

  /// Returns the sum of percentages of each macronutrient from the total calories, can be more than 100%
  double _getTotalCaloriesPercentage(BodyTargetsProvider bodyTargets) {
    return _getProteinPercentageOfCalories(bodyTargets) +
        _getCarbsPercentageOfCalories(bodyTargets) +
        _getFatPercentageOfCalories(bodyTargets);
  }

  /// Hide the pie chart if not at least _getTotalCalories > 0 and one of the macros > 0
  bool _isPieChartHidden(BodyTargetsProvider bodyTargets) {
    if (_getTotalCalories(bodyTargets) <= 0) {
      return true;
    }

    // Now _getTotalCalories > 0, need just one macro

    if (bodyTargets.proteinTarget > 0) {
      return false;
    }
    if (bodyTargets.carbsTarget > 0) {
      return false;
    }
    if (bodyTargets.fatTarget > 0) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final bodyTargets = Provider.of<BodyTargetsProvider>(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          AppLocalizations.of(context)!.totalEnergy,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: bodyTargets.caloriesTarget.toString(),
          onChanged: (val) =>
              bodyTargets.caloriesTarget = val == '' ? 0 : double.parse(val),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: const Icon(Icons.bolt),
            filled: true,
            suffixText: 'kcal',
            labelText: AppLocalizations.of(context)!.energy,
          ),
        ),
        _isPieChartHidden(bodyTargets)
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 16.0),
                child: InfoCard(
                  message: AppLocalizations.of(context)!
                      .energyDistributionChartMissingHint,
                ),
              )
            : AspectRatio(
                aspectRatio: 1.1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      '= ${_getTotalCaloriesPercentage(bodyTargets).toStringAsFixed(0)} %',
                    ),
                    PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                return;
                              }
                              final int touchedPieChartIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;

                              // Set value only if valid (0, 1, 2)
                              if ([0, 1, 2].contains(touchedPieChartIndex)) {
                                _selectedMacroIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              }
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 30,
                        sections: showingSections(),
                      ),
                    ),
                  ],
                ),
              ),
        if (!_isPieChartHidden(bodyTargets))
          Text(
            '* ${AppLocalizations.of(context)!.percentOfTotalEnergy} (kcal)',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.end,
          ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.selectedMacronutrient,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                value: _selectedMacroIndex,
                isExpanded: true,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedMacroIndex = newValue!;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _selectedMacroIndex == 0
                      ? Theme.of(context).proteinContainer
                      : _selectedMacroIndex == 1
                          ? Theme.of(context).carbsContainer
                          : _selectedMacroIndex == 2
                              ? Theme.of(context).fatContainer
                              : null,
                ),
                items: [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text(AppLocalizations.of(context)!.protein),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text(AppLocalizations.of(context)!.carbs),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text(AppLocalizations.of(context)!.fat),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (_selectedMacroIndex == 0)
              Expanded(
                child: TextFormField(
                  key: const Key('protein'),
                  initialValue: bodyTargets.proteinTarget.toString(),
                  onChanged: (val) {
                    setState(() {
                      bodyTargets.proteinTarget =
                          val == '' ? 0 : double.parse(val);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).proteinContainer,
                    suffixText: 'g',
                  ),
                ),
              )
            else if (_selectedMacroIndex == 1)
              Expanded(
                child: TextFormField(
                  key: const Key('carbs'),
                  initialValue: bodyTargets.carbsTarget.toString(),
                  onChanged: (val) {
                    setState(() {
                      bodyTargets.carbsTarget =
                          val == '' ? 0 : double.parse(val);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).carbsContainer,
                    suffixText: 'g',
                  ),
                ),
              )
            else if (_selectedMacroIndex == 2)
              Expanded(
                child: TextFormField(
                  key: const Key('fat'),
                  initialValue: bodyTargets.fatTarget.toString(),
                  onChanged: (val) {
                    setState(() {
                      bodyTargets.fatTarget = val == '' ? 0 : double.parse(val);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).fatContainer,
                    suffixText: 'g',
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  PieChartSectionData _getPieChartSectionData(
    Color color,
    double value,
    String title,
    double radius,
    double fontSize,
    double widgetSize,
  ) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: '$value%',
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
        shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
      ),
      badgeWidget: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: Text(
          title.substring(0, 1),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      badgePositionPercentageOffset: .98,
    );
  }

  List<PieChartSectionData> showingSections() {
    final bodyTargets =
        Provider.of<BodyTargetsProvider>(context, listen: false);

    return List.generate(3, (i) {
      final isTouched = i == _selectedMacroIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return _getPieChartSectionData(
            Theme.of(context).proteinContainer,
            _getProteinPercentageOfCalories(bodyTargets),
            AppLocalizations.of(context)!.protein,
            radius,
            fontSize,
            widgetSize,
          );

        case 1:
          return _getPieChartSectionData(
            Theme.of(context).carbsContainer,
            _getCarbsPercentageOfCalories(bodyTargets),
            AppLocalizations.of(context)!.carbs,
            radius,
            fontSize,
            widgetSize,
          );

        case 2:
          return _getPieChartSectionData(
            Theme.of(context).fatContainer,
            _getFatPercentageOfCalories(bodyTargets),
            AppLocalizations.of(context)!.fat,
            radius,
            fontSize,
            widgetSize,
          );

        default:
          throw Exception('Oh no');
      }
    });
  }
}
