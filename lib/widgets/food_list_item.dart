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
              foregroundImage: NetworkImage(
                food.imageThumbnailUrl!,
              ),
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
      title: Text(
        food.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: (food.calories != null)
          ? Text(
              '${food.calories?.toStringAsFixed(0)} kcal / 100 g',
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : const Text(''),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FoodMicroCountPill(
            food.nutrientCount,
            height: pillHeight,
            showText: false,
          ),
          const SizedBox(width: 8),
          hideOrigin == null || hideOrigin == false
              ? FoodOriginLogoPill(
                  food.origin,
                  width: 50,
                  height: pillHeight,
                )
              : Container(),
          quickAddFoodCallback != null
              ? GestureDetector(
                  onTap: () => quickAddFoodCallback!(food, trackedFoodProvider),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add),
                        Text(
                          '${((getQuickAddFoodAmountCallback!(food) as double).toStringAsFixed(0))} g',
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
