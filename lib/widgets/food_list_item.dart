import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food/food.dart';
import '../../providers/tracked_food_provider.dart';
import '../../widgets/food_micro_count_pill.dart';
import '../../widgets/food_origin_logo_pill.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final Function onTapCallback;
  final Function? quickAddFoodCallback;
  final Function? getQuickAddFoodAmountCallback;
  final double height;
  final double pillHeight;
  final bool? hideOrigin;

  const FoodListItem(this.food,
      {super.key,
      required this.onTapCallback,
      this.quickAddFoodCallback,
      this.getQuickAddFoodAmountCallback,
      required this.height,
      required this.pillHeight,
      this.hideOrigin});

  @override
  Widget build(BuildContext context) {
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
      ),
      child: InkWell(
        onTap: () => onTapCallback(context, food),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        child: SizedBox(
          height: height,
          child: Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 0.5, top: 3.0, bottom: 3.0),
                child: (food.imageThumbnailUrl != null)
                    ? CircleAvatar(
                        radius: height / 2,
                        foregroundImage: NetworkImage(
                          food.imageThumbnailUrl!,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: height / 2,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: height * 0.8,
                          color: Colors.white,
                        ),
                      ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    food.calories != null
                        ? Text(
                            '${food.calories} kcal / 100 g',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              const SizedBox(width: 10),
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
                      onTap: () =>
                          quickAddFoodCallback!(food, trackedFoodProvider),
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
        ),
      ),
    );
  }
}
