import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../services/nutrition_targets_calculator/calculated_nutrition_targets.dart';
import 'nutrition_target_preview_row.dart';

/// Previews calculated nutrition targets and returns whether to apply them.
class NutritionTargetsPreviewDialog extends StatelessWidget {
  final CalculatedNutritionTargets targets;

  const NutritionTargetsPreviewDialog({super.key, required this.targets});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(localizations.calculatedNutritionTargets),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.introTargetsSettingsHint),
            const SizedBox(height: 12),
            NutritionTargetPreviewRow(
              label: localizations.energy,
              value: '${targets.calories} kcal',
            ),
            NutritionTargetPreviewRow(
              label: localizations.protein,
              value: '${targets.protein} g',
            ),
            NutritionTargetPreviewRow(
              label: localizations.carbs,
              value: '${targets.carbs} g',
            ),
            NutritionTargetPreviewRow(
              label: localizations.fat,
              value: '${targets.fat} g',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(localizations.apply),
        ),
      ],
    );
  }
}
