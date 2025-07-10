// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Jednoduchý zápisník na jídlo a výživové hodnoty.';

  @override
  String get appDescription =>
      'Jednoduchý zápisník na jídlo a výživové hodnoty. Naskenujte čárový kód produktu nebo manuálně hledejte v různých databázích.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Prosím zadejte hodnotu';

  @override
  String get onlyNumbersAllowed => 'Pouze čísla jsou dovolena';

  @override
  String get undo => 'Zrušit';

  @override
  String get deleted => 'smazáno';

  @override
  String get loading => 'Načítání';

  @override
  String somethingNotFound(String something) {
    return '$something nebylo nalezeno';
  }

  @override
  String get unknownErrorText => 'Došlo k neznámé chybě';

  @override
  String get tracking => 'Sledování výživy';

  @override
  String get energy => 'Energie';

  @override
  String get protein => 'Bílkoviny';

  @override
  String get carbs => 'Sacharidy';

  @override
  String get fat => 'Tuk';

  @override
  String get detailedSummary => 'Podrobný souhrn';

  @override
  String get dayComplete => 'Den je ukončen';

  @override
  String get markedDayAsComplete => 'Ukončit den';

  @override
  String get dayIncomplete => 'Den ještě není kompletní';

  @override
  String get unmarkedDayAsComplete => 'Den byl označen jako nehotový';

  @override
  String get trackFood => 'Zapsat jídlo';

  @override
  String get timeSetHelpText =>
      'Při sledování potravin se tento čas použije jako šablona pro čas konzumace.';

  @override
  String get useAsTemplateForCustomFood => 'Použít šablonu s vlastním jídlem';

  @override
  String get additionalInformation => 'Další informace';

  @override
  String get completeProductName => 'Úplný název produktu';

  @override
  String get addedDate => 'Přidáno';

  @override
  String get consumedDate => 'Spotřebováno';

  @override
  String get nutrients => 'Nutrienty';

  @override
  String get labelingEu => 'Označování (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit obsahovat';
  }

  @override
  String get dailyTarget => 'denní cíl';

  @override
  String get general => 'Obecné';

  @override
  String get micronutrients => 'Mikronutrienty';

  @override
  String get editTrackedFood => 'Upravit zapsané jídlo';

  @override
  String get scanBarcode => 'Skenování čárového kódu';

  @override
  String get searchFood => 'Vyhledat jídlo';

  @override
  String get productOrBrand => 'Produkt nebo značka';

  @override
  String get searchError => 'Chyba při vyhledávání';

  @override
  String get searchErrorHint =>
      'Alespoň jednu databázi složení potravin se nepodařilo získat. Zkuste to prosím později nebo dočasně zakažte nefunkční databáze v nastavení.';

  @override
  String get affectedDatabases => 'Dotčené databáze';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ani v potravinách na zakázku, ani v Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Není k dispozici v potravinách na zakázku, služba Open Food Facts potřebuje přístup k internetu';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Nebylo nalezeno ve vlastních potravinách, při vyhledávání v sekci Otevřít fakta o potravinách došlo k chybě';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Nevyskytuje se ve vlastních potravinách, funkce Open Food Facts není aktivována';

  @override
  String get barcodeScanningUnsupported =>
      'Skenování čárových kódů pomocí fotoaparátu zařízení je v současné době podporováno pouze v systému Android.';

  @override
  String get customFood => 'Vlastní jídlo';

  @override
  String get searchCustomFood => 'Vyhledat vlastní jídlo';

  @override
  String get addCustomFood => 'Přidat vlastní jídlo';

  @override
  String get editCustomFood => 'Upravit vlastní jídlo';

  @override
  String get title => 'Název';

  @override
  String get barcode => 'Čárový kód';

  @override
  String get settings => 'Nastavení';

  @override
  String get yourPersonalNutritionNeeds => 'Vaše osobní nutriční potřeby';

  @override
  String get personalNutritionNeedsHint =>
      'Vypočítejte si své nutriční potřeby nebo si nastavte vlastní';

  @override
  String get calculate => 'Vypočítat';

  @override
  String get energyDistribution => 'Rozložení energie';

  @override
  String get yourBody => 'Vaše tělo';

  @override
  String get age => 'Věk';

  @override
  String get years => 'let';

  @override
  String get sex => 'Pohlaví';

  @override
  String get female => 'Žena';

  @override
  String get male => 'Muž';

  @override
  String get weight => 'Váha';

  @override
  String get height => 'Tělesná výška';

  @override
  String get behaviourAndTarget => 'Chování a cíl';

  @override
  String get activityLevel => 'Stupeň aktivity (PAL)';

  @override
  String get activityLevel1_0 => 'Kromě spaní vlastně nic neděláte';

  @override
  String get activityLevel1_1 => 'Celý den ležíte v posteli';

  @override
  String get activityLevel1_2 => 'Celý den sedíte v posteli';

  @override
  String get activityLevel1_3 => 'Nechodíte moc ven';

  @override
  String get activityLevel1_4 => 'Nejste moc aktivní';

  @override
  String get activityLevel1_5 => 'Děláte kancelářskou práci';

  @override
  String get activityLevel1_6 =>
      'Jste trochu aktivní, pracujete a občas sportujete';

  @override
  String get activityLevel1_7 => 'Cvičíte často';

  @override
  String get activityLevel1_8 => 'Pravidelně intenzivně cvičíte';

  @override
  String get activityLevel1_9 =>
      'Jste velmi aktivní, cvičíte a nemáte kancelářskou práci';

  @override
  String get activityLevel2_0 =>
      'Máte fyzicky náročnou práci a často intenzivně cvičíte';

  @override
  String get noActivityLevelDescription => 'Žádný popis stupně aktivity';

  @override
  String get weightTarget => 'Cíl váhy';

  @override
  String get weightTargetStrongLoss => 'Značná úbytek';

  @override
  String get weightTargetModerateLoss => 'Střední úbytek';

  @override
  String get weightTargetSlightLoss => 'Mírný úbytek';

  @override
  String get weightTargetMaintaining => 'Udržování';

  @override
  String get weightTargetSlightGain => 'Mírný nárůst';

  @override
  String get weightTargetModerateGain => 'Střední nárůst';

  @override
  String get weightTargetStrongGain => 'Rychlý nárůst';

  @override
  String get calculateNutritionTargets => 'Výpočet výživových cílů';

  @override
  String get calculationInfo => 'Informace o výpočtu';

  @override
  String get calculationInfoText1 =>
      'Výpočet příjmu kalorií je založen na principu Mifflin-St.Jeor. Prosím mějte na paměti, že může sloužit pouze jako odhad opravdových hodnot. Mohou se lišit od osoby na osobu, protože mají různou tělesnou kondici.';

  @override
  String get formulaForFemales => 'Princip pro ženy';

  @override
  String get weightInKg => 'Váha v kg';

  @override
  String get heightInCm => 'Výška v cm';

  @override
  String get ageInYears => 'Věk v letech';

  @override
  String get formulaForMales => 'Princip pro muže';

  @override
  String get calculationInfoText2 =>
      'Výsledek tohoto výpočtu je definován jako bazální metabolická rychlost (BMR). Ten se vynásobí vaším faktorem aktivity a získáte celkový přepočtený výkon. To je váš vypočtený energetický příjem v kcal.';

  @override
  String get calculatedNutritionTargets => 'Vypočítat nutriční cíle';

  @override
  String get calculatedNutritionTargetsHint =>
      'Neváhejte upravit vypočítané hodnoty před použitím dle vašich potřeb.';

  @override
  String get percentOfCalories => '% kalorií';

  @override
  String get proteinRatio => 'Poměr bílkovin';

  @override
  String get carbsRatio => 'Poměr sacharidů';

  @override
  String get fatRatio => 'Poměr tuku';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Též nastavit mikronutrienty dle věku a pohlaví';

  @override
  String get apply => 'Použít';

  @override
  String get targetsApplied => 'Nutriční cíle byly použity';

  @override
  String get targetsApplyError => 'Nutriční cíle nemohly být použity';

  @override
  String get totalEnergy => 'Celková energie';

  @override
  String get energyDistributionChartMissingHint =>
      'Graf rozložení energie se zobrazí pouze v případě, že jste nastavili cílovou hodnotu kalorií a cílovou hodnotu alespoň jedné z makroživin.';

  @override
  String get percentOfTotalEnergy => 'Procent celkové energie';

  @override
  String get selectedMacronutrient => 'Vybraný makronutrient';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalorie, bílkoviny, sacharidy, tuky';

  @override
  String get display => 'Zobrazit';

  @override
  String get displayHint =>
      'Přizpůsobení uživatelského rozhraní vašim potřebám';

  @override
  String get groupFoodsToMeals => 'Seskupení potravin do jídel';

  @override
  String get groupFoodsToMealsHint =>
      'Automaticky seskupuje potraviny konzumované ve velmi krátkých intervalech jako jídlo';

  @override
  String get preferServingSizes => 'Preferované velikosti porcí';

  @override
  String get preferServingSizesHint =>
      'Při sledování nové potraviny se předem vybere velikost porce, pokud je nějaká zvolena';

  @override
  String mealAt(String time) {
    return 'Jídlo v $time';
  }

  @override
  String get databaseManagement => 'Správa databáze';

  @override
  String get databaseManagementHint => 'Výběr jaké používat databáze potravin';

  @override
  String get storedOnDevice => 'Dostupné lokálně';

  @override
  String get swissFoodCompositionDatabase =>
      'Švýcarská databáze složení potravin';

  @override
  String get version => 'Verze';

  @override
  String get language => 'Jazyk';

  @override
  String get languages => 'Jazyky';

  @override
  String get german => 'Němčina';

  @override
  String get italian => 'Italský';

  @override
  String get french => 'Francouzský';

  @override
  String get publisher => 'Vydavatel';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federální úřad pro bezpečnost potravin a veterinární záležitosti';

  @override
  String get switzerland => 'Švýcarsko';

  @override
  String get generalInformation => 'Obecné informace';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Tato databáze obsahuje informace o přibližně 1100 potravinách, včetně mikronutrientů. Funguje i bez internetu, protože je uložená lokálně.';

  @override
  String get source => 'Zdroj';

  @override
  String get tapHereForFurtherInformation => 'Klikněte pro více informací.';

  @override
  String get serverBased => 'Dostupné online';

  @override
  String get openFoodFactsVariousLanguagesText => 'Různé';

  @override
  String get nonProfitInstitution => 'Nezisková organizace';

  @override
  String get france => 'Francie';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Berte prosím v úvahu, že tato databáze je obrovská a občas obsahuje nekompletní nebo zastaralá data. Každý registrovaný uživatel může nutriční hodnoty produktů upravovat. Přidávání nových položek je dokonce možné bez vytvořeného účtu. Po deaktivaci této databáze budete moct skenovat pouze vlastní vytvořené potraviny.';

  @override
  String get termsOfUse => 'Podmínky použití';

  @override
  String get openFoodFactsTermsText =>
      'Aktivováním databáze dáváte souhlas s podmínkami použití.';

  @override
  String get contribute => 'Přispějte na';

  @override
  String get databaseContributeText =>
      'Ukázat jak se můžu zapojit do zlepšování databáze.';

  @override
  String get english => 'Angličtina';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central je databáze nutričních hodnot potravin od Amerického ministerstva zemědělství. Data jsou volně přístupnáa obsahuje přibližně 200 základních potravin a přes 380 000 produktů.';

  @override
  String get backupAndRestore => 'Zálohování a obnovení zálohy';

  @override
  String get backupAndRestoreHint =>
      'Ukládejte svá data lokálně nebo v cloudovém úložišti kompatibilním s WebDAV, jako je Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Varování: Nastavení, personalizace a cíle zatím nejsou zahrnuty!';

  @override
  String get successfullyCreatedBackup => 'Úspěšně vytvořená záloha';

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

    return 'Exportované $customFoodsCountString vlastní potraviny a $trackedFoodsCountString sledované potraviny';
  }

  @override
  String get successfullyRestoredBackup => 'Úspěšně obnovená záloha';

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

    return 'Importované $customFoodsCountString vlastní potraviny a $trackedFoodsCountString sledované potraviny';
  }

  @override
  String get createWebDAVBackup => 'Vytvoření zálohy WebDAV';

  @override
  String get webDAVSettings => 'Nastavení WebDAV';

  @override
  String get serverURL => 'URL serveru';

  @override
  String get invalidURL => 'Adresa URL je neplatná';

  @override
  String get username => 'Uživatelské jméno';

  @override
  String get password => 'Heslo';

  @override
  String get pathAndFilename => 'Cesta a název souboru';

  @override
  String energizeBackup(String appName) {
    return '$appName Zálohování';
  }

  @override
  String get backupPasswordNotice => 'Bez hesla k záloze nelze zálohu obnovit.';

  @override
  String get restoreWebDAVBackup => 'Obnovení zálohy WebDAV';

  @override
  String get createLocalBackup => 'Vytvoření místní zálohy';

  @override
  String get restoreLocalBackup => 'Obnovení místní zálohy';

  @override
  String get aboutEnergize => 'O Energize';

  @override
  String get license => 'Licence';

  @override
  String get allLicenses => 'Všechny licence';

  @override
  String get privacyPolicy => 'Zásady ochrany soukromí';

  @override
  String get logs => 'Protokoly';

  @override
  String get reportIssue => 'Nahlásit problém';

  @override
  String get proposeImprovement => 'Navrhnout zlepšení';

  @override
  String get sourceCode => 'Zdrojový kód';

  @override
  String get translation => 'Překlady';

  @override
  String get contributors => 'Přispěvatelé';

  @override
  String get thanksToContributorsText =>
      'Děkujeme všem lidem, kteří přispěli do projektu Energize. Díky vaší pomoci se Energize mohla stát tím, čím je nyní.';

  @override
  String get contributionTypeCodeAndConversations => 'Kód a konverzace';

  @override
  String get contributionTypeAcrylicPicture => 'Akrylový obraz';

  @override
  String get allTranslatorsOnWeblate => 'Všichni překladatelé na Weblate';

  @override
  String get contact => 'Kontakt';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Používejte ji prosím pouze pro jiná než výše uvedená témata';

  @override
  String get supportMeByDonating => 'Podpořte autora aplikace';

  @override
  String get donate => 'Darovat';

  @override
  String get donationText =>
      'Pokud chcete podpořit vývoj příspěvkem, budeme velmi rádi! Vytváření této aplikace je zábava, ale též velmi časově náročné a někdy vede k frustraci :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoinová adresa byla zkopírována do schránky';

  @override
  String get bankAccountOrCreditCard => 'Bankovní účet nebo platební karta';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Jste vítán napsat mi e-mail pro další možnosti příspěvků';

  @override
  String get energyAndMacronutrients => 'Kalorie a makronutrienty';

  @override
  String get vitamins => 'Vitamíny';

  @override
  String get vitaminA => 'Vitamín A';

  @override
  String get vitaminB1 => 'B1 (Thiamin)';

  @override
  String get vitaminB2 => 'B2 (Ryboflavin)';

  @override
  String get vitaminB3 => 'B3 (Niacinu)';

  @override
  String get vitaminB5 => 'B5 (Kyselina pantothenová)';

  @override
  String get vitaminB6 => 'Vitamín B6';

  @override
  String get vitaminB7 => 'B7 (Biogen)';

  @override
  String get vitaminB9 => 'B9 (Kyselina listová)';

  @override
  String get vitaminB12 => 'B12 (Kobalamin)';

  @override
  String get vitaminC => 'Vitamín C';

  @override
  String get vitaminD => 'Vitamín D';

  @override
  String get vitaminE => 'Vitamín E';

  @override
  String get vitaminK => 'Vitamín K';

  @override
  String get minerals => 'Minerály';

  @override
  String get majorMinerals => 'Hlavní minerály';

  @override
  String get calcium => 'Vápník (Ca)';

  @override
  String get chloride => 'Chloridy';

  @override
  String get magnesium => 'Hořčík (Mg)';

  @override
  String get phosphorous => 'Fosfor (P)';

  @override
  String get potassium => 'Draslík (K, potassium)';

  @override
  String get sodium => 'Sodík (Na)';

  @override
  String get traceElements => 'Stopové prvky';

  @override
  String get chromium => 'Chrom';

  @override
  String get iron => 'Železo';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Jód';

  @override
  String get copper => 'Měď (Cu)';

  @override
  String get manganese => 'Mangan (Mn)';

  @override
  String get molybdenum => 'Molybden';

  @override
  String get selenium => 'Selen';

  @override
  String get zinc => 'Zinek';

  @override
  String get fats => 'Tuky';

  @override
  String get monounsaturatedFat => '(Mono)nenasycené mastné kyseliny';

  @override
  String get polyunsaturatedFat => 'Vícenenasycené mastné kyseliny';

  @override
  String get omega3 => 'Omegy 3';

  @override
  String get omega6 => 'Omegy 6';

  @override
  String get saturatedFat => 'Nasycené mastné kyseliny';

  @override
  String get transfat => 'Trans mastné kyseliny';

  @override
  String get cholesterol => 'Cholesterolu';

  @override
  String get fiber => 'Vláknina';

  @override
  String get sugar => 'Cukry';

  @override
  String get sugarAlcohol => 'Cukerné alkoholy';

  @override
  String get starch => 'Škrob';

  @override
  String get other => 'Jiné';

  @override
  String get water => 'Voda';

  @override
  String get caffeine => 'Kofein';

  @override
  String get alcohol => 'Alkohol';

  @override
  String get salt => 'Sůl';

  @override
  String get servingSizes => 'Velikost porcí';

  @override
  String get add => 'Přidat';

  @override
  String get noServingSizesText => 'Nejsou uvedeny žádné velikosti porcí.';

  @override
  String get addServingSize => 'Přidejte velikost porce';

  @override
  String get typicalServingSizes => 'Typické velikosti porcí';

  @override
  String get or => 'nebo';

  @override
  String get servingSizeName => 'Název velikosti porce';

  @override
  String get size => 'Velikost';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'Hrv.',
        'l10nPackage': 'Pak.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Palačinky';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Hašlerky';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Smažená okra';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Skotské vejce';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Yorkshirský pudink';

  @override
  String get testCustomFood5Calories => '259';
}
