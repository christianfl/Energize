import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../l10n/app_localizations.dart';

@JsonEnum(valueField: 'storageValue')
enum WeightTarget {
  strongLoss('strong_loss'),
  moderateLoss('moderate_loss'),
  slightLoss('slight_loss'),
  maintaining('maintaining'),
  slightGain('slight_gain'),
  moderateGain('moderate_gain'),
  strongGain('strong_gain');

  const WeightTarget(this.storageValue);

  /// Stable snake-case value used for JSON and key-value storage.
  final String storageValue;
}

extension ParseToString on WeightTarget {
  String toLocalizedString(BuildContext context) {
    switch (this) {
      case WeightTarget.strongLoss:
        return AppLocalizations.of(context)!.weightTargetStrongLoss;
      case WeightTarget.moderateLoss:
        return AppLocalizations.of(context)!.weightTargetModerateLoss;
      case WeightTarget.slightLoss:
        return AppLocalizations.of(context)!.weightTargetSlightLoss;
      case WeightTarget.maintaining:
        return AppLocalizations.of(context)!.weightTargetMaintaining;
      case WeightTarget.slightGain:
        return AppLocalizations.of(context)!.weightTargetSlightGain;
      case WeightTarget.moderateGain:
        return AppLocalizations.of(context)!.weightTargetModerateGain;
      case WeightTarget.strongGain:
        return AppLocalizations.of(context)!.weightTargetStrongGain;
    }
  }
}

extension MapDoubleValues on WeightTarget {
  double toValue() {
    switch (this) {
      case WeightTarget.strongLoss:
        return 0.8;
      case WeightTarget.moderateLoss:
        return 0.85;
      case WeightTarget.slightLoss:
        return 0.9;
      case WeightTarget.maintaining:
        return 1;
      case WeightTarget.slightGain:
        return 1.1;
      case WeightTarget.moderateGain:
        return 1.15;
      case WeightTarget.strongGain:
        return 1.2;
    }
  }
}
