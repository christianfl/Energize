import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/food.dart';
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

  FoodListItem(this.food,
      {required this.onTapCallback,
      this.quickAddFoodCallback,
      this.getQuickAddFoodAmountCallback,
      required this.height,
      required this.pillHeight,
      this.hideOrigin});

  @override
  Widget build(BuildContext context) {
    final trackedFoodProvider = Provider.of<TrackedFoodProvider>(context);

    return Card(
      child: InkWell(
        onTap: () => onTapCallback(context, food),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          height: height,
          child: Row(
            children: <Widget>[
              if (food.imageThumbnailUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Image.network(
                    food.imageThumbnailUrl!,
                    width: height,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Container(
                  width: height,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: height,
                    color: Colors.black,
                  ),
                ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    food.calories != null
                        ? Text(
                            '${food.calories} kcal / 100 g',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FoodMicroCountPill(
                food.nutrientCount,
                height: pillHeight,
                showText: false,
              ),
              SizedBox(
                width: 8,
              ),
              hideOrigin == null || hideOrigin == false
                  ? FoodOriginLogoPill(
                      food.origin,
                      width: 50,
                      height: pillHeight,
                    )
                  : Container(),
              this.quickAddFoodCallback != null
                  ? GestureDetector(
                      onTap: () =>
                          quickAddFoodCallback!(food, trackedFoodProvider),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add),
                            Text(
                              '${((getQuickAddFoodAmountCallback!(food) as double).toStringAsFixed(0))} g',
                              style: TextStyle(
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
