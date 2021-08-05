import 'package:flutter/material.dart';

import '../../models/food_tracked.dart';
import '../../widgets/micro_chart.dart';

class DetailedSummarySubPage extends StatelessWidget {
  static const routeName = '/tracking/detailed-summary';

  @override
  Widget build(BuildContext context) {
    final foods =
        ModalRoute.of(context)!.settings.arguments as List<FoodTracked>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed summary'),
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
