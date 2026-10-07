import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../pages/tab_custom_food/custom_food_page.dart';
import '../services/food_database_bindings/food_databases.dart';

class FoodOriginLogoPill extends StatelessWidget {
  final String foodOrigin;
  final double? width;
  final double? height;
  final double? fontSize;
  final Function()? onTapCallback;
  final bool isConstrained;

  const FoodOriginLogoPill(
    this.foodOrigin, {
    super.key,
    this.width,
    this.height,
    this.fontSize,
    this.onTapCallback,
    this.isConstrained = true,
  });

  String? get _assetUrl {
    if (foodOrigin == CustomFoodPage.originName) {
      return CustomFoodPage.imageUrl;
    }

    for (final database in foodDatabases) {
      final metadata = database.metadata;
      if (metadata.originName == foodOrigin ||
          metadata.originAliases.contains(foodOrigin)) {
        return metadata.imageUrl;
      }
    }

    return null;
  }

  Color? _getColor(BuildContext context) {
    switch (foodOrigin) {
      case CustomFoodPage.originName:
        return Theme.of(context).colorScheme.secondary;
    }

    return Theme.of(context).textTheme.bodyMedium?.color;
  }

  @override
  Widget build(BuildContext context) {
    final assetUrl = _assetUrl;
    return assetUrl != null
        ? IconButton(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            constraints: BoxConstraints(maxHeight: height ?? double.infinity),
            onPressed: onTapCallback,
            icon: Image.asset(assetUrl),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              disabledBackgroundColor: Colors.white,
            ),
          )
        : TextButton(
            onPressed: onTapCallback,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              disabledBackgroundColor: Colors.white,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isConstrained ? 110 : double.infinity,
              ),
              child: Text(
                foodOrigin == CustomFoodPage.originName
                    ? AppLocalizations.of(context)!.customFood
                    : foodOrigin,
                style: TextStyle(
                  color: _getColor(context),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
  }
}
