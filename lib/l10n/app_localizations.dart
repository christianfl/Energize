import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('es'),
    Locale('et'),
    Locale('fi'),
    Locale('fr'),
    Locale('he'),
    Locale('hu'),
    Locale('it'),
    Locale('nb'),
    Locale('nb', 'NO'),
    Locale('nl'),
    Locale('pa'),
    Locale('pa', 'PK'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sr'),
    Locale('sv'),
    Locale('ta'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Energize'**
  String get appName;

  /// No description provided for @appDescriptionShort.
  ///
  /// In en, this message translates to:
  /// **'Track your food and nutrition easily and fast.'**
  String get appDescriptionShort;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Track your food and nutrition easily and fast. Scan your products or search manually in different databases.'**
  String get appDescription;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @fieldMandatory.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value'**
  String get fieldMandatory;

  /// No description provided for @onlyNumbersAllowed.
  ///
  /// In en, this message translates to:
  /// **'Only numbers are allowed'**
  String get onlyNumbersAllowed;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @deleted.
  ///
  /// In en, this message translates to:
  /// **'deleted'**
  String get deleted;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @somethingNotFound.
  ///
  /// In en, this message translates to:
  /// **'{something} not found'**
  String somethingNotFound(String something);

  /// No description provided for @unknownErrorText.
  ///
  /// In en, this message translates to:
  /// **'An unknown error has occured'**
  String get unknownErrorText;

  /// No description provided for @tracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get tracking;

  /// No description provided for @energy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get energy;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @detailedSummary.
  ///
  /// In en, this message translates to:
  /// **'Detailed summary'**
  String get detailedSummary;

  /// No description provided for @dayComplete.
  ///
  /// In en, this message translates to:
  /// **'Day complete'**
  String get dayComplete;

  /// No description provided for @markedDayAsComplete.
  ///
  /// In en, this message translates to:
  /// **'Marked day as complete'**
  String get markedDayAsComplete;

  /// No description provided for @dayIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Day incomplete'**
  String get dayIncomplete;

  /// No description provided for @unmarkedDayAsComplete.
  ///
  /// In en, this message translates to:
  /// **'Unmarked day as complete'**
  String get unmarkedDayAsComplete;

  /// No description provided for @trackFood.
  ///
  /// In en, this message translates to:
  /// **'Track food'**
  String get trackFood;

  /// No description provided for @timeSetHelpText.
  ///
  /// In en, this message translates to:
  /// **'When tracking food, this time will be used as a template for the time of consume.'**
  String get timeSetHelpText;

  /// No description provided for @useAsTemplateForCustomFood.
  ///
  /// In en, this message translates to:
  /// **'Use as template for custom food'**
  String get useAsTemplateForCustomFood;

  /// No description provided for @additionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get additionalInformation;

  /// No description provided for @completeProductName.
  ///
  /// In en, this message translates to:
  /// **'Complete product name'**
  String get completeProductName;

  /// No description provided for @addedDate.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get addedDate;

  /// No description provided for @consumedDate.
  ///
  /// In en, this message translates to:
  /// **'Consumed'**
  String get consumedDate;

  /// No description provided for @nutrients.
  ///
  /// In en, this message translates to:
  /// **'Nutrients'**
  String get nutrients;

  /// No description provided for @labelingEu.
  ///
  /// In en, this message translates to:
  /// **'Labeling (EU)'**
  String get labelingEu;

  /// No description provided for @amountContain.
  ///
  /// In en, this message translates to:
  /// **'{amountWithUnit} contain'**
  String amountContain(String amountWithUnit);

  /// No description provided for @dailyTarget.
  ///
  /// In en, this message translates to:
  /// **'daily target'**
  String get dailyTarget;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @micronutrients.
  ///
  /// In en, this message translates to:
  /// **'Micronutrients'**
  String get micronutrients;

  /// No description provided for @editTrackedFood.
  ///
  /// In en, this message translates to:
  /// **'Edit tracked food'**
  String get editTrackedFood;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode'**
  String get scanBarcode;

  /// No description provided for @searchFood.
  ///
  /// In en, this message translates to:
  /// **'Search food'**
  String get searchFood;

  /// No description provided for @productOrBrand.
  ///
  /// In en, this message translates to:
  /// **'Product or brand'**
  String get productOrBrand;

  /// No description provided for @searchError.
  ///
  /// In en, this message translates to:
  /// **'Error during search'**
  String get searchError;

  /// No description provided for @searchErrorHint.
  ///
  /// In en, this message translates to:
  /// **'At least one food composition database could not be reached. Please try again later or temporarily disable non-functional databases in the settings.'**
  String get searchErrorHint;

  /// No description provided for @affectedDatabases.
  ///
  /// In en, this message translates to:
  /// **'Affected databases'**
  String get affectedDatabases;

  /// No description provided for @notFoundInCustomFoodsOrOpenFoodFacts.
  ///
  /// In en, this message translates to:
  /// **'Neither in custom foods nor on Open Food Facts'**
  String get notFoundInCustomFoodsOrOpenFoodFacts;

  /// No description provided for @notFoundInCustomFoodsOpenFoodFactsNeedsInternet.
  ///
  /// In en, this message translates to:
  /// **'Not found in custom foods, Open Food Facts needs internet access'**
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet;

  /// No description provided for @notFoundInCustomFoodsOpenFoodFactsHasError.
  ///
  /// In en, this message translates to:
  /// **'Not found in custom foods, Open Food Facts search had an error'**
  String get notFoundInCustomFoodsOpenFoodFactsHasError;

  /// No description provided for @notFoundInCustomFoodsOpenFoodFactsNotActivated.
  ///
  /// In en, this message translates to:
  /// **'Not found in custom foods, Open Food Facts is not activated'**
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated;

  /// No description provided for @barcodeScanningUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Scanning barcodes with the device camera is currently only supported on Android.'**
  String get barcodeScanningUnsupported;

  /// No description provided for @customFood.
  ///
  /// In en, this message translates to:
  /// **'Custom Food'**
  String get customFood;

  /// No description provided for @searchCustomFood.
  ///
  /// In en, this message translates to:
  /// **'Search custom food'**
  String get searchCustomFood;

  /// No description provided for @addCustomFood.
  ///
  /// In en, this message translates to:
  /// **'Add custom food'**
  String get addCustomFood;

  /// No description provided for @editCustomFood.
  ///
  /// In en, this message translates to:
  /// **'Edit custom food'**
  String get editCustomFood;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @yourPersonalNutritionNeeds.
  ///
  /// In en, this message translates to:
  /// **'Your personal nutrition needs'**
  String get yourPersonalNutritionNeeds;

  /// No description provided for @personalNutritionNeedsHint.
  ///
  /// In en, this message translates to:
  /// **'Calculate your personal nutrition needs or set them yourself'**
  String get personalNutritionNeedsHint;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @energyDistribution.
  ///
  /// In en, this message translates to:
  /// **'Energy distribution'**
  String get energyDistribution;

  /// No description provided for @yourBody.
  ///
  /// In en, this message translates to:
  /// **'Your Body'**
  String get yourBody;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Body height'**
  String get height;

  /// No description provided for @behaviourAndTarget.
  ///
  /// In en, this message translates to:
  /// **'Behaviour and target'**
  String get behaviourAndTarget;

  /// No description provided for @activityLevel.
  ///
  /// In en, this message translates to:
  /// **'Activity Level (PAL)'**
  String get activityLevel;

  /// No description provided for @activityLevel1_0.
  ///
  /// In en, this message translates to:
  /// **'You do basically nothing than sleep'**
  String get activityLevel1_0;

  /// No description provided for @activityLevel1_1.
  ///
  /// In en, this message translates to:
  /// **'You are laying in your bed the whole day'**
  String get activityLevel1_1;

  /// No description provided for @activityLevel1_2.
  ///
  /// In en, this message translates to:
  /// **'You are sitting in your bed the whole day'**
  String get activityLevel1_2;

  /// No description provided for @activityLevel1_3.
  ///
  /// In en, this message translates to:
  /// **'You don\'t really go outside very often'**
  String get activityLevel1_3;

  /// No description provided for @activityLevel1_4.
  ///
  /// In en, this message translates to:
  /// **'You are not that active at all'**
  String get activityLevel1_4;

  /// No description provided for @activityLevel1_5.
  ///
  /// In en, this message translates to:
  /// **'You do an office work'**
  String get activityLevel1_5;

  /// No description provided for @activityLevel1_6.
  ///
  /// In en, this message translates to:
  /// **'You are a bit active, work and sometimes do sports'**
  String get activityLevel1_6;

  /// No description provided for @activityLevel1_7.
  ///
  /// In en, this message translates to:
  /// **'You do workout often'**
  String get activityLevel1_7;

  /// No description provided for @activityLevel1_8.
  ///
  /// In en, this message translates to:
  /// **'You do workout hard regularly'**
  String get activityLevel1_8;

  /// No description provided for @activityLevel1_9.
  ///
  /// In en, this message translates to:
  /// **'You are very active, workout and don\'t have an office job'**
  String get activityLevel1_9;

  /// No description provided for @activityLevel2_0.
  ///
  /// In en, this message translates to:
  /// **'You do a physically active job and workout hard regularly'**
  String get activityLevel2_0;

  /// No description provided for @noActivityLevelDescription.
  ///
  /// In en, this message translates to:
  /// **'No activity level description'**
  String get noActivityLevelDescription;

  /// No description provided for @weightTarget.
  ///
  /// In en, this message translates to:
  /// **'Weight target'**
  String get weightTarget;

  /// No description provided for @weightTargetStrongLoss.
  ///
  /// In en, this message translates to:
  /// **'Strong loss'**
  String get weightTargetStrongLoss;

  /// No description provided for @weightTargetModerateLoss.
  ///
  /// In en, this message translates to:
  /// **'Moderate loss'**
  String get weightTargetModerateLoss;

  /// No description provided for @weightTargetSlightLoss.
  ///
  /// In en, this message translates to:
  /// **'Slight loss'**
  String get weightTargetSlightLoss;

  /// No description provided for @weightTargetMaintaining.
  ///
  /// In en, this message translates to:
  /// **'Maintaining'**
  String get weightTargetMaintaining;

  /// No description provided for @weightTargetSlightGain.
  ///
  /// In en, this message translates to:
  /// **'Slight gain'**
  String get weightTargetSlightGain;

  /// No description provided for @weightTargetModerateGain.
  ///
  /// In en, this message translates to:
  /// **'Moderate gain'**
  String get weightTargetModerateGain;

  /// No description provided for @weightTargetStrongGain.
  ///
  /// In en, this message translates to:
  /// **'Strong gain'**
  String get weightTargetStrongGain;

  /// No description provided for @calculateNutritionTargets.
  ///
  /// In en, this message translates to:
  /// **'Calculate nutrition targets'**
  String get calculateNutritionTargets;

  /// No description provided for @calculationInfo.
  ///
  /// In en, this message translates to:
  /// **'Information about calculation'**
  String get calculationInfo;

  /// No description provided for @calculationInfoText1.
  ///
  /// In en, this message translates to:
  /// **'The calorie intake calculation is based on the Mifflin-St.Jeor formula. Please be aware that it can only act as an approximation to the real world values. These differ from person to person as their body conditions can diverge more or less.'**
  String get calculationInfoText1;

  /// No description provided for @formulaForFemales.
  ///
  /// In en, this message translates to:
  /// **'Formula for females'**
  String get formulaForFemales;

  /// No description provided for @weightInKg.
  ///
  /// In en, this message translates to:
  /// **'Weight in kg'**
  String get weightInKg;

  /// No description provided for @heightInCm.
  ///
  /// In en, this message translates to:
  /// **'Height in cm'**
  String get heightInCm;

  /// No description provided for @ageInYears.
  ///
  /// In en, this message translates to:
  /// **'Age in years'**
  String get ageInYears;

  /// No description provided for @formulaForMales.
  ///
  /// In en, this message translates to:
  /// **'Formula for males'**
  String get formulaForMales;

  /// No description provided for @calculationInfoText2.
  ///
  /// In en, this message translates to:
  /// **'The output of this calculation is defined as the basal metabolic rate (BMR). It gets multiplied with your activity factor to receive your total power conversion. This is your calculated energy intake in kcal.'**
  String get calculationInfoText2;

  /// No description provided for @calculatedNutritionTargets.
  ///
  /// In en, this message translates to:
  /// **'Calculated nutrition targets'**
  String get calculatedNutritionTargets;

  /// No description provided for @calculatedNutritionTargetsHint.
  ///
  /// In en, this message translates to:
  /// **'Feel free to edit the calculated targets according to your needs before applying them.'**
  String get calculatedNutritionTargetsHint;

  /// No description provided for @percentOfCalories.
  ///
  /// In en, this message translates to:
  /// **'% of kcal'**
  String get percentOfCalories;

  /// No description provided for @proteinRatio.
  ///
  /// In en, this message translates to:
  /// **'Protein ratio'**
  String get proteinRatio;

  /// No description provided for @carbsRatio.
  ///
  /// In en, this message translates to:
  /// **'Carbs ratio'**
  String get carbsRatio;

  /// No description provided for @fatRatio.
  ///
  /// In en, this message translates to:
  /// **'Fat ratio'**
  String get fatRatio;

  /// No description provided for @alsoSetMicronutrientsSwitch.
  ///
  /// In en, this message translates to:
  /// **'Also set micronutrient targets'**
  String get alsoSetMicronutrientsSwitch;

  /// No description provided for @alsoSetMicronutrientsHint.
  ///
  /// In en, this message translates to:
  /// **'Values depend on age and sex. Data based on DGE reference values from 2022 with a partly update from 2025.'**
  String get alsoSetMicronutrientsHint;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @targetsApplied.
  ///
  /// In en, this message translates to:
  /// **'Nutrition targets were applied'**
  String get targetsApplied;

  /// No description provided for @targetsApplyError.
  ///
  /// In en, this message translates to:
  /// **'Nutrition targets could not be applied'**
  String get targetsApplyError;

  /// No description provided for @totalEnergy.
  ///
  /// In en, this message translates to:
  /// **'Total energy'**
  String get totalEnergy;

  /// No description provided for @energyDistributionChartMissingHint.
  ///
  /// In en, this message translates to:
  /// **'The energy distribution chart is only shown if you have set a calories target and a target for at least one of the macronutrients.'**
  String get energyDistributionChartMissingHint;

  /// No description provided for @percentOfTotalEnergy.
  ///
  /// In en, this message translates to:
  /// **'Percent of total energy'**
  String get percentOfTotalEnergy;

  /// No description provided for @selectedMacronutrient.
  ///
  /// In en, this message translates to:
  /// **'Selected macronutrient'**
  String get selectedMacronutrient;

  /// No description provided for @energyAndMacronutrientsTargetsHint.
  ///
  /// In en, this message translates to:
  /// **'Calories, protein, carbs, fat'**
  String get energyAndMacronutrientsTargetsHint;

  /// No description provided for @display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// No description provided for @displayHint.
  ///
  /// In en, this message translates to:
  /// **'Customize the user interface to your needs'**
  String get displayHint;

  /// No description provided for @groupFoodsToMeals.
  ///
  /// In en, this message translates to:
  /// **'Group foods to meals'**
  String get groupFoodsToMeals;

  /// No description provided for @groupFoodsToMealsHint.
  ///
  /// In en, this message translates to:
  /// **'Automatically groups together foods consumed in very short intervals as a meal'**
  String get groupFoodsToMealsHint;

  /// No description provided for @preferServingSizes.
  ///
  /// In en, this message translates to:
  /// **'Prefer serving sizes'**
  String get preferServingSizes;

  /// No description provided for @preferServingSizesHint.
  ///
  /// In en, this message translates to:
  /// **'When tracking new food, a serving size will be preselected, if any'**
  String get preferServingSizesHint;

  /// No description provided for @mealAt.
  ///
  /// In en, this message translates to:
  /// **'Meal at {time}'**
  String mealAt(String time);

  /// No description provided for @databaseManagement.
  ///
  /// In en, this message translates to:
  /// **'Database management'**
  String get databaseManagement;

  /// No description provided for @databaseManagementHint.
  ///
  /// In en, this message translates to:
  /// **'Select which food databases to query'**
  String get databaseManagementHint;

  /// No description provided for @storedOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Stored on device'**
  String get storedOnDevice;

  /// No description provided for @swissFoodCompositionDatabase.
  ///
  /// In en, this message translates to:
  /// **'Swiss Food Composition Database'**
  String get swissFoodCompositionDatabase;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @publisher.
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get publisher;

  /// No description provided for @federalFoodSafetyAndVeterinaryOffice.
  ///
  /// In en, this message translates to:
  /// **'Federal Food Safety and Veterinary Office'**
  String get federalFoodSafetyAndVeterinaryOffice;

  /// No description provided for @switzerland.
  ///
  /// In en, this message translates to:
  /// **'Switzerland'**
  String get switzerland;

  /// No description provided for @generalInformation.
  ///
  /// In en, this message translates to:
  /// **'General information'**
  String get generalInformation;

  /// No description provided for @swissFoodCompositionDatabaseGeneralInformationText.
  ///
  /// In en, this message translates to:
  /// **'This database offers about 1.100 general products and many micronutrients. Because it is stored on your device it therefore works offline.'**
  String get swissFoodCompositionDatabaseGeneralInformationText;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get source;

  /// No description provided for @tapHereForFurtherInformation.
  ///
  /// In en, this message translates to:
  /// **'Tap here for futher information.'**
  String get tapHereForFurtherInformation;

  /// No description provided for @serverBased.
  ///
  /// In en, this message translates to:
  /// **'Server-based'**
  String get serverBased;

  /// No description provided for @openFoodFactsVariousLanguagesText.
  ///
  /// In en, this message translates to:
  /// **'Various'**
  String get openFoodFactsVariousLanguagesText;

  /// No description provided for @nonProfitInstitution.
  ///
  /// In en, this message translates to:
  /// **'Nonprofit institution'**
  String get nonProfitInstitution;

  /// No description provided for @france.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get france;

  /// No description provided for @openFoodFactsGeneralInformationText.
  ///
  /// In en, this message translates to:
  /// **'Please be aware that whereas this database is very large, entries can be incomplete or out-of-date. Every registered user can update nutrient values. Adding new products is possible without creating an account. Deactivating this database does also include EAN scanning so you will only be able to scan custom foods by EAN code then.'**
  String get openFoodFactsGeneralInformationText;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @openFoodFactsTermsText.
  ///
  /// In en, this message translates to:
  /// **'By activating this database you agree to the terms.'**
  String get openFoodFactsTermsText;

  /// No description provided for @contribute.
  ///
  /// In en, this message translates to:
  /// **'Contribute'**
  String get contribute;

  /// No description provided for @databaseContributeText.
  ///
  /// In en, this message translates to:
  /// **'See how you can help improving this database.'**
  String get databaseContributeText;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @usdaFoodDataCentralGeneralInformationText.
  ///
  /// In en, this message translates to:
  /// **'FoodData Central is a database of food and nutritions from the US department of agriculture. The data is under the public domain and contains about 200 foundation foods and over 380.000 branded foods.'**
  String get usdaFoodDataCentralGeneralInformationText;

  /// No description provided for @backupAndRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get backupAndRestore;

  /// No description provided for @backupAndRestoreHint.
  ///
  /// In en, this message translates to:
  /// **'Store your data locally or on a WebDAV compatible cloud storage like Nextcloud'**
  String get backupAndRestoreHint;

  /// No description provided for @missingBackupPartsHint.
  ///
  /// In en, this message translates to:
  /// **'Warning: Settings, personalizations and targets are not yet included!'**
  String get missingBackupPartsHint;

  /// No description provided for @successfullyCreatedBackup.
  ///
  /// In en, this message translates to:
  /// **'Successfully created backup'**
  String get successfullyCreatedBackup;

  /// No description provided for @exportedNumberOfFoodsMessage.
  ///
  /// In en, this message translates to:
  /// **'Exported {customFoodsCount} custom foods and {trackedFoodsCount} tracked foods'**
  String exportedNumberOfFoodsMessage(
    int customFoodsCount,
    int trackedFoodsCount,
  );

  /// No description provided for @successfullyRestoredBackup.
  ///
  /// In en, this message translates to:
  /// **'Successfully restored backup'**
  String get successfullyRestoredBackup;

  /// No description provided for @importedNumberOfFoodsMessage.
  ///
  /// In en, this message translates to:
  /// **'Imported {customFoodsCount} custom foods and {trackedFoodsCount} tracked foods'**
  String importedNumberOfFoodsMessage(
    int customFoodsCount,
    int trackedFoodsCount,
  );

  /// No description provided for @createWebDAVBackup.
  ///
  /// In en, this message translates to:
  /// **'Create WebDAV backup'**
  String get createWebDAVBackup;

  /// No description provided for @webDAVSettings.
  ///
  /// In en, this message translates to:
  /// **'WebDAV settings'**
  String get webDAVSettings;

  /// No description provided for @serverURL.
  ///
  /// In en, this message translates to:
  /// **'Server URL'**
  String get serverURL;

  /// No description provided for @invalidURL.
  ///
  /// In en, this message translates to:
  /// **'The URL is invalid'**
  String get invalidURL;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pathAndFilename.
  ///
  /// In en, this message translates to:
  /// **'Path and filename'**
  String get pathAndFilename;

  /// No description provided for @energizeBackup.
  ///
  /// In en, this message translates to:
  /// **'{appName} Backup'**
  String energizeBackup(String appName);

  /// No description provided for @backupPasswordNotice.
  ///
  /// In en, this message translates to:
  /// **'Without the backup password, it is impossible to restore a backup.'**
  String get backupPasswordNotice;

  /// No description provided for @restoreWebDAVBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore WebDAV backup'**
  String get restoreWebDAVBackup;

  /// No description provided for @createLocalBackup.
  ///
  /// In en, this message translates to:
  /// **'Create local backup'**
  String get createLocalBackup;

  /// No description provided for @restoreLocalBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore local backup'**
  String get restoreLocalBackup;

  /// No description provided for @aboutEnergize.
  ///
  /// In en, this message translates to:
  /// **'About Energize'**
  String get aboutEnergize;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'license'**
  String get license;

  /// No description provided for @allLicenses.
  ///
  /// In en, this message translates to:
  /// **'All licenses'**
  String get allLicenses;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// No description provided for @reportIssue.
  ///
  /// In en, this message translates to:
  /// **'Report issue'**
  String get reportIssue;

  /// No description provided for @proposeImprovement.
  ///
  /// In en, this message translates to:
  /// **'Propose improvement'**
  String get proposeImprovement;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get sourceCode;

  /// No description provided for @translation.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translation;

  /// No description provided for @contributors.
  ///
  /// In en, this message translates to:
  /// **'Contributors'**
  String get contributors;

  /// No description provided for @thanksToContributorsText.
  ///
  /// In en, this message translates to:
  /// **'Thanks to all people who contributed to Energize. Due to your help, Energize could become what it is now.'**
  String get thanksToContributorsText;

  /// No description provided for @contributionTypeCodeAndConversations.
  ///
  /// In en, this message translates to:
  /// **'Code and conversations'**
  String get contributionTypeCodeAndConversations;

  /// No description provided for @contributionTypeAcrylicPicture.
  ///
  /// In en, this message translates to:
  /// **'Acrylic picture'**
  String get contributionTypeAcrylicPicture;

  /// No description provided for @allTranslatorsOnWeblate.
  ///
  /// In en, this message translates to:
  /// **'All translators on Weblate'**
  String get allTranslatorsOnWeblate;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-Mail'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Please use this only for other topics than the above'**
  String get emailHint;

  /// No description provided for @supportMeByDonating.
  ///
  /// In en, this message translates to:
  /// **'Support me by donating'**
  String get supportMeByDonating;

  /// No description provided for @donate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donate;

  /// No description provided for @donationText.
  ///
  /// In en, this message translates to:
  /// **'If you want to support the development by a donation, you are very welcome to do so! Creating this app is a lot of fun but also a very time consuming task and sometimes leads to little frustration :-).'**
  String get donationText;

  /// No description provided for @bitcoinAddressCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Bitcoin address copied to clipboard'**
  String get bitcoinAddressCopiedToClipboard;

  /// No description provided for @bankAccountOrCreditCard.
  ///
  /// In en, this message translates to:
  /// **'Bank account or credit card'**
  String get bankAccountOrCreditCard;

  /// No description provided for @writeMeAnEmailForFurtherDonationOptions.
  ///
  /// In en, this message translates to:
  /// **'You are welcome to write me an e-mail for further donation options'**
  String get writeMeAnEmailForFurtherDonationOptions;

  /// No description provided for @energyAndMacronutrients.
  ///
  /// In en, this message translates to:
  /// **'Energy and macronutrients'**
  String get energyAndMacronutrients;

  /// No description provided for @vitamins.
  ///
  /// In en, this message translates to:
  /// **'Vitamins'**
  String get vitamins;

  /// No description provided for @vitaminA.
  ///
  /// In en, this message translates to:
  /// **'Vitamin A'**
  String get vitaminA;

  /// No description provided for @vitaminB1.
  ///
  /// In en, this message translates to:
  /// **'B1 (Thiamine)'**
  String get vitaminB1;

  /// No description provided for @vitaminB2.
  ///
  /// In en, this message translates to:
  /// **'B2 (Riboflavin)'**
  String get vitaminB2;

  /// No description provided for @vitaminB3.
  ///
  /// In en, this message translates to:
  /// **'B3 (Niacin)'**
  String get vitaminB3;

  /// No description provided for @vitaminB5.
  ///
  /// In en, this message translates to:
  /// **'B5 (Pantothenic acid)'**
  String get vitaminB5;

  /// No description provided for @vitaminB6.
  ///
  /// In en, this message translates to:
  /// **'Vitamin B6'**
  String get vitaminB6;

  /// No description provided for @vitaminB7.
  ///
  /// In en, this message translates to:
  /// **'B7 (Biotin)'**
  String get vitaminB7;

  /// No description provided for @vitaminB9.
  ///
  /// In en, this message translates to:
  /// **'B9 (Folate)'**
  String get vitaminB9;

  /// No description provided for @vitaminB12.
  ///
  /// In en, this message translates to:
  /// **'B12 (Cobalamin)'**
  String get vitaminB12;

  /// No description provided for @vitaminC.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C'**
  String get vitaminC;

  /// No description provided for @vitaminD.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D'**
  String get vitaminD;

  /// No description provided for @vitaminE.
  ///
  /// In en, this message translates to:
  /// **'Vitamin E'**
  String get vitaminE;

  /// No description provided for @vitaminK.
  ///
  /// In en, this message translates to:
  /// **'Vitamin K'**
  String get vitaminK;

  /// No description provided for @minerals.
  ///
  /// In en, this message translates to:
  /// **'Minerals'**
  String get minerals;

  /// No description provided for @majorMinerals.
  ///
  /// In en, this message translates to:
  /// **'Major minerals'**
  String get majorMinerals;

  /// No description provided for @calcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium'**
  String get calcium;

  /// No description provided for @chloride.
  ///
  /// In en, this message translates to:
  /// **'Chloride'**
  String get chloride;

  /// No description provided for @magnesium.
  ///
  /// In en, this message translates to:
  /// **'Magnesium'**
  String get magnesium;

  /// No description provided for @phosphorous.
  ///
  /// In en, this message translates to:
  /// **'Phosphorous'**
  String get phosphorous;

  /// No description provided for @potassium.
  ///
  /// In en, this message translates to:
  /// **'Potassium'**
  String get potassium;

  /// No description provided for @sodium.
  ///
  /// In en, this message translates to:
  /// **'Sodium'**
  String get sodium;

  /// No description provided for @traceElements.
  ///
  /// In en, this message translates to:
  /// **'Trace elements'**
  String get traceElements;

  /// No description provided for @chromium.
  ///
  /// In en, this message translates to:
  /// **'Chromium'**
  String get chromium;

  /// No description provided for @iron.
  ///
  /// In en, this message translates to:
  /// **'Iron'**
  String get iron;

  /// No description provided for @fluorine.
  ///
  /// In en, this message translates to:
  /// **'Fluorine'**
  String get fluorine;

  /// No description provided for @iodine.
  ///
  /// In en, this message translates to:
  /// **'Iodine'**
  String get iodine;

  /// No description provided for @copper.
  ///
  /// In en, this message translates to:
  /// **'Copper'**
  String get copper;

  /// No description provided for @manganese.
  ///
  /// In en, this message translates to:
  /// **'Manganese'**
  String get manganese;

  /// No description provided for @molybdenum.
  ///
  /// In en, this message translates to:
  /// **'Molybdenum'**
  String get molybdenum;

  /// No description provided for @selenium.
  ///
  /// In en, this message translates to:
  /// **'Selenium'**
  String get selenium;

  /// No description provided for @zinc.
  ///
  /// In en, this message translates to:
  /// **'Zinc'**
  String get zinc;

  /// No description provided for @fats.
  ///
  /// In en, this message translates to:
  /// **'Fats'**
  String get fats;

  /// No description provided for @monounsaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Monounsaturated fat'**
  String get monounsaturatedFat;

  /// No description provided for @polyunsaturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Polyunsaturated fat'**
  String get polyunsaturatedFat;

  /// No description provided for @omega3.
  ///
  /// In en, this message translates to:
  /// **'Omega 3'**
  String get omega3;

  /// No description provided for @omega6.
  ///
  /// In en, this message translates to:
  /// **'Omega 6'**
  String get omega6;

  /// No description provided for @saturatedFat.
  ///
  /// In en, this message translates to:
  /// **'Saturated fat'**
  String get saturatedFat;

  /// No description provided for @transfat.
  ///
  /// In en, this message translates to:
  /// **'Transfat'**
  String get transfat;

  /// No description provided for @cholesterol.
  ///
  /// In en, this message translates to:
  /// **'Cholesterol'**
  String get cholesterol;

  /// No description provided for @fiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber'**
  String get fiber;

  /// No description provided for @sugar.
  ///
  /// In en, this message translates to:
  /// **'Sugar'**
  String get sugar;

  /// No description provided for @sugarAlcohol.
  ///
  /// In en, this message translates to:
  /// **'Sugar alcohol'**
  String get sugarAlcohol;

  /// No description provided for @starch.
  ///
  /// In en, this message translates to:
  /// **'Starch'**
  String get starch;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @caffeine.
  ///
  /// In en, this message translates to:
  /// **'Caffeine'**
  String get caffeine;

  /// No description provided for @alcohol.
  ///
  /// In en, this message translates to:
  /// **'Alcohol'**
  String get alcohol;

  /// No description provided for @salt.
  ///
  /// In en, this message translates to:
  /// **'Salt'**
  String get salt;

  /// No description provided for @servingSizes.
  ///
  /// In en, this message translates to:
  /// **'Serving sizes'**
  String get servingSizes;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @noServingSizesText.
  ///
  /// In en, this message translates to:
  /// **'There are no serving sizes present.'**
  String get noServingSizesText;

  /// No description provided for @addServingSize.
  ///
  /// In en, this message translates to:
  /// **'Add serving size'**
  String get addServingSize;

  /// No description provided for @typicalServingSizes.
  ///
  /// In en, this message translates to:
  /// **'Typical serving sizes'**
  String get typicalServingSizes;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @servingSizeName.
  ///
  /// In en, this message translates to:
  /// **'Serving size name'**
  String get servingSizeName;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// Translatable (system-defined) serving size names. Please translate only the part in between the curly brackets for l10nServing and l10nPackage. Example: l10nServing{Srv.} (en) --> l10nServing{Por.} (de). Those values should be shortened translations for 'Package' and 'Serving', ideally about 3 letters long
  ///
  /// In en, this message translates to:
  /// **'{name, select, l10nServing{Srv.} l10nPackage{Pck.} other{}}'**
  String translatableServingSizeNames(String name);

  /// Only used for translated screenshots, not within the app itself. Name of custom food 1/5 which can be anything which makes sense in the current language. E.g. a local food.
  ///
  /// In en, this message translates to:
  /// **'Pancakes'**
  String get testCustomFood1Name;

  /// Only used for translated screenshots, not within the app itself. Calories in kcal per 100 g of custom food 1/5 as a double value (e.g.: 120.0)
  ///
  /// In en, this message translates to:
  /// **'227'**
  String get testCustomFood1Calories;

  /// Only used for translated screenshots, not within the app itself. Name of custom food 2/5 which can be anything which makes sense in the current language. E.g. a local food.
  ///
  /// In en, this message translates to:
  /// **'Hashbrowns'**
  String get testCustomFood2Name;

  /// Only used for translated screenshots, not within the app itself. Calories in kcal per 100 g of custom food 2/5 as a double value (e.g.: 120.0)
  ///
  /// In en, this message translates to:
  /// **'326'**
  String get testCustomFood2Calories;

  /// Only used for translated screenshots, not within the app itself. Name of custom food 3/5 which can be anything which makes sense in the current language. E.g. a local food.
  ///
  /// In en, this message translates to:
  /// **'Fried okra'**
  String get testCustomFood3Name;

  /// Only used for translated screenshots, not within the app itself. Calories in kcal per 100 g of custom food 3/5 as a double value (e.g.: 120.0)
  ///
  /// In en, this message translates to:
  /// **'260'**
  String get testCustomFood3Calories;

  /// Only used for translated screenshots, not within the app itself. Name of custom food 4/5 which can be anything which makes sense in the current language. E.g. a local food.
  ///
  /// In en, this message translates to:
  /// **'Scotch Egg'**
  String get testCustomFood4Name;

  /// Only used for translated screenshots, not within the app itself. Calories in kcal per 100 g of custom food 4/5 as a double value (e.g.: 120.0)
  ///
  /// In en, this message translates to:
  /// **'228'**
  String get testCustomFood4Calories;

  /// Only used for translated screenshots, not within the app itself. Name of custom food 5/5 which can be anything which makes sense in the current language. E.g. a local food.
  ///
  /// In en, this message translates to:
  /// **'Yorkshire Pudding'**
  String get testCustomFood5Name;

  /// Only used for translated screenshots, not within the app itself. Calories in kcal per 100 g of custom food 5/5 as a double value (e.g.: 120.0)
  ///
  /// In en, this message translates to:
  /// **'259'**
  String get testCustomFood5Calories;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ca',
    'cs',
    'da',
    'de',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'he',
    'hu',
    'it',
    'nb',
    'nl',
    'pa',
    'pl',
    'pt',
    'ru',
    'sk',
    'sl',
    'sr',
    'sv',
    'ta',
    'tr',
    'uk',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'nb':
      {
        switch (locale.countryCode) {
          case 'NO':
            return AppLocalizationsNbNo();
        }
        break;
      }
    case 'pa':
      {
        switch (locale.countryCode) {
          case 'PK':
            return AppLocalizationsPaPk();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hu':
      return AppLocalizationsHu();
    case 'it':
      return AppLocalizationsIt();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
