// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'உங்கள் உணவு மற்றும் ஊட்டச்சத்தை எளிதாகவும் வேகமாகவும் கண்காணிக்கவும்.';

  @override
  String get appDescription =>
      'உங்கள் உணவு மற்றும் ஊட்டச்சத்தை எளிதாகவும் வேகமாகவும் கண்காணிக்கவும். உங்கள் தயாரிப்புகளை ச்கேன் செய்யுங்கள் அல்லது வெவ்வேறு தரவுத்தளங்களில் கைமுறையாகத் தேடுங்கள்.';

  @override
  String get ok => 'சரி';

  @override
  String get fieldMandatory => 'தயவுசெய்து ஒரு மதிப்பை உள்ளிடவும்';

  @override
  String get onlyNumbersAllowed => 'எண்கள் மட்டுமே அனுமதிக்கப்படுகின்றன';

  @override
  String get undo => 'செயல்தவிர்';

  @override
  String get deleted => 'நீக்கப்பட்டது';

  @override
  String get loading => 'ஏற்றுகிறது';

  @override
  String somethingNotFound(String something) {
    return '$something காணப்படவில்லை';
  }

  @override
  String get unknownErrorText => 'அறியப்படாத பிழை ஏற்பட்டுள்ளது';

  @override
  String get tracking => 'கண்காணிப்பு';

  @override
  String get energy => 'ஆற்றல்';

  @override
  String get protein => 'புரதம்';

  @override
  String get carbs => 'கார்ப்ச்';

  @override
  String get fat => 'கொழுப்பு';

  @override
  String get detailedSummary => 'விரிவான சுருக்கம்';

  @override
  String get dayComplete => 'நாள் முடிந்தது';

  @override
  String get markedDayAsComplete => 'நாள் முழுமையானதாக குறிக்கப்பட்டுள்ளது';

  @override
  String get dayIncomplete => 'நாள் முழுமையடையாது';

  @override
  String get unmarkedDayAsComplete => 'குறிக்கப்படாத நாள் முழுமையானது';

  @override
  String get trackFood => 'உணவைக் கண்காணிக்கவும்';

  @override
  String get timeSetHelpText =>
      'உணவைக் கண்காணிக்கும் போது, இந்த நேரம் உட்கொள்ளும் நேரத்திற்கு ஒரு வார்ப்புருவாக பயன்படுத்தப்படும்.';

  @override
  String get useAsTemplateForCustomFood =>
      'தனிப்பயன் உணவுக்கு வார்ப்புருவாக பயன்படுத்தவும்';

  @override
  String get additionalInformation => 'கூடுதல் தகவல்';

  @override
  String get completeProductName => 'முழுமையான தயாரிப்பு பெயர்';

  @override
  String get addedDate => 'சேர்க்கப்பட்டது';

  @override
  String get consumedDate => 'நுகரப்பட்டது';

  @override
  String get nutrients => 'ஊட்டச்சத்துக்கள்';

  @override
  String get labelingEu => 'லேபிளிங் (ஐரோப்பிய ஒன்றியம்)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit கட்டுப்படுத்தவும்';
  }

  @override
  String get dailyTarget => 'நாள்தோறும் இலக்கு';

  @override
  String get general => 'பொது';

  @override
  String get micronutrients => 'நுண்ணூட்டச்சத்துக்கள்';

  @override
  String get editTrackedFood => 'கண்காணிக்கப்பட்ட உணவைத் திருத்து';

  @override
  String get scanBarcode => 'ச்கேன் பார்கோடு';

  @override
  String get searchFood => 'உணவைத் தேடுங்கள்';

  @override
  String get productOrBrand => 'தயாரிப்பு அல்லது சூட்டுக்குறி';

  @override
  String get searchError => 'தேடலின் போது பிழை';

  @override
  String get searchErrorHint =>
      'குறைந்தது ஒரு உணவு கலவை தரவுத்தளத்தை அடைய முடியவில்லை. தயவுசெய்து பின்னர் மீண்டும் முயற்சிக்கவும் அல்லது அமைப்புகளில் செயல்படாத தரவுத்தளங்களை தற்காலிகமாக முடக்கவும்.';

  @override
  String get affectedDatabases => 'பாதிக்கப்பட்ட தரவுத்தளங்கள்';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'தனிப்பயன் உணவுகளிலோ அல்லது திறந்த உணவு உண்மைகளிலோ இல்லை';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'தனிப்பயன் உணவுகளில் காணப்படவில்லை, திறந்த உணவு உண்மைகளுக்கு இணைய அணுகல் தேவை';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'தனிப்பயன் உணவுகளில் காணப்படவில்லை, திறந்த உணவு உண்மைகள் தேடலில் பிழை இருந்தது';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'தனிப்பயன் உணவுகளில் காணப்படவில்லை, திறந்த உணவு உண்மைகள் செயல்படுத்தப்படவில்லை';

  @override
  String get barcodeScanningUnsupported =>
      'சாதன கேமராவுடன் பார்கோடுகளை வருடு செய்வது தற்போது ஆண்ட்ராய்டு இல் மட்டுமே ஆதரிக்கப்படுகிறது.';

  @override
  String get customFood => 'தனிப்பயன் உணவு';

  @override
  String get searchCustomFood => 'தனிப்பயன் உணவைத் தேடுங்கள்';

  @override
  String get addCustomFood => 'தனிப்பயன் உணவைச் சேர்க்கவும்';

  @override
  String get editCustomFood => 'தனிப்பயன் உணவைத் திருத்தவும்';

  @override
  String get title => 'தலைப்பு';

  @override
  String get barcode => 'பார்கோடு';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get yourPersonalNutritionNeeds => 'உங்கள் தனிப்பட்ட ஊட்டச்சத்து தேவை';

  @override
  String get personalNutritionNeedsHint =>
      'உங்கள் தனிப்பட்ட ஊட்டச்சத்து தேவைகளை கணக்கிடுங்கள் அல்லது அவற்றை நீங்களே அமைக்கவும்';

  @override
  String get calculate => 'கணக்கிடுங்கள்';

  @override
  String get energyDistribution => 'ஆற்றல் வழங்கல்';

  @override
  String get yourBody => 'உங்கள் உடல்';

  @override
  String get age => 'அகவை';

  @override
  String get years => 'ஆண்டுகள்';

  @override
  String get sex => 'செக்ச்';

  @override
  String get female => 'பெண்';

  @override
  String get male => 'ஆண்';

  @override
  String get weight => 'எடை';

  @override
  String get height => 'உடல் உயரம்';

  @override
  String get behaviourAndTarget => 'நடத்தை மற்றும் இலக்கு';

  @override
  String get activityLevel => 'செயல்பாட்டு நிலை (பிஏஎல்)';

  @override
  String get activityLevel1_0 =>
      'நீங்கள் அடிப்படையில் தூக்கத்தைத் தவிர வேறொன்றையும் செய்யவில்லை';

  @override
  String get activityLevel1_1 =>
      'நீங்கள் நாள் முழுவதும் உங்கள் படுக்கையில் கிடக்கிறீர்கள்';

  @override
  String get activityLevel1_2 =>
      'நீங்கள் நாள் முழுவதும் உங்கள் படுக்கையில் அமர்ந்திருக்கிறீர்கள்';

  @override
  String get activityLevel1_3 =>
      'நீங்கள் உண்மையில் அடிக்கடி வெளியே செல்லமாட்டீர்கள்';

  @override
  String get activityLevel1_4 => 'நீங்கள் அவ்வளவு சுறுசுறுப்பாக இல்லை';

  @override
  String get activityLevel1_5 => 'நீங்கள் ஒரு அலுவலக வேலை செய்கிறீர்கள்';

  @override
  String get activityLevel1_6 =>
      'நீங்கள் கொஞ்சம் சுறுசுறுப்பானவர், வேலை மற்றும் சில நேரங்களில் விளையாட்டு செய்யுங்கள்';

  @override
  String get activityLevel1_7 => 'நீங்கள் அடிக்கடி பயிற்சி செய்கிறீர்கள்';

  @override
  String get activityLevel1_8 =>
      'நீங்கள் வழக்கமாக வொர்க்அவுட்டை கடினமாக செய்கிறீர்கள்';

  @override
  String get activityLevel1_9 =>
      'நீங்கள் மிகவும் சுறுசுறுப்பாக இருக்கிறீர்கள், பயிற்சி மற்றும் அலுவலக வேலை இல்லை';

  @override
  String get activityLevel2_0 =>
      'நீங்கள் உடல் ரீதியாக சுறுசுறுப்பான வேலை மற்றும் வொர்க்அவுட்டை தவறாமல் செய்கிறீர்கள்';

  @override
  String get noActivityLevelDescription => 'செயல்பாட்டு நிலை விளக்கம் இல்லை';

  @override
  String get weightTarget => 'எடை இலக்கு';

  @override
  String get weightTargetStrongLoss => 'வலுவான இழப்பு';

  @override
  String get weightTargetModerateLoss => 'மிதமான இழப்பு';

  @override
  String get weightTargetSlightLoss => 'லேசான இழப்பு';

  @override
  String get weightTargetMaintaining => 'பராமரித்தல்';

  @override
  String get weightTargetSlightGain => 'லேசான ஆதாயம்';

  @override
  String get weightTargetModerateGain => 'மிதமான ஆதாயம்';

  @override
  String get weightTargetStrongGain => 'வலுவான ஆதாயம்';

  @override
  String get calculateNutritionTargets =>
      'ஊட்டச்சத்து இலக்குகளைக் கணக்கிடுங்கள்';

  @override
  String get calculationInfo => 'கணக்கீடு பற்றிய செய்தி';

  @override
  String get calculationInfoText1 =>
      'கலோரி உட்கொள்ளல் கணக்கீடு மிஃப்ளின்-ச்ட்.சியர் சூத்திரத்தை அடிப்படையாகக் கொண்டது. இது உண்மையான உலக மதிப்புகளுக்கு தோராயமாக மட்டுமே செயல்பட முடியும் என்பதை நினைவில் கொள்க. அவற்றின் உடல் நிலைமைகள் அதிகமாகவோ அல்லது குறைவாகவோ வேறுபடுவதால் இவை நபரிடமிருந்து நபருக்கு வேறுபடுகின்றன.';

  @override
  String get formulaForFemales => 'பெண்களுக்கான தேற்றம்';

  @override
  String get weightInKg => 'கிலோ எடை';

  @override
  String get heightInCm => 'முதல்வரில் உயரம்';

  @override
  String get ageInYears => 'ஆண்டுகளில் அகவை';

  @override
  String get formulaForMales => 'ஆண்களுக்கான தேற்றம்';

  @override
  String get calculationInfoText2 =>
      'இந்த கணக்கீட்டின் வெளியீடு அடித்தள வளர்சிதை மாற்ற விகிதம் (பிஎம்ஆர்) என வரையறுக்கப்படுகிறது. உங்கள் மொத்த ஆற்றல் மாற்றத்தைப் பெற இது உங்கள் செயல்பாட்டு காரணியுடன் பெருக்கப்படுகிறது. இது கிலோகலோரி உங்கள் கணக்கிடப்பட்ட ஆற்றல் உட்கொள்ளல்.';

  @override
  String get calculatedNutritionTargets =>
      'கணக்கிடப்பட்ட ஊட்டச்சத்து இலக்குகள்';

  @override
  String get calculatedNutritionTargetsHint =>
      'கணக்கிடப்பட்ட இலக்குகளை உங்கள் தேவைகளுக்கு ஏற்ப அவற்றைப் பயன்படுத்துவதற்கு முன்பு திருத்தலாம்.';

  @override
  String get percentOfCalories => 'கிலோகலோரி %';

  @override
  String get proteinRatio => 'புரத விகிதம்';

  @override
  String get carbsRatio => 'கார்ப்ச் விகிதம்';

  @override
  String get fatRatio => 'கொழுப்பு விகிதம்';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'அகவை மற்றும் பாலினத்தின் அடிப்படையில் நுண்ணூட்டச்சத்து இலக்குகளையும் அமைக்கவும்';

  @override
  String get apply => 'இடு';

  @override
  String get targetsApplied => 'ஊட்டச்சத்து இலக்குகள் பயன்படுத்தப்பட்டன';

  @override
  String get targetsApplyError =>
      'ஊட்டச்சத்து இலக்குகளைப் பயன்படுத்த முடியவில்லை';

  @override
  String get totalEnergy => 'மொத்த ஆற்றல்';

  @override
  String get energyDistributionChartMissingHint =>
      'நீங்கள் ஒரு கலோரிகள் இலக்கு மற்றும் குறைந்தது ஒரு மக்ரோனூட்ரியன்களுக்கு இலக்கை அமைத்திருந்தால் மட்டுமே ஆற்றல் விநியோக விளக்கப்படம் காட்டப்படும்.';

  @override
  String get percentOfTotalEnergy => 'மொத்த ஆற்றலின் விழுக்காடு';

  @override
  String get selectedMacronutrient => 'தேர்ந்தெடுக்கப்பட்ட மக்ரோனூட்ரியண்ட்';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'கலோரிகள், புரதம், கார்ப்ச், கொழுப்பு';

  @override
  String get display => 'காட்சி';

  @override
  String get displayHint =>
      'உங்கள் தேவைகளுக்கு பயனர் இடைமுகத்தைத் தனிப்பயனாக்கவும்';

  @override
  String get groupFoodsToMeals => 'உணவுக்கு குழு உணவுகள்';

  @override
  String get groupFoodsToMealsHint =>
      'தானாகவே ஒரு குறுகிய இடைவெளியில் உட்கொள்ளும் உணவுகளை ஒரு உணவாக ஒன்றாகக் குழுக்கள்';

  @override
  String get preferServingSizes => 'பணி அளவுகளை விரும்புகிறது';

  @override
  String get preferServingSizesHint =>
      'புதிய உணவைக் கண்காணிக்கும் போது, ஒரு பணி அளவு முன்னரே தேர்ந்தெடுக்கப்பட்டால், ஏதேனும் இருந்தால்';

  @override
  String mealAt(String time) {
    return '$time இல் உணவு';
  }

  @override
  String get databaseManagement => 'தரவுத்தள மேலாண்மை';

  @override
  String get databaseManagementHint =>
      'எந்த உணவு தரவுத்தளங்களை வினவ வேண்டும் என்பதைத் தேர்ந்தெடுக்கவும்';

  @override
  String get storedOnDevice => 'சாதனத்தில் சேமிக்கப்படுகிறது';

  @override
  String get swissFoodCompositionDatabase => 'சுவிச் உணவு கலவை தரவுத்தளம்';

  @override
  String get version => 'பதிப்பு';

  @override
  String get language => 'மொழி';

  @override
  String get languages => 'மொழிகள்';

  @override
  String get german => 'செர்மன்';

  @override
  String get italian => 'இத்தாலிய';

  @override
  String get french => 'பிரஞ்சு';

  @override
  String get publisher => 'வெளியீட்டாளர்';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'கூட்டாட்சி உணவு பாதுகாப்பு மற்றும் கால்நடை அலுவலகம்';

  @override
  String get switzerland => 'சுவிட்சர்லாந்து';

  @override
  String get generalInformation => 'பொது செய்தி';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'இந்த தரவுத்தளம் சுமார் 1.100 பொது தயாரிப்புகள் மற்றும் பல நுண்ணூட்டச்சத்துக்களை வழங்குகிறது. இது உங்கள் சாதனத்தில் சேமிக்கப்படுவதால் அது ஆஃப்லைனில் வேலை செய்கிறது.';

  @override
  String get source => 'மூலம்';

  @override
  String get tapHereForFurtherInformation => 'மேலும் தகவலுக்கு இங்கே தட்டவும்.';

  @override
  String get serverBased => 'சேவையக அடிப்படையிலான';

  @override
  String get openFoodFactsVariousLanguagesText => 'பல்வேறு';

  @override
  String get nonProfitInstitution => 'இலாப நோக்கற்ற நிறுவனம்';

  @override
  String get france => 'ஃப்ரான்ச்';

  @override
  String get openFoodFactsGeneralInformationText =>
      'இந்த தரவுத்தளம் மிகப் பெரியதாக இருந்தாலும், உள்ளீடுகள் முழுமையடையாது அல்லது காலாவதியானவை என்பதை நினைவில் கொள்க. பதிவுசெய்யப்பட்ட ஒவ்வொரு பயனரும் ஊட்டச்சத்து மதிப்புகளைப் புதுப்பிக்க முடியும். ஒரு கணக்கை உருவாக்காமல் புதிய தயாரிப்புகளைச் சேர்ப்பது சாத்தியமாகும். இந்த தரவுத்தளத்தை செயலிழக்கச் செய்வது EAN ச்கேனிங்கையும் உள்ளடக்கியது, எனவே நீங்கள் தனிப்பயன் உணவுகளை EAN குறியீட்டால் மட்டுமே ச்கேன் செய்ய முடியும்.';

  @override
  String get termsOfUse => 'பயன்பாட்டு விதிமுறைகள்';

  @override
  String get openFoodFactsTermsText =>
      'இந்த தரவுத்தளத்தை செயல்படுத்துவதன் மூலம் நீங்கள் விதிமுறைகளை ஒப்புக்கொள்கிறீர்கள்.';

  @override
  String get contribute => 'பங்களிப்பு';

  @override
  String get databaseContributeText =>
      'இந்த தரவுத்தளத்தை மேம்படுத்த நீங்கள் எவ்வாறு உதவ முடியும் என்பதைப் பாருங்கள்.';

  @override
  String get english => 'ஆங்கிலம்';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'ஃபுட் டேட்டா சென்ட்ரல் என்பது அமெரிக்க வேளாண்மைத் துறையின் உணவு மற்றும் ஊட்டச்சத்துகளின் தரவுத்தளமாகும். தரவு பொது களத்தின் கீழ் உள்ளது மற்றும் சுமார் 200 அடித்தள உணவுகள் மற்றும் 380.000 சூட்டுக்குறியிட்ட உணவுகள் உள்ளன.';

  @override
  String get backupAndRestore => 'காப்புப்பிரதி மற்றும் மீட்டமை';

  @override
  String get backupAndRestoreHint =>
      'உங்கள் தரவை உள்நாட்டில் அல்லது நெக்ச்ட் முகில் போன்ற ஒரு WebDAV இணக்கமான முகில் சேமிப்பிடத்தில் சேமிக்கவும்';

  @override
  String get missingBackupPartsHint =>
      'எச்சரிக்கை: அமைப்புகள், தனிப்பட்டமயமாக்கல்கள் மற்றும் இலக்குகள் இன்னும் சேர்க்கப்படவில்லை!';

  @override
  String get successfullyCreatedBackup =>
      'வெற்றிகரமாக காப்புப்பிரதி உருவாக்கியது';

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

    return 'ஏற்றுமதி செய்யப்பட்ட $customFoodsCountString தனிப்பயன் உணவுகள் மற்றும் $trackedFoodsCountString கண்காணிக்கப்பட்ட உணவுகள்';
  }

  @override
  String get successfullyRestoredBackup =>
      'வெற்றிகரமாக மீட்டெடுக்கப்பட்ட காப்புப்பிரதி';

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

    return 'இறக்குமதி செய்யப்பட்ட $customFoodsCountString தனிப்பயன் உணவுகள் மற்றும் $trackedFoodsCountString கண்காணிக்கப்பட்ட உணவுகள்';
  }

  @override
  String get createWebDAVBackup => 'WebDAV காப்புப்பிரதியை உருவாக்கவும்';

  @override
  String get webDAVSettings => 'WebDAV அமைப்புகள்';

  @override
  String get serverURL => 'சேவையக முகவரி';

  @override
  String get invalidURL => 'முகவரி தவறானது';

  @override
  String get username => 'பயனர்பெயர்';

  @override
  String get password => 'கடவுச்சொல்';

  @override
  String get pathAndFilename => 'பாதை மற்றும் கோப்பு பெயர்';

  @override
  String energizeBackup(String appName) {
    return '$appName காப்புப்பிரதி';
  }

  @override
  String get backupPasswordNotice =>
      'காப்புப்பிரதி கடவுச்சொல் இல்லாமல், காப்புப்பிரதியை மீட்டெடுப்பது சாத்தியமில்லை.';

  @override
  String get restoreWebDAVBackup => 'WebDAV காப்புப்பிரதியை மீட்டெடுங்கள்';

  @override
  String get createLocalBackup => 'உள்ளக காப்புப்பிரதியை உருவாக்கவும்';

  @override
  String get restoreLocalBackup => 'உள்ளக காப்புப்பிரதியை மீட்டெடுக்கவும்';

  @override
  String get aboutEnergize => 'ஆற்றல் பற்றி';

  @override
  String get license => 'உரிமம்';

  @override
  String get allLicenses => 'அனைத்து உரிமங்களும்';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get logs => 'பதிவுகள்';

  @override
  String get reportIssue => 'சிக்கல் அறிக்கை';

  @override
  String get proposeImprovement => 'முன்னேற்றத்தை முன்மொழியுங்கள்';

  @override
  String get sourceCode => 'மூலக் குறியீடு';

  @override
  String get translation => 'மொழிபெயர்ப்பு';

  @override
  String get contributors => 'பங்களிப்பாளர்கள்';

  @override
  String get thanksToContributorsText =>
      'ஆற்றலுக்கு பங்களித்த அனைத்து மக்களுக்கும் நன்றி. உங்கள் உதவியின் காரணமாக, எனர்சைச் இப்போது என்னவாக இருக்கும்.';

  @override
  String get contributionTypeCodeAndConversations =>
      'குறியீடு மற்றும் உரையாடல்கள்';

  @override
  String get contributionTypeAcrylicPicture => 'அக்ரிலிக் படம்';

  @override
  String get allTranslatorsOnWeblate =>
      'வெப்லேட்டில் உள்ள அனைத்து மொழிபெயர்ப்பாளர்களும்';

  @override
  String get contact => 'தொடர்பு';

  @override
  String get email => 'மின்னஞ்சல்';

  @override
  String get emailHint =>
      'மேலே உள்ளதை விட பிற தலைப்புகளுக்கு மட்டுமே இதைப் பயன்படுத்தவும்';

  @override
  String get supportMeByDonating => 'நன்கொடை அளிப்பதன் மூலம் என்னை ஆதரிக்கவும்';

  @override
  String get donate => 'நன்கொடை';

  @override
  String get donationText =>
      'நன்கொடை மூலம் நீங்கள் வளர்ச்சியை ஆதரிக்க விரும்பினால், அவ்வாறு செய்ய நீங்கள் மிகவும் வரவேற்கப்படுகிறீர்கள்! இந்த பயன்பாட்டை உருவாக்குவது மிகவும் வேடிக்கையானது, ஆனால் அதிக நேரம் எடுக்கும் பணியாகும், சில சமயங்களில் சிறிய விரக்திக்கு வழிவகுக்கிறது :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'பிட்காயின் முகவரி கிளிப்போர்டுக்கு நகலெடுக்கப்பட்டது';

  @override
  String get bankAccountOrCreditCard => 'வங்கி கணக்கு அல்லது கடன் அட்டை';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'மேலும் நன்கொடை விருப்பங்களுக்காக எனக்கு ஒரு மின்னஞ்சல் எழுத உங்களை வரவேற்கிறோம்';

  @override
  String get energyAndMacronutrients => 'ஆற்றல் மற்றும் மேக்ரோனூட்ரியன்கள்';

  @override
  String get vitamins => 'வைட்டமின்கள்';

  @override
  String get vitaminA => 'வைட்டமின் அ';

  @override
  String get vitaminB1 => 'பி 1 (தியாமின்)';

  @override
  String get vitaminB2 => 'பி 2 (ரைபோஃப்ளேவின்)';

  @override
  String get vitaminB3 => 'பி 3 (நியாசின்)';

  @override
  String get vitaminB5 => 'பி 5 (பாண்டோத்தேனிக் அமிலம்)';

  @override
  String get vitaminB6 => 'வைட்டமின் பி';

  @override
  String get vitaminB7 => 'பி.டி (பயோட்டின்)';

  @override
  String get vitaminB9 => 'பி 9 (ஃபோலேட்)';

  @override
  String get vitaminB12 => 'பி 12 (கோபாலமின்)';

  @override
  String get vitaminC => 'வைட்டமின் சி';

  @override
  String get vitaminD => 'வைட்டமின் டி';

  @override
  String get vitaminE => 'வைட்டமின் இ';

  @override
  String get vitaminK => 'வைட்டமின் கே';

  @override
  String get minerals => 'தாதுக்கள்';

  @override
  String get majorMinerals => 'பெரிய தாதுக்கள்';

  @override
  String get calcium => 'சுண்ணவியம்';

  @override
  String get chloride => 'பாசிகம்';

  @override
  String get magnesium => 'வெளிமம்';

  @override
  String get phosphorous => 'தீமுறி, பிரகாசிதம்';

  @override
  String get potassium => 'சாம்பரம்';

  @override
  String get sodium => 'உவர்மம்';

  @override
  String get traceElements => 'சுவடு கூறுகள்';

  @override
  String get chromium => 'நீலிரும்பு, குருமம்';

  @override
  String get iron => 'இரும்பு';

  @override
  String get fluorine => 'ஃவுளூரின்';

  @override
  String get iodine => 'நைலம்';

  @override
  String get copper => 'செம்பு, செப்பு, தாமிரம்';

  @override
  String get manganese => 'மங்கனம்';

  @override
  String get molybdenum => 'மாலிப்டினம்';

  @override
  String get selenium => 'செங்கந்தகம், மதிமம்';

  @override
  String get zinc => 'நாகம்';

  @override
  String get fats => 'கொழுப்புகள்';

  @override
  String get monounsaturatedFat => 'மோனோசாச்சுரேட்டட் கொழுப்பு';

  @override
  String get polyunsaturatedFat => 'பாலிஅன்சாச்சுரேட்டட் கொழுப்பு';

  @override
  String get omega3 => 'ஒமேகா 3';

  @override
  String get omega6 => 'ஒமேகா 6';

  @override
  String get saturatedFat => 'பூரிதக் கொழுப்பு';

  @override
  String get transfat => 'டிரான்ச் கொழுப்பு';

  @override
  String get cholesterol => 'கொழுப்பு';

  @override
  String get fiber => 'ஃபைபர்';

  @override
  String get sugar => 'சர்க்கரை';

  @override
  String get sugarAlcohol => 'சர்க்கரை ஆல்கஆல்';

  @override
  String get starch => 'மாவுச்சத்து';

  @override
  String get other => 'மற்றொன்று';

  @override
  String get water => 'நீர்';

  @override
  String get caffeine => 'வெறியம்';

  @override
  String get alcohol => 'மதுசாரம்';

  @override
  String get salt => 'உப்பு';

  @override
  String get servingSizes => 'பணி அளவுகள்';

  @override
  String get add => 'கூட்டு';

  @override
  String get noServingSizesText => 'பணி அளவுகள் எதுவும் இல்லை.';

  @override
  String get addServingSize => 'பணி அளவு சேர்க்கவும்';

  @override
  String get typicalServingSizes => 'வழக்கமான பணி அளவுகள்';

  @override
  String get or => 'அல்லது';

  @override
  String get servingSizeName => 'பணி அளவு பெயர்';

  @override
  String get size => 'அளவு';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'சேவை.',
        'l10nPackage': 'கட்டு.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'அப்பத்தை';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'ஆச்பிரவுன்கள்';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'வறுத்த ஓக்ரா';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'ச்காட்ச் முட்டை';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'யார்க்சயர் புட்டு';

  @override
  String get testCustomFood5Calories => '259';
}
