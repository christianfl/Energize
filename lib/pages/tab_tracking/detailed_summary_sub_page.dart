import 'package:flutter/material.dart';

import '../../config/layout_config.dart';
import '../../l10n/app_localizations.dart';
import '../../models/food/food_tracked.dart';
import '../../widgets/micro_chart.dart';
import '../../widgets/page_scaffold.dart';

class DetailedSummarySubPage extends StatelessWidget {
  static const routeName = '/tracking/detailed-summary';

  const DetailedSummarySubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foods =
        ModalRoute.of(context)!.settings.arguments as List<FoodTracked>;

    return PageScaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.detailedSummary),
      ),
      body: SingleChildScrollView(
        padding: pagePadding,
        child: MicroChart(foods, showZero: true, scrollable: true),
      ),
    );
  }
}
