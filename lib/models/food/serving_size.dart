import 'package:json_annotation/json_annotation.dart';

part 'serving_size.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class ServingSize {
  String? internalName;
  String translatedName;
  double inGrams;

  ServingSize(
    this.internalName,
    this.translatedName,
    this.inGrams,
  );

  /// Connect the generated fromJson function to the `fromJson` factory.
  factory ServingSize.fromJson(Map<String, dynamic> json) =>
      _$ServingSizeFromJson(json);

  /// Connect the generated toJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ServingSizeToJson(this);
}
