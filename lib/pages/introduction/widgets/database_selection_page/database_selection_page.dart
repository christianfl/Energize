import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../services/food_database_bindings/food_database_binding_metadata.dart';
import '../../../../services/food_database_bindings/food_databases.dart';
import '../../../../widgets/food_database_switch_list_tile.dart';
import '../../../../widgets/hint_text.dart';
import '../../../../widgets/icon_label.dart';
import '../introduction_page_frame.dart';

/// Page shows food databases and let users activate them.
class DatabaseSelectionPage extends StatelessWidget {
  final ValueChanged<FoodDatabaseBindingMetadata> onDatabaseActivated;

  const DatabaseSelectionPage({super.key, required this.onDatabaseActivated});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return IntroductionPageFrame(
      icon: Icons.storage_outlined,
      title: localizations.selectFoodDatabases,
      subtitle: localizations.selectFoodDatabasesHint,
      children: [
        for (final binding in foodDatabases)
          Card(
            clipBehavior: Clip.antiAlias,
            child: FoodDatabaseSwitchListTile(
              database: binding.metadata,
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 6,
                  children: [
                    IconLabel(
                      icon: binding.metadata.isOnline
                          ? Icons.cloud_outlined
                          : Icons.smartphone_outlined,
                      label: binding.metadata.availabilityLabel(localizations),
                    ),
                    IconLabel(
                      icon: Icons.language,
                      label: binding.metadata.languagesLabel(localizations),
                    ),
                    IconLabel(
                      label: binding.metadata.contentsLabel(localizations),
                    ),
                  ],
                ),
              ),
              onActivated: onDatabaseActivated,
              isCompact: true,
            ),
          ),
        const SizedBox(height: 8),
        HintText(
          icon: Icons.language,
          text: localizations.databaseLanguageFallbackHint,
        ),
      ],
    );
  }
}
