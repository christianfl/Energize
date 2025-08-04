// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'מעקב אחר המזון והתזונה שלך במהירות ובקלות.';

  @override
  String get appDescription =>
      'מעקב אחר המזון והתזונה שלך במהירות ובקלות. אפשר לסרוק את המוצרים שלך או לחפש ידנית במגוון מסדי נתונים.';

  @override
  String get ok => 'אישור';

  @override
  String get fieldMandatory => 'נא למלא ערך';

  @override
  String get onlyNumbersAllowed => 'מותר רק מספרים';

  @override
  String get undo => 'הסגה';

  @override
  String get deleted => 'נמחק';

  @override
  String get loading => 'בטעינה';

  @override
  String somethingNotFound(String something) {
    return '$something לא נמצא';
  }

  @override
  String get unknownErrorText => 'אירעה שגיאה בלתי ידועה';

  @override
  String get tracking => 'מעקב';

  @override
  String get energy => 'אנרגיה';

  @override
  String get protein => 'חלבון';

  @override
  String get carbs => 'פחמימות';

  @override
  String get fat => 'שומן';

  @override
  String get detailedSummary => 'תקציר מפורט';

  @override
  String get dayComplete => 'היום הושלם';

  @override
  String get markedDayAsComplete => 'היום סומן כמושלם';

  @override
  String get dayIncomplete => 'יום חלקי';

  @override
  String get unmarkedDayAsComplete => 'סימון היום כמושלם בוטל';

  @override
  String get trackFood => 'מעקב אחר מזון';

  @override
  String get timeSetHelpText =>
      'בעת מעקב אחר מזון, השעה הזאת תשמש כתבנית לזמן הצריכה.';

  @override
  String get useAsTemplateForCustomFood => 'להשתמש כתבנית למזון מותאם אישית';

  @override
  String get additionalInformation => 'פרטים נוספים';

  @override
  String get completeProductName => 'השלמת שם המוצר';

  @override
  String get addedDate => 'נוסף';

  @override
  String get consumedDate => 'נצרך';

  @override
  String get nutrients => 'מזינים';

  @override
  String get labelingEu => 'תוויות אריזה (אירופה)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit תכולה';
  }

  @override
  String get dailyTarget => 'יעד יומי';

  @override
  String get general => 'כללי';

  @override
  String get micronutrients => 'מזיני קורט';

  @override
  String get editTrackedFood => 'עריכת אוכל במעקב';

  @override
  String get scanBarcode => 'סריקת ברקוד';

  @override
  String get searchFood => 'חיפוש מזון';

  @override
  String get productOrBrand => 'מוצר או מותג';

  @override
  String get searchError => 'שגיאה במהלך החיפוש';

  @override
  String get searchErrorHint =>
      'לפחות אחד ממסדי הנתונים להרכב מזון לא זמין. נא לנסות שוב מאוחר יותר או להשבית זמנית את מסדי הנתונים שאינם מגיבים בהגדרות.';

  @override
  String get affectedDatabases => 'מסדי נתונים שהושפעו';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'לא במאכלים מותאמים או ב־Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'לא נמצא במאכלים שהתאמת, ל־Open Food Facts דרושה גישה לאינטרנט';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'לא נמצא במאכלים המותאמים, החיפוש ב־Open Food Facts נכשל';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'לא נמצא במאכלים המותאמים, Open Food Facts לא פעיל';

  @override
  String get barcodeScanningUnsupported =>
      'סריקת ברקודים עם מצלמת המכשיר נתמכת ב־Android בלבד.';

  @override
  String get customFood => 'מזון מותאם אישית';

  @override
  String get searchCustomFood => 'חיפוש מזון מותאם אישית';

  @override
  String get addCustomFood => 'הוספת מזון מותאם אישית';

  @override
  String get editCustomFood => 'עריכת מזון מותאם אישית';

  @override
  String get title => 'כותרת';

  @override
  String get barcode => 'ברקוד';

  @override
  String get settings => 'הגדרות';

  @override
  String get yourPersonalNutritionNeeds => 'צורכי התזונה האישיים שלך';

  @override
  String get personalNutritionNeedsHint =>
      'חישוב צורכי התזונה האישיים שלך או הגדרה שלהם בעצמך';

  @override
  String get calculate => 'חישוב';

  @override
  String get energyDistribution => 'חלוקת אנרגיה';

  @override
  String get yourBody => 'הגוף שלך';

  @override
  String get age => 'גיל';

  @override
  String get years => 'שנים';

  @override
  String get sex => 'מגדר';

  @override
  String get female => 'אישה';

  @override
  String get male => 'גבר';

  @override
  String get weight => 'מזקל';

  @override
  String get height => 'משקל גוף';

  @override
  String get behaviourAndTarget => 'התנהגות ויעד';

  @override
  String get activityLevel => 'רמת פעילות (PAL)';

  @override
  String get activityLevel1_0 => 'שינה היא החלק המשמעותי ביום שלך';

  @override
  String get activityLevel1_1 => 'שכיבה במיטה זה הקטע החזק שלך';

  @override
  String get activityLevel1_2 => 'ישיבה במיטה כל היום הוא העיסוק העיקרי שלך';

  @override
  String get activityLevel1_3 => 'יציאה החוצה פחות מדברת אליך';

  @override
  String get activityLevel1_4 => 'רמת הפעילות שלך יחסית נמוכה';

  @override
  String get activityLevel1_5 => 'הגוף שלך עסוק בעבודה משרדית';

  @override
  String get activityLevel1_6 => 'רמה מסוימת של פעילות, עבודה ולפעמים ספורט';

  @override
  String get activityLevel1_7 => 'אימונים לעיתים קרובות';

  @override
  String get activityLevel1_8 => 'אימונים קשרים באופן סדיר';

  @override
  String get activityLevel1_9 =>
      'פעילות ספורטיבית גבוהה, אימונים ומיעוט בעבודה משרדית';

  @override
  String get activityLevel2_0 =>
      'העבודה שלך מאוד פיזית ויש לך אימונים קשים ותדירים';

  @override
  String get noActivityLevelDescription => 'אין תיאור לרמת הפעילות';

  @override
  String get weightTarget => 'יעד משקל';

  @override
  String get weightTargetStrongLoss => 'ירידה מתונה';

  @override
  String get weightTargetModerateLoss => 'ירידה בינונית';

  @override
  String get weightTargetSlightLoss => 'ירידה קלה';

  @override
  String get weightTargetMaintaining => 'שימור';

  @override
  String get weightTargetSlightGain => 'עלייה קלה';

  @override
  String get weightTargetModerateGain => 'עלייה בינונית';

  @override
  String get weightTargetStrongGain => 'עלייה מתונה';

  @override
  String get calculateNutritionTargets => 'חישוב יעדי תזונה';

  @override
  String get calculationInfo => 'מידע על החישוב';

  @override
  String get calculationInfoText1 =>
      'חישוב התצרוכת הקלורית מבוססת על נוסחת מילפין-סנט ג׳אור. נא לשים לב שהיא יכולה לשמש רק כשערוך לערכים מהעולם האמיתי. הם משתנים מאדם לאדם עקב תנאי גוף משתנים יותר או פחות.';

  @override
  String get formulaForFemales => 'נוסחה לנשים';

  @override
  String get weightInKg => 'משקל בקילוגרמים';

  @override
  String get heightInCm => 'גובה בסנטימטרים';

  @override
  String get ageInYears => 'גיל בשנים';

  @override
  String get formulaForMales => 'נוסחה לגברים';

  @override
  String get calculationInfoText2 =>
      'פלט החישוב הזה מוגדר כקצב מטאבולי בסיסי (BMR). הוא מוכפל בגורם הפעילות שלך כדי שתתקבל המרת האנרגיה הכוללת שלך. זאת תצורת האנרגיה המחושבת שלך בקילו קלוריות.';

  @override
  String get calculatedNutritionTargets => 'יעדי תזונה מחושבים';

  @override
  String get calculatedNutritionTargetsHint =>
      'מאוד מומלץ לערוך את היעדים המחושבים לפי הצרכים שלך בטרם החלתם.';

  @override
  String get percentOfCalories => '% מתוך הקילו קלוריות';

  @override
  String get proteinRatio => 'יחס חלבון';

  @override
  String get carbsRatio => 'יחס פחמימות';

  @override
  String get fatRatio => 'יחס שומן';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'להגדיר גם יעדי מזיני קורט לפי גיל ומגדר';

  @override
  String get alsoSetMicronutrientsHint =>
      'Based on DGE reference values from 2022 with a partly update from 2025';

  @override
  String get apply => 'החלה';

  @override
  String get targetsApplied => 'יעדי התזונה חלו';

  @override
  String get targetsApplyError => 'אי אפשר להחיל את יעדי התזונה';

  @override
  String get totalEnergy => 'סך כל האנרגיה';

  @override
  String get energyDistributionChartMissingHint =>
      'תרשים חלוקת האנרגיה מופיע רק אם הגדרת יעד קלוריות ויעד של לפחות אחד ממזיני הקורט.';

  @override
  String get percentOfTotalEnergy => 'אחוז מכלל האנרגיה';

  @override
  String get selectedMacronutrient => 'מזין קורט נבחר';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'קלוריות, חלבון, פחמימות, שומן';

  @override
  String get display => 'תצוגה';

  @override
  String get displayHint => 'התאמת ממשק המשתמש לצרכים שלך';

  @override
  String get groupFoodsToMeals => 'קיבוץ מאכלים לארוחות';

  @override
  String get groupFoodsToMealsHint =>
      'קיבוץ אוטומטי של מאכלים שנצרכים בהפרשים קצרים כארוחות';

  @override
  String get preferServingSizes => 'העדפת גודלי הגשה';

  @override
  String get preferServingSizesHint =>
      'בעת מעקב אחר מאכל חדש, גודל המנה ייבחר מראש, אם קיים';

  @override
  String mealAt(String time) {
    return 'ארוחה ב־$time';
  }

  @override
  String get databaseManagement => 'ניהול מסד נתונים';

  @override
  String get databaseManagementHint =>
      'נא לבחור מול אילו מסדי נתונים לבצע תשאול';

  @override
  String get storedOnDevice => 'מאוחסן במכשיר';

  @override
  String get swissFoodCompositionDatabase => 'מסד נתוני הרכב המזון השווייצרי';

  @override
  String get version => 'גרסה';

  @override
  String get language => 'שפה';

  @override
  String get languages => 'שפות';

  @override
  String get german => 'גרמנית';

  @override
  String get italian => 'איטלקית';

  @override
  String get french => 'צרפתית';

  @override
  String get publisher => 'מפיץ';

  @override
  String get federalFoodSafetyAndVeterinaryOffice => 'משרד בטיחות המזון והחי';

  @override
  String get switzerland => 'שווייץ';

  @override
  String get generalInformation => 'מידע כללי';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'מסד הנתונים הזה מציע בערך 1,100 סוגי מזון כלליים שונים. כיוון שהוא מאוחסן במכשיר שלך הוא יכול לעבוד גם בלי אינטרנט.';

  @override
  String get source => 'מקור';

  @override
  String get tapHereForFurtherInformation => 'אפשר לגעת כאן למידע נוסף.';

  @override
  String get serverBased => 'מבוסס שרת';

  @override
  String get openFoodFactsVariousLanguagesText => 'מגוון';

  @override
  String get nonProfitInstitution => 'עמותה ללא מטרות רווח';

  @override
  String get france => 'צרפת';

  @override
  String get openFoodFactsGeneralInformationText =>
      'נא לשים לב שלמרות שמסד הנתונים הזה גדול מאוד, הרשומות יכולות להיות חלקיות או בלתי עדכניות. כל משתמש רשום יכול לעדכן את ערכי ההזנה. אפשר להוסיף מוצרים חדשים גם בלי ליצור חשבון. השבתת הגישה למסד הנתונים הזה כוללת גם סריקת EAN כך שאפשר יהיה לסרוק מוצרי מזון מותאמים אישית רק באמצעות קוד EAN.';

  @override
  String get termsOfUse => 'תנאי השימוש';

  @override
  String get openFoodFactsTermsText =>
      'הפעלת מסד הנתונים מהווה את הסכמתך לתנאים.';

  @override
  String get contribute => 'התנדבות';

  @override
  String get databaseContributeText =>
      'כאן אפשר לראות איך אפשר לשפר את מסד הנתונים הזה.';

  @override
  String get english => 'אנגלית';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central הוא מסד נתוני מזון ומזינים מבית משרד החקלאות האמריקאי. הנתונים מוגשים לנחלת הכללי ומכילים בערך 200 רכיבי מזון בסיסיים ולמעלה מ־380,000 מוצרי מזון ממותגים.';

  @override
  String get backupAndRestore => 'גיבוי ושחזור';

  @override
  String get backupAndRestoreHint =>
      'אפשר לאחסן את הנתונים שלך מקומית או באחסון ענן תומך WebDAV כמו למשל Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'אזהרה: הגדרות, התאמות אישיות ויעדים לא נכללים עדיין!';

  @override
  String get successfullyCreatedBackup => 'הגיבוי נוצר בהצלחה';

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

    return 'יוצאו $customFoodsCountString מאכלים מותאמים ו־$trackedFoodsCountString מאכלים במעקב';
  }

  @override
  String get successfullyRestoredBackup => 'הגיבוי שוחזר בהצלחה';

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

    return 'יובאו $customFoodsCountString מאכלים מותאמים ו־$trackedFoodsCountString מאכלים במעקב';
  }

  @override
  String get createWebDAVBackup => 'יצירת גיבוי WebDAV';

  @override
  String get webDAVSettings => 'הגדרות WebDAV';

  @override
  String get serverURL => 'כתובת שרת';

  @override
  String get invalidURL => 'הכתובת שגויה';

  @override
  String get username => 'שם משתמש';

  @override
  String get password => 'סיסמה';

  @override
  String get pathAndFilename => 'נתיב ושם קובץ';

  @override
  String energizeBackup(String appName) {
    return 'גיבוי $appName';
  }

  @override
  String get backupPasswordNotice => 'בלי סיסמת גיבוי לא ניתן לשחזר גיבויים.';

  @override
  String get restoreWebDAVBackup => 'שחזור גיבוי WebDAV';

  @override
  String get createLocalBackup => 'יצירת גיבוי מקומי';

  @override
  String get restoreLocalBackup => 'שחזור גיבוי מקומי';

  @override
  String get aboutEnergize => 'על Energize';

  @override
  String get license => 'רישיון';

  @override
  String get allLicenses => 'כל הרישיונות';

  @override
  String get privacyPolicy => 'מדיניות פרטיות';

  @override
  String get logs => 'יומנים';

  @override
  String get reportIssue => 'דיווח על תקלה';

  @override
  String get proposeImprovement => 'הצעת שיפור';

  @override
  String get sourceCode => 'קוד המקור';

  @override
  String get translation => 'תרגום';

  @override
  String get contributors => 'מתנדבים';

  @override
  String get thanksToContributorsText =>
      'תודה לכל מי שתרם ל־Energize. בזכותכם Energize הפך למה שהוא.';

  @override
  String get contributionTypeCodeAndConversations => 'קוד והמרות';

  @override
  String get contributionTypeAcrylicPicture => 'תמונה אקרילית';

  @override
  String get allTranslatorsOnWeblate => 'כל המתרגמים ב־Weblate';

  @override
  String get contact => 'יצירת קשר';

  @override
  String get email => 'דוא״ל';

  @override
  String get emailHint => 'נא להשתמש בזה רק לנושאים שונים מאלו שלעיל';

  @override
  String get supportMeByDonating => 'תמיכה בי על ידי תרומה';

  @override
  String get donate => 'תרומה כספית';

  @override
  String get donationText =>
      'אם חשוב לך לתמוך במיזם באמצעות תרומה כספים, אנו מאוד נשמח! יצירת היישומון הזה היא מאוד מהנה אבל גוזלת זמן רב ולפעמים טומנת בחובה לא מעט תסכולים :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'כתובת הביטקוין הועתה ללוח הגזירים';

  @override
  String get bankAccountOrCreditCard => 'חשבון בנק או כרטיס אשראי';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'אפשר לשלוח לי הודעות בנוגע לאפשרויות תרומה נוספות בדוא״ל';

  @override
  String get energyAndMacronutrients => 'אנרגיה ומזיני קורט';

  @override
  String get vitamins => 'ויטמינים';

  @override
  String get vitaminA => 'ויטמין A';

  @override
  String get vitaminB1 => 'B1 (תיאמין)';

  @override
  String get vitaminB2 => 'B2 (ריבופלבין)';

  @override
  String get vitaminB3 => 'B3 (ניאצין)';

  @override
  String get vitaminB5 => 'B5 (חומצה פנטותנית)';

  @override
  String get vitaminB6 => 'ויטמין B6';

  @override
  String get vitaminB7 => 'B7 (ביוטין)';

  @override
  String get vitaminB9 => 'B9 (פולאט)';

  @override
  String get vitaminB12 => 'B12 (קובלמין)';

  @override
  String get vitaminC => 'ויטמין C';

  @override
  String get vitaminD => 'ויטמין D';

  @override
  String get vitaminE => 'ויטמין E';

  @override
  String get vitaminK => 'ויטמין K';

  @override
  String get minerals => 'מינרלים';

  @override
  String get majorMinerals => 'מינרלים עיקריים';

  @override
  String get calcium => 'סידן';

  @override
  String get chloride => 'כלוריד';

  @override
  String get magnesium => 'מגנזיום';

  @override
  String get phosphorous => 'זרחן';

  @override
  String get potassium => 'אשלגן';

  @override
  String get sodium => 'נתרן';

  @override
  String get traceElements => 'מעקב אחר יסודות';

  @override
  String get chromium => 'כרום';

  @override
  String get iron => 'ברזל';

  @override
  String get fluorine => 'פלואור';

  @override
  String get iodine => 'יוד';

  @override
  String get copper => 'נחושת';

  @override
  String get manganese => 'מנגן';

  @override
  String get molybdenum => 'מוליבדן';

  @override
  String get selenium => 'סלניום';

  @override
  String get zinc => 'אבץ';

  @override
  String get fats => 'שומנים';

  @override
  String get monounsaturatedFat => 'שומן חד בלתי רווי';

  @override
  String get polyunsaturatedFat => 'שומן רב בלתי רווי';

  @override
  String get omega3 => 'אומגה 3';

  @override
  String get omega6 => 'אומגה 6';

  @override
  String get saturatedFat => 'שומן רווי';

  @override
  String get transfat => 'שומן טראנס';

  @override
  String get cholesterol => 'כולסטרול';

  @override
  String get fiber => 'סיבים';

  @override
  String get sugar => 'סוכר';

  @override
  String get sugarAlcohol => 'סוכר כוהלי';

  @override
  String get starch => 'עמילן';

  @override
  String get other => 'אחר';

  @override
  String get water => 'מים';

  @override
  String get caffeine => 'קפאין';

  @override
  String get alcohol => 'אלכוהול';

  @override
  String get salt => 'מלח';

  @override
  String get servingSizes => 'גודלי מנות';

  @override
  String get add => 'הוספה';

  @override
  String get noServingSizesText => 'אין גודלי מנות.';

  @override
  String get addServingSize => 'הוספת גודל מנה';

  @override
  String get typicalServingSizes => 'גודלי מנות מקובלים';

  @override
  String get or => 'או';

  @override
  String get servingSizeName => 'שם גודל מנה';

  @override
  String get size => 'גודל';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': 'מנה',
      'l10nPackage': 'אריזה',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'פנקייקים';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'בראוניז';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'במיה מטוגנת';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'ביצים סקוטיות';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'יורקשייר פודינג';

  @override
  String get testCustomFood5Calories => '259';
}
