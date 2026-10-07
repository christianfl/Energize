import '../../l10n/app_localizations.dart';

/// Food Database Bindings Metadata.
class FoodDatabaseBindingMetadata {
  final String originName;

  /// Legacy identifiers may still present in saved food records.
  final List<String> originAliases;

  /// Asset path for the database logo.
  final String imageUrl;
  final String Function(AppLocalizations) displayName;
  final bool requiresActivationConfirmation;
  final String? termsUrl;
  final String? privacyUrl;
  final bool isOnline;

  /// Language codes, or null for a database covering various languages.
  final List<String>? supportedLanguages;

  /// Resolves the content description using the current app language.
  final String Function(AppLocalizations) contentsLabel;

  const FoodDatabaseBindingMetadata({
    required this.originName,
    this.originAliases = const [],
    required this.imageUrl,
    required this.displayName,
    required this.requiresActivationConfirmation,
    this.termsUrl,
    this.privacyUrl,
    required this.isOnline,
    required this.supportedLanguages,
    required this.contentsLabel,
  });

  /// Returns the localized online or offline label.
  String availabilityLabel(AppLocalizations localizations) => isOnline
      ? localizations.databaseOnlineShort
      : localizations.databaseOnDeviceShort;

  /// Formats language codes or returns the localized label for many languages.
  String languagesLabel(AppLocalizations localizations) =>
      supportedLanguages
          ?.map((language) => language.toUpperCase())
          .join(' · ') ??
      localizations.databaseVariousLanguagesShort;
}
