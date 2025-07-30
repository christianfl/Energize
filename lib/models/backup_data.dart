import 'package:json_annotation/json_annotation.dart';

import 'app_settings.dart';
import 'food/food.dart';
import 'food/food_tracked.dart';
import 'person/body_targets.dart';

part 'backup_data.g.dart';

@JsonSerializable(
  explicitToJson: true, // Ensure toJson() of nested objects is called
  includeIfNull: false, // Removes null fields at the top level
)
class BackupData {
  final List<Food>? customFood; // Don't rename without adapting toJson
  final List<FoodTracked>? trackedFood; // Don't rename without adapting toJson
  final List<DateTime>? completedDays;
  final AppSettings? appSettings;
  final BodyTargets? bodyTargets;

  BackupData({
    this.customFood,
    this.trackedFood,
    this.completedDays,
    this.appSettings,
    this.bodyTargets,
  });

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory BackupData.fromJson(Map<String, dynamic> json) =>
      _$BackupDataFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  ///
  /// Additionally, remove null values of nested objects.
  ///
  /// This saves space for the backup while ensuring nested objects themselves
  /// keep null values within their own toJson() methods to ensure null values are
  /// saved when updating values in the sqlite db.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = _$BackupDataToJson(this);

    // Manually clean null values from nested lists
    (json['customFood'] as List<dynamic>?)?.forEach(
      (item) => (item as Map<String, dynamic>).removeWhere(
        (key, value) => value == null,
      ),
    );

    (json['trackedFood'] as List<dynamic>?)?.forEach(
      (item) => (item as Map<String, dynamic>).removeWhere(
        (key, value) => value == null,
      ),
    );

    return json;
  }
}
