import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../pages/tab_food/food_page.dart';
import '../services/food_database_bindings/open_food_facts/open_food_facts_binding.dart';
import '../services/food_database_bindings/swiss_food_composition_database/swiss_food_composition_database_binding.dart';
import '../services/food_database_bindings/usda/usda_binding.dart';
import '../theme/energize_theme.dart';

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
        return Theme.of(context).usdaColor;
      case FoodPage.originName:
        return Theme.of(context).colorScheme.secondary;
    }

    return Theme.of(context).textTheme.bodyMedium?.color;
  }

  @override
  Widget build(BuildContext context) {
    return _assetUrl != null
        ? IconButton(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            constraints: BoxConstraints(maxHeight: height ?? double.infinity),
            onPressed: onTapCallback,
            icon: Image.asset(
              _assetUrl!,
            ),
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
                foodOrigin == FoodPage.originName
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
