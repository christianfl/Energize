import 'package:flutter/material.dart';

/// Utility class for time representation.
class TimeUtil {
  /// Returns a locale-aware representation of the time in [dateTime].
  static String getTime(DateTime dateTime, BuildContext context) {
    return MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.fromDateTime(dateTime),
      alwaysUse24HourFormat:
          MediaQuery.maybeOf(context)?.alwaysUse24HourFormat ?? false,
    );
  }
}
