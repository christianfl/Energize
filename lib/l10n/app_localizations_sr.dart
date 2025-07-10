// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort => 'Пратите вашу исхрану брзо и лако.';

  @override
  String get appDescription =>
      'Пратите вашу исхрану брзо и лако. Скенирајте производе или ручно претражите постојеће базе података.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Унесите вредност';

  @override
  String get onlyNumbersAllowed => 'Дозвољени су само бројеви';

  @override
  String get undo => 'Undo';

  @override
  String get deleted => 'deleted';

  @override
  String get loading => 'Loading';

  @override
  String somethingNotFound(String something) {
    return '$something not found';
  }

  @override
  String get unknownErrorText => 'An unknown error has occured';

  @override
  String get tracking => 'Праћење';

  @override
  String get energy => 'Енергија';

  @override
  String get protein => 'Беланчевине (протеини)';

  @override
  String get carbs => 'Угљени хидрати';

  @override
  String get fat => 'Масти';

  @override
  String get detailedSummary => 'Детаљни пресек';

  @override
  String get dayComplete => 'Окончај дан';

  @override
  String get markedDayAsComplete => 'Дан је окончан';

  @override
  String get dayIncomplete => 'Дан није готов';

  @override
  String get unmarkedDayAsComplete => 'Означено је да дан још траје';

  @override
  String get trackFood => 'Прати исхрану';

  @override
  String get timeSetHelpText =>
      'When tracking food, this time will be used as a template for the time of consume.';

  @override
  String get useAsTemplateForCustomFood =>
      'Користи као шаблон за произвољну храну';

  @override
  String get additionalInformation => 'Additional information';

  @override
  String get completeProductName => 'Complete product name';

  @override
  String get addedDate => 'Added';

  @override
  String get consumedDate => 'Consumed';

  @override
  String get nutrients => 'Nutrients';

  @override
  String get labelingEu => 'Labeling (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit contain';
  }

  @override
  String get dailyTarget => 'daily target';

  @override
  String get general => 'Опште';

  @override
  String get micronutrients => 'Микронутријенти';

  @override
  String get editTrackedFood => 'Уреди праћену храну';

  @override
  String get scanBarcode => 'Scan barcode';

  @override
  String get searchFood => 'Потражи храну';

  @override
  String get productOrBrand => 'Product or brand';

  @override
  String get searchError => 'Error during search';

  @override
  String get searchErrorHint =>
      'At least one food composition database could not be reached. Please try again later or temporarily disable non-functional databases in the settings.';

  @override
  String get affectedDatabases => 'Affected databases';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Neither in custom foods nor on Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Not found in custom foods, Open Food Facts needs internet access';

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
  String get customFood => 'Произвољна храна';

  @override
  String get searchCustomFood => 'Потражи произвољну храну';

  @override
  String get addCustomFood => 'Додај произвољну храну';

  @override
  String get editCustomFood => 'Уреди произвољну храну';

  @override
  String get title => 'Наслов';

  @override
  String get barcode => 'Бар-код';

  @override
  String get settings => 'Подешавања';

  @override
  String get yourPersonalNutritionNeeds => 'Ваше нутритивне потребе';

  @override
  String get personalNutritionNeedsHint =>
      'Израчунај личне нутритивне потребе или их сами поставите';

  @override
  String get calculate => 'Израчунај';

  @override
  String get energyDistribution => 'Расподела енергије';

  @override
  String get yourBody => 'Ваше тело';

  @override
  String get age => 'Старост';

  @override
  String get years => 'година';

  @override
  String get sex => 'Пол';

  @override
  String get female => 'Женско';

  @override
  String get male => 'Мушко';

  @override
  String get weight => 'Тежина';

  @override
  String get height => 'Висина';

  @override
  String get behaviourAndTarget => 'Понашање и циљ';

  @override
  String get activityLevel => 'Ниво покретности (PAL)';

  @override
  String get activityLevel1_0 => 'Не радите било шта осим спавања';

  @override
  String get activityLevel1_1 => 'Лежите у кревету по цео дан';

  @override
  String get activityLevel1_2 => 'Седите у кревету по цео дан';

  @override
  String get activityLevel1_3 => 'Не излазите веома често';

  @override
  String get activityLevel1_4 => 'Нисте превише активни';

  @override
  String get activityLevel1_5 => 'Радите у канцеларији';

  @override
  String get activityLevel1_6 =>
      'Делимично сте активни, радите и некада се бавите спортом';

  @override
  String get activityLevel1_7 => 'Вежбате с времена на време';

  @override
  String get activityLevel1_8 => 'Често и редовно вежбате';

  @override
  String get activityLevel1_9 =>
      'Веома сте активни, вежбате и немате канцеларијски посао';

  @override
  String get activityLevel2_0 =>
      'Радите на физички захтевном послу и често вежбате';

  @override
  String get noActivityLevelDescription => 'Нема описа нивоа покретности';

  @override
  String get weightTarget => 'Жељена тежина';

  @override
  String get weightTargetStrongLoss => 'Значајно мршављење';

  @override
  String get weightTargetModerateLoss => 'Умерено мршављење';

  @override
  String get weightTargetSlightLoss => 'Омање мршављење';

  @override
  String get weightTargetMaintaining => 'Одржавање тежине';

  @override
  String get weightTargetSlightGain => 'Омање удебљавање';

  @override
  String get weightTargetModerateGain => 'Умерено удебљавање';

  @override
  String get weightTargetStrongGain => 'Значајно удебљавање';

  @override
  String get calculateNutritionTargets => 'Израчунај нутритивне потребе';

  @override
  String get calculationInfo => 'Подаци о обрачуну';

  @override
  String get calculationInfoText1 =>
      'The calorie intake calculation is based on the Mifflin-St.Jeor formula. Please be aware that it can only act as an approximation to the real world values. These differ from person to person as their body conditions can diverge more or less.';

  @override
  String get formulaForFemales => 'Формула за жене';

  @override
  String get weightInKg => 'Тежина у кг';

  @override
  String get heightInCm => 'Висина у цм';

  @override
  String get ageInYears => 'Старост у годинама';

  @override
  String get formulaForMales => 'Формула за мушкарце';

  @override
  String get calculationInfoText2 =>
      'The output of this calculation is defined as the basal metabolic rate (BMR). It gets multiplied with your activity factor to receive your total power conversion. This is your calculated energy intake in kcal.';

  @override
  String get calculatedNutritionTargets => 'Срачунате нутритивне потребе';

  @override
  String get calculatedNutritionTargetsHint =>
      'Слободно промените нутритивне потребе у складу са вашим жељама, пре примене.';

  @override
  String get percentOfCalories => '% калорија';

  @override
  String get proteinRatio => 'Однос протеина';

  @override
  String get carbsRatio => 'Однос угљених хидрата';

  @override
  String get fatRatio => 'Однос масти';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Такође подеси потребе за микронутријентима на основу старости и пола';

  @override
  String get apply => 'Примени';

  @override
  String get targetsApplied => 'Потребе за микронутријентима су примењене';

  @override
  String get targetsApplyError => 'Потребе за микронутријентима нису примењене';

  @override
  String get totalEnergy => 'Укупна енергија';

  @override
  String get energyDistributionChartMissingHint =>
      'The energy distribution chart is only shown if you have set a calories target and a target for at least one of the macronutrients.';

  @override
  String get percentOfTotalEnergy => 'Процената укупне енергије';

  @override
  String get selectedMacronutrient => 'Изабрани микронутријент';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Калорија, протеина, угљених хидрата, масти';

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
  String get databaseManagement => 'Управљање базом података';

  @override
  String get databaseManagementHint =>
      'Изаберите које базе хране треба претражити';

  @override
  String get storedOnDevice => 'Сачувано на уређају';

  @override
  String get swissFoodCompositionDatabase => 'Swiss Food Composition Database';

  @override
  String get version => 'Version';

  @override
  String get language => 'Језик';

  @override
  String get languages => 'Languages';

  @override
  String get german => 'Немачки';

  @override
  String get italian => 'Italian';

  @override
  String get french => 'French';

  @override
  String get publisher => 'Издавач';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federal Food Safety and Veterinary Office';

  @override
  String get switzerland => 'Швајцарска';

  @override
  String get generalInformation => 'Општи подаци';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'This database offers about 1.100 general products and many micronutrients. Because it is stored on your device it therefore works offline.';

  @override
  String get source => 'Извор';

  @override
  String get tapHereForFurtherInformation => 'Тапните за више података.';

  @override
  String get serverBased => 'На удаљеном серверу';

  @override
  String get openFoodFactsVariousLanguagesText => 'Разно';

  @override
  String get nonProfitInstitution => 'Непрофитна организација';

  @override
  String get france => 'Француска';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Please be aware that whereas this database is very large, entries can be incomplete or out-of-date. Every registered user can update nutrient values. Adding new products is possible without creating an account. Deactivating this database does also include EAN scanning so you will only be able to scan custom foods by EAN code then.';

  @override
  String get termsOfUse => 'Услови коришћења';

  @override
  String get openFoodFactsTermsText =>
      'Покретањем ове базе изражавате слагање са условима коришћења.';

  @override
  String get contribute => 'Допринеси';

  @override
  String get databaseContributeText =>
      'Погледајте како можете побољшати ову базу података.';

  @override
  String get english => 'Енглески';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central is a database of food and nutritions from the US department of agriculture. The data is under the public domain and contains about 200 foundation foods and over 380.000 branded foods.';

  @override
  String get backupAndRestore => 'Резервна копија';

  @override
  String get backupAndRestoreHint =>
      'Сачувајте ваше податке на ВебДАВ компатибилно складиште на облаку као што је то Nextcloud';

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
  String get aboutEnergize => 'О програму Energize';

  @override
  String get license => 'лиценца';

  @override
  String get allLicenses => 'Све лиценце';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Пријави проблем';

  @override
  String get proposeImprovement => 'Propose improvement';

  @override
  String get sourceCode => 'Изворни код';

  @override
  String get translation => 'Превод';

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
  String get contact => 'Контакт';

  @override
  String get email => 'Имејл';

  @override
  String get emailHint =>
      'Please use this only for other topics than the above';

  @override
  String get supportMeByDonating => 'Подржите ме донацијама';

  @override
  String get donate => 'Донирај';

  @override
  String get donationText =>
      'If you want to support the development by a donation, you are very welcome to do so! Creating this app is a lot of fun but also a very time consuming task and sometimes leads to little frustration :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Биткоин адреса ископирана у оставу';

  @override
  String get bankAccountOrCreditCard => 'Банковни рачун или кредитна картица';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'You are welcome to write me an e-mail for further donation options';

  @override
  String get energyAndMacronutrients => 'Енергија и макронутријенти';

  @override
  String get vitamins => 'Витамини';

  @override
  String get vitaminA => 'Витамин А';

  @override
  String get vitaminB1 => 'Б1 (тиамин)';

  @override
  String get vitaminB2 => 'Б2 (рибофлавин)';

  @override
  String get vitaminB3 => 'Б3 (ниацин)';

  @override
  String get vitaminB5 => 'Б5 (пантотенска киселина)';

  @override
  String get vitaminB6 => 'Витамин Б6';

  @override
  String get vitaminB7 => 'Б7 (биотин)';

  @override
  String get vitaminB9 => 'Б9 (фолат)';

  @override
  String get vitaminB12 => 'Б12 (кобаламин)';

  @override
  String get vitaminC => 'Витамин Ц';

  @override
  String get vitaminD => 'Витамин Д';

  @override
  String get vitaminE => 'Витамин Е';

  @override
  String get vitaminK => 'Витамин К';

  @override
  String get minerals => 'Минерали';

  @override
  String get majorMinerals => 'Најважнији минерали';

  @override
  String get calcium => 'Калцијум';

  @override
  String get chloride => 'Хлорид';

  @override
  String get magnesium => 'Магнезијум';

  @override
  String get phosphorous => 'Фосфор';

  @override
  String get potassium => 'Калијум';

  @override
  String get sodium => 'Натријум';

  @override
  String get traceElements => 'Елементи у траговима';

  @override
  String get chromium => 'Хром';

  @override
  String get iron => 'Гвожђе';

  @override
  String get fluorine => 'Флуор';

  @override
  String get iodine => 'Јод';

  @override
  String get copper => 'Бакар';

  @override
  String get manganese => 'Манган';

  @override
  String get molybdenum => 'Молибден';

  @override
  String get selenium => 'Селен';

  @override
  String get zinc => 'Цинк';

  @override
  String get fats => 'Масти';

  @override
  String get monounsaturatedFat => 'Мононезасићена маст';

  @override
  String get polyunsaturatedFat => 'Полинезасићена маст';

  @override
  String get omega3 => 'Омега 3';

  @override
  String get omega6 => 'Омега 6';

  @override
  String get saturatedFat => 'Засићена маст';

  @override
  String get transfat => 'Транс масти';

  @override
  String get cholesterol => 'Холестерол';

  @override
  String get fiber => 'Влакна';

  @override
  String get sugar => 'Шећер';

  @override
  String get sugarAlcohol => 'Шећерни алкохол';

  @override
  String get starch => 'Скроб';

  @override
  String get other => 'Друго';

  @override
  String get water => 'Вода';

  @override
  String get caffeine => 'Кофеин';

  @override
  String get alcohol => 'Алкохол';

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
