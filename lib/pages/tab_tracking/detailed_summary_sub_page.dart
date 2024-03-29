import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/food/food_tracked.dart';
import '../../widgets/micro_chart.dart';

class DetailedSummarySubPage extends StatelessWidget {
  static const routeName = '/tracking/detailed-summary';

  const DetailedSummarySubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foods =
        ModalRoute.of(context)!.settings.arguments as List<FoodTracked>;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.detailedSummary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MicroChart(
            foods,
            showZero: true,
            scrollable: true,
          ),
        ),
      ),
    );
  }
}
