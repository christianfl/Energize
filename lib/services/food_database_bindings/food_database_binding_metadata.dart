import '../../l10n/app_localizations.dart';

/// Food Database Bindings Metadata.
class FoodDatabaseBindingMetadata {
  /// ID persisted in food records and backups.
  ///
  /// Do never change without adding the previous value to [legacyOriginIds]!
  final String originId;

  /// Legacy IDs which may still be present in some user's food records / backups.
  final List<String> legacyOriginIds;

  /// Asset path for the database logo.
  final String imageUrl;
  final String Function(AppLocalizations) displayName;
  final bool requiresActivationConfirmation;
  final String? termsUrl;
  final String? privacyUrl;
  final bool isOnline;

  // Optional details shown in database management.
  final String? version;
  final String Function(AppLocalizations)? publisher;
  final String Function(AppLocalizations)? description;
  final String Function(AppLocalizations)? languageDescription;
  final String Function(AppLocalizations)? termsDescription;
  final String? sourceUrl;
  final String? contributeUrl;

  /// Language codes, or null for a database covering various languages.
  final List<String>? supportedLanguages;

  /// Resolves the content description using the current app language.
  final String Function(AppLocalizations) contentsLabel;

  const FoodDatabaseBindingMetadata({
    required this.originId,
    this.legacyOriginIds = const [],
    required this.imageUrl,
    required this.displayName,
    required this.requiresActivationConfirmation,
    this.termsUrl,
    this.privacyUrl,
    required this.isOnline,
    this.version,
    this.publisher,
    this.description,
    this.languageDescription,
    this.termsDescription,
    this.sourceUrl,
    this.contributeUrl,
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
