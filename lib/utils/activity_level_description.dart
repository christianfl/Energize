import '../l10n/app_localizations.dart';

/// Returns the localized description for a physical activity level ("PAL").
///
/// Rounds [activityLevel] to the nearest tenth to select the description.
String activityLevelDescription(
  AppLocalizations localizations,
  double activityLevel,
) {
  return switch ((activityLevel * 10).round()) {
    10 => localizations.activityLevel1_0,
    11 => localizations.activityLevel1_1,
    12 => localizations.activityLevel1_2,
    13 => localizations.activityLevel1_3,
    14 => localizations.activityLevel1_4,
    15 => localizations.activityLevel1_5,
    16 => localizations.activityLevel1_6,
    17 => localizations.activityLevel1_7,
    18 => localizations.activityLevel1_8,
    19 => localizations.activityLevel1_9,
    20 => localizations.activityLevel2_0,
    _ => localizations.noActivityLevelDescription,
  };
}
