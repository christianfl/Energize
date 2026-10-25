import 'package:flutter/material.dart';

/// Group of preferences which are loosely related.
///
/// They:
/// - share one surface
/// - have subtle separators between rows.
class SettingsGroup extends StatelessWidget {
  final List<Widget> children;

  const SettingsGroup({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final childrenWithDividers = <Widget>[];

    for (final child in children) {
      if (childrenWithDividers.isNotEmpty) {
        childrenWithDividers.add(const Divider(height: 1.0, thickness: 0.5));
      }
      childrenWithDividers.add(child);
    }

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0.0,
      color: theme.brightness == Brightness.light
          ? theme.colorScheme.surfaceContainerLowest
          : theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withAlpha(120),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: childrenWithDividers,
      ),
    );
  }
}
