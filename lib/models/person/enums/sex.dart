import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Sex {
  male,
  female,
}

extension ParseToString on Sex {
  String toLocalizedString() {
    switch (this) {
      case Sex.male:
        return 'Male';
      case Sex.female:
        return 'Female';
    }
  }
}
