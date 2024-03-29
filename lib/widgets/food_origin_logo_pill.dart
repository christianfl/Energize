import 'package:flutter/material.dart';

import '../pages/tab_food/food_page.dart';
import '../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../services/food_database_bindings/usda/usda_binding.dart';

class FoodOriginLogoPill extends StatelessWidget {
  final String foodOrigin;
  final double? width;
  final double? height;
  final double? fontSize;

  const FoodOriginLogoPill(
    this.foodOrigin, {
    super.key,
    this.width,
    this.height,
    this.fontSize,
  });

  String? get _assetUrl {
    switch (foodOrigin) {
      case OpenFoodFactsBinding.originName:
        return OpenFoodFactsBinding.imageUrl;
      case SwissFoodCompositionDatabaseBinding.originName:
        return SwissFoodCompositionDatabaseBinding.imageUrl;
      case 'SNDB':
        // SNDB was renamed but it's kept here because of old tracked food...
        return SwissFoodCompositionDatabaseBinding.imageUrl;
    }

    return null;
  }

  Color? _getColor(BuildContext context) {
    switch (foodOrigin) {
      case USDABinding.originName:
        return const Color(0xFF004785);
      case FoodPage.originName:
        return Theme.of(context).colorScheme.secondary;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _assetUrl != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: width,
              height: height,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(_assetUrl!),
              ),
            ),
          )
        : Container(
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: _getColor(context) ?? const Color(0xFF000000),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(6),
            child: Center(
              child: Text(
                foodOrigin,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _getColor(context),
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
