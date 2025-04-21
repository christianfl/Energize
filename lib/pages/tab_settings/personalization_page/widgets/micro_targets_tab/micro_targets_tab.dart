import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/body_targets_provider.dart';
import '../../../../../widgets/category_list_tile_header.dart';

class MicroTargetsTab extends StatefulWidget {
  const MicroTargetsTab({super.key});

  @override
  MicroTargetsTabState createState() => MicroTargetsTabState();
}

class MicroTargetsTabState extends State<MicroTargetsTab> {
  var activePanelIndex = -1;

  Widget _getCustomListTile({
    required String title,
    required String initialValue,
    required Function(String) setValueFunction,
    required String unit,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: setValueFunction,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          isDense: true,
          labelText: title,
          filled: true,
          suffixText: unit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodyTargets = Provider.of<BodyTargetsProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(0.0),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            if (activePanelIndex == panelIndex) {
              activePanelIndex = -1;
            } else {
              activePanelIndex = panelIndex;
            }
          });
        },
        children: <ExpansionPanel>[
          ExpansionPanel(
            isExpanded: activePanelIndex == 0,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return CategoryListTileHeader(
                title: AppLocalizations.of(context)!.vitamins,
                subtitle:
                    '${AppLocalizations.of(context)!.vitaminA} – ${AppLocalizations.of(context)!.vitaminK}',
              );
            },
            body: Column(
              children: [
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminA,
                  initialValue: bodyTargets.vitaminATarget.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminATarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB1,
                  initialValue: bodyTargets.vitaminB1Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB1Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB2,
                  initialValue: bodyTargets.vitaminB2Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB2Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB3,
                  initialValue: bodyTargets.vitaminB3Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB3Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB5,
                  initialValue: bodyTargets.vitaminB5Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB5Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB6,
                  initialValue: bodyTargets.vitaminB6Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB6Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB7,
                  initialValue: bodyTargets.vitaminB7Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB7Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB9,
                  initialValue: bodyTargets.vitaminB9Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB9Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB12,
                  initialValue: bodyTargets.vitaminB12Target.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminB12Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminC,
                  initialValue: bodyTargets.vitaminCTarget.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminCTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminD,
                  initialValue: bodyTargets.vitaminDTarget.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminDTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminE,
                  initialValue: bodyTargets.vitaminETarget.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminETarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminK,
                  initialValue: bodyTargets.vitaminKTarget.toString(),
                  setValueFunction: (val) => bodyTargets.vitaminKTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
              ],
            ),
          ),
          ExpansionPanel(
            isExpanded: activePanelIndex == 1,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return CategoryListTileHeader(
                title: AppLocalizations.of(context)!.majorMinerals,
                subtitle:
                    '${AppLocalizations.of(context)!.calcium}, ${AppLocalizations.of(context)!.chloride}, ${AppLocalizations.of(context)!.magnesium}, ...',
              );
            },
            body: Column(
              children: [
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.calcium,
                  initialValue: bodyTargets.calciumTarget.toString(),
                  setValueFunction: (val) => bodyTargets.calciumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.chloride,
                  initialValue: bodyTargets.chlorideTarget.toString(),
                  setValueFunction: (val) => bodyTargets.chlorideTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.magnesium,
                  initialValue: bodyTargets.magnesiumTarget.toString(),
                  setValueFunction: (val) => bodyTargets.magnesiumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.phosphorous,
                  initialValue: bodyTargets.phosphorusTarget.toString(),
                  setValueFunction: (val) => bodyTargets.phosphorusTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.potassium,
                  initialValue: bodyTargets.potassiumTarget.toString(),
                  setValueFunction: (val) => bodyTargets.potassiumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.sodium,
                  initialValue: bodyTargets.sodiumTarget.toString(),
                  setValueFunction: (val) => bodyTargets.sodiumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
              ],
            ),
          ),
          ExpansionPanel(
            isExpanded: activePanelIndex == 2,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return CategoryListTileHeader(
                title: AppLocalizations.of(context)!.traceElements,
                subtitle:
                    '${AppLocalizations.of(context)!.chromium}, ${AppLocalizations.of(context)!.iron}, ${AppLocalizations.of(context)!.fluorine}, ${AppLocalizations.of(context)!.iodine}, ${AppLocalizations.of(context)!.copper}, ...',
              );
            },
            body: Column(
              children: [
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.chromium,
                  initialValue: bodyTargets.chromiumTarget.toString(),
                  setValueFunction: (val) => bodyTargets.chromiumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.iron,
                  initialValue: bodyTargets.ironTarget.toString(),
                  setValueFunction: (val) => bodyTargets.ironTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.fluorine,
                  initialValue: bodyTargets.fluorineTarget.toString(),
                  setValueFunction: (val) => bodyTargets.fluorineTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.iodine,
                  initialValue: bodyTargets.iodineTarget.toString(),
                  setValueFunction: (val) => bodyTargets.iodineTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.copper,
                  initialValue: bodyTargets.copperTarget.toString(),
                  setValueFunction: (val) => bodyTargets.copperTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.manganese,
                  initialValue: bodyTargets.manganeseTarget.toString(),
                  setValueFunction: (val) => bodyTargets.manganeseTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.molybdenum,
                  initialValue: bodyTargets.molybdenumTarget.toString(),
                  setValueFunction: (val) => bodyTargets.molybdenumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.selenium,
                  initialValue: bodyTargets.seleniumTarget.toString(),
                  setValueFunction: (val) => bodyTargets.seleniumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.zinc,
                  initialValue: bodyTargets.zincTarget.toString(),
                  setValueFunction: (val) => bodyTargets.zincTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
              ],
            ),
          ),
          ExpansionPanel(
            isExpanded: activePanelIndex == 3,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return CategoryListTileHeader(
                title: AppLocalizations.of(context)!.fats,
                subtitle:
                    '${AppLocalizations.of(context)!.omega3}, ${AppLocalizations.of(context)!.omega6}, ${AppLocalizations.of(context)!.cholesterol}, ...',
              );
            },
            body: Column(
              children: [
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.monounsaturatedFat,
                  initialValue: bodyTargets.monounsaturatedFatTarget.toString(),
                  setValueFunction: (val) =>
                      bodyTargets.monounsaturatedFatTarget =
                          val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.polyunsaturatedFat,
                  initialValue: bodyTargets.polyunsaturatedFatTarget.toString(),
                  setValueFunction: (val) =>
                      bodyTargets.polyunsaturatedFatTarget =
                          val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.omega3,
                  initialValue: bodyTargets.omega3Target.toString(),
                  setValueFunction: (val) => bodyTargets.omega3Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.omega6,
                  initialValue: bodyTargets.omega6Target.toString(),
                  setValueFunction: (val) => bodyTargets.omega6Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.saturatedFat,
                  initialValue: bodyTargets.saturatedFatTarget.toString(),
                  setValueFunction: (val) => bodyTargets.saturatedFatTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.transfat,
                  initialValue: bodyTargets.transFatTarget.toString(),
                  setValueFunction: (val) => bodyTargets.transFatTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.cholesterol,
                  initialValue: bodyTargets.cholesterolTarget.toString(),
                  setValueFunction: (val) => bodyTargets.cholesterolTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
              ],
            ),
          ),
          ExpansionPanel(
            isExpanded: activePanelIndex == 4,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return CategoryListTileHeader(
                title: AppLocalizations.of(context)!.carbs,
                subtitle:
                    '${AppLocalizations.of(context)!.fiber}, ${AppLocalizations.of(context)!.sugar}, ${AppLocalizations.of(context)!.starch}, ...',
              );
            },
            body: Column(
              children: [
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.fiber,
                  initialValue: bodyTargets.fiberTarget.toString(),
                  setValueFunction: (val) => bodyTargets.fiberTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.sugar,
                  initialValue: bodyTargets.sugarTarget.toString(),
                  setValueFunction: (val) => bodyTargets.sugarTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.sugarAlcohol,
                  initialValue: bodyTargets.sugarAlcoholTarget.toString(),
                  setValueFunction: (val) => bodyTargets.sugarAlcoholTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.starch,
                  initialValue: bodyTargets.starchTarget.toString(),
                  setValueFunction: (val) => bodyTargets.starchTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
              ],
            ),
          ),
          ExpansionPanel(
            isExpanded: activePanelIndex == 5,
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return CategoryListTileHeader(
                title: AppLocalizations.of(context)!.other,
                subtitle:
                    '${AppLocalizations.of(context)!.water}, ${AppLocalizations.of(context)!.caffeine}, ${AppLocalizations.of(context)!.alcohol}',
              );
            },
            body: Column(
              children: [
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.water,
                  initialValue: bodyTargets.waterTarget.toString(),
                  setValueFunction: (val) => bodyTargets.waterTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'ml',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.caffeine,
                  initialValue: bodyTargets.caffeineTarget.toString(),
                  setValueFunction: (val) => bodyTargets.caffeineTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.alcohol,
                  initialValue: bodyTargets.alcoholTarget.toString(),
                  setValueFunction: (val) => bodyTargets.alcoholTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
