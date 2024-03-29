import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String message;
  final Color? color;
  final Icon? icon;

  const InfoCard({
    super.key,
    required this.message,
    this.color,
    this.icon,
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
