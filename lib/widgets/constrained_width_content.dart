import 'package:flutter/material.dart';

import '../config/layout_config.dart';

/// For rendering content within a constrained width.
class ConstrainedWidthContent extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const ConstrainedWidthContent({
    super.key,
    required this.child,
    this.maxWidth = defaultMaxContentWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SizedBox(width: double.infinity, child: child),
      ),
    );
  }
}
