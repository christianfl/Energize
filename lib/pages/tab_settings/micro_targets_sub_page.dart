import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_settings.dart';

class MicroTargetsSubPage extends StatefulWidget {
  static const routeName = '/settings/micro-targets';

  @override
  _MicroTargetsSubPageState createState() => _MicroTargetsSubPageState();
}

class _MicroTargetsSubPageState extends State<MicroTargetsSubPage> {
  var activePanelIndex = -1;
  static const double _formFieldWidth = 90;
  static const double _formFieldHeight = 45;

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.micronutrientsTargets),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 0:
                  {
                    appSettings.resetMicros();
                    // TODO: Issue #2: Remove after personalized micros have been added
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).errorColor,
                        content: Text(
                            'Restart the app in order to let the changes take effekt!'),
                      ),
                    );
                  }
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Reset to defaults"),
                value: 0,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
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
                  return ListTile(
                    title: Text('Vitamins'),
                    subtitle: Text('Vitamin A – K'),
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Vitamin A'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminATarget.toString(),
                          onChanged: (val) => appSettings.vitaminATarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B1'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB1Target.toString(),
                          onChanged: (val) => appSettings.vitaminB1Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B2'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB2Target.toString(),
                          onChanged: (val) => appSettings.vitaminB2Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B3'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB3Target.toString(),
                          onChanged: (val) => appSettings.vitaminB3Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B5'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB5Target.toString(),
                          onChanged: (val) => appSettings.vitaminB5Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B6'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB6Target.toString(),
                          onChanged: (val) => appSettings.vitaminB6Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B7'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB7Target.toString(),
                          onChanged: (val) => appSettings.vitaminB7Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B9'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB9Target.toString(),
                          onChanged: (val) => appSettings.vitaminB9Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin B12'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminB12Target.toString(),
                          onChanged: (val) => appSettings.vitaminB2Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin C'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminCTarget.toString(),
                          onChanged: (val) => appSettings.vitaminCTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin D'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminDTarget.toString(),
                          onChanged: (val) => appSettings.vitaminDTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin E'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminETarget.toString(),
                          onChanged: (val) => appSettings.vitaminETarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Vitamin K'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.vitaminKTarget.toString(),
                          onChanged: (val) => appSettings.vitaminKTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionPanel(
                isExpanded: activePanelIndex == 1,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('Major minerals'),
                    subtitle: Text('Calcium – Sodium'),
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Calcium'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.calciumTarget.toString(),
                          onChanged: (val) => appSettings.calciumTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Chloride'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.chlorideTarget.toString(),
                          onChanged: (val) => appSettings.chlorideTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Magnesium'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.magnesiumTarget.toString(),
                          onChanged: (val) => appSettings.magnesiumTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Phosphorus'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.phosphorusTarget.toString(),
                          onChanged: (val) => appSettings.phosphorusTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Potassium'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.potassiumTarget.toString(),
                          onChanged: (val) => appSettings.potassiumTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Sodium'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.sodiumTarget.toString(),
                          onChanged: (val) => appSettings.sodiumTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionPanel(
                isExpanded: activePanelIndex == 2,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('Trace elements'),
                    subtitle: Text('Chromium – Zinc'),
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Chromium'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.chromiumTarget.toString(),
                          onChanged: (val) => appSettings.chromiumTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Iron'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.ironTarget.toString(),
                          onChanged: (val) => appSettings.ironTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Fluorine'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.fluorineTarget.toString(),
                          onChanged: (val) => appSettings.fluorineTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Iodine'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.iodineTarget.toString(),
                          onChanged: (val) => appSettings.iodineTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Copper'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.copperTarget.toString(),
                          onChanged: (val) => appSettings.copperTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Manganese'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.manganeseTarget.toString(),
                          onChanged: (val) => appSettings.manganeseTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Molybdenum'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.molybdenumTarget.toString(),
                          onChanged: (val) => appSettings.molybdenumTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Selenium'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.seleniumTarget.toString(),
                          onChanged: (val) => appSettings.seleniumTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'μg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Zinc'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.zincTarget.toString(),
                          onChanged: (val) => appSettings.zincTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionPanel(
                isExpanded: activePanelIndex == 3,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('Fats'),
                    subtitle: Text('Different kind of fats'),
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Monounsaturated fat'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue:
                              appSettings.monounsaturatedFatTarget.toString(),
                          onChanged: (val) =>
                              appSettings.monounsaturatedFatTarget =
                                  val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Polyunsaturated fat'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue:
                              appSettings.polyunsaturatedFatTarget.toString(),
                          onChanged: (val) =>
                              appSettings.polyunsaturatedFatTarget =
                                  val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Omega 3'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.omega3Target.toString(),
                          onChanged: (val) => appSettings.omega3Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Omega 6'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.omega6Target.toString(),
                          onChanged: (val) => appSettings.omega6Target =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Saturated fat'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue:
                              appSettings.saturatedFatTarget.toString(),
                          onChanged: (val) => appSettings.saturatedFatTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Transfat'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.transFatTarget.toString(),
                          onChanged: (val) => appSettings.transFatTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Cholesterol'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue:
                              appSettings.cholesterolTarget.toString(),
                          onChanged: (val) => appSettings.cholesterolTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionPanel(
                isExpanded: activePanelIndex == 4,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('Carbs'),
                    subtitle: Text('Fiber, sugar, starch, etc.'),
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Fiber'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.fiberTarget.toString(),
                          onChanged: (val) => appSettings.fiberTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Sugar'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.sugarTarget.toString(),
                          onChanged: (val) => appSettings.sugarTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Sugar alcohol'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue:
                              appSettings.sugarAlcoholTarget.toString(),
                          onChanged: (val) => appSettings.sugarAlcoholTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Starch'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.starchTarget.toString(),
                          onChanged: (val) => appSettings.starchTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionPanel(
                isExpanded: activePanelIndex == 5,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('Other'),
                    subtitle: Text('Water, caffeine, alcohol'),
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text('Water'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.waterTarget.toString(),
                          onChanged: (val) => appSettings.waterTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'ml',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Caffeine'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.caffeineTarget.toString(),
                          onChanged: (val) => appSettings.caffeineTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'mg',
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Alcohol'),
                      trailing: Container(
                        width: _formFieldWidth,
                        height: _formFieldHeight,
                        child: TextFormField(
                          initialValue: appSettings.alcoholTarget.toString(),
                          onChanged: (val) => appSettings.alcoholTarget =
                              val == '' ? 0 : double.parse(val),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            suffixText: 'g',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
