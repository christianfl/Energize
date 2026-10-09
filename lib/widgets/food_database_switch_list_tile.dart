import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_settings_provider.dart';
import '../services/food_database_bindings/food_database_binding_metadata.dart';
import '../utils/food_database_activation.dart';

/// SwitchListTile for managing food databases.
class FoodDatabaseSwitchListTile extends StatefulWidget {
  final FoodDatabaseBindingMetadata database;
  final Widget? subtitle;
  final ValueChanged<FoodDatabaseBindingMetadata>? onActivated;
  final bool? isCompact;

  const FoodDatabaseSwitchListTile({
    super.key,
    required this.database,
    this.subtitle,
    this.onActivated,
    this.isCompact,
  });

  @override
  State<FoodDatabaseSwitchListTile> createState() =>
      _FoodDatabaseSwitchListTileState();
}

class _FoodDatabaseSwitchListTileState
    extends State<FoodDatabaseSwitchListTile> {
  var _isChanging = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final activated = context.select<AppSettingsProvider, bool>(
      (settings) => settings.isFoodDatabaseActivated(widget.database.originId),
    );

    return SwitchListTile(
      dense: widget.isCompact,
      visualDensity: widget.isCompact == true ? VisualDensity.compact : null,
      title: Text(widget.database.displayName(localizations)),
      subtitle: widget.subtitle,
      value: activated,
      onChanged: _isChanging
          ? null
          : (value) async {
              setState(() => _isChanging = true);
              final changed = await setFoodDatabaseActivation(
                context,
                widget.database,
                value,
              );
              if (changed && value) widget.onActivated?.call(widget.database);
              if (mounted) setState(() => _isChanging = false);
            },
    );
  }
}
