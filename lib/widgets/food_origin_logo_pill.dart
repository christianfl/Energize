import 'package:flutter/material.dart';

import '../../models/food.dart';

class FoodOriginLogoPill extends StatelessWidget {
  final String foodOrigin;
  final double width;
  final double height;

  FoodOriginLogoPill(this.foodOrigin,
      {required this.width, required this.height});

  String? get _url {
    switch (foodOrigin) {
      case 'OFF':
        {
          return Food.openFoodFactsImageUrl;
        }
      case 'SNDB':
        {
          return Food.swissNutritionDatabaseImageUrl;
        }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _url != null
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    _url!,
                  ),
                )),
          )
        : Container(
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.all(6),
            child: Text(
              foodOrigin,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
          );
  }
}
