import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/calculation_tab/calculation_tab.dart';
import 'widgets/energy_distribution_tab/energy_distribution_tab.dart';
import 'widgets/micro_targets_tab/micro_targets_tab.dart';

class NutritionTargetsPage extends StatefulWidget {
  static const routeName = '/settings/personalization';

  const NutritionTargetsPage({super.key});

  @override
  NutritionTargetsPageState createState() => NutritionTargetsPageState();
}

class NutritionTargetsPageState extends State<NutritionTargetsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.yourPersonalNutritionNeeds),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: const Icon(Icons.calculate),
                text: AppLocalizations.of(context)!.calculate,
              ),
              Tab(
                icon: const Icon(Icons.bolt),
                text: AppLocalizations.of(context)!.energyDistribution,
              ),
              Tab(
                icon: const Icon(Icons.biotech),
                text: AppLocalizations.of(context)!.micronutrients,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CalculationTab(),
            EnergyDistributionTab(),
            MicroTargetsTab(),
          ],
        ),
      ),
    );
  }
}
