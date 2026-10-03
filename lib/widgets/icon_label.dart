import 'package:flutter/material.dart';

/// Displays a label with an optional leading icon.
class IconLabel extends StatelessWidget {
  final IconData? icon;
  final String label;

  const IconLabel({super.key, this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon != null
            ? Row(children: [Icon(icon, size: 16), const SizedBox(width: 4)])
            : Container(),
        Flexible(child: Text(label)),
      ],
    );
  }
}
