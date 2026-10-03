import 'package:flutter/material.dart';

/// Displays a nutrition target like: [label] [value] (incl. unit).
class NutritionTargetPreviewRow extends StatelessWidget {
  final String label;
  final String value;

  const NutritionTargetPreviewRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
