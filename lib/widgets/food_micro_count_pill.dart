import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FoodMicroCountPill extends StatelessWidget {
  final int count;
  final double height;
  final bool showText;

  const FoodMicroCountPill(
    this.count, {
    super.key,
    required this.height,
    required this.showText,
  });

  String _getPillText(BuildContext context) {
    if (showText) {
      return '${AppLocalizations.of(context)!.nutrients}: $count';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          const Icon(
            Icons.biotech,
            color: Colors.amber,
          ),
          Text(
            _getPillText(context),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
