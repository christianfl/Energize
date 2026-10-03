import 'package:flutter/material.dart';

/// Displays an icon with small hint text.
class HintText extends StatelessWidget {
  final IconData icon;
  final String text;

  const HintText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
