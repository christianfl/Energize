// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Spåra din mat och näring enkelt och snabbt.';

  @override
  String get appDescription =>
      'Spåra din mat och näring enkelt och snabbt. Skanna dina produkter eller sök manuellt i olika databaser.';

  @override
  String get ok => 'OKEJ';

  @override
  String get fieldMandatory => 'Ange ett värde';

  @override
  String get onlyNumbersAllowed => 'Endast siffror är tillåtna';

  @override
  String get undo => 'Ångra';

  @override
  String get deleted => 'bort';

  @override
  String get loading => 'Lastning';

  @override
  String somethingNotFound(String something) {
    return '$something hittades inte';
  }

  @override
  String get unknownErrorText => 'Ett okänt fel har uppstått';

  @override
  String get tracking => 'Spårning';

  @override
  String get energy => 'Kraft';

  @override
  String get protein => 'Proteiner';

  @override
  String get carbs => 'Kolhydrater';

  @override
  String get fat => 'Fett';

  @override
  String get detailedSummary => 'Detaljerad sammanfattning';

  @override
  String get dayComplete => 'Dag komplett';

  @override
  String get markedDayAsComplete => 'Markerad dag som komplett';

  @override
  String get dayIncomplete => 'Dag ofullständig';

  @override
  String get unmarkedDayAsComplete => 'Omärkt dag som komplett';

  @override
  String get trackFood => 'Spåra mat';

  @override
  String get timeSetHelpText =>
      'Vid spårning av mat kommer den här tiden att användas som en mall för konsumentens tid.';

  @override
  String get useAsTemplateForCustomFood => 'Använd som mall för anpassad mat';

  @override
  String get additionalInformation => 'Ytterligare information';

  @override
  String get completeProductName => 'Fullständigt Produktnamn';

  @override
  String get addedDate => 'Lagt';

  @override
  String get consumedDate => 'Konsumera';

  @override
  String get nutrients => 'Näringsämne';

  @override
  String get labelingEu => 'Märkning (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit innehåller';
  }

  @override
  String get dailyTarget => 'dagligt mål';

  @override
  String get general => 'Allmänna';

  @override
  String get micronutrients => 'Mikronäringsämnen';

  @override
  String get editTrackedFood => 'Redigera spårad mat';

  @override
  String get scanBarcode => 'Skanna streckkod';

  @override
  String get searchFood => 'Sök mat';

  @override
  String get productOrBrand => 'Produkt eller varumärke';

  @override
  String get searchError => 'Fel vid sökning';

  @override
  String get searchErrorHint =>
      'Minst en databas för livsmedelssammansättning kunde inte nås. Försök igen senare eller inaktivera tillfälligt icke-funktionella databaser i inställningarna.';

  @override
  String get affectedDatabases => 'Berörda databaser';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Varken i anpassade livsmedel eller på Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Finns inte i anpassade livsmedel, Open Food Facts behöver tillgång till internet';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Hittades inte i anpassade livsmedel, sökningen i Open Food Facts hade ett fel';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Finns inte i anpassade livsmedel, Open Food Facts är inte aktiverat';

  @override
  String get barcodeScanningUnsupported =>
      'Skanning av streckkoder med enhetskameran stöds för närvarande endast på Android.';

  @override
  String get customFood => 'Anpassad Mat';

  @override
  String get searchCustomFood => 'Sök anpassad mat';

  @override
  String get addCustomFood => 'Lägg till anpassad mat';

  @override
  String get editCustomFood => 'Redigera anpassad mat';

  @override
  String get title => 'Titel';

  @override
  String get barcode => 'Streckkod';

  @override
  String get settings => 'Inställning';

  @override
  String get yourPersonalNutritionNeeds => 'Dina personliga näringsbehov';

  @override
  String get personalNutritionNeedsHint =>
      'Beräkna dina personliga näringsbehov eller ställ in dem själv';

  @override
  String get calculate => 'Beräkna';

  @override
  String get energyDistribution => 'Energidistribution';

  @override
  String get yourBody => 'Din Kropp';

  @override
  String get age => 'Ålder';

  @override
  String get years => 'år';

  @override
  String get sex => 'Kön';

  @override
  String get female => 'Kvinnlig';

  @override
  String get male => 'Manlig';

  @override
  String get weight => 'Vikt';

  @override
  String get height => 'Kroppshöjd';

  @override
  String get behaviourAndTarget => 'Beteende och mål';

  @override
  String get activityLevel => 'Aktivitetsnivå (PAL)';

  @override
  String get activityLevel1_0 => 'Du gör i princip ingenting än att sova';

  @override
  String get activityLevel1_1 => 'Du ligger i din säng hela dagen';

  @override
  String get activityLevel1_2 => 'Du sitter i din säng hela dagen';

  @override
  String get activityLevel1_3 => 'Du går inte riktigt ut så ofta';

  @override
  String get activityLevel1_4 => 'Du är inte så aktiv alls';

  @override
  String get activityLevel1_5 => 'Du gör ett kontorsarbete';

  @override
  String get activityLevel1_6 =>
      'Du är lite aktiv, arbetar och ibland gör sport';

  @override
  String get activityLevel1_7 => 'Du tränar ofta';

  @override
  String get activityLevel1_8 => 'Du tränar hårt regelbundet';

  @override
  String get activityLevel1_9 =>
      'Du är väldigt aktiv, tränar och har inget kontorsjobb';

  @override
  String get activityLevel2_0 =>
      'Du gör ett fysiskt aktivt jobb och tränar hårt regelbundet';

  @override
  String get noActivityLevelDescription =>
      'Ingen beskrivning av aktivitetsnivå';

  @override
  String get weightTarget => 'Viktmål';

  @override
  String get weightTargetStrongLoss => 'Stark förlust';

  @override
  String get weightTargetModerateLoss => 'Måttlig förlust';

  @override
  String get weightTargetSlightLoss => 'Liten förlust';

  @override
  String get weightTargetMaintaining => 'Upprätthålla';

  @override
  String get weightTargetSlightGain => 'Liten vinst';

  @override
  String get weightTargetModerateGain => 'Måttlig vinst';

  @override
  String get weightTargetStrongGain => 'Stark vinst';

  @override
  String get calculateNutritionTargets => 'Beräkna näringsmål';

  @override
  String get calculationInfo => 'Information om beräkning';

  @override
  String get calculationInfoText1 =>
      'Beräkningen av kaloriintaget baseras på Mifflin-St.Jeor-formeln. Tänk på att det bara kan fungera som en approximation till de verkliga världsvärdena. Dessa skiljer sig från person till person eftersom deras kroppsförhållanden kan avvika mer eller mindre.';

  @override
  String get formulaForFemales => 'Formel för kvinnor';

  @override
  String get weightInKg => 'Vikt i kg';

  @override
  String get heightInCm => 'Höjd i cm';

  @override
  String get ageInYears => 'Ålder i år';

  @override
  String get formulaForMales => 'Formel för män';

  @override
  String get calculationInfoText2 =>
      'Utgången av denna beräkning definieras som den basala metaboliska hastigheten (BMR). Det multipliceras med din aktivitetsfaktor för att få din totala effektomvandling. Detta är ditt beräknade energiintag i kcal.';

  @override
  String get calculatedNutritionTargets => 'Beräknade näringsmål';

  @override
  String get calculatedNutritionTargetsHint =>
      'Redigera gärna de beräknade målen efter dina behov innan du tillämpar dem.';

  @override
  String get percentOfCalories => '% av kcal';

  @override
  String get proteinRatio => 'Proteinförhållande';

  @override
  String get carbsRatio => 'Kolhydratkvot';

  @override
  String get fatRatio => 'Fettkvot';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Ställ också in mikronäringsmål baserat på ålder och kön';

  @override
  String get apply => 'Gälla';

  @override
  String get targetsApplied => 'Näringsmål tillämpades';

  @override
  String get targetsApplyError => 'Näringsmål kunde inte tillämpas';

  @override
  String get totalEnergy => 'Total energi';

  @override
  String get energyDistributionChartMissingHint =>
      'Energifördelningsdiagrammet visas bara om du har ställt in ett kalorimål och ett mål för minst ett av makronäringsämnena.';

  @override
  String get percentOfTotalEnergy => 'Procent av den totala energin';

  @override
  String get selectedMacronutrient => 'Valda makronäringsämnen';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalorier, protein, kolhydrater, fett';

  @override
  String get display => 'Visning';

  @override
  String get displayHint => 'Anpassa användargränssnittet efter dina behov';

  @override
  String get groupFoodsToMeals => 'Gruppera livsmedel till måltider';

  @override
  String get groupFoodsToMealsHint =>
      'Grupperar automatiskt livsmedel som intas med mycket korta intervall som en måltid';

  @override
  String get preferServingSizes => 'Föredra portionsstorlekar';

  @override
  String get preferServingSizesHint =>
      'Vid spårning av ny mat kommer en portionsstorlek att väljas i förväg, om någon';

  @override
  String mealAt(String time) {
    return 'Måltid vid $time';
  }

  @override
  String get databaseManagement => 'Databasförvaltning';

  @override
  String get databaseManagementHint =>
      'Välj vilka livsmedelsdatabaser du vill söka i';

  @override
  String get storedOnDevice => 'Lagrad på enheten';

  @override
  String get swissFoodCompositionDatabase =>
      'Schweizisk databas för livsmedelssammansättning';

  @override
  String get version => 'Versioner';

  @override
  String get language => 'Språk';

  @override
  String get languages => 'Språken';

  @override
  String get german => 'Tysk';

  @override
  String get italian => 'Italiensk';

  @override
  String get french => 'Franska';

  @override
  String get publisher => 'Utgivare';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federala kontoret för livsmedelssäkerhet och Veterinär';

  @override
  String get switzerland => 'Schweiz';

  @override
  String get generalInformation => 'Allmän information';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Denna databas erbjuder cirka 1.100 allmänna produkter och många mikronäringsämnen. Eftersom den är lagrad på din enhet fungerar den därför offline.';

  @override
  String get source => 'Källa';

  @override
  String get tapHereForFurtherInformation => 'Tryck här för mer information.';

  @override
  String get serverBased => 'Serverbaserad';

  @override
  String get openFoodFactsVariousLanguagesText => 'Olika';

  @override
  String get nonProfitInstitution => 'Ideell organisation';

  @override
  String get france => 'Frankrike';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Observera att även om denna databas är mycket stor, poster kan vara ofullständig eller inaktuell. Varje registrerad användare kan uppdatera näringsvärden. Att lägga till nya produkter är möjligt utan att skapa ett konto. Att inaktivera denna databas inkluderar också EAN-skanning så att du bara kan skanna anpassade livsmedel med EAN-kod då.';

  @override
  String get termsOfUse => 'Användningsvillkor';

  @override
  String get openFoodFactsTermsText =>
      'Genom att aktivera denna databas godkänner du villkoren.';

  @override
  String get contribute => 'Bidra';

  @override
  String get databaseContributeText =>
      'Se hur du kan hjälpa till att förbättra den här databasen.';

  @override
  String get english => 'Engelsk';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'Food Data Central är en databas över livsmedel och näringsämnen från USA: s jordbruksdepartement. Uppgifterna är offentliga och innehåller cirka 200 foundation foods och över 380.000 branded foods.';

  @override
  String get backupAndRestore => 'Hantering av databaser';

  @override
  String get backupAndRestoreHint =>
      'Lagra dina data lokalt eller på en WebDAV-kompatibel molnlagring som Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Varning: Inställningar, personaliseringar och mål är ännu inte inkluderade!';

  @override
  String get successfullyCreatedBackup => 'Framgångsrikt skapat backup';

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

    return 'Exporterade $customFoodsCountString anpassade livsmedel och $trackedFoodsCountString spårade livsmedel';
  }

  @override
  String get successfullyRestoredBackup => 'Återställd säkerhetskopiering';

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

    return 'Importerade $customFoodsCountString anpassade livsmedel och $trackedFoodsCountString spårbara livsmedel';
  }

  @override
  String get createWebDAVBackup => 'Skapa WebDAV backup';

  @override
  String get webDAVSettings => 'WebDAV inställningar';

  @override
  String get serverURL => 'Serverns URL';

  @override
  String get invalidURL => 'URL-adressen är ogiltig';

  @override
  String get username => 'Användarnamn';

  @override
  String get password => 'Lösenord';

  @override
  String get pathAndFilename => 'Sökväg och filnamn';

  @override
  String energizeBackup(String appName) {
    return '$appName Säkerhetskopiering';
  }

  @override
  String get backupPasswordNotice =>
      'Utan backuplösenordet är det omöjligt att återställa en säkerhetskopia.';

  @override
  String get restoreWebDAVBackup => 'Återställ WebDAV backup';

  @override
  String get createLocalBackup => 'Skapa lokal säkerhetskopia';

  @override
  String get restoreLocalBackup => 'Återställ lokal säkerhetskopiering';

  @override
  String get aboutEnergize => 'Om Energize';

  @override
  String get license => 'licensavtal';

  @override
  String get allLicenses => 'Alla licenser';

  @override
  String get privacyPolicy => 'Integritetspolicy';

  @override
  String get logs => 'Loggar';

  @override
  String get reportIssue => 'Rapportera problem';

  @override
  String get proposeImprovement => 'Föreslå förbättring';

  @override
  String get sourceCode => 'Källa kod';

  @override
  String get translation => 'Översättning';

  @override
  String get contributors => 'Bidragsgivare';

  @override
  String get thanksToContributorsText =>
      'Tack till alla som har bidragit till Energize. Tack vare din hjälp kunde Energize bli vad det är nu.';

  @override
  String get contributionTypeCodeAndConversations => 'Kod och konversationer';

  @override
  String get contributionTypeAcrylicPicture => 'Akrylbild';

  @override
  String get allTranslatorsOnWeblate => 'Alla översättare på Weblate';

  @override
  String get contact => 'Kontakt';

  @override
  String get email => 'E-Post';

  @override
  String get emailHint => 'Använd detta endast för andra ämnen än ovanstående';

  @override
  String get supportMeByDonating => 'Stöd mig genom att donera';

  @override
  String get donate => 'Donera';

  @override
  String get donationText =>
      'Om du vill stödja utvecklingen genom en donation är du varmt välkommen att göra det! Att skapa den här appen är mycket roligt men också en mycket tidskrävande uppgift och leder ibland till lite frustration :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin-adress kopierad till Urklipp';

  @override
  String get bankAccountOrCreditCard => 'Bankkonto eller kreditkort';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Du är välkommen att skriva mig ett e-mail för ytterligare donationsalternativ';

  @override
  String get energyAndMacronutrients => 'Energi och makronäringsämnen';

  @override
  String get vitamins => 'Vitaminer';

  @override
  String get vitaminA => 'Vitaminer A';

  @override
  String get vitaminB1 => 'B1 (Tiamin)';

  @override
  String get vitaminB2 => 'B2 (riboslavin)';

  @override
  String get vitaminB3 => 'B3 (niacin)';

  @override
  String get vitaminB5 => 'B5 (pantotensyra)';

  @override
  String get vitaminB6 => 'Vitaminer B6';

  @override
  String get vitaminB7 => 'B7 (biotin)';

  @override
  String get vitaminB9 => 'B9 (folat)';

  @override
  String get vitaminB12 => 'B12 (kobalamin)';

  @override
  String get vitaminC => 'Vitaminer C';

  @override
  String get vitaminD => 'Vitaminer D';

  @override
  String get vitaminE => 'Vitaminer E';

  @override
  String get vitaminK => 'Vitaminer K';

  @override
  String get minerals => 'Mineral';

  @override
  String get majorMinerals => 'Viktiga mineraler';

  @override
  String get calcium => 'Kalcium';

  @override
  String get chloride => 'Klor';

  @override
  String get magnesium => 'Magnesium och';

  @override
  String get phosphorous => 'Fosfor';

  @override
  String get potassium => 'Kalium';

  @override
  String get sodium => 'Natrium';

  @override
  String get traceElements => 'Spårämne';

  @override
  String get chromium => 'Krom';

  @override
  String get iron => 'Strykjärn';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Jod';

  @override
  String get copper => 'Koppar';

  @override
  String get manganese => 'Mangan';

  @override
  String get molybdenum => 'Molybden';

  @override
  String get selenium => 'Selen';

  @override
  String get zinc => 'Zink';

  @override
  String get fats => 'Fette';

  @override
  String get monounsaturatedFat => 'Enkelomättat fett';

  @override
  String get polyunsaturatedFat => 'Fleromättat fett';

  @override
  String get omega3 => 'Omega- 3';

  @override
  String get omega6 => 'Omega- 6';

  @override
  String get saturatedFat => 'Mättat fett';

  @override
  String get transfat => 'Transvat';

  @override
  String get cholesterol => 'Kolesterol';

  @override
  String get fiber => 'Fibrer';

  @override
  String get sugar => 'Socker';

  @override
  String get sugarAlcohol => 'Sockeralkohol';

  @override
  String get starch => 'Stärkelse';

  @override
  String get other => 'Andra';

  @override
  String get water => 'Vatten';

  @override
  String get caffeine => 'Koffein';

  @override
  String get alcohol => 'Sprit';

  @override
  String get salt => 'Saltet';

  @override
  String get servingSizes => 'Portionsstorlekar';

  @override
  String get add => 'Tillägg';

  @override
  String get noServingSizesText => 'Det finns inga portionsstorlekar angivna.';

  @override
  String get addServingSize => 'Lägg till portionsstorlek';

  @override
  String get typicalServingSizes => 'Typiska portionsstorlekar';

  @override
  String get or => 'eller';

  @override
  String get servingSizeName => 'Namn på portionsstorlek';

  @override
  String get size => 'Storlek';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'Ser.',
        'l10nPackage': 'Pak.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Pannkakor';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Haschpotatis';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Stekt okra';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Skotskt Ägg';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Yorkshire-pudding';

  @override
  String get testCustomFood5Calories => '259';
}
