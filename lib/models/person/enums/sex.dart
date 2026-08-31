import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../l10n/app_localizations.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Sex { notSpecified, female, male, diverse }

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

  String toKeyValueStorageValueName() {
    switch (this) {
      case Sex.notSpecified:
        return 'Not_Specified';
      case Sex.female:
        return 'Female';
      case Sex.male:
        return 'Male';
      case Sex.diverse:
        return 'Diverse';
    }
  }
}
