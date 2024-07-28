import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/food/food_tracked.dart';
import '../../widgets/micro_chart.dart';

class DetailedSummarySubPage extends StatelessWidget {
  static const routeName = '/tracking/detailed-summary';

  const DetailedSummarySubPage({super.key});

  /// Gets called when a specific ChartBar gets tapped
  _showTrackedFoodsByNutrient(BuildContext context, String nutrient) {
    // Retrieve list of foods of this specific day
    final foods =
        ModalRoute.of(context)!.settings.arguments as List<FoodTracked>;

    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(nutrient),
          content: _getTrackedFoodsByNutrient(context, foods, nutrient),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
            ),
          ],
        );
      },
    );
  }

  /// TODO
  Widget _getTrackedFoodsByNutrient(
    BuildContext context,
    List<FoodTracked> foods,
    String nutrient,
  ) {
    final List<FoodTracked> sortedFoodsByNutrient = List.from(foods);

    if (nutrient == AppLocalizations.of(context)!.vitaminB12) {
      // Sort by: hightest --> lowest --> 0 --> null
      sortedFoodsByNutrient.sort((s2, s1) {
        if (s1.vitaminB12 == null && s2.vitaminB12 == null) {
          return 0;
        } else if (s1.vitaminB12 == null) {
          return -1;
        } else if (s2.vitaminB12 == null) {
          return 1;
        } else {
          return s1.vitaminB12!.compareTo(s2.vitaminB12!);
        }
      });

      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tracked food'),
                Text('Amount per g or ml'),
              ],
            ),
            const Divider(),
            ListView.separated(
              itemCount: sortedFoodsByNutrient.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                final food = sortedFoodsByNutrient[index];
                return ListTile(
                  dense: true,
                  title: Text(
                    food.title,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    '${food.amount.toStringAsFixed(0)} g',
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${food.vitaminB12 ?? 0.0} μg / 100'),
                      Text(
                        '${food.vitaminB12 != null ? food.vitaminB12! * food.amount / 100 : 0.0} μg / ${food.amount.toStringAsFixed(0)}',
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ],
        ),
      );
    } else {
      return Text('This nutrient is not implemented yet!');
    }
  }

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
            onChartBarTap: _showTrackedFoodsByNutrient,
          ),
        ),
      ),
    );
  }
}
