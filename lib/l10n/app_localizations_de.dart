// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Beobachte einfach und schnell, was du isst.';

  @override
  String get appDescription =>
      'Beobachte einfach und schnell, was du isst. Scanne deine Zutaten oder suche manuell in verschiedenen Datenbanken.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Bitte einen Wert ausfüllen';

  @override
  String get onlyNumbersAllowed => 'Nur Nummern sind erlaubt';

  @override
  String get undo => 'Rückgängig machen';

  @override
  String get deleted => 'gelöscht';

  @override
  String get loading => 'Laden';

  @override
  String somethingNotFound(String something) {
    return '$something nicht gefunden';
  }

  @override
  String get unknownErrorText => 'Ein unbekannter Fehler ist aufgetreten';

  @override
  String get tracking => 'Tracking';

  @override
  String get energy => 'Energie';

  @override
  String get protein => 'Protein';

  @override
  String get carbs => 'Kohlenhydrate';

  @override
  String get fat => 'Fett';

  @override
  String get detailedSummary => 'Ausführliche Zusammenfassung';

  @override
  String get dayComplete => 'Tag vollständig';

  @override
  String get markedDayAsComplete => 'Tag als vollständig markiert';

  @override
  String get dayIncomplete => 'Tag unvollständig';

  @override
  String get unmarkedDayAsComplete => 'Markierung der Vollständigkeit entfernt';

  @override
  String get trackFood => 'Nahrung tracken';

  @override
  String get timeSetHelpText =>
      'Diese Uhrzeit dient beim Tracken als Vorlage für die Zeit des Verzehrs.';

  @override
  String get useAsTemplateForCustomFood =>
      'Als Vorlage für eigene Nahrung benutzen';

  @override
  String get additionalInformation => 'Weitere Informationen';

  @override
  String get completeProductName => 'Vollständiger Produktname';

  @override
  String get addedDate => 'Hinzugefügt';

  @override
  String get consumedDate => 'Konsumiert';

  @override
  String get nutrients => 'Nährstoffe';

  @override
  String get labelingEu => 'Kennzeichnung (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit enthalten';
  }

  @override
  String get dailyTarget => 'Tagesziel';

  @override
  String get general => 'Allgemein';

  @override
  String get micronutrients => 'Mikronährstoffe';

  @override
  String get editTrackedFood => 'Getrackte Nahrung bearbeiten';

  @override
  String get scanBarcode => 'Barcode scannen';

  @override
  String get searchFood => 'Nahrung suchen';

  @override
  String get productOrBrand => 'Produkt oder Marke';

  @override
  String get searchError => 'Fehler beim Suchen';

  @override
  String get searchErrorHint =>
      'Mindestens eine Lebensmitteldatenbank konnte nicht erreicht werden. Bitte probiere es später erneut oder deaktiviere temporär nicht funktionierende Datenbanken in den Einstellungen.';

  @override
  String get affectedDatabases => 'Betroffene Datenbanken';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Weder bei der eigenen Nahrung noch auf Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Nicht bei der eigenen Nahrung gefunden, Open Food Facts benötigt Internetzugang';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Nicht bei der eigenen Nahrung gefunden, Open Food Facts hatte einen Fehler bei der Suche';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Nicht bei der eigenen Nahrung gefunden, Open Food Facts ist nicht aktiviert';

  @override
  String get barcodeScanningUnsupported =>
      'Das Scannen von Barcodes mit der Kamera wird bisher nur unter Android unterstützt.';

  @override
  String get customFood => 'Eigene Nahrung';

  @override
  String get searchCustomFood => 'Eigene Nahrung suchen';

  @override
  String get addCustomFood => 'Eigene Nahrung hinzufügen';

  @override
  String get editCustomFood => 'Eigene Nahrung bearbeiten';

  @override
  String get title => 'Titel';

  @override
  String get barcode => 'Strichcode';

  @override
  String get settings => 'Einstellungen';

  @override
  String get yourPersonalNutritionNeeds => 'Dein Nährstoffbedarf';

  @override
  String get personalNutritionNeedsHint =>
      'Berechne deinen persönlichen Nährstoffbedarf oder setze ihn selbst';

  @override
  String get calculate => 'Berechnen';

  @override
  String get energyDistribution => 'Energieverteilung';

  @override
  String get yourBody => 'Dein Körper';

  @override
  String get age => 'Alter';

  @override
  String get years => 'Jahre';

  @override
  String get sex => 'Geschlecht';

  @override
  String get female => 'Weiblich';

  @override
  String get male => 'Männlich';

  @override
  String get weight => 'Gewicht';

  @override
  String get height => 'Körpergröße';

  @override
  String get behaviourAndTarget => 'Verhalten und Ziel';

  @override
  String get activityLevel => 'Aktivitätslevel (PAL)';

  @override
  String get activityLevel1_0 => 'Du schläfst den ganzten Tag';

  @override
  String get activityLevel1_1 => 'Du liegst den ganzen Tag im Bett';

  @override
  String get activityLevel1_2 => 'Du sitzt den ganzen Tag im Bett';

  @override
  String get activityLevel1_3 => 'Du bewegst dich wenig';

  @override
  String get activityLevel1_4 => 'Du bist nicht sehr aktiv';

  @override
  String get activityLevel1_5 => 'Du hast einen Bürojob';

  @override
  String get activityLevel1_6 =>
      'Du bist etwas aktiv und machst manchmal Sport';

  @override
  String get activityLevel1_7 => 'Du machst häufiger Sport';

  @override
  String get activityLevel1_8 => 'Du trainierst häufig und stark';

  @override
  String get activityLevel1_9 =>
      'Du bist sehr aktiv, machst häufig Sport und hast einen körperlich anstrengenden Job';

  @override
  String get activityLevel2_0 =>
      'Du hast einen körperlich anstrengenden Job und trainierst regelmäßig sehr hart';

  @override
  String get noActivityLevelDescription => 'Keine Aktivitätslevelbeschreibung';

  @override
  String get weightTarget => 'Gewichtsziel';

  @override
  String get weightTargetStrongLoss => 'Starkes Abnehmen';

  @override
  String get weightTargetModerateLoss => 'Moderates Abnehmen';

  @override
  String get weightTargetSlightLoss => 'Leichtes Abnehmen';

  @override
  String get weightTargetMaintaining => 'Erhaltung';

  @override
  String get weightTargetSlightGain => 'Leichtes Zunehmen';

  @override
  String get weightTargetModerateGain => 'Moderates Zunehmen';

  @override
  String get weightTargetStrongGain => 'Starkes Zunehmen';

  @override
  String get calculateNutritionTargets => 'Nährstoffvorgaben berechnen';

  @override
  String get calculationInfo => 'Berechnungsinformationen';

  @override
  String get calculationInfoText1 =>
      'Die Berechnung des Kalorienbedarfs basiert auf der Mifflin-St.Jeor Formel. Bitte beachte, dass das Ergebnis dieser Gleichung lediglich als eine Annäherung dienen kann, da der echte Grundumsatz sich von Person zu Person unterscheiden kann.';

  @override
  String get formulaForFemales => 'Formel für Frauen';

  @override
  String get weightInKg => 'Gewicht in kg';

  @override
  String get heightInCm => 'Körpergröße in cm';

  @override
  String get ageInYears => 'Alter in Jahren';

  @override
  String get formulaForMales => 'Formel für Männer';

  @override
  String get calculationInfoText2 =>
      'Das Ergebnis dieser Formel ist der Grundumsatz. Dieser wird mit deinem Aktivitätsfaktor multipliziert, um deinen Leistungsumsatz zu erhalten. Dies ist dein täglicher Energiebedarf in kcal, um dein Gewicht zu halten.';

  @override
  String get calculatedNutritionTargets => 'Berechnete Nährstoffvorgaben';

  @override
  String get calculatedNutritionTargetsHint =>
      'Ändere die berechneten Vorgaben gerne nach deinem Wunsch bevor du sie anwendest.';

  @override
  String get percentOfCalories => '% der kcal';

  @override
  String get proteinRatio => 'Proteinanteil';

  @override
  String get carbsRatio => 'Kohlenhydratanteil';

  @override
  String get fatRatio => 'Fettanteil';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Zusätzlich Vorgaben für Mikronährstoffe basierend auf Alter und Geschlecht setzen';

  @override
  String get apply => 'Anwenden';

  @override
  String get targetsApplied => 'Die Nährstoffvorgaben wurden angewendet';

  @override
  String get targetsApplyError =>
      'Die Nährstoffvorgaben konnten nicht angewendet werden';

  @override
  String get totalEnergy => 'Gesamtenergie';

  @override
  String get energyDistributionChartMissingHint =>
      'Das Diagramm der Energieverteilung wird erst gezeigt wenn die Gesamtenergie und ein Ziel für mindestens eines der Makronährstoffe gesetzt ist.';

  @override
  String get percentOfTotalEnergy => 'Prozent der Gesamtenergie';

  @override
  String get selectedMacronutrient => 'Ausgewählter Makronährstoff';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kilokalorien, Protein, Kohlenhydrate, Fett';

  @override
  String get display => 'Darstellung';

  @override
  String get displayHint =>
      'Passe die Benutzeroberfläche deinen Bedürfnissen an';

  @override
  String get groupFoodsToMeals => 'Nahrung zu Mahlzeiten gruppieren';

  @override
  String get groupFoodsToMealsHint =>
      'Fasst Nahrung, die in sehr kurzem Abstand konsumiert wurde, automatisch als Mahlzeit zusammen';

  @override
  String get preferServingSizes => 'Portionsgrößen haben Vorrang';

  @override
  String get preferServingSizesHint =>
      'Beim Tracken neuer Nahrung wird, sofern vorhanden, eine Portionsgröße vorausgewählt';

  @override
  String mealAt(String time) {
    return 'Mahlzeit um $time';
  }

  @override
  String get databaseManagement => 'Datenbankverwaltung';

  @override
  String get databaseManagementHint =>
      'Entscheide, welche Nahrungsmitteldatenbanken verwendet werden sollen';

  @override
  String get storedOnDevice => 'Auf Gerät gespeichert';

  @override
  String get swissFoodCompositionDatabase => 'Schweizer Nährwertdatenbank';

  @override
  String get version => 'Version';

  @override
  String get language => 'Sprache';

  @override
  String get languages => 'Sprachen';

  @override
  String get german => 'Deutsch';

  @override
  String get italian => 'Italienisch';

  @override
  String get french => 'Französisch';

  @override
  String get publisher => 'Herausgeber';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Bundesamt für Lebensmittelsicherheit und Veterinärwesen';

  @override
  String get switzerland => 'Schweiz';

  @override
  String get generalInformation => 'Allgemeine Informationen';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Diese Datenbank beinhaltet mehr als 1.100 allgemeine Produkte und zahlreiche Mikronährstoffe. Weil sie auf deinem Gerät gespeichert ist, funktioniert sie auch ohne Internetverbindung.';

  @override
  String get source => 'Quelle';

  @override
  String get tapHereForFurtherInformation =>
      'Tippe hier für weitere Informationen.';

  @override
  String get serverBased => 'Serverbasiert';

  @override
  String get openFoodFactsVariousLanguagesText => 'Verschiedene';

  @override
  String get nonProfitInstitution => 'Gemeinnützige Einrichtung';

  @override
  String get france => 'Frankreich';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Diese Datenbank beinhaltet sehr viele Lebensmittel, allerdings können Daten unter Umständen unvollständig, veraltet oder falsch sein. Jeder registrierte Benutzer kann Werte bearbeiten; das Hinzufügen neuer Produkte ist für jeden möglich. Das Deaktivieren wirkt sich auch auf das EAN-Scanning aus, sodass dort dann ausschließlich selbsterstellte Nahrung gefunden werden kann.';

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get openFoodFactsTermsText =>
      'Mit dem Aktivieren dieser Datenbank stimmst du den Nutzungsbedingungen zu.';

  @override
  String get contribute => 'Mitwirken';

  @override
  String get databaseContributeText =>
      'Schau dir an, wie du helfen kannst, diese Datenbank zu verbessern.';

  @override
  String get english => 'Englisch';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central ist eine Datenbank für Lebensmittel und Nährstoffe des Landwirtschaftsministeriums der Vereinigten Staaten. Die Daten sind öffentlich zugänglich und enthalten etwa 200 Grundnahrungsmittel und über 380.000 Markenlebensmittel.';

  @override
  String get backupAndRestore => 'Sichern und Wiederherstellen';

  @override
  String get backupAndRestoreHint =>
      'Sichere deine Daten lokal oder auf einem WebDAV-kompatiblen Server, wie z.B. Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Warnung: Einstellungen, Personalisierungen, und Vorgaben für Nahrung fehlen beim Backup bisher!';

  @override
  String get successfullyCreatedBackup => 'Backup erfolgreich erstellt';

  @override
  String exportedNumberOfFoodsMessage(
      int customFoodsCount, int trackedFoodsCount) {
    final intl.NumberFormat customFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String customFoodsCountString =
        customFoodsCountNumberFormat.format(customFoodsCount);
    final intl.NumberFormat trackedFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String trackedFoodsCountString =
        trackedFoodsCountNumberFormat.format(trackedFoodsCount);

    return '$customFoodsCountString eigene Nahrung und $trackedFoodsCountString getrackte Nahrung exportiert';
  }

  @override
  String get successfullyRestoredBackup =>
      'Backup erfolgreich wiederhergestellt';

  @override
  String importedNumberOfFoodsMessage(
      int customFoodsCount, int trackedFoodsCount) {
    final intl.NumberFormat customFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String customFoodsCountString =
        customFoodsCountNumberFormat.format(customFoodsCount);
    final intl.NumberFormat trackedFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String trackedFoodsCountString =
        trackedFoodsCountNumberFormat.format(trackedFoodsCount);

    return '$customFoodsCountString eigene Nahrung und $trackedFoodsCountString getrackte Nahrung importiert';
  }

  @override
  String get createWebDAVBackup => 'WebDAV Backup erstellen';

  @override
  String get webDAVSettings => 'WebDAV Einstellungen';

  @override
  String get serverURL => 'Server URL';

  @override
  String get invalidURL => 'Die URL ist nicht gültig';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get pathAndFilename => 'Pfad und Dateiname';

  @override
  String energizeBackup(String appName) {
    return '$appName Backup';
  }

  @override
  String get backupPasswordNotice =>
      'Ohne das Backup-Passwort ist es unmöglich, ein Backup wiederherzustellen.';

  @override
  String get restoreWebDAVBackup => 'WebDAV Backup wiederherstellen';

  @override
  String get createLocalBackup => 'Lokales Backup erstellen';

  @override
  String get restoreLocalBackup => 'Lokales Backup wiederherstellen';

  @override
  String get aboutEnergize => 'Über Energize';

  @override
  String get license => 'Lizenz';

  @override
  String get allLicenses => 'Alle Lizenzen';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get logs => 'Protokolle';

  @override
  String get reportIssue => 'Fehler melden';

  @override
  String get proposeImprovement => 'Verbesserung vorschlagen';

  @override
  String get sourceCode => 'Quellcode';

  @override
  String get translation => 'Übersetzung';

  @override
  String get contributors => 'Beitragende';

  @override
  String get thanksToContributorsText =>
      'Vielen Dank an jede Person, die zu Energize beigetragen hat. Dank eurer Hilfe konnte Energize zu dem werden, was es heute ist.';

  @override
  String get contributionTypeCodeAndConversations => 'Code und Konversationen';

  @override
  String get contributionTypeAcrylicPicture => 'Acrylbild';

  @override
  String get allTranslatorsOnWeblate => 'Alle Übersetzende auf Weblate';

  @override
  String get contact => 'Kontakt';

  @override
  String get email => 'E-Mail';

  @override
  String get emailHint => 'Bitte nur für andere Themen nutzen';

  @override
  String get supportMeByDonating => 'Unterstütze mich mit einer Spende';

  @override
  String get donate => 'Spenden';

  @override
  String get donationText =>
      'Ich würde mich sehr darüber freuen, wenn du die Entwicklung von Energize mit einer kleinen Spende unterstützt. Diese App zu Entwickeln macht zwar sehr viel Spaß, ist allerdings auch mit viel Zeit verbunden und manchmal ein wenig frustrierend :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin Adresse in die Zwischenablage kopiert';

  @override
  String get bankAccountOrCreditCard => 'Bankkonto oder Kreditkarte';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Schreibe mir gerne für weitere Spendenmöglichkeiten eine E-Mail';

  @override
  String get energyAndMacronutrients => 'Energie und Makronährstoffe';

  @override
  String get vitamins => 'Vitamine';

  @override
  String get vitaminA => 'Vitamin A';

  @override
  String get vitaminB1 => 'B1 (Thiamin)';

  @override
  String get vitaminB2 => 'B2 (Riboflavin)';

  @override
  String get vitaminB3 => 'B3 (Niacin)';

  @override
  String get vitaminB5 => 'B5 (Pantothensäure)';

  @override
  String get vitaminB6 => 'Vitamin B6';

  @override
  String get vitaminB7 => 'B7 (Biotin)';

  @override
  String get vitaminB9 => 'B9 (Folsäure)';

  @override
  String get vitaminB12 => 'B12 (Cobalamin)';

  @override
  String get vitaminC => 'Vitamin C';

  @override
  String get vitaminD => 'Vitamin D';

  @override
  String get vitaminE => 'Vitamin E';

  @override
  String get vitaminK => 'Vitamin K';

  @override
  String get minerals => 'Mineralstoffe';

  @override
  String get majorMinerals => 'Hauptmineralien';

  @override
  String get calcium => 'Kalzium';

  @override
  String get chloride => 'Chlorid';

  @override
  String get magnesium => 'Magnesium';

  @override
  String get phosphorous => 'Phosphor';

  @override
  String get potassium => 'Kalium';

  @override
  String get sodium => 'Natrium';

  @override
  String get traceElements => 'Spurenelemente';

  @override
  String get chromium => 'Chrom';

  @override
  String get iron => 'Eisen';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Jod';

  @override
  String get copper => 'Kupfer';

  @override
  String get manganese => 'Mangan';

  @override
  String get molybdenum => 'Molybdän';

  @override
  String get selenium => 'Selen';

  @override
  String get zinc => 'Zink';

  @override
  String get fats => 'Fette';

  @override
  String get monounsaturatedFat => 'Einfach ungesättigte Fettsäuren';

  @override
  String get polyunsaturatedFat => 'Mehrfach ungesättigte Fettsäuren';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Gesättigte Fettsäuren';

  @override
  String get transfat => 'Transfett';

  @override
  String get cholesterol => 'Cholesterin';

  @override
  String get fiber => 'Ballaststoffe';

  @override
  String get sugar => 'Zucker';

  @override
  String get sugarAlcohol => 'Zuckeralkohole';

  @override
  String get starch => 'Stärke';

  @override
  String get other => 'Sonstiges';

  @override
  String get water => 'Wasser';

  @override
  String get caffeine => 'Koffein';

  @override
  String get alcohol => 'Alkohol';

  @override
  String get salt => 'Salz';

  @override
  String get servingSizes => 'Portionsgrößen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get noServingSizesText => 'Es sind keine Portionsgrößen vorhanden.';

  @override
  String get addServingSize => 'Portionsgröße hinzufügen';

  @override
  String get typicalServingSizes => 'Typische Portionsgrößen';

  @override
  String get or => 'oder';

  @override
  String get servingSizeName => 'Name der Portionsgröße';

  @override
  String get size => 'Größe';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'Por.',
        'l10nPackage': 'Pck.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Käsespätzle';

  @override
  String get testCustomFood1Calories => '157';

  @override
  String get testCustomFood2Name => 'Tiroler Kasnocken';

  @override
  String get testCustomFood2Calories => '232';

  @override
  String get testCustomFood3Name => 'Semmelknödel';

  @override
  String get testCustomFood3Calories => '181';

  @override
  String get testCustomFood4Name => 'Kaiserschmarrn';

  @override
  String get testCustomFood4Calories => '202';

  @override
  String get testCustomFood5Name => 'Kartoffelbrei';

  @override
  String get testCustomFood5Calories => '87';
}
