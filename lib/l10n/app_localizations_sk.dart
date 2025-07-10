// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Sledujte svoje jedlo a výživu ľahko a rýchlo.';

  @override
  String get appDescription =>
      'Sledujte svoje jedlo a výživu ľahko a rýchlo. Skenujte svoje produkty alebo hľadajte manuálne v rôznych databázach.';

  @override
  String get ok => 'DOBRE';

  @override
  String get fieldMandatory => 'Zadajte hodnotu';

  @override
  String get onlyNumbersAllowed => 'Povolené sú iba čísla';

  @override
  String get undo => 'Späť';

  @override
  String get deleted => 'odstránený';

  @override
  String get loading => 'Nakladanie';

  @override
  String somethingNotFound(String something) {
    return '$something not found';
  }

  @override
  String get unknownErrorText => 'Vyskytla sa neznáma chyba';

  @override
  String get tracking => 'Sledovanie';

  @override
  String get energy => 'Energia';

  @override
  String get protein => 'Bielkovín';

  @override
  String get carbs => 'Sacharidy';

  @override
  String get fat => 'Tuk';

  @override
  String get detailedSummary => 'Podrobné zhrnutie';

  @override
  String get dayComplete => 'Deň dokončený';

  @override
  String get markedDayAsComplete => 'Označený deň ako úplný';

  @override
  String get dayIncomplete => 'Deň neúplný';

  @override
  String get unmarkedDayAsComplete => 'Neoznačený deň ako kompletný';

  @override
  String get trackFood => 'Sledovanie potravín';

  @override
  String get timeSetHelpText =>
      'Pri sledovaní potravín sa tento čas použije ako vzor pre čas spotreby.';

  @override
  String get useAsTemplateForCustomFood =>
      'Použitie ako šablóna pre vlastné potraviny';

  @override
  String get additionalInformation => 'Ďalšie informácie';

  @override
  String get completeProductName => 'Úplný názov výrobku';

  @override
  String get addedDate => 'Added';

  @override
  String get consumedDate => 'Spotrebované';

  @override
  String get nutrients => 'Živiny';

  @override
  String get labelingEu => 'Označovanie (EÚ)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit contain';
  }

  @override
  String get dailyTarget => 'denný cieľ';

  @override
  String get general => 'Všeobecné';

  @override
  String get micronutrients => 'Mikroživiny';

  @override
  String get editTrackedFood => 'Úprava sledovaných potravín';

  @override
  String get scanBarcode => 'Skenovanie čiarového kódu';

  @override
  String get searchFood => 'Vyhľadávanie potravín';

  @override
  String get productOrBrand => 'Produkt alebo značka';

  @override
  String get searchError => 'Chyba pri vyhľadávaní';

  @override
  String get searchErrorHint =>
      'Nepodarilo sa získať aspoň jednu databázu zloženia potravín. Skúste to znova neskôr alebo dočasne vypnite nefunkčné databázy v nastaveniach.';

  @override
  String get affectedDatabases => 'Dotknuté databázy';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ani vo vlastných potravinách, ani na Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Nie je k dispozícii vo vlastných potravinách, Open Food Facts potrebuje prístup na internet';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Nenájdené vo vlastných potravinách, Open Food Facts vyhľadávanie malo chybu';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Nenachádza sa vo vlastných potravinách, Open Food Facts nie je aktivovaný';

  @override
  String get barcodeScanningUnsupported =>
      'Skenovanie čiarových kódov pomocou fotoaparátu zariadenia je momentálne podporované iba v systéme Android.';

  @override
  String get customFood => 'Vlastné potraviny';

  @override
  String get searchCustomFood => 'Vyhľadávanie potravín na mieru';

  @override
  String get addCustomFood => 'Add custom food';

  @override
  String get editCustomFood => 'Edit custom food';

  @override
  String get title => 'Title';

  @override
  String get barcode => 'Barcode';

  @override
  String get settings => 'Settings';

  @override
  String get yourPersonalNutritionNeeds => 'Your personal nutrition needs';

  @override
  String get personalNutritionNeedsHint =>
      'Calculate your personal nutrition needs or set them yourself';

  @override
  String get calculate => 'Calculate';

  @override
  String get energyDistribution => 'Energy distribution';

  @override
  String get yourBody => 'Your Body';

  @override
  String get age => 'Age';

  @override
  String get years => 'years';

  @override
  String get sex => 'Sex';

  @override
  String get female => 'Female';

  @override
  String get male => 'Male';

  @override
  String get weight => 'Weight';

  @override
  String get height => 'Body height';

  @override
  String get behaviourAndTarget => 'Behaviour and target';

  @override
  String get activityLevel => 'Activity Level (PAL)';

  @override
  String get activityLevel1_0 => 'You do basically nothing than sleep';

  @override
  String get activityLevel1_1 => 'You are laying in your bed the whole day';

  @override
  String get activityLevel1_2 => 'You are sitting in your bed the whole day';

  @override
  String get activityLevel1_3 => 'You don\'t really go outside very often';

  @override
  String get activityLevel1_4 => 'You are not that active at all';

  @override
  String get activityLevel1_5 => 'You do an office work';

  @override
  String get activityLevel1_6 =>
      'You are a bit active, work and sometimes do sports';

  @override
  String get activityLevel1_7 => 'You do workout often';

  @override
  String get activityLevel1_8 => 'You do workout hard regularly';

  @override
  String get activityLevel1_9 =>
      'You are very active, workout and don\'t have an office job';

  @override
  String get activityLevel2_0 =>
      'You do a physically active job and workout hard regularly';

  @override
  String get noActivityLevelDescription => 'No activity level description';

  @override
  String get weightTarget => 'Weight target';

  @override
  String get weightTargetStrongLoss => 'Strong loss';

  @override
  String get weightTargetModerateLoss => 'Moderate loss';

  @override
  String get weightTargetSlightLoss => 'Slight loss';

  @override
  String get weightTargetMaintaining => 'Maintaining';

  @override
  String get weightTargetSlightGain => 'Slight gain';

  @override
  String get weightTargetModerateGain => 'Moderate gain';

  @override
  String get weightTargetStrongGain => 'Strong gain';

  @override
  String get calculateNutritionTargets => 'Calculate nutrition targets';

  @override
  String get calculationInfo => 'Information about calculation';

  @override
  String get calculationInfoText1 =>
      'The calorie intake calculation is based on the Mifflin-St.Jeor formula. Please be aware that it can only act as an approximation to the real world values. These differ from person to person as their body conditions can diverge more or less.';

  @override
  String get formulaForFemales => 'Formula for females';

  @override
  String get weightInKg => 'Weight in kg';

  @override
  String get heightInCm => 'Height in cm';

  @override
  String get ageInYears => 'Age in years';

  @override
  String get formulaForMales => 'Formula for males';

  @override
  String get calculationInfoText2 =>
      'The output of this calculation is defined as the basal metabolic rate (BMR). It gets multiplied with your activity factor to receive your total power conversion. This is your calculated energy intake in kcal.';

  @override
  String get calculatedNutritionTargets => 'Calculated nutrition targets';

  @override
  String get calculatedNutritionTargetsHint =>
      'Feel free to edit the calculated targets according to your needs before applying them.';

  @override
  String get percentOfCalories => '% of kcal';

  @override
  String get proteinRatio => 'Protein ratio';

  @override
  String get carbsRatio => 'Carbs ratio';

  @override
  String get fatRatio => 'Fat ratio';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Also set micronutrient targets based on age and sex';

  @override
  String get apply => 'Apply';

  @override
  String get targetsApplied => 'Nutrition targets were applied';

  @override
  String get targetsApplyError => 'Nutrition targets could not be applied';

  @override
  String get totalEnergy => 'Total energy';

  @override
  String get energyDistributionChartMissingHint =>
      'The energy distribution chart is only shown if you have set a calories target and a target for at least one of the macronutrients.';

  @override
  String get percentOfTotalEnergy => 'Percent of total energy';

  @override
  String get selectedMacronutrient => 'Selected macronutrient';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calories, protein, carbs, fat';

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
  String get databaseManagement => 'Database management';

  @override
  String get databaseManagementHint => 'Select which food databases to query';

  @override
  String get storedOnDevice => 'Stored on device';

  @override
  String get swissFoodCompositionDatabase => 'Swiss Food Composition Database';

  @override
  String get version => 'Version';

  @override
  String get language => 'Language';

  @override
  String get languages => 'Languages';

  @override
  String get german => 'German';

  @override
  String get italian => 'Italian';

  @override
  String get french => 'French';

  @override
  String get publisher => 'Publisher';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federal Food Safety and Veterinary Office';

  @override
  String get switzerland => 'Switzerland';

  @override
  String get generalInformation => 'General information';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'This database offers about 1.100 general products and many micronutrients. Because it is stored on your device it therefore works offline.';

  @override
  String get source => 'Source';

  @override
  String get tapHereForFurtherInformation => 'Tap here for futher information.';

  @override
  String get serverBased => 'Server-based';

  @override
  String get openFoodFactsVariousLanguagesText => 'Various';

  @override
  String get nonProfitInstitution => 'Nonprofit institution';

  @override
  String get france => 'France';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Please be aware that whereas this database is very large, entries can be incomplete or out-of-date. Every registered user can update nutrient values. Adding new products is possible without creating an account. Deactivating this database does also include EAN scanning so you will only be able to scan custom foods by EAN code then.';

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get openFoodFactsTermsText =>
      'By activating this database you agree to the terms.';

  @override
  String get contribute => 'Contribute';

  @override
  String get databaseContributeText =>
      'See how you can help improving this database.';

  @override
  String get english => 'English';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central is a database of food and nutritions from the US department of agriculture. The data is under the public domain and contains about 200 foundation foods and over 380.000 branded foods.';

  @override
  String get backupAndRestore => 'Backup & Restore';

  @override
  String get backupAndRestoreHint =>
      'Store your data locally or on a WebDAV compatible cloud storage like Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Warning: Settings, personalizations and targets are not yet included!';

  @override
  String get successfullyCreatedBackup => 'Successfully created backup';

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

    return 'Exported $customFoodsCountString custom foods and $trackedFoodsCountString tracked foods';
  }

  @override
  String get successfullyRestoredBackup => 'Successfully restored backup';

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
  String get aboutEnergize => 'About Energize';

  @override
  String get license => 'license';

  @override
  String get allLicenses => 'All licenses';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Report issue';

  @override
  String get proposeImprovement => 'Propose improvement';

  @override
  String get sourceCode => 'Source code';

  @override
  String get translation => 'Translation';

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
  String get email => 'E-Mail';

  @override
  String get emailHint =>
      'Please use this only for other topics than the above';

  @override
  String get supportMeByDonating => 'Support me by donating';

  @override
  String get donate => 'Donate';

  @override
  String get donationText =>
      'If you want to support the development by a donation, you are very welcome to do so! Creating this app is a lot of fun but also a very time consuming task and sometimes leads to little frustration :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin address copied to clipboard';

  @override
  String get bankAccountOrCreditCard => 'Bank account or credit card';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'You are welcome to write me an e-mail for further donation options';

  @override
  String get energyAndMacronutrients => 'Energy and macronutrients';

  @override
  String get vitamins => 'Vitamins';

  @override
  String get vitaminA => 'Vitamin A';

  @override
  String get vitaminB1 => 'B1 (Thiamine)';

  @override
  String get vitaminB2 => 'B2 (Riboflavin)';

  @override
  String get vitaminB3 => 'B3 (Niacin)';

  @override
  String get vitaminB5 => 'B5 (Pantothenic acid)';

  @override
  String get vitaminB6 => 'Vitamin B6';

  @override
  String get vitaminB7 => 'B7 (Biotin)';

  @override
  String get vitaminB9 => 'B9 (Folate)';

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
  String get minerals => 'Minerals';

  @override
  String get majorMinerals => 'Major minerals';

  @override
  String get calcium => 'Calcium';

  @override
  String get chloride => 'Chloride';

  @override
  String get magnesium => 'Magnesium';

  @override
  String get phosphorous => 'Phosphorous';

  @override
  String get potassium => 'Potassium';

  @override
  String get sodium => 'Sodium';

  @override
  String get traceElements => 'Trace elements';

  @override
  String get chromium => 'Chromium';

  @override
  String get iron => 'Iron';

  @override
  String get fluorine => 'Fluorine';

  @override
  String get iodine => 'Iodine';

  @override
  String get copper => 'Copper';

  @override
  String get manganese => 'Manganese';

  @override
  String get molybdenum => 'Molybdenum';

  @override
  String get selenium => 'Selenium';

  @override
  String get zinc => 'Zinc';

  @override
  String get fats => 'Fats';

  @override
  String get monounsaturatedFat => 'Monounsaturated fat';

  @override
  String get polyunsaturatedFat => 'Polyunsaturated fat';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Saturated fat';

  @override
  String get transfat => 'Transfat';

  @override
  String get cholesterol => 'Cholesterol';

  @override
  String get fiber => 'Fiber';

  @override
  String get sugar => 'Sugar';

  @override
  String get sugarAlcohol => 'Sugar alcohol';

  @override
  String get starch => 'Starch';

  @override
  String get other => 'Other';

  @override
  String get water => 'Water';

  @override
  String get caffeine => 'Caffeine';

  @override
  String get alcohol => 'Alcohol';

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
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'Srv.',
        'l10nPackage': 'Pck.',
        'other': '',
      },
    );
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
