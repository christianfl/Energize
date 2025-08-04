// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Könnyen és gyorsan nyomon követheti ételeit és táplálkozását.';

  @override
  String get appDescription =>
      'Könnyen és gyorsan nyomon követheti ételeit és táplálkozását. Szkennelje be termékeit, vagy keressen manuálisan különböző adatbázisokban.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Kérjük, adjon meg egy értéket';

  @override
  String get onlyNumbersAllowed => 'Csak számok engedélyezettek';

  @override
  String get undo => 'Visszavonás';

  @override
  String get deleted => 'törölve';

  @override
  String get loading => 'Betöltés';

  @override
  String somethingNotFound(String something) {
    return '$something nem található';
  }

  @override
  String get unknownErrorText => 'Ismeretlen hiba történt';

  @override
  String get tracking => 'Nyomkövetés';

  @override
  String get energy => 'Energia';

  @override
  String get protein => 'Fehérje';

  @override
  String get carbs => 'Szénhidrátok';

  @override
  String get fat => 'Zsír';

  @override
  String get detailedSummary => 'Részletes összefoglaló';

  @override
  String get dayComplete => 'Nap teljes';

  @override
  String get markedDayAsComplete => 'A napot befejezettnek jelölte';

  @override
  String get dayIncomplete => 'Nap nem teljes';

  @override
  String get unmarkedDayAsComplete => 'Jelöletlen nap, mint teljes';

  @override
  String get trackFood => 'Pálya élelmiszer';

  @override
  String get timeSetHelpText =>
      'Az ételek nyomon követésekor ez az időpont lesz a fogyasztás idejének sablonja.';

  @override
  String get useAsTemplateForCustomFood =>
      'Használja sablonként az egyéni ételekhez';

  @override
  String get additionalInformation => 'További információk';

  @override
  String get completeProductName => 'Teljes terméknév';

  @override
  String get addedDate => 'Hozzáadva';

  @override
  String get consumedDate => 'Fogyasztott';

  @override
  String get nutrients => 'Tápanyagok';

  @override
  String get labelingEu => 'Címkézés (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit tartalmaz';
  }

  @override
  String get dailyTarget => 'napi cél';

  @override
  String get general => 'Általános';

  @override
  String get micronutrients => 'Mikrotápanyagok';

  @override
  String get editTrackedFood => 'Nyomon követett élelmiszer szerkesztése';

  @override
  String get scanBarcode => 'Vonalkód beolvasása';

  @override
  String get searchFood => 'Keresés élelmiszer';

  @override
  String get productOrBrand => 'Termék vagy márka';

  @override
  String get searchError => 'Hiba a keresés során';

  @override
  String get searchErrorHint =>
      'Legalább egy élelmiszer-összetétel adatbázis nem volt elérhető. Kérjük, próbálja meg később újra, vagy ideiglenesen tiltsa le a nem működő adatbázisokat a beállításokban.';

  @override
  String get affectedDatabases => 'Érintett adatbázisok';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Sem az egyedi élelmiszerekben, sem a Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Nem található az egyedi élelmiszerekben, az Open Food Facts internet-hozzáférést igényel';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Nem található meg az egyedi élelmiszerekben, Az Open Food Facts keresés hibát tartalmazott';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Az egyedi élelmiszerekben nem található, az Open Food Facts nem aktiválódik';

  @override
  String get barcodeScanningUnsupported =>
      'A vonalkódok beolvasása a készülék kamerájával jelenleg csak Androidon támogatott.';

  @override
  String get customFood => 'Egyedi ételek';

  @override
  String get searchCustomFood => 'Egyéni élelmiszer keresése';

  @override
  String get addCustomFood => 'Egyéni étel hozzáadása';

  @override
  String get editCustomFood => 'Egyéni étel szerkesztése';

  @override
  String get title => 'Cím';

  @override
  String get barcode => 'Vonalkód';

  @override
  String get settings => 'Beállítások';

  @override
  String get yourPersonalNutritionNeeds =>
      'Személyes táplálkozási szükségletei';

  @override
  String get personalNutritionNeedsHint =>
      'Számítsa ki a személyes táplálkozási szükségleteit, vagy állítsa be azokat saját magának';

  @override
  String get calculate => 'Számítsa ki';

  @override
  String get energyDistribution => 'Energiaelosztás';

  @override
  String get yourBody => 'A tested';

  @override
  String get age => 'Kor';

  @override
  String get years => 'évek';

  @override
  String get sex => 'Szex';

  @override
  String get female => 'Női';

  @override
  String get male => 'Férfi';

  @override
  String get weight => 'Súly';

  @override
  String get height => 'Test magassága';

  @override
  String get behaviourAndTarget => 'Viselkedés és célkitűzés';

  @override
  String get activityLevel => 'Aktivitási szint (PAL)';

  @override
  String get activityLevel1_0 => 'Alapvetően semmit sem csinálsz, csak alszol';

  @override
  String get activityLevel1_1 => 'Egész nap az ágyadban fekszel';

  @override
  String get activityLevel1_2 => 'Egész nap az ágyadban ülsz';

  @override
  String get activityLevel1_3 => 'Nem igazán jársz ki gyakran a szabadba';

  @override
  String get activityLevel1_4 => 'Egyáltalán nem vagy olyan aktív';

  @override
  String get activityLevel1_5 => 'Irodai munkát végzel';

  @override
  String get activityLevel1_6 =>
      'Kicsit aktív vagy, dolgozol és néha sportolsz';

  @override
  String get activityLevel1_7 => 'Gyakran edzel';

  @override
  String get activityLevel1_8 => 'Rendszeresen keményen edzel';

  @override
  String get activityLevel1_9 =>
      'Nagyon aktív vagy, edzel, és nincs irodai munkád';

  @override
  String get activityLevel2_0 =>
      'Fizikailag aktív munkát végez és rendszeresen keményen edz';

  @override
  String get noActivityLevelDescription => 'Nincs tevékenységi szint leírása';

  @override
  String get weightTarget => 'Súlycél';

  @override
  String get weightTargetStrongLoss => 'Erős veszteség';

  @override
  String get weightTargetModerateLoss => 'Mérsékelt veszteség';

  @override
  String get weightTargetSlightLoss => 'Enyhe veszteség';

  @override
  String get weightTargetMaintaining => 'Fenntartása';

  @override
  String get weightTargetSlightGain => 'Enyhe erősödés';

  @override
  String get weightTargetModerateGain => 'Mérsékelt nyereség';

  @override
  String get weightTargetStrongGain => 'Erős nyereség';

  @override
  String get calculateNutritionTargets => 'Táplálkozási célok kiszámítása';

  @override
  String get calculationInfo => 'Számítással kapcsolatos információk';

  @override
  String get calculationInfoText1 =>
      'A kalóriabevitel kiszámítása a Mifflin-St.Jeor-formulán alapul. Kérjük, vegye figyelembe, hogy ez csak közelítő értékként szolgálhat a valós értékekhez. Ezek személyenként eltérőek, mivel testalkatuk többé-kevésbé eltérhet egymástól.';

  @override
  String get formulaForFemales => 'Képlet nők számára';

  @override
  String get weightInKg => 'Súly kg-ban';

  @override
  String get heightInCm => 'Magasság cm-ben';

  @override
  String get ageInYears => 'Életkor években';

  @override
  String get formulaForMales => 'Képlet férfiak számára';

  @override
  String get calculationInfoText2 =>
      'E számítás eredménye az alapanyagcsere-ráta (BMR). Ezt megszorozzuk az aktivitási tényezővel, hogy megkapjuk a teljes energiaátalakítást. Ez az Ön számított energiabevitele kcal-ban.';

  @override
  String get calculatedNutritionTargets => 'Kiszámított táplálkozási célok';

  @override
  String get calculatedNutritionTargetsHint =>
      'Alkalmazásuk előtt nyugodtan szerkesztheti a kiszámított célokat az igényeinek megfelelően.';

  @override
  String get percentOfCalories => '% vagy kcal';

  @override
  String get proteinRatio => 'Fehérje arány';

  @override
  String get carbsRatio => 'Szénhidrát arány';

  @override
  String get fatRatio => 'Zsír arány';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Mikrotápanyag-célkitűzések meghatározása életkor és nem szerint is';

  @override
  String get alsoSetMicronutrientsHint =>
      'Based on DGE reference values from 2022 with a partly update from 2025';

  @override
  String get apply => 'Alkalmazás';

  @override
  String get targetsApplied => 'Táplálkozási célokat alkalmaztak';

  @override
  String get targetsApplyError =>
      'A táplálkozási célokat nem lehetett alkalmazni';

  @override
  String get totalEnergy => 'Teljes energia';

  @override
  String get energyDistributionChartMissingHint =>
      'Az energiaeloszlási diagram csak akkor jelenik meg, ha kalóriacélt és legalább egy makrotápanyagra vonatkozó célértéket állított be.';

  @override
  String get percentOfTotalEnergy => 'A teljes energia százalékában';

  @override
  String get selectedMacronutrient => 'Kiválasztott makrotápanyag';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalória, fehérje, szénhidrát, zsír';

  @override
  String get display => 'Megjelenítés';

  @override
  String get displayHint =>
      'A felhasználói felület testreszabása az Ön igényeihez';

  @override
  String get groupFoodsToMeals => 'Csoportosítsa az ételeket az ételekhez';

  @override
  String get groupFoodsToMealsHint =>
      'Automatikusan csoportosítja a nagyon rövid időközönként elfogyasztott ételeket étkezésként';

  @override
  String get preferServingSizes => 'Adagolási méretek előnyben részesítése';

  @override
  String get preferServingSizesHint =>
      'Új élelmiszer nyomon követésekor az adagméret előre kiválasztásra kerül, ha van ilyen';

  @override
  String mealAt(String time) {
    return 'Étkezés a $time';
  }

  @override
  String get databaseManagement => 'Adatbázis-kezelés';

  @override
  String get databaseManagementHint =>
      'Válassza ki a lekérdezendő élelmiszer-adatbázisokat';

  @override
  String get storedOnDevice => 'A készüléken tárolva';

  @override
  String get swissFoodCompositionDatabase =>
      'Svájci élelmiszer-összetételi adatbázis';

  @override
  String get version => 'Verzió';

  @override
  String get language => 'Nyelv';

  @override
  String get languages => 'Nyelvek';

  @override
  String get german => 'Német';

  @override
  String get italian => 'Olasz';

  @override
  String get french => 'Francia';

  @override
  String get publisher => 'Kiadó';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Szövetségi Élelmiszerbiztonsági és állatorvosi Hivatal';

  @override
  String get switzerland => 'Svájc';

  @override
  String get generalInformation => 'Általános információk';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Ez az adatbázis körülbelül 1.100 általános terméket és számos mikrotápanyagot kínál. Mivel az Ön készülékén tárolódik, ezért offline is működik.';

  @override
  String get source => 'Forrás';

  @override
  String get tapHereForFurtherInformation =>
      'További információkért koppintson ide.';

  @override
  String get serverBased => 'Szerver alapú';

  @override
  String get openFoodFactsVariousLanguagesText => 'Különböző';

  @override
  String get nonProfitInstitution => 'Nonprofit intézmény';

  @override
  String get france => 'Franciaország';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Kérjük, vegye figyelembe, hogy mivel ez az adatbázis nagyon nagy, a bejegyzések hiányosak vagy elavultak lehetnek. Minden regisztrált felhasználó frissítheti a tápanyagértékeket. Új termékek hozzáadása fiók létrehozása nélkül is lehetséges. Az adatbázis deaktiválása az EAN beolvasást is magában foglalja, így az egyéni élelmiszerek beolvasása csak ekkor lesz lehetséges az EAN kód alapján.';

  @override
  String get termsOfUse => 'Használati feltételek';

  @override
  String get openFoodFactsTermsText =>
      'Az adatbázis aktiválásával Ön elfogadja a feltételeket.';

  @override
  String get contribute => 'Hozzájárulás';

  @override
  String get databaseContributeText =>
      'Nézze meg, hogyan segíthet az adatbázis javításában.';

  @override
  String get english => 'Angol';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'A FoodData Central az Egyesült Államok mezőgazdasági minisztériumának élelmiszer- és tápanyag-adatbázisa. Az adatok nyilvánosak, és mintegy 200 alapélelmiszert és több mint 380 000 márkás élelmiszert tartalmaznak.';

  @override
  String get backupAndRestore => 'Biztonsági mentés és visszaállítás';

  @override
  String get backupAndRestoreHint =>
      'Tárolja adatait helyben vagy egy WebDAV-kompatibilis felhőalapú tárhelyen, például a Nextcloudon';

  @override
  String get missingBackupPartsHint =>
      'Figyelmeztetés: A beállítások, személyre szabások és célpontok még nem szerepelnek!';

  @override
  String get successfullyCreatedBackup =>
      'Sikeresen létrehozott biztonsági mentés';

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

    return 'Exportált $customFoodsCountString egyéni élelmiszerek és $trackedFoodsCountString nyomon követett élelmiszerek';
  }

  @override
  String get successfullyRestoredBackup =>
      'Sikeresen visszaállított biztonsági mentés';

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

    return 'Importált $customFoodsCountString egyéni élelmiszerek és $trackedFoodsCountString nyomon követett élelmiszerek';
  }

  @override
  String get createWebDAVBackup => 'WebDAV biztonsági másolat készítése';

  @override
  String get webDAVSettings => 'WebDAV beállítások';

  @override
  String get serverURL => 'Szerver URL';

  @override
  String get invalidURL => 'Az URL érvénytelen';

  @override
  String get username => 'Felhasználónév';

  @override
  String get password => 'Jelszó';

  @override
  String get pathAndFilename => 'Elérési út és fájlnév';

  @override
  String energizeBackup(String appName) {
    return '$appName biztonsági mentés';
  }

  @override
  String get backupPasswordNotice =>
      'A biztonsági jelszó nélkül lehetetlen visszaállítani a biztonsági másolatot.';

  @override
  String get restoreWebDAVBackup => 'WebDAV biztonsági mentés visszaállítása';

  @override
  String get createLocalBackup => 'Helyi biztonsági mentés létrehozása';

  @override
  String get restoreLocalBackup => 'Helyi mentés visszaállítása';

  @override
  String get aboutEnergize => 'Mintegy Energize';

  @override
  String get license => 'licenc';

  @override
  String get allLicenses => 'Minden licenc';

  @override
  String get privacyPolicy => 'Adatvédelmi szabályzat';

  @override
  String get logs => 'Naplók';

  @override
  String get reportIssue => 'Jelentési probléma';

  @override
  String get proposeImprovement => 'Javasoljon javítást';

  @override
  String get sourceCode => 'Forráskód';

  @override
  String get translation => 'Fordítás';

  @override
  String get contributors => 'Közreműködők';

  @override
  String get thanksToContributorsText =>
      'Köszönet mindazoknak, akik hozzájárultak a Energize. Az Önök segítségének köszönhetően válhatott az Energize azzá, ami most.';

  @override
  String get contributionTypeCodeAndConversations => 'Kód és beszélgetések';

  @override
  String get contributionTypeAcrylicPicture => 'Akril kép';

  @override
  String get allTranslatorsOnWeblate => 'Minden fordító a Weblate-en';

  @override
  String get contact => 'Kapcsolat';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Kérjük, ezt csak a fentiektől eltérő témákhoz használja';

  @override
  String get supportMeByDonating => 'Támogasson adományozással';

  @override
  String get donate => 'Adományozni';

  @override
  String get donationText =>
      'Ha adománnyal szeretnéd támogatni a fejlesztést, nagyon szívesen látunk! Ennek az alkalmazásnak a létrehozása nagyon szórakoztató, de egyben nagyon időigényes feladat is, és néha egy kis frusztrációhoz vezet :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin cím másolása a vágólapra';

  @override
  String get bankAccountOrCreditCard => 'Bankszámla vagy hitelkártya';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'További adományozási lehetőségekért írjon nekem egy e-mailt';

  @override
  String get energyAndMacronutrients => 'Energia és makrotápanyagok';

  @override
  String get vitamins => 'Vitaminok';

  @override
  String get vitaminA => 'A-Vitamin';

  @override
  String get vitaminB1 => 'B1 (tiamin)';

  @override
  String get vitaminB2 => 'B2 (riboflávin)';

  @override
  String get vitaminB3 => 'B3 (niacin)';

  @override
  String get vitaminB5 => 'B5 (pantoténsav)';

  @override
  String get vitaminB6 => 'B6 vitamin';

  @override
  String get vitaminB7 => 'B7 (biotin)';

  @override
  String get vitaminB9 => 'B9 (folsav)';

  @override
  String get vitaminB12 => 'B12 (kobalamin)';

  @override
  String get vitaminC => 'C-Vitamin';

  @override
  String get vitaminD => 'D-Vitamin';

  @override
  String get vitaminE => 'E-Vitamin';

  @override
  String get vitaminK => 'K-Vitamin';

  @override
  String get minerals => 'Ásványok';

  @override
  String get majorMinerals => 'Főbb ásványi anyagok';

  @override
  String get calcium => 'Kalcium';

  @override
  String get chloride => 'Klorid';

  @override
  String get magnesium => 'Magnézium';

  @override
  String get phosphorous => 'Foszfor';

  @override
  String get potassium => 'Kálium';

  @override
  String get sodium => 'Nátrium';

  @override
  String get traceElements => 'Elemek nyomelemek';

  @override
  String get chromium => 'Króm';

  @override
  String get iron => 'Vas';

  @override
  String get fluorine => 'Fluorium';

  @override
  String get iodine => 'Jód';

  @override
  String get copper => 'Réz';

  @override
  String get manganese => 'Mangán';

  @override
  String get molybdenum => 'Molibdén';

  @override
  String get selenium => 'Szelénium';

  @override
  String get zinc => 'Zink';

  @override
  String get fats => 'Zsírok';

  @override
  String get monounsaturatedFat => 'Egyszeresen telítetlen zsír';

  @override
  String get polyunsaturatedFat => 'Többszörösen telítetlen zsír';

  @override
  String get omega3 => 'Omega-3';

  @override
  String get omega6 => 'Omega-6';

  @override
  String get saturatedFat => 'Telített zsír';

  @override
  String get transfat => 'Transzfát';

  @override
  String get cholesterol => 'Koleszterin';

  @override
  String get fiber => 'Rost';

  @override
  String get sugar => 'Cukor';

  @override
  String get sugarAlcohol => 'Cukoralkohol';

  @override
  String get starch => 'Keményítő';

  @override
  String get other => 'Egyéb';

  @override
  String get water => 'Víz';

  @override
  String get caffeine => 'Koffein';

  @override
  String get alcohol => 'Alkohol';

  @override
  String get salt => 'Só';

  @override
  String get servingSizes => 'Adagolási méretek';

  @override
  String get add => 'Hozzáadás';

  @override
  String get noServingSizesText => 'Nincsenek adagméretek.';

  @override
  String get addServingSize => 'Adagolási méret hozzáadása';

  @override
  String get typicalServingSizes => 'Tipikus adagméretek';

  @override
  String get or => 'vagy';

  @override
  String get servingSizeName => 'Adagolási méret neve';

  @override
  String get size => 'Méret';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': 'Ada.',
      'l10nPackage': 'Cso.',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Palacsinta';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Hasábburgonya';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Sült okra';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Skót Tojás';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Yorkshire Puding';

  @override
  String get testCustomFood5Calories => '259';
}
