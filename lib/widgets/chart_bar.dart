import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double value;
  final double target;
  final String unit;
  final Color color;
  final int? decimalPlaces;
  final Function(BuildContext, String)? onTap;

  const ChartBar({
    super.key,
    required this.title,
    required this.value,
    required this.target,
    required this.unit,
    required this.color,
    this.decimalPlaces,
    this.onTap,
  });

  double get _percentage {
    if (target > 0) {
      return value / target * 100;
    } else {
      return 0;
    }
  }

  /// Return 'x %' or an empty string in case of 0 %
  String get _percentageString {
    if (_percentage > 0) {
      return '${_percentage.toStringAsFixed(0)} %';
    } else {
      return '';
    }
  }

  double get _percentageBar {
    double scaleFactor = _percentage / 100;

    if (scaleFactor > 1) {
      return 1;
    } else {
      return scaleFactor;
    }
  }

  int get _valueDecimalPlaces {
    if (decimalPlaces == null) return 1;
    return decimalPlaces!;
  }

  /// If there are no targets return e.g. '30 g', otherwise e.g. '30 / 90 g'
  String get _fromTargetString {
    String trackedSum = value.toStringAsFixed(_valueDecimalPlaces);

    if (target == 0) {
      trackedSum += ' $unit';
    } else {
      trackedSum += ' / ${target.toStringAsFixed(_valueDecimalPlaces)} $unit';
    }

    return trackedSum;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onTap: onTap != null ? () => onTap!(context, title) : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          8.0,
          4.0,
          8.0,
          0.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(title)),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(_fromTargetString),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Container(
              height: 12,
              margin: const EdgeInsets.only(bottom: 6),
              child: Stack(
                children: [
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(20),
                    minHeight: 12,
                    color: color,
                    backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                    value: _percentageBar,
                  ),
                  Center(
                    child: Text(
                      _percentageString,
                      style: const TextStyle(
                        height: 1.0,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
