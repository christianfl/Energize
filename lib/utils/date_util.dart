import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Utility Class for date(-time) representation
class DateUtil {
  /// Returns String representation of a date without time
  static String getDate(
    DateTime dateTime,
    BuildContext context,
  ) {
    if (Localizations.localeOf(context) == const Locale('de')) {
      // Use two digit dd.MM.yyyy representation
      return DateFormat(
        'dd.MM.yyyy',
      ).format(dateTime);
    } else {
      // Use standard representation of the user's language
      return DateFormat.yMd(
        Localizations.localeOf(context).toString(),
      ).format(dateTime);
    }
  }
}
