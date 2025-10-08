// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Nem og hurtig kalorietæller og madjournal.';

  @override
  String get appDescription =>
      'Log din mad og kalorier, nemt og hurtigt. Skan dine produkter eller søg manuelt i forskellige databaser.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Indtast venligst en værdi';

  @override
  String get onlyNumbersAllowed => 'Kun tal er tilladt';

  @override
  String get undo => 'Fortryd';

  @override
  String get deleted => 'slettet';

  @override
  String get loading => 'Indlæser';

  @override
  String somethingNotFound(String something) {
    return '$something ikke fundet';
  }

  @override
  String get unknownErrorText => 'En ukendt fejl opstod';

  @override
  String get tracking => 'Sporing';

  @override
  String get energy => 'Energi';

  @override
  String get protein => 'Protein';

  @override
  String get carbs => 'Kulhydrater';

  @override
  String get fat => 'Fedt';

  @override
  String get detailedSummary => 'Detaljeret opsummering';

  @override
  String get dayComplete => 'Dagen er fuldendt';

  @override
  String get markedDayAsComplete => 'Dagen er markeret som fuldendt';

  @override
  String get dayIncomplete => 'Dagen er ufuldendt';

  @override
  String get unmarkedDayAsComplete =>
      'Dagen er ikke længere markeret som ufuldendt';

  @override
  String get trackFood => 'Madjournal';

  @override
  String get timeSetHelpText =>
      'Når du sporer mad, bruges dette tidspunkt som skabelon for indtagelsestidspunktet.';

  @override
  String get useAsTemplateForCustomFood =>
      'Brug som et skabelon for brugerformuleret mad';

  @override
  String get additionalInformation => 'Yderligere information';

  @override
  String get completeProductName => 'Komplet produktnavn';

  @override
  String get addedDate => 'Tilføjet';

  @override
  String get consumedDate => 'Indtaget';

  @override
  String get nutrients => 'Næringsstoffer';

  @override
  String get labelingEu => 'Mærkning (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit indeholder';
  }

  @override
  String get dailyTarget => 'dagligt mål';

  @override
  String get general => 'Generelt';

  @override
  String get micronutrients => 'Mikronæringsstoffer';

  @override
  String get editTrackedFood => 'Rediger madjournal';

  @override
  String get scanBarcode => 'Skan stregkode';

  @override
  String get searchFood => 'Søg efter mad';

  @override
  String get productOrBrand => 'Produkt eller mærke';

  @override
  String get searchError => 'Fejl under søgning';

  @override
  String get searchErrorHint =>
      'Mindst én database med fødevaresammensætning kunne ikke nås. Prøv igen senere, eller deaktiver midlertidigt ikke-funktionelle databaser i indstillingerne.';

  @override
  String get affectedDatabases => 'Påvirkede databaser';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Hverken i brugerdefinerede fødevarer eller på Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Ikke fundet i brugerdefinerede fødevarer; Open Food Facts kræver internetadgang';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Ikke fundet i brugerdefinerede fødevarer; Open Food Facts-søgning havde en fejl';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Ikke fundet i brugerdefinerede fødevarer; Open Food Facts er ikke aktiveret';

  @override
  String get barcodeScanningUnsupported =>
      'Scanning barcodes with the device camera is currently only supported on Android.';

  @override
  String get customFood => 'Brugerdefineret Mad';

  @override
  String get searchCustomFood => 'Søg i brugerdefineret mad';

  @override
  String get addCustomFood => 'Tilføj brugerdefineret mad';

  @override
  String get editCustomFood => 'Rediger brugerdefineret mad';

  @override
  String get title => 'Titel';

  @override
  String get barcode => 'Stregkode';

  @override
  String get settings => 'Indstillinger';

  @override
  String get yourPersonalNutritionNeeds => 'Dine personlige ernæringsbehov';

  @override
  String get personalNutritionNeedsHint =>
      'Beregn dine personlige ernæringsbehov, eller fastlæg dem selv';

  @override
  String get calculate => 'Beregn';

  @override
  String get energyDistribution => 'Energifordeling';

  @override
  String get yourBody => 'Din Krop';

  @override
  String get age => 'Alder';

  @override
  String get years => 'år';

  @override
  String get sex => 'Køn';

  @override
  String get female => 'Kvinde';

  @override
  String get male => 'Mand';

  @override
  String get weight => 'Vægt';

  @override
  String get height => 'Kropshøjde';

  @override
  String get behaviourAndTarget => 'Adfærd og mål';

  @override
  String get activityLevel => 'Aktivitetsniveau (PAL)';

  @override
  String get activityLevel1_0 => 'Du laver stort set ikke andet end at sove';

  @override
  String get activityLevel1_1 => 'Du ligger i din seng hele dagen';

  @override
  String get activityLevel1_2 => 'Du sidder i din seng hele dagen';

  @override
  String get activityLevel1_3 => 'Du går ikke særlig tit udenfor';

  @override
  String get activityLevel1_4 => 'Du er slet ikke særlig aktiv';

  @override
  String get activityLevel1_5 => 'Du laver kontorarbejde';

  @override
  String get activityLevel1_6 =>
      'Du er lidt aktiv; arbejder og dyrker nogle gange sport';

  @override
  String get activityLevel1_7 => 'Du træner ofte';

  @override
  String get activityLevel1_8 => 'Du træner hårdt regelmæssigt';

  @override
  String get activityLevel1_9 =>
      'Du er meget aktiv; træner og har ikke et kontorjob';

  @override
  String get activityLevel2_0 =>
      'Du har et fysisk aktivt job og træner hårdt regelmæssigt';

  @override
  String get noActivityLevelDescription =>
      'Ingen beskrivelse af aktivitetsniveau';

  @override
  String get weightTarget => 'Målvægt';

  @override
  String get weightTargetStrongLoss => 'Stort vægttab';

  @override
  String get weightTargetModerateLoss => 'Moderat vægttab';

  @override
  String get weightTargetSlightLoss => 'Lille vægttab';

  @override
  String get weightTargetMaintaining => 'Vedligehold vægt';

  @override
  String get weightTargetSlightGain => 'Lille vægtøgning';

  @override
  String get weightTargetModerateGain => 'Moderat vægtøgning';

  @override
  String get weightTargetStrongGain => 'Stor vægtøgning';

  @override
  String get calculateNutritionTargets => 'Beregn ernæringsmål';

  @override
  String get calculationInfo => 'Information om beregning';

  @override
  String get calculationInfoText1 =>
      'Beregningen af kalorieindtaget er baseret på Mifflin-St. Jeor-formlen. Vær opmærksom på, at den kun kan fungere som en tilnærmelse til den virkelige verdens værdier. Disse varierer fra person til person, da deres kropsforhold kan afvige mere eller mindre.';

  @override
  String get formulaForFemales => 'Formel for kvinder';

  @override
  String get weightInKg => 'Vægt i kg';

  @override
  String get heightInCm => 'Højde i cm';

  @override
  String get ageInYears => 'Alder i år';

  @override
  String get formulaForMales => 'Formel for mænd';

  @override
  String get calculationInfoText2 =>
      'The output of this calculation is defined as the basal metabolic rate (BMR). It gets multiplied with your activity factor to receive your total power conversion. This is your calculated energy intake in kcal.';

  @override
  String get calculatedNutritionTargets => 'Calculated nutrition targets';

  @override
  String get calculatedNutritionTargetsHint =>
      'Du er velkommen til at redigere de beregnede mål efter dine behov, før du anvender dem.';

  @override
  String get percentOfCalories => '% af kcal';

  @override
  String get proteinRatio => 'Protein ratio';

  @override
  String get carbsRatio => 'Carbs ratio';

  @override
  String get fatRatio => 'Fat ratio';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Sæt også mål for mikronæringsstoffer baseret på alder og køn';

  @override
  String get alsoSetMicronutrientsHint =>
      'Values depend on age and sex. Data based on DGE reference values from 2022 with a partly update from 2025.';

  @override
  String get apply => 'Anvend';

  @override
  String get targetsApplied => 'Ernæringsmål blev anvendt';

  @override
  String get targetsApplyError => 'Ernæringsmål kunne ikke anvendes';

  @override
  String get totalEnergy => 'Total energy';

  @override
  String get energyDistributionChartMissingHint =>
      'Energifordelingsdiagrammet vises kun, hvis du har indstillet et kaloriemål og et mål for mindst et af makronæringsstofferne.';

  @override
  String get percentOfTotalEnergy => 'Percent of total energy';

  @override
  String get selectedMacronutrient => 'Selected macronutrient';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalorier, proteiner, kulhydrater og fedt';

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
  String get databaseManagement => 'Styr databaser';

  @override
  String get databaseManagementHint =>
      'Vælg, hvilke fødevaredatabaser at søge i';

  @override
  String get storedOnDevice => 'Gemt på enheden';

  @override
  String get swissFoodCompositionDatabase => 'Swiss Food Composition Database';

  @override
  String get version => 'Version';

  @override
  String get language => 'Sprog';

  @override
  String get languages => 'Languages';

  @override
  String get german => 'Tysk';

  @override
  String get italian => 'Italian';

  @override
  String get french => 'French';

  @override
  String get publisher => 'Udgiver';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federal Food Safety and Veterinary Office';

  @override
  String get switzerland => 'Schweiz';

  @override
  String get generalInformation => 'Generel information';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Denne database tilbyder omkring 1.100 generelle produkter og mange mikronæringsstoffer. Da den er gemt på din enhed, virker den også offline.';

  @override
  String get source => 'Kilde';

  @override
  String get tapHereForFurtherInformation =>
      'Tryk her for yderligere information.';

  @override
  String get serverBased => 'Server-baseret';

  @override
  String get openFoodFactsVariousLanguagesText => 'Various';

  @override
  String get nonProfitInstitution => 'Nonprofit-institution';

  @override
  String get france => 'Frankrig';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Vær opmærksom på at opslag i denne store database kan være ufuldkomne. Brugere kan opdatere næringsindholdet. Alle kan indsætte et nyt produkt. Hvis du slår denne database fra har det ingen indflydelse på stregkoder.';

  @override
  String get termsOfUse => 'Brugsbetingelser';

  @override
  String get openFoodFactsTermsText =>
      'Ved at aktivere denne database, accepterer du betingelserne.';

  @override
  String get contribute => 'Bidrag';

  @override
  String get databaseContributeText =>
      'Se hvordan du kan hjælpe med at forbedre databasen.';

  @override
  String get english => 'Engelsk';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central er en database med mad og ernæring fra USAs landbrugsministerie. Dataen er frit tilgængelig og indholder over 380000 madvarer.';

  @override
  String get backupAndRestore => 'Backup & Gendan';

  @override
  String get backupAndRestoreHint =>
      'Gem dine data på en WebDAV-kompatibel cloudtjeneste som f.eks. Nextcloud';

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
  String get aboutEnergize => 'Om Energize';

  @override
  String get license => 'licens';

  @override
  String get allLicenses => 'Alle licenser';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Anmeld fejl';

  @override
  String get proposeImprovement => 'Foreslå forbedring';

  @override
  String get sourceCode => 'Kildekode';

  @override
  String get translation => 'Oversættelse';

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
  String get contact => 'Kontakt';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Brug venligst kun dette til andre emner end ovenstående';

  @override
  String get supportMeByDonating => 'Støt mig med donationer';

  @override
  String get donate => 'Donér';

  @override
  String get donationText =>
      'Hvis du vil støtte udviklingen med en donation, er du meget velkommen til at gøre det! At lave denne app er meget sjovt, men også en meget tidskrævende opgave, som nogle gange fører til lidt frustration :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin-adresse kopieret til udklipsholder';

  @override
  String get bankAccountOrCreditCard => 'Bankkonto eller kreditkort';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'You are welcome to write me an e-mail for further donation options';

  @override
  String get energyAndMacronutrients => 'Energi og makronutrienter';

  @override
  String get vitamins => 'Vitaminer';

  @override
  String get vitaminA => 'Vitamin A';

  @override
  String get vitaminB1 => 'B1 (Tiamin)';

  @override
  String get vitaminB2 => 'B2 (Riboflavin)';

  @override
  String get vitaminB3 => 'B3 (Niacin)';

  @override
  String get vitaminB5 => 'B5 (Pantotensyre)';

  @override
  String get vitaminB6 => 'Vitamin B6';

  @override
  String get vitaminB7 => 'B7 (Biotin)';

  @override
  String get vitaminB9 => 'B9 (Folsyre)';

  @override
  String get vitaminB12 => 'B12 (Kobalamin)';

  @override
  String get vitaminC => 'Vitamin C';

  @override
  String get vitaminD => 'Vitamin D';

  @override
  String get vitaminE => 'Vitamin E';

  @override
  String get vitaminK => 'Vitamin K';

  @override
  String get minerals => 'Mineraler';

  @override
  String get majorMinerals => 'Makromineraler';

  @override
  String get calcium => 'Kalcium';

  @override
  String get chloride => 'Klorid';

  @override
  String get magnesium => 'Magnesium';

  @override
  String get phosphorous => 'Fosfor';

  @override
  String get potassium => 'Kalium';

  @override
  String get sodium => 'Salt';

  @override
  String get traceElements => 'Spormineraler';

  @override
  String get chromium => 'Krom';

  @override
  String get iron => 'Jern';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Jod';

  @override
  String get copper => 'Kobber';

  @override
  String get manganese => 'Mangan';

  @override
  String get molybdenum => 'Molybdæn';

  @override
  String get selenium => 'Selen';

  @override
  String get zinc => 'Zink';

  @override
  String get fats => 'Fedtstoffer';

  @override
  String get monounsaturatedFat => 'Monoumættet fedt';

  @override
  String get polyunsaturatedFat => 'Flerumættet fedt';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Mættet fedt';

  @override
  String get transfat => 'Transfedt';

  @override
  String get cholesterol => 'Kolesterol';

  @override
  String get fiber => 'Fiber';

  @override
  String get sugar => 'Sukker';

  @override
  String get sugarAlcohol => 'Sukkeralkohol';

  @override
  String get starch => 'Stivelse';

  @override
  String get other => 'Andet';

  @override
  String get water => 'Vand';

  @override
  String get caffeine => 'Koffein';

  @override
  String get alcohol => 'Alkohol';

  @override
  String get salt => 'Salt';

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
