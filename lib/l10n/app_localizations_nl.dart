// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Houd je eten en voeding gemakkelijk en snel bij.';

  @override
  String get appDescription =>
      'Houd je eten en voeding gemakkelijk en snel bij. Scan je producten of zoek handmatig in verscheidene databanken.';

  @override
  String get ok => 'Oké';

  @override
  String get fieldMandatory => 'Vul a.u.b. een waarde in';

  @override
  String get onlyNumbersAllowed => 'Alleen nummers zijn toegestaan';

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get deleted => 'verwijderd';

  @override
  String get loading => 'Laden';

  @override
  String somethingNotFound(String something) {
    return '$something niet gevonden';
  }

  @override
  String get unknownErrorText => 'Een onbekende fout is opgetreden';

  @override
  String get tracking => 'Bijhouden';

  @override
  String get energy => 'Energie';

  @override
  String get protein => 'Eiwitten';

  @override
  String get carbs => 'Koolhydraten';

  @override
  String get fat => 'Vetten';

  @override
  String get detailedSummary => 'Gedetailleerde samenvatting';

  @override
  String get dayComplete => 'Dag voltooid';

  @override
  String get markedDayAsComplete => 'Dag als voltooid gemarkeerd';

  @override
  String get dayIncomplete => 'Dag onvoltooid';

  @override
  String get unmarkedDayAsComplete => 'Dag als onvoltooid gemarkeerd';

  @override
  String get trackFood => 'Eten bijhouden';

  @override
  String get timeSetHelpText =>
      'Als u eten bijhoudt, wordt deze tijd gebruikt als sjabloon voor het tijdstip van consumptie.';

  @override
  String get useAsTemplateForCustomFood =>
      'Gebruik als sjabloon voor eigen eten';

  @override
  String get additionalInformation => 'Extra informatie';

  @override
  String get completeProductName => 'Volledige productnaam';

  @override
  String get addedDate => 'Toegevoegd';

  @override
  String get consumedDate => 'Geconsumeerd';

  @override
  String get nutrients => 'Voedingsstoffen';

  @override
  String get labelingEu => 'Etikettering (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit bevat';
  }

  @override
  String get dailyTarget => 'dagelijks doel';

  @override
  String get general => 'Algemeen';

  @override
  String get micronutrients => 'Microvoedingsstoffen';

  @override
  String get editTrackedFood => 'Bewerk bijgehouden eten';

  @override
  String get scanBarcode => 'Scan barcode';

  @override
  String get searchFood => 'Zoek eten';

  @override
  String get productOrBrand => 'Product of merk';

  @override
  String get searchError => 'Fout tijdens zoeken';

  @override
  String get searchErrorHint =>
      'At least one food composition database could not be reached. Please try again later or temporarily disable non-functional databases in the settings.';

  @override
  String get affectedDatabases => 'Betrokken databases';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Niet in eigen eten, noch op Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Niet gevonden in eigen eten, Open Food Facts vereist internettoegang';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Not found in custom foods, Open Food Facts search had an error';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Not found in custom foods, Open Food Facts is not activated';

  @override
  String get barcodeScanningUnsupported =>
      'Scanning barcodes with the device camera is currently only supported on Android.';

  @override
  String get customFood => 'Eigen eten';

  @override
  String get searchCustomFood => 'Zoek door eigen eten';

  @override
  String get addCustomFood => 'Eigen eten toevoegen';

  @override
  String get editCustomFood => 'Bewerk eigen eten';

  @override
  String get title => 'Titel';

  @override
  String get barcode => 'Streepjescode';

  @override
  String get settings => 'Instellingen';

  @override
  String get yourPersonalNutritionNeeds =>
      'Jouw persoonlijke voedingsbehoeften';

  @override
  String get personalNutritionNeedsHint =>
      'Bereken uw persoonlijke voedingsbehoefte of stel deze zelf in';

  @override
  String get calculate => 'Bereken';

  @override
  String get energyDistribution => 'Energiedistributie';

  @override
  String get yourBody => 'Jouw lichaam';

  @override
  String get age => 'Leeftijd';

  @override
  String get years => 'jaren';

  @override
  String get sex => 'Geslacht';

  @override
  String get female => 'Vrouw';

  @override
  String get male => 'Man';

  @override
  String get weight => 'Gewicht';

  @override
  String get height => 'Lichaamslengte';

  @override
  String get behaviourAndTarget => 'Gedrag en doel';

  @override
  String get activityLevel => 'Activiteitsniveau (PAL)';

  @override
  String get activityLevel1_0 => 'Je doet eigenlijk niets anders dan slapen';

  @override
  String get activityLevel1_1 => 'Je ligt de hele dag in bed';

  @override
  String get activityLevel1_2 => 'Je zit de hele dag op je bed';

  @override
  String get activityLevel1_3 => 'Je gaat eigenlijk niet vaak naar buiten';

  @override
  String get activityLevel1_4 => 'Je bent niet zo actief';

  @override
  String get activityLevel1_5 => 'Je doet kantoorwerk';

  @override
  String get activityLevel1_6 => 'Je bent een beetje actief, en sport soms';

  @override
  String get activityLevel1_7 => 'Je traint vaak';

  @override
  String get activityLevel1_8 => 'Je traint regelmatig hard';

  @override
  String get activityLevel1_9 =>
      'Je bent zeer actief, je traint en je hebt geen kantoorbaan';

  @override
  String get activityLevel2_0 =>
      'Je hebt een fysiek zware baan en je traint regelmatig hard';

  @override
  String get noActivityLevelDescription => 'Geen activiteitsniveaubeschrijving';

  @override
  String get weightTarget => 'Gewichtsdoel';

  @override
  String get weightTargetStrongLoss => 'Veel afvallen';

  @override
  String get weightTargetModerateLoss => 'Matig afvallen';

  @override
  String get weightTargetSlightLoss => 'Licht afvallen';

  @override
  String get weightTargetMaintaining => 'Behouden';

  @override
  String get weightTargetSlightGain => 'Licht aankomen';

  @override
  String get weightTargetModerateGain => 'Matig aankomen';

  @override
  String get weightTargetStrongGain => 'Sterk aankomen';

  @override
  String get calculateNutritionTargets => 'Bereken voedingsdoelen';

  @override
  String get calculationInfo => 'Informatie over berekening';

  @override
  String get calculationInfoText1 =>
      'De berekening van de calorie-inname is gebaseerd op de Mifflin-St.Jeor-formule. Houd er rekening mee dat dit alleen dient als benadering van de echte waarden. Deze verschillen van persoon tot persoon, omdat hun lichaamscondities min of meer kunnen verschillen.';

  @override
  String get formulaForFemales => 'Formule voor vrouwen';

  @override
  String get weightInKg => 'Gewicht in kg';

  @override
  String get heightInCm => 'Lengte in cm';

  @override
  String get ageInYears => 'Leeftijd in jaren';

  @override
  String get formulaForMales => 'Formule voor mannen';

  @override
  String get calculationInfoText2 =>
      'De output van deze berekening wordt gedefinieerd als de ruststofwisseling. Het wordt vermenigvuldigd met je activiteitsfactor om je totale energieverbruik te verkrijgen. Dit is je berekende energie-inname in kcal.';

  @override
  String get calculatedNutritionTargets => 'Berekende voedingsdoelen';

  @override
  String get calculatedNutritionTargetsHint =>
      'Pas gerust de berekende doelen aan naar jouw behoeften voordat je ze toepast.';

  @override
  String get percentOfCalories => '% van kcal';

  @override
  String get proteinRatio => 'Eiwitratio';

  @override
  String get carbsRatio => 'Koolhydraatratio';

  @override
  String get fatRatio => 'Vetratio';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Stel ook doelen aan microvoedingsstoffen op basis van leeftijd en geslacht';

  @override
  String get apply => 'Toepassen';

  @override
  String get targetsApplied => 'Voedingsdoelen waren toegepast';

  @override
  String get targetsApplyError => 'Voedingsdoelen konden niet worden toegepast';

  @override
  String get totalEnergy => 'Totale energie';

  @override
  String get energyDistributionChartMissingHint =>
      'De energiedistributiegrafiek wordt alleen weergegeven als je een caloriedoel en een doel voor ten minste één van de macrovoedingsstoffen hebt ingesteld.';

  @override
  String get percentOfTotalEnergy => 'Percentage van totale energie';

  @override
  String get selectedMacronutrient => 'Geselecteerde macrovoedingsstof';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calorieën, eiwitten, koolhydraten en vetten';

  @override
  String get display => 'Display';

  @override
  String get displayHint => 'Customize the user interface to your needs';

  @override
  String get groupFoodsToMeals => 'Group foods to meals';

  @override
  String get groupFoodsToMealsHint =>
      'Automatically groups together foods consumed in very short intervals as a meal';

  @override
  String get preferServingSizes => 'Prefer serving sizes';

  @override
  String get preferServingSizesHint =>
      'When tracking new food, a serving size will be preselected, if any';

  @override
  String mealAt(String time) {
    return 'Meal at $time';
  }

  @override
  String get databaseManagement => 'Databankbeheer';

  @override
  String get databaseManagementHint =>
      'Selecteer welke voedseldatabanken je wil gebruiken';

  @override
  String get storedOnDevice => 'Opgeslagen op apparaat';

  @override
  String get swissFoodCompositionDatabase =>
      'Zwitserse voedselsamenstellingsdatabank';

  @override
  String get version => 'Version';

  @override
  String get language => 'Taal';

  @override
  String get languages => 'Languages';

  @override
  String get german => 'Duits';

  @override
  String get italian => 'Italian';

  @override
  String get french => 'French';

  @override
  String get publisher => 'Uitgever';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federal Food Safety and Veterinary Office';

  @override
  String get switzerland => 'Zwitserland';

  @override
  String get generalInformation => 'Algemene informatie';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Deze databank biedt ongeveer 1100 algemene producten en veel microvoedingsstoffen. Omdat het op je apparaat wordt opgeslagen, werkt het ook offline.';

  @override
  String get source => 'Bron';

  @override
  String get tapHereForFurtherInformation => 'Tik hier voor meer informatie.';

  @override
  String get serverBased => 'Servergebaseerd';

  @override
  String get openFoodFactsVariousLanguagesText => 'Diverse';

  @override
  String get nonProfitInstitution => 'Non-profit instelling';

  @override
  String get france => 'Frankrijk';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Houd er rekening mee dat, hoewel deze databank erg groot is, gegevens onvolledig of verouderd kunnen zijn. Iedere geregistreerde gebruiker kan voedingswaarden aanpassen. Het toevoegen van nieuwe producten is mogelijk zonder een account aan te maken. Het uitschakelen van deze databank omvat ook EAN-scannen, waardoor je alleen aangepaste voedingsmiddelen op EAN-code kunt scannen.';

  @override
  String get termsOfUse => 'Gebruiksvoorwaarden';

  @override
  String get openFoodFactsTermsText =>
      'Door deze databank te activeren gaat u akkoord met de voorwaarden.';

  @override
  String get contribute => 'Bijdragen';

  @override
  String get databaseContributeText =>
      'Ontdek hoe je kan helpen met het verbeteren van deze databank.';

  @override
  String get english => 'Engels';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central is een databank met eten en voedingsstoffen van het Amerikaanse ministerie van landbouw. De gegevens vallen onder het publieke domein en bevatten ongeveer 200 basisvoedingsmiddelen en meer dan 380.000 merkvoedingsmiddelen.';

  @override
  String get backupAndRestore => 'Back-up en herstellen';

  @override
  String get backupAndRestoreHint =>
      'Bewaar je gegevens op een WebDAV-compatibele cloudopslag, zoals Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Warning: Settings, personalizations and targets are not yet included!';

  @override
  String get successfullyCreatedBackup => 'Successfully created backup';

  @override
  String exportedNumberOfFoodsMessage(
    int customFoodsCount,
    int trackedFoodsCount,
  ) {
    final intl.NumberFormat customFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String customFoodsCountString = customFoodsCountNumberFormat.format(
      customFoodsCount,
    );
    final intl.NumberFormat trackedFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String trackedFoodsCountString = trackedFoodsCountNumberFormat.format(
      trackedFoodsCount,
    );

    return 'Exported $customFoodsCountString custom foods and $trackedFoodsCountString tracked foods';
  }

  @override
  String get successfullyRestoredBackup => 'Successfully restored backup';

  @override
  String importedNumberOfFoodsMessage(
    int customFoodsCount,
    int trackedFoodsCount,
  ) {
    final intl.NumberFormat customFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String customFoodsCountString = customFoodsCountNumberFormat.format(
      customFoodsCount,
    );
    final intl.NumberFormat trackedFoodsCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String trackedFoodsCountString = trackedFoodsCountNumberFormat.format(
      trackedFoodsCount,
    );

    return 'Imported $customFoodsCountString custom foods and $trackedFoodsCountString tracked foods';
  }

  @override
  String get createWebDAVBackup => 'Create WebDAV backup';

  @override
  String get webDAVSettings => 'WebDAV settings';

  @override
  String get serverURL => 'Server URL';

  @override
  String get invalidURL => 'The URL is invalid';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get pathAndFilename => 'Path and filename';

  @override
  String energizeBackup(String appName) {
    return '$appName Backup';
  }

  @override
  String get backupPasswordNotice =>
      'Without the backup password, it is impossible to restore a backup.';

  @override
  String get restoreWebDAVBackup => 'Restore WebDAV backup';

  @override
  String get createLocalBackup => 'Create local backup';

  @override
  String get restoreLocalBackup => 'Restore local backup';

  @override
  String get aboutEnergize => 'Over Energize';

  @override
  String get license => 'licentie';

  @override
  String get allLicenses => 'Alle licenties';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Een fout melden';

  @override
  String get proposeImprovement => 'Verbetering voorstellen';

  @override
  String get sourceCode => 'Broncode';

  @override
  String get translation => 'Vertaling';

  @override
  String get contributors => 'Contributors';

  @override
  String get thanksToContributorsText =>
      'Thanks to all people who contributed to Energize. Due to your help, Energize could become what it is now.';

  @override
  String get contributionTypeCodeAndConversations => 'Code and conversations';

  @override
  String get contributionTypeAcrylicPicture => 'Acrylic picture';

  @override
  String get allTranslatorsOnWeblate => 'All translators on Weblate';

  @override
  String get contact => 'Contact';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Gebruik dit a.u.b. alleen voor andere onderwerpen dan bovenstaande';

  @override
  String get supportMeByDonating => 'Ondersteun me door te doneren';

  @override
  String get donate => 'Doneer';

  @override
  String get donationText =>
      'Wil je de ontwikkeling steunen met een donatie, dan is dat van harte welkom! Het maken van deze app is erg leuk, maar ook een zeer tijdrovende klus en leidt soms tot een beetje frustratie :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin-adres gekopieerd naar klembord';

  @override
  String get bankAccountOrCreditCard => 'Bankrekening of creditcard';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Stuur me gerust een e-mail voor andere donatiemogelijkheden';

  @override
  String get energyAndMacronutrients => 'Energie en macrovoedingsstoffen';

  @override
  String get vitamins => 'Vitaminen';

  @override
  String get vitaminA => 'Vitamine A';

  @override
  String get vitaminB1 => 'B1 (Thiamine)';

  @override
  String get vitaminB2 => 'B2 (Riboflavine)';

  @override
  String get vitaminB3 => 'B3 (Niacine)';

  @override
  String get vitaminB5 => 'B5 (Pantotheenzuur)';

  @override
  String get vitaminB6 => 'Vitamine B6';

  @override
  String get vitaminB7 => 'B7 (Biotine)';

  @override
  String get vitaminB9 => 'B9 (Foliumzuur)';

  @override
  String get vitaminB12 => 'B12 (Cobalamine)';

  @override
  String get vitaminC => 'Vitamine C';

  @override
  String get vitaminD => 'Vitamine D';

  @override
  String get vitaminE => 'Vitamine E';

  @override
  String get vitaminK => 'Vitamine K';

  @override
  String get minerals => 'Mineralen';

  @override
  String get majorMinerals => 'Belangrijke mineralen';

  @override
  String get calcium => 'Calcium';

  @override
  String get chloride => 'Chloride';

  @override
  String get magnesium => 'Magnesium';

  @override
  String get phosphorous => 'Fosfor';

  @override
  String get potassium => 'Potassium';

  @override
  String get sodium => 'Natrium';

  @override
  String get traceElements => 'Spoorelementen';

  @override
  String get chromium => 'Chroom';

  @override
  String get iron => 'IJzer';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Jodium';

  @override
  String get copper => 'Koper';

  @override
  String get manganese => 'Mangaan';

  @override
  String get molybdenum => 'Molybdeen';

  @override
  String get selenium => 'Seleen';

  @override
  String get zinc => 'Zink';

  @override
  String get fats => 'Vetten';

  @override
  String get monounsaturatedFat => 'Enkelvoudig onverzadigd vet';

  @override
  String get polyunsaturatedFat => 'Meervoudig onverzadigd vet';

  @override
  String get omega3 => 'Omega-3';

  @override
  String get omega6 => 'Omega-6';

  @override
  String get saturatedFat => 'Verzadigd vet';

  @override
  String get transfat => 'Trans vet';

  @override
  String get cholesterol => 'Cholesterol';

  @override
  String get fiber => 'Vezels';

  @override
  String get sugar => 'Suiker';

  @override
  String get sugarAlcohol => 'Suikeralcohol';

  @override
  String get starch => 'Zetmeel';

  @override
  String get other => 'Overig';

  @override
  String get water => 'Water';

  @override
  String get caffeine => 'Caffeïne';

  @override
  String get alcohol => 'Alcohol';

  @override
  String get salt => 'Zout';

  @override
  String get servingSizes => 'Serving sizes';

  @override
  String get add => 'Add';

  @override
  String get noServingSizesText => 'There are no serving sizes present.';

  @override
  String get addServingSize => 'Add serving size';

  @override
  String get typicalServingSizes => 'Typical serving sizes';

  @override
  String get or => 'or';

  @override
  String get servingSizeName => 'Serving size name';

  @override
  String get size => 'Size';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': 'Srv.',
      'l10nPackage': 'Pck.',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Pancakes';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Hashbrowns';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Fried okra';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Scotch Egg';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Yorkshire Pudding';

  @override
  String get testCustomFood5Calories => '259';
}
