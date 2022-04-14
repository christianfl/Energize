import 'package:json_annotation/json_annotation.dart';

import 'food/food.dart';
import 'food/food_tracked.dart';

part 'backup_data.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class BackupData {
  final List<Food>? customFood;
  final List<FoodTracked>? trackedFood;
  final List<DateTime>? completedDays;

  BackupData({
    this.customFood,
    this.trackedFood,
    this.completedDays,
  });

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory BackupData.fromJson(Map<String, dynamic> json) =>
      _$BackupDataFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BackupDataToJson(this);
}
