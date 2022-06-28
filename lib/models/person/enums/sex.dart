import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Sex {
  male,
  female,
}

extension ParseToString on Sex {
  String toLocalizedString(BuildContext context) {
    switch (this) {
      case Sex.male:
        return AppLocalizations.of(context)!.male;
      case Sex.female:
        return AppLocalizations.of(context)!.female;
    }
  }

  String fromValue() {
    switch (this) {
      case Sex.male:
        return 'Male';
      case Sex.female:
        return 'Female';
    }
  }
}
