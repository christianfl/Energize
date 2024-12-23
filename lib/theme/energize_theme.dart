import 'package:flutter/material.dart';

class EnergizeTheme {
  static const themeColor = Colors.pink;
  static ThemeData get theme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColor,
        brightness: Brightness.dark,
      ),
    );
  }
}

extension EnergizeThemeData on ThemeData {
  bool get isDarkMode => brightness == Brightness.dark;

  // Static colors
  Color get donateContainer => const Color(0xFFF6C915);
  Color get onDonateContainer => Colors.black;
  Color get usdaColor => const Color(0xFF004785);
  Color get dangerContainer => Colors.red;
  Color get onDangerContainer => Colors.white;
  Color get warningContainer => Colors.deepOrange;
  Color get onWarningContainer => Colors.white;
  Color get energyContainer => Colors.yellow;
  Color get onEnergyContainer => Colors.black;
  Color get proteinContainer => Colors.green;
  Color get onProteinContainer => Colors.white;
  Color get carbsContainer => Colors.blue;
  Color get onCarbsContainer => Colors.white;
  Color get fatContainer => Colors.red;
  Color get onFatContainer => Colors.white;
  Color get microNutrientsContainer => Colors.blueGrey;
  Color get successContainer => Colors.green;
  Color get onSuccessContainer => Colors.white;
  Color get noPictureBackground => Colors.black;
  Color get onNoPictureBackground => Colors.white;
  Color get progressBar => const Color(0xFFDCDCDC);
  Color get onProgressBar => Colors.black;

  // Dynamic colors
  Color get extraHighlightColor =>
      isDarkMode ? Colors.orange : Colors.redAccent;

  Color get decentHighlightColor =>
      isDarkMode ? const Color(0xFF342110) : const Color(0xFFFFDEDD);
}
