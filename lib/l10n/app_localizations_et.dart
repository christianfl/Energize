// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Pea arvet oma toitude ja söömise üle lihtsalt ja kiiresti.';

  @override
  String get appDescription =>
      'Pea arvet oma toitude ja söömise kohta lihtsalt ja kiiresti. Skaneeri oma tooted või otsi käsitsi erinevatest andmebaasidest.';

  @override
  String get ok => 'Sobib';

  @override
  String get fieldMandatory => 'Palun sisesta väärtus';

  @override
  String get onlyNumbersAllowed => 'Lubatud on vaid numbrid';

  @override
  String get undo => 'Pööra tegevus tagasi';

  @override
  String get deleted => 'kustutatud';

  @override
  String get loading => 'Laadime andmeid';

  @override
  String somethingNotFound(String something) {
    return '$something ei leidunud';
  }

  @override
  String get unknownErrorText => 'Tekkis tundmatu viga';

  @override
  String get tracking => 'Arvepidamine';

  @override
  String get energy => 'Energiasisaldus';

  @override
  String get protein => 'Valke';

  @override
  String get carbs => 'Süsivesikuid';

  @override
  String get fat => 'Rasvu';

  @override
  String get detailedSummary => 'Üksikasjalik kokkuvõte';

  @override
  String get dayComplete => 'Märgi päev lõppenuks';

  @override
  String get markedDayAsComplete => 'Päev on märgitud lõppenuks';

  @override
  String get dayIncomplete => 'Märgi päev kestvaks';

  @override
  String get unmarkedDayAsComplete => 'Päev on märgitud veel kestvaks';

  @override
  String get trackFood => 'Jälgi söödud toitu';

  @override
  String get timeSetHelpText =>
      'Söödud toidu üle arvepidamisel kasutatame seda aega tarbimisaja mallina.';

  @override
  String get useAsTemplateForCustomFood => 'Kasuta kohandatud toidu mallina';

  @override
  String get additionalInformation => 'Täiendav teave';

  @override
  String get completeProductName => 'Täielik tootenimetus';

  @override
  String get addedDate => 'Lisatud';

  @override
  String get consumedDate => 'Tarbitud';

  @override
  String get nutrients => 'Toitained';

  @override
  String get labelingEu => 'Märgistus (EL)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit sisaldab';
  }

  @override
  String get dailyTarget => 'päevane eesmärk';

  @override
  String get general => 'Üldine';

  @override
  String get micronutrients => 'Mikrotoitained';

  @override
  String get editTrackedFood => 'Muuda jälgitavat toitu';

  @override
  String get scanBarcode => 'Skaneeri triipkoodi';

  @override
  String get searchFood => 'Otsi toitu';

  @override
  String get productOrBrand => 'Toode või kaubamärk';

  @override
  String get searchError => 'Otsinguviga';

  @override
  String get searchErrorHint =>
      'Päring vähemalt ühte toidu koostise andmebaasi ei toiminud. Palun proovi hiljem uuesti või keela seadetes ajutiselt mittetoimivad andmebaasid.';

  @override
  String get affectedDatabases => 'Mõjutatud andmebaasid';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ei sinu koostatud toitudes ega Open Food Facts andmekogus';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Ei leidunud sinu koostatud toitudes, Open Food Facts vajab luba internetiühenduse kasutamiseks';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Ei leidunud sinu koostatud toitudes, otsingul Open Food Facts teenusest tekkis viga';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Ei leidu kohandatud toidus, Open Food Facts ei ole kasutuses';

  @override
  String get barcodeScanningUnsupported =>
      'Triipkoodide skaneerimine seadme kaameraga on praegu toetatud ainult Androidis.';

  @override
  String get customFood => 'Sinu koostatud toit';

  @override
  String get searchCustomFood => 'Otsi oma koostatud toitu';

  @override
  String get addCustomFood => 'Lisa oma koostatud toit';

  @override
  String get editCustomFood => 'Muuda oma koostatud toitu';

  @override
  String get title => 'Pealkiri';

  @override
  String get barcode => 'Triipkood';

  @override
  String get settings => 'Seadistused';

  @override
  String get yourPersonalNutritionNeeds => 'Sinu isiklikud toitumisvajadused';

  @override
  String get personalNutritionNeedsHint =>
      'Arvuta oma isiklikud toitumisvajadused või määra need ise';

  @override
  String get calculate => 'Arvuta';

  @override
  String get energyDistribution => 'Energia jaotus';

  @override
  String get yourBody => 'Sinu keha';

  @override
  String get age => 'Vanus';

  @override
  String get years => 'aastat';

  @override
  String get sex => 'Sugu';

  @override
  String get female => 'Naine';

  @override
  String get male => 'Mees';

  @override
  String get weight => 'Kaal';

  @override
  String get height => 'Pikkus';

  @override
  String get behaviourAndTarget => 'Käitumine ja eesmärk';

  @override
  String get activityLevel => 'Aktiivsuse tase (PAL)';

  @override
  String get activityLevel1_0 =>
      'Sa ei tee põhimõtteliselt midagi muud kui magad';

  @override
  String get activityLevel1_1 => 'Sa oled terve päeva oma voodis lamanud';

  @override
  String get activityLevel1_2 => 'Sa istud kogu päeva oma voodis';

  @override
  String get activityLevel1_3 => 'Sa ei käi eriti tihti väljas';

  @override
  String get activityLevel1_4 => 'Sa ei ole üldsegi nii aktiivne';

  @override
  String get activityLevel1_5 => 'Töötad kontoris';

  @override
  String get activityLevel1_6 =>
      'Sa oled natuke aktiivne, töötad ja teed mõnikord sporti';

  @override
  String get activityLevel1_7 => 'Sa treenid tihti';

  @override
  String get activityLevel1_8 => 'Sa treenid regulaarselt kõvasti';

  @override
  String get activityLevel1_9 =>
      'Sa oled väga aktiivne, teed trenni ja sul ei ole kontoritööd';

  @override
  String get activityLevel2_0 =>
      'Teed füüsiliselt aktiivset tööd ja treenid regulaarselt kõvasti';

  @override
  String get noActivityLevelDescription => 'Tegevustaseme kirjeldus puudub';

  @override
  String get weightTarget => 'Kaalu eesmärk';

  @override
  String get weightTargetStrongLoss => 'Tugev kaalukaotus';

  @override
  String get weightTargetModerateLoss => 'Mõõdukas kaalukaotus';

  @override
  String get weightTargetSlightLoss => 'Väike kaalukaotus';

  @override
  String get weightTargetMaintaining => 'Kaalu säilitamine';

  @override
  String get weightTargetSlightGain => 'Väike kaalutõus';

  @override
  String get weightTargetModerateGain => 'Mõõdukas kaalutõus';

  @override
  String get weightTargetStrongGain => 'Tugev kaalutõus';

  @override
  String get calculateNutritionTargets => 'Arvuta toitumiseesmärke';

  @override
  String get calculationInfo => 'Teave arvutamise kohta';

  @override
  String get calculationInfoText1 =>
      'Toiteväärtuse arvutamine põhineb Mifflin-St.Jeori valemil. Pea meeles, et see võib toimida ainult ligikaudselt tegelike väärtuste suhtes. Need erinevad inimeselt inimesele, kuna nende kehatingimused võivad rohkem või vähem erineda.';

  @override
  String get formulaForFemales => 'Valem naiste jaoks';

  @override
  String get weightInKg => 'Kaal kg';

  @override
  String get heightInCm => 'Pikkus cm';

  @override
  String get ageInYears => 'Vanus aastates';

  @override
  String get formulaForMales => 'Valem meeste jaoks';

  @override
  String get calculationInfoText2 =>
      'Selle arvutuse tulemus on määratletud kui põhiainevahetuskordaja (BMR). See korrutatakse sinu aktiivsusteguriga, et saada sinu koguvõimsuse muundamise tulemus. See on sinu arvutuslik energiatarbimine kilokalorites.';

  @override
  String get calculatedNutritionTargets => 'Arvutatud toitumisalased eesmärgid';

  @override
  String get calculatedNutritionTargetsHint =>
      'Võid arvutuslikke eesmärke enne nende rakendamist vabalt vastavalt oma vajadustele muuta.';

  @override
  String get percentOfCalories => '% kcal';

  @override
  String get proteinRatio => 'Valkude suhe';

  @override
  String get carbsRatio => 'Süsivesikute suhe';

  @override
  String get fatRatio => 'Rasvade suhe';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Määra ka mikrotoitainete eesmärgid vanuse ja soo alusel';

  @override
  String get apply => 'Rakenda';

  @override
  String get targetsApplied => 'Toitumisalased eesmärgid on kasutusele võetud';

  @override
  String get targetsApplyError =>
      'Toitumisalaseid eesmärke ei saanud kasutusele võtta';

  @override
  String get totalEnergy => 'Kogu energia';

  @override
  String get energyDistributionChartMissingHint =>
      'Energiajaotuse graafik kuvatakse ainult siis, kui oled seadnud kalorite eesmärgi ja eesmärgi vähemalt ühele makrotoitainele.';

  @override
  String get percentOfTotalEnergy => 'Protsent kogu energiast';

  @override
  String get selectedMacronutrient => 'Valitud makrotoitained';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalorid, valgud, süsivesikud, rasvad';

  @override
  String get display => 'Ekraanivaade';

  @override
  String get displayHint => 'Kohanda kasutajaliidest vastavalt oma vajadustele';

  @override
  String get groupFoodsToMeals => 'Rühmita toidud söökideks';

  @override
  String get groupFoodsToMealsHint =>
      'Rühmitab automaatselt väga lühikeste ajavahemike tagant tarbitud toidud üheks söögikorraks';

  @override
  String get preferServingSizes => 'Eelista portsjonite suurusi';

  @override
  String get preferServingSizesHint =>
      'Uute toitude üle arvepidamisel on portsjonite suurused eelvalitud, kui nad olemas on';

  @override
  String mealAt(String time) {
    return 'Toidukord kell $time';
  }

  @override
  String get databaseManagement => 'Andmebaasihaldus';

  @override
  String get databaseManagementHint =>
      'Vali, millistest toiduandmebaasidest teeme päringuid';

  @override
  String get storedOnDevice => 'Salvestatud nutiseadmes';

  @override
  String get swissFoodCompositionDatabase => 'Šveitsi toidukoostise andmekogu';

  @override
  String get version => 'Versioon';

  @override
  String get language => 'Keel';

  @override
  String get languages => 'Keeled';

  @override
  String get german => 'saksa';

  @override
  String get italian => 'itaalia';

  @override
  String get french => 'prantsuse';

  @override
  String get publisher => 'Väljaandja';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Föderaalne toiduohutuse ja Veterinaaramet';

  @override
  String get switzerland => 'Šveits';

  @override
  String get generalInformation => 'Üldteave';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Antud andmebaas sisaldab umbes 1100 tavatoodet ja palju mikrotoitaineid. Kuna ta on salvestatud sinu nutiseadmesse, töötab ta seetõttu ka võrguühenduseta.';

  @override
  String get source => 'Allikas';

  @override
  String get tapHereForFurtherInformation => 'Lisateabe saamiseks klõpsi siin.';

  @override
  String get serverBased => 'Serveri-põhine';

  @override
  String get openFoodFactsVariousLanguagesText => 'Erinevad';

  @override
  String get nonProfitInstitution => 'Mittetulundusasutus';

  @override
  String get france => 'Prantsusmaa';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Pane tähele, et kuna see andmebaas on väga suur, võivad kirjed olla puudulikud või aegunud. Iga registreeritud kasutaja saab toitainete väärtusi uuendada. Uute toodete lisamine on võimalik ilma kontot loomata. Selle andmebaasi deaktiveerimine hõlmab ka EAN-koodi skaneerimist, nii et siis saad skaneerida kohandatud toiduaineid ainult EAN-koodi järgi.';

  @override
  String get termsOfUse => 'Kasutustingimused';

  @override
  String get openFoodFactsTermsText =>
      'Selle andmebaasi kasutuselevõtmisel nõustud tema tingimustega.';

  @override
  String get contribute => 'Tee kaastööd';

  @override
  String get databaseContributeText =>
      'Vaata, kuidas saad aidata seda andmebaasi täiendada.';

  @override
  String get english => 'Inglise';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central on USA põllumajandusministeeriumi toidu ja toitainete andmebaas. Andmed on avalikud ja sisaldavad umbes 200 põhitoiduainet ja üle 380 000 kaubamärgiga toiduainet.';

  @override
  String get backupAndRestore => 'Varundus ja taastamine';

  @override
  String get backupAndRestoreHint =>
      'Säilita oma andmeid nutiseadmes või WebDAVi kasutavas pilvepõhises salvestusruumis nagu Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Hoiatus: Seadistused, isiklikud valikud ja eesmärgid ei ole veel lisatud!';

  @override
  String get successfullyCreatedBackup => 'Varukoopia loomine õnnestus';

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

    return 'Eksportisime $customFoodsCountString omaloodud toitu ja $trackedFoodsCountString jälgitud toitu';
  }

  @override
  String get successfullyRestoredBackup => 'Varukoopia taastasime õnnestus';

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

    return 'Importisime $customFoodsCountString omakoostatud toitu ja $trackedFoodsCountString jälgitud toitu';
  }

  @override
  String get createWebDAVBackup => 'Loo WebDAVi põhine varukoopia';

  @override
  String get webDAVSettings => 'WebDAVi seadistused';

  @override
  String get serverURL => 'Serveri võrguaadress';

  @override
  String get invalidURL => 'Võrguaadress on vigane';

  @override
  String get username => 'Kasutajanimi';

  @override
  String get password => 'Salasõna';

  @override
  String get pathAndFilename => 'Asukoht ja failinimi';

  @override
  String energizeBackup(String appName) {
    return 'Varukoopia: $appName';
  }

  @override
  String get backupPasswordNotice =>
      'Ilma varukoopia loomisel kasutatud salasõnata pole seda võimalik taastada.';

  @override
  String get restoreWebDAVBackup => 'Taasta WebDAVi põhisest varukoopiast';

  @override
  String get createLocalBackup => 'Loo varukoopia nutiseadmesse';

  @override
  String get restoreLocalBackup => 'Taasta nutiseadmesse loodud varukoopiast';

  @override
  String get aboutEnergize => 'Rakenduse teave: Energize';

  @override
  String get license => 'litsents';

  @override
  String get allLicenses => 'Kõik litsentsid';

  @override
  String get privacyPolicy => 'Andmekaitsepõhimõtted';

  @override
  String get logs => 'Logid';

  @override
  String get reportIssue => 'Teata veast';

  @override
  String get proposeImprovement => 'Tee parandusettepanekuid';

  @override
  String get sourceCode => 'Lähtekood';

  @override
  String get translation => 'Tõlge';

  @override
  String get contributors => 'Kaasautorid';

  @override
  String get thanksToContributorsText =>
      'Täname kõiki inimesi, kes andsid oma panuse Energize\'i loomiseks. Tänu teie abile muutus Energize saada selliseks, nagu ta praegu on.';

  @override
  String get contributionTypeCodeAndConversations => 'Lähtekood ja vestlused';

  @override
  String get contributionTypeAcrylicPicture => 'Logo';

  @override
  String get allTranslatorsOnWeblate => 'Kõik tõlkijad Weblate\'is';

  @override
  String get contact => 'Kontakt';

  @override
  String get email => 'E-post';

  @override
  String get emailHint =>
      'Palun kasuta seda ainult muude, kui eespool nimetatud teemade puhul';

  @override
  String get supportMeByDonating => 'Toeta mind rahaliselt';

  @override
  String get donate => 'Rahaline toetus';

  @override
  String get donationText =>
      'Kui soovid toetada arendustööd annetusega, on see väga teretulnud! Selle rakenduse loomine on olnud väga lõbus, kuid ka väga aeganõudev ülesanne ja mõnikord toob kaasa väikese pettumuse :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoini aadress on kopeeritud lõikelauale';

  @override
  String get bankAccountOrCreditCard => 'Pangakonto või krediitkaart';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Oled teretulnud saatma mulle e-kirja muude toetusvõimaluste kohta';

  @override
  String get energyAndMacronutrients => 'Energia ja makrotoitained';

  @override
  String get vitamins => 'Vitamiine';

  @override
  String get vitaminA => 'Vitamiin A';

  @override
  String get vitaminB1 => 'B1 (tiamiin)';

  @override
  String get vitaminB2 => 'B2 (riboflaviin)';

  @override
  String get vitaminB3 => 'B3 (niatsiin)';

  @override
  String get vitaminB5 => 'B5 (pantoteenhape)';

  @override
  String get vitaminB6 => 'Vitamiin B6';

  @override
  String get vitaminB7 => 'B7 (biotiin)';

  @override
  String get vitaminB9 => 'B9 (folaat)';

  @override
  String get vitaminB12 => 'B12 (kobalamiin)';

  @override
  String get vitaminC => 'Vitamiin C';

  @override
  String get vitaminD => 'Vitamiin D';

  @override
  String get vitaminE => 'Vitamiin E';

  @override
  String get vitaminK => 'Vitamiin K';

  @override
  String get minerals => 'Mineraale';

  @override
  String get majorMinerals => 'Peamiseid mineraale';

  @override
  String get calcium => 'Kaltsium';

  @override
  String get chloride => 'Klooriid';

  @override
  String get magnesium => 'Magneesium';

  @override
  String get phosphorous => 'Fosfor';

  @override
  String get potassium => 'Kaalium';

  @override
  String get sodium => 'Naatrium';

  @override
  String get traceElements => 'Mikroelemendid';

  @override
  String get chromium => 'Kroom';

  @override
  String get iron => 'Raud';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Jood';

  @override
  String get copper => 'Vask';

  @override
  String get manganese => 'Mangaan';

  @override
  String get molybdenum => 'Molübdeen';

  @override
  String get selenium => 'Seleen';

  @override
  String get zinc => 'Tsink';

  @override
  String get fats => 'Rasvu';

  @override
  String get monounsaturatedFat => 'Monoküllastumata rasvu';

  @override
  String get polyunsaturatedFat => 'Polüküllastumata rasvu';

  @override
  String get omega3 => 'Oomega 3';

  @override
  String get omega6 => 'Oomega 6';

  @override
  String get saturatedFat => 'Küllastunud rasvu';

  @override
  String get transfat => 'Transrasvu';

  @override
  String get cholesterol => 'Kolesterooli';

  @override
  String get fiber => 'Kiudaineid';

  @override
  String get sugar => 'Suhkurt';

  @override
  String get sugarAlcohol => 'Suhkru alkoholi';

  @override
  String get starch => 'Tärklist';

  @override
  String get other => 'Muud';

  @override
  String get water => 'Vett';

  @override
  String get caffeine => 'Kofeiini';

  @override
  String get alcohol => 'Alkoholi';

  @override
  String get salt => 'Soola';

  @override
  String get servingSizes => 'Portsjonite suurused';

  @override
  String get add => 'Lisa';

  @override
  String get noServingSizesText => 'Portsjonite suurusi ei leidu.';

  @override
  String get addServingSize => 'Lisa portsjoni suurus';

  @override
  String get typicalServingSizes => 'Tüüpilised portsjonite suurused';

  @override
  String get or => 'või';

  @override
  String get servingSizeName => 'Portsjoni suuruse nimi';

  @override
  String get size => 'Suurus';

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
  String get testCustomFood1Name => 'Pannkoogid';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Praetud kartulid';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Praetud sibulad';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Munapuder';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Kapsapirukad';

  @override
  String get testCustomFood5Calories => '259';
}
