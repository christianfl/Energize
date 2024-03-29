import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double value;
  final double target;
  final String unit;
  final Color color;
  final int? decimalPlaces;

  const ChartBar({
    super.key,
    required this.title,
    required this.value,
    required this.target,
    required this.unit,
    required this.color,
    this.decimalPlaces,
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
    return Column(
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
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                widthFactor: _percentageBar,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
    );
  }
}
