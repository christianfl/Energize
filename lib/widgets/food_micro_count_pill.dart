import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../theme/energize_theme.dart';

class FoodMicroCountPill extends StatelessWidget {
  final int count;
  final double? height;
  final bool showText;
  final bool hideBorder;
  final double? fontSize;
  final double? iconSize;

  const FoodMicroCountPill(
    this.count, {
    super.key,
    this.height,
    required this.showText,
    this.hideBorder = false,
    this.fontSize,
    this.iconSize,
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
      decoration: !hideBorder
          ? BoxDecoration(
              border: Border.all(
                color: Theme.of(context).extraHighlightColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Icon(
            Icons.biotech,
            color: Theme.of(context).extraHighlightColor,
            size: iconSize,
          ),
          Text(
            _getPillText(context),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: Theme.of(context).extraHighlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
