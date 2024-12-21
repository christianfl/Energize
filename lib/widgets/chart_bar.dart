import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/energize_theme.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double value;
  final double target;
  final String unit;
  final Color color;
  final int? maxFractionDigits;

  const ChartBar({
    super.key,
    required this.title,
    required this.value,
    required this.target,
    required this.unit,
    required this.color,
    this.maxFractionDigits,
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
    final double scaleFactor = _percentage / 100;

    if (scaleFactor > 1) {
      return 1;
    } else {
      return scaleFactor;
    }
  }

  /// Returns the fraction digits for the given number using some sanity.
  ///
  /// Returns fractionDigits dynamically based on value:
  ///
  /// x    if value is a whole number
  /// x    if value >= 100
  /// x.y  if value >= 10
  /// x.yz if value < 10
  ///
  /// Never returns more fraction digits than [maxFractionDigits] if set.
  /// Removes trailing 0 fraction digits.
  int _getFractionDigits(double number) {
    // Round number to fix issues with nearly whole numbers
    final roundedNumber = double.parse(number.toStringAsFixed(5));

    // This is generally the max fraction digits value to not clutter the UI
    int maxFractionDigits = 2;

    if (roundedNumber % 1 == 0 || roundedNumber >= 100) {
      // If value is a whole number or >= 100, do not show fraction digits
      maxFractionDigits = 0;
    } else if (value >= 10) {
      maxFractionDigits = 1;
    }

    // Set the lower value of both as maxFractionDigits
    maxFractionDigits = this.maxFractionDigits == null
        ? maxFractionDigits
        : min(this.maxFractionDigits!, maxFractionDigits);

    if (maxFractionDigits == 2) {
      // Omit trailing 0 if any
      if (double.tryParse(roundedNumber.toStringAsFixed(1)) ==
          double.tryParse(roundedNumber.toStringAsFixed(2))) {
        maxFractionDigits = 1;
      }
    }

    return maxFractionDigits;
  }

  /// If there are no targets return e.g. '30 g', otherwise e.g. '30 / 90 g'
  String get _fromTargetString {
    String trackedSum = value.toStringAsFixed(_getFractionDigits(value));

    if (target == 0) {
      trackedSum += ' $unit';
    } else {
      trackedSum +=
          ' / ${target.toStringAsFixed(_getFractionDigits(target))} $unit';
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
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20),
                minHeight: 12,
                color: color,
                backgroundColor: Theme.of(context).progressBar,
                value: _percentageBar,
              ),
              Center(
                child: Text(
                  _percentageString,
                  style: TextStyle(
                    height: 1.0,
                    color: Theme.of(context).onProgressBar,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
