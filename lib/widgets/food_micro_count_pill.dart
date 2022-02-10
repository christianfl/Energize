import 'package:flutter/material.dart';

class FoodMicroCountPill extends StatelessWidget {
  final int count;
  final double height;
  final bool showText;

  FoodMicroCountPill(this.count,
      {required this.height, required this.showText});

  String get _pillText {
    if (showText) {
      return 'Nutrients: $count';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).highlightColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Icon(
            Icons.biotech,
            color: Theme.of(context).highlightColor,
          ),
          Text(
            _pillText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
