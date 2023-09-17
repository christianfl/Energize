import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double value;
  final double target;
  final String unit;
  final Color color;
  final int? decimalPlaces;

  const ChartBar({
    Key? key,
    required this.title,
    required this.value,
    required this.target,
    required this.unit,
    required this.color,
    this.decimalPlaces,
  }) : super(key: key);

  double get _percentage {
    if (target > 0) {
      return value / target * 100;
    } else {
      return 100;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(title)),
            Expanded(
              child: Center(
                child: Text('${_percentage.toStringAsFixed(0)} %'),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                    '${value.toStringAsFixed(_valueDecimalPlaces)} / ${target.toStringAsFixed(_valueDecimalPlaces)} $unit'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Container(
          height: 10,
          margin: const EdgeInsets.only(bottom: 6),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                widthFactor: _percentageBar,
                child: Container(
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
