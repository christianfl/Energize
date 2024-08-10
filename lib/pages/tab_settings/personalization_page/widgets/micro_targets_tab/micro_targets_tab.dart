import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/app_settings.dart';
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
    final appSettings = Provider.of<AppSettings>(context);

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
                  initialValue: appSettings.vitaminATarget.toString(),
                  setValueFunction: (val) => appSettings.vitaminATarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB1,
                  initialValue: appSettings.vitaminB1Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB1Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB2,
                  initialValue: appSettings.vitaminB2Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB2Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB3,
                  initialValue: appSettings.vitaminB3Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB3Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB5,
                  initialValue: appSettings.vitaminB5Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB5Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB6,
                  initialValue: appSettings.vitaminB6Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB6Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB7,
                  initialValue: appSettings.vitaminB7Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB7Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB9,
                  initialValue: appSettings.vitaminB9Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB9Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminB12,
                  initialValue: appSettings.vitaminB12Target.toString(),
                  setValueFunction: (val) => appSettings.vitaminB12Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminC,
                  initialValue: appSettings.vitaminCTarget.toString(),
                  setValueFunction: (val) => appSettings.vitaminCTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminD,
                  initialValue: appSettings.vitaminDTarget.toString(),
                  setValueFunction: (val) => appSettings.vitaminDTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminE,
                  initialValue: appSettings.vitaminETarget.toString(),
                  setValueFunction: (val) => appSettings.vitaminETarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.vitaminK,
                  initialValue: appSettings.vitaminKTarget.toString(),
                  setValueFunction: (val) => appSettings.vitaminKTarget =
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
                  initialValue: appSettings.calciumTarget.toString(),
                  setValueFunction: (val) => appSettings.calciumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.chloride,
                  initialValue: appSettings.chlorideTarget.toString(),
                  setValueFunction: (val) => appSettings.chlorideTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.magnesium,
                  initialValue: appSettings.magnesiumTarget.toString(),
                  setValueFunction: (val) => appSettings.magnesiumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.phosphorous,
                  initialValue: appSettings.phosphorusTarget.toString(),
                  setValueFunction: (val) => appSettings.phosphorusTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.potassium,
                  initialValue: appSettings.potassiumTarget.toString(),
                  setValueFunction: (val) => appSettings.potassiumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.sodium,
                  initialValue: appSettings.sodiumTarget.toString(),
                  setValueFunction: (val) => appSettings.sodiumTarget =
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
                  initialValue: appSettings.chromiumTarget.toString(),
                  setValueFunction: (val) => appSettings.chromiumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.iron,
                  initialValue: appSettings.ironTarget.toString(),
                  setValueFunction: (val) => appSettings.ironTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.fluorine,
                  initialValue: appSettings.fluorineTarget.toString(),
                  setValueFunction: (val) => appSettings.fluorineTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.iodine,
                  initialValue: appSettings.iodineTarget.toString(),
                  setValueFunction: (val) => appSettings.iodineTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.copper,
                  initialValue: appSettings.copperTarget.toString(),
                  setValueFunction: (val) => appSettings.copperTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.manganese,
                  initialValue: appSettings.manganeseTarget.toString(),
                  setValueFunction: (val) => appSettings.manganeseTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.molybdenum,
                  initialValue: appSettings.molybdenumTarget.toString(),
                  setValueFunction: (val) => appSettings.molybdenumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.selenium,
                  initialValue: appSettings.seleniumTarget.toString(),
                  setValueFunction: (val) => appSettings.seleniumTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'μg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.zinc,
                  initialValue: appSettings.zincTarget.toString(),
                  setValueFunction: (val) => appSettings.zincTarget =
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
                  initialValue: appSettings.monounsaturatedFatTarget.toString(),
                  setValueFunction: (val) =>
                      appSettings.monounsaturatedFatTarget =
                          val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.polyunsaturatedFat,
                  initialValue: appSettings.polyunsaturatedFatTarget.toString(),
                  setValueFunction: (val) =>
                      appSettings.polyunsaturatedFatTarget =
                          val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.omega3,
                  initialValue: appSettings.omega3Target.toString(),
                  setValueFunction: (val) => appSettings.omega3Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.omega6,
                  initialValue: appSettings.omega6Target.toString(),
                  setValueFunction: (val) => appSettings.omega6Target =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.saturatedFat,
                  initialValue: appSettings.saturatedFatTarget.toString(),
                  setValueFunction: (val) => appSettings.saturatedFatTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.transfat,
                  initialValue: appSettings.transFatTarget.toString(),
                  setValueFunction: (val) => appSettings.transFatTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.cholesterol,
                  initialValue: appSettings.cholesterolTarget.toString(),
                  setValueFunction: (val) => appSettings.cholesterolTarget =
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
                  initialValue: appSettings.fiberTarget.toString(),
                  setValueFunction: (val) => appSettings.fiberTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.sugar,
                  initialValue: appSettings.sugarTarget.toString(),
                  setValueFunction: (val) => appSettings.sugarTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.sugarAlcohol,
                  initialValue: appSettings.sugarAlcoholTarget.toString(),
                  setValueFunction: (val) => appSettings.sugarAlcoholTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'g',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.starch,
                  initialValue: appSettings.starchTarget.toString(),
                  setValueFunction: (val) => appSettings.starchTarget =
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
                  initialValue: appSettings.waterTarget.toString(),
                  setValueFunction: (val) => appSettings.waterTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'ml',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.caffeine,
                  initialValue: appSettings.caffeineTarget.toString(),
                  setValueFunction: (val) => appSettings.caffeineTarget =
                      val == '' ? 0 : double.parse(val),
                  unit: 'mg',
                ),
                _getCustomListTile(
                  title: AppLocalizations.of(context)!.alcohol,
                  initialValue: appSettings.alcoholTarget.toString(),
                  setValueFunction: (val) => appSettings.alcoholTarget =
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
