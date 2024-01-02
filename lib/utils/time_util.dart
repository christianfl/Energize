import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Utility class for time) representation
class TimeUtil {
  /// Returns String representation of a time
  static String getTime(
    DateTime dateTime,
    BuildContext context,
  ) {
    // Use standard representation of the user's language
    return DateFormat.Hm(
      Localizations.localeOf(context).toString(),
    ).format(dateTime);
  }
}
