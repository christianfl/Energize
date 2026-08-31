import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../l10n/app_localizations.dart';

@JsonEnum(valueField: 'storageValue')
enum Sex {
  notSpecified('not_specified'),
  female('female'),
  male('male'),
  diverse('diverse');

  const Sex(this.storageValue);

  /// Stable snake-case value used for JSON and key-value storage.
  final String storageValue;
}

extension ParseToString on Sex {
  String toLocalizedString(BuildContext context) {
    switch (this) {
      case Sex.notSpecified:
        return AppLocalizations.of(context)!.notSpecified;
      case Sex.female:
        return AppLocalizations.of(context)!.female;
      case Sex.male:
        return AppLocalizations.of(context)!.male;
      case Sex.diverse:
        return AppLocalizations.of(context)!.diverse;
    }
  }
}
