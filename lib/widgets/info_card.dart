import 'package:flutter/material.dart';

/// Displays an info message with an icon and configurable layout.
class InfoCard extends StatelessWidget {
  final String message;
  final Color? color;
  final Icon? icon;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment crossAxisAlignment;

  const InfoCard({
    super.key,
    required this.message,
    this.color,
    this.icon,
    this.padding = const EdgeInsets.all(8),
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  Icon get _icon {
    if (icon == null) {
      return const Icon(Icons.info);
    } else {
      return icon!;
    }
  }

  Color getColor(BuildContext context) {
    if (color == null) {
      return Theme.of(context).cardColor;
    } else {
      return color!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getColor(context),
      child: Padding(
        padding: padding,
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            _icon,
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }
}
