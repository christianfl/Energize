import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/tracked_food_provider.dart';
import '../../widgets/food_micro_count_pill.dart';
import '../../widgets/food_origin_logo_pill.dart';
import '../models/food/food.dart';
import '../theme/energize_theme.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final Function onTapCallback;
  final Function? quickAddFoodCallback;
  final Function? getQuickAddFoodAmountCallback;
  final double height;
  final double pillHeight;
  final bool? hideOrigin;

  const FoodListItem(
    this.food, {
    super.key,
    required this.onTapCallback,
    this.quickAddFoodCallback,
    this.getQuickAddFoodAmountCallback,
    required this.height,
    required this.pillHeight,
    this.hideOrigin,
  });

  /// Returns the String shown in the TextButton for quickly adding Food.
  ///
  /// In case the amount is very small, fractions are used which saves space.
  /// The fractions use approximate ranges.
  ///
  /// Returns e.g. "½ Por." or "300 g".
  String _getQuickAddFoodAmountString(BuildContext context) {
    final double amount = getQuickAddFoodAmountCallback!(food).amount;
    String amountString = amount.toStringAsFixed(0);

    if (amount == 0) {
      amountString = '0';
    } else if (amount <= 0.15) {
      amountString = '⅒';
    } else if (amount <= 0.23) {
      amountString = '⅕';
    } else if (amount <= 0.29) {
      amountString = '¼';
    } else if (amount <= 0.41) {
      amountString = '⅓';
    } else if (amount <= 0.58) {
      amountString = '½';
    } else if (amount <= 0.70) {
      amountString = '⅔';
    } else if (amount <= 0.77) {
      amountString = '¾';
    } else if (amount <= 0.9) {
      amountString = '⅘';
    }

    final String? selectedServingSize = getQuickAddFoodAmountCallback!(
      food,
    ).selectedServingSize;
    final String gOrLocalizedServingSize = selectedServingSize != null
        ? Food.getLocalizedServingSizeName(context, selectedServingSize)
        : 'g';

    return '$amountString $gOrLocalizedServingSize';
  }

  @override
  Widget build(BuildContext context) {
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(context);

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 16.0, right: 8.0),
      onTap: () => onTapCallback(context, food),
      leading: (food.imageThumbnailUrl != null)
          ? CircleAvatar(
              radius: height / 2,
              foregroundImage: NetworkImage(food.imageThumbnailUrl!),
            )
          : CircleAvatar(
              backgroundColor: Theme.of(context).noPictureBackground,
              radius: height / 2,
              child: Icon(
                Icons.image_not_supported_outlined,
                size: height * 0.8,
                color: Theme.of(context).onNoPictureBackground,
              ),
            ),
      title: Text(food.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${(food.calories ?? 0).toStringAsFixed(0)} kcal / 100 g',
            style: const TextStyle(fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          FoodMicroCountPill(
            food.nutrientCount,
            showText: false,
            hideBorder: hideOrigin == null || hideOrigin == false,
            fontSize: hideOrigin == null || hideOrigin == false ? 12 : 14,
            iconSize: hideOrigin == null || hideOrigin == false ? 16 : null,
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hideOrigin == null || hideOrigin == false)
            FoodOriginLogoPill(food.origin, width: 50, height: pillHeight),
          if (quickAddFoodCallback != null)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: TextButton(
                onPressed: () =>
                    quickAddFoodCallback!(food, trackedFoodProvider),
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.only(left: 2.0, right: 6.0),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    Text(
                      _getQuickAddFoodAmountString(context),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
