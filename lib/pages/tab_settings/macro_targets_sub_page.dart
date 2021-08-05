import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_settings.dart';

class MacroTargetsSubPage extends StatelessWidget {
  static const routeName = '/settings/targets';

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Energy and macronutrients targets'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          ListTile(
            leading: const Icon(Icons.bolt),
            title: TextFormField(
              initialValue: appSettings.caloriesTarget.toString(),
              onChanged: (val) => appSettings.caloriesTarget =
                  val == '' ? 0 : double.parse(val),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                suffixText: 'kcal',
                labelText: 'Energy',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: TextFormField(
              initialValue: appSettings.proteinTarget.toString(),
              onChanged: (val) =>
                  appSettings.proteinTarget = val == '' ? 0 : double.parse(val),
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                suffixText: 'g',
                labelText: 'Protein',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: TextFormField(
              initialValue: appSettings.carbsTarget.toString(),
              onChanged: (val) =>
                  appSettings.carbsTarget = val == '' ? 0 : double.parse(val),
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                suffixText: 'g',
                labelText: 'Carbs',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bakery_dining),
            title: TextFormField(
              initialValue: appSettings.fatTarget.toString(),
              onChanged: (val) =>
                  appSettings.fatTarget = val == '' ? 0 : double.parse(val),
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                suffixText: 'g',
                labelText: 'Fat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
