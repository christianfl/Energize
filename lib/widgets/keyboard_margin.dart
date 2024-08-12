import 'package:flutter/material.dart';

class KeyboardMargin extends StatelessWidget {
  /// Makes its child widget hover above the keyboard.
  const KeyboardMargin({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: child,
    );
  }
}
