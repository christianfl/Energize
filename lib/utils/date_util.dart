import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Utility class for date representation.
class DateUtil {
  /// Returns a locale-aware representation of [dateTime] without its time.
  static String getDate(DateTime dateTime, BuildContext context) {
    final locale = Localizations.localeOf(context);

    if (locale.languageCode == 'de') {
      return DateFormat('dd.MM.yyyy').format(dateTime);
    }

    return DateFormat.yMd(locale.toString()).format(dateTime);
  }
}
