import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum WeightTarget {
  strongLoss,
  moderateLoss,
  slightLoss,
  maintaining,
  slightGain,
  moderateGain,
  strongGain,
}

extension ParseToString on WeightTarget {
  String toLocalizedString() {
    switch (this) {
      case WeightTarget.strongLoss:
        return 'Strong loss';
      case WeightTarget.moderateLoss:
        return 'Moderate loss';
      case WeightTarget.slightLoss:
        return 'Slight loss';
      case WeightTarget.maintaining:
        return 'Maintaining';
      case WeightTarget.slightGain:
        return 'Slight gain';
      case WeightTarget.moderateGain:
        return 'Moderate gain';
      case WeightTarget.strongGain:
        return 'Strong gain';
    }
  }
}
