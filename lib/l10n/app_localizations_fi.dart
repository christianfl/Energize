// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Seuraa ruokaa ja ravitsemusta helposti ja nopeasti.';

  @override
  String get appDescription =>
      'Seuraa ruokaa ja ravitsemusta helposti ja nopeasti. Skannaa tuotteesi tai etsi manuaalisesti eri tietokannoista.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Anna arvo';

  @override
  String get onlyNumbersAllowed => 'Vain numerot ovat sallittuja';

  @override
  String get undo => 'Kumota';

  @override
  String get deleted => 'poistaa';

  @override
  String get loading => 'Lastaus';

  @override
  String somethingNotFound(String something) {
    return '$something ei löytynyt';
  }

  @override
  String get unknownErrorText => 'On tapahtunut Tuntematon virhe';

  @override
  String get tracking => 'Seuranta';

  @override
  String get energy => 'Energia';

  @override
  String get protein => 'Proteiini';

  @override
  String get carbs => 'Hiilarit';

  @override
  String get fat => 'Rasva';

  @override
  String get detailedSummary => 'Yksityiskohtainen yhteenveto';

  @override
  String get dayComplete => 'Päivä valmis';

  @override
  String get markedDayAsComplete => 'Merkitty päivä täydelliseksi';

  @override
  String get dayIncomplete => 'Päivä kesken';

  @override
  String get unmarkedDayAsComplete => 'Merkitsemätön päivä täydellisenä';

  @override
  String get trackFood => 'Seuraa ruokaa';

  @override
  String get timeSetHelpText =>
      'Ruokaa seurattaessa tätä aikaa käytetään mallina kuluttajan ajalle.';

  @override
  String get useAsTemplateForCustomFood => 'Käytä muokatun ruoan mallina';

  @override
  String get additionalInformation => 'Lisätiedot';

  @override
  String get completeProductName => 'Täydellinen Tuotteen nimi';

  @override
  String get addedDate => 'Lisätä';

  @override
  String get consumedDate => 'Kuluteta';

  @override
  String get nutrients => 'Ravintoaine';

  @override
  String get labelingEu => 'Merkinnät (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit sisältää';
  }

  @override
  String get dailyTarget => 'päivittäinen tavoite';

  @override
  String get general => 'Yleinen';

  @override
  String get micronutrients => 'Hivenaineet';

  @override
  String get editTrackedFood => 'Muokkaa seurattua ruokaa';

  @override
  String get scanBarcode => 'Skannaa viivakoodi';

  @override
  String get searchFood => 'Etsi ruokaa';

  @override
  String get productOrBrand => 'Tuote tai tuotemerkki';

  @override
  String get searchError => 'Virhe haun aikana';

  @override
  String get searchErrorHint =>
      'Ainakin yhteen elintarvikkeiden koostumustietokantaan ei päästy. Yritä myöhemmin uudelleen tai Poista tilapäisesti käytöstä ei-toiminnalliset tietokannat asetuksista.';

  @override
  String get affectedDatabases => 'Vaikuttavat tietokannat';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ei mukautetuissa elintarvikkeissa eikä Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Ei löydy mukautetuista elintarvikkeista, Open Food Facts tarvitsee internet-yhteyden';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Ei löydy räätälöidyistä elintarvikkeista, Open Food Facts -haun yhteydessä tapahtui virhe';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Ei löydy räätälöidyistä elintarvikkeista, Open Food Facts ei ole aktivoitu';

  @override
  String get barcodeScanningUnsupported =>
      'Viivakoodien skannaus laitteen kameralla on tällä hetkellä tuettu vain Androidissa.';

  @override
  String get customFood => 'Mukautettu Ruoka';

  @override
  String get searchCustomFood => 'Etsi mukautettua ruokaa';

  @override
  String get addCustomFood => 'Lisää mukautettu ruoka';

  @override
  String get editCustomFood => 'Muokkaa mukautettua ruokaa';

  @override
  String get title => 'Otsikko';

  @override
  String get barcode => 'Viivakoodi';

  @override
  String get settings => 'Asetus';

  @override
  String get yourPersonalNutritionNeeds =>
      'Henkilökohtaiset ravitsemustarpeesi';

  @override
  String get personalNutritionNeedsHint =>
      'Laske henkilökohtaiset ravitsemustarpeesi tai aseta ne itse';

  @override
  String get calculate => 'Laske';

  @override
  String get energyDistribution => 'Energian jakelu';

  @override
  String get yourBody => 'Kehosi';

  @override
  String get age => 'Vuotiaana';

  @override
  String get years => 'vuotiaat';

  @override
  String get sex => 'Sukupuoli';

  @override
  String get female => 'Nainen';

  @override
  String get male => 'Mies';

  @override
  String get weight => 'Paino';

  @override
  String get height => 'Kehon korkeus';

  @override
  String get behaviourAndTarget => 'Käyttäytyminen ja tavoite';

  @override
  String get activityLevel => 'Aktiivisuustaso (PAL)';

  @override
  String get activityLevel1_0 => 'Et tee periaatteessa mitään kuin nukkua';

  @override
  String get activityLevel1_1 => 'Makaat sängyssäsi koko päivän';

  @override
  String get activityLevel1_2 => 'Istut sängyssäsi koko päivän';

  @override
  String get activityLevel1_3 => 'Et käy ulkona kovin usein';

  @override
  String get activityLevel1_4 => 'Et ole ollenkaan niin aktiivinen';

  @override
  String get activityLevel1_5 => 'Teet toimistotyötä';

  @override
  String get activityLevel1_6 =>
      'Olet hieman aktiivinen, työskentelet ja joskus urheilet';

  @override
  String get activityLevel1_7 => 'Treenaat usein';

  @override
  String get activityLevel1_8 => 'Treenaat kovaa säännöllisesti';

  @override
  String get activityLevel1_9 =>
      'Olet erittäin aktiivinen, harjoittelet eikä sinulla ole toimistotyötä';

  @override
  String get activityLevel2_0 =>
      'Teet fyysisesti aktiivista työtä ja harjoittelet kovaa säännöllisesti';

  @override
  String get noActivityLevelDescription => 'Ei toimintatason kuvausta';

  @override
  String get weightTarget => 'Painotavoite';

  @override
  String get weightTargetStrongLoss => 'Vahva tappio';

  @override
  String get weightTargetModerateLoss => 'Kohtalainen tappio';

  @override
  String get weightTargetSlightLoss => 'Lievä tappio';

  @override
  String get weightTargetMaintaining => 'Ylläpitää';

  @override
  String get weightTargetSlightGain => 'Pieni voitto';

  @override
  String get weightTargetModerateGain => 'Kohtuullinen voitto';

  @override
  String get weightTargetStrongGain => 'Vahva voitto';

  @override
  String get calculateNutritionTargets => 'Laske ravitsemustavoitteet';

  @override
  String get calculationInfo => 'Tietoa laskennasta';

  @override
  String get calculationInfoText1 =>
      'Kalorien saannin laskeminen perustuu Mifflin-St.Jeorin kaavaan. Huomaa, että se voi toimia vain likiarvona todellisille arvoille. Ne vaihtelevat henkilöstä toiseen, koska heidän kehonsa olosuhteet voivat poiketa toisistaan enemmän tai vähemmän.';

  @override
  String get formulaForFemales => 'Naisten kaava';

  @override
  String get weightInKg => 'Paino kg';

  @override
  String get heightInCm => 'Korkeus cm';

  @override
  String get ageInYears => 'Ikä vuosina';

  @override
  String get formulaForMales => 'Kaava miehille';

  @override
  String get calculationInfoText2 =>
      'Tämän laskennan tuloksena saadaan perusaineenvaihdunta (BMR). Se kerrotaan aktiivisuuskertoimella, jotta saadaan kokonaistehon muuntaminen. Tämä on laskennallinen energiansaantisi kcal:ina.';

  @override
  String get calculatedNutritionTargets => 'Lasketut ravitsemustavoitteet';

  @override
  String get calculatedNutritionTargetsHint =>
      'Voit vapaasti muokata laskettuja tavoitteita omien tarpeidesi mukaan ennen niiden soveltamista.';

  @override
  String get percentOfCalories => '% kcal';

  @override
  String get proteinRatio => 'Proteiinien suhde';

  @override
  String get carbsRatio => 'Hiilihydraattien suhde';

  @override
  String get fatRatio => 'Rasvan osuus';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Asetetaan myös ikään ja sukupuoleen perustuvia mikroravintoaineita koskevia tavoitteita';

  @override
  String get apply => 'Hae';

  @override
  String get targetsApplied => 'Ravitsemustavoitteita sovellettiin';

  @override
  String get targetsApplyError => 'Ravitsemustavoitteita ei voitu soveltaa';

  @override
  String get totalEnergy => 'Energian kokonaismäärä';

  @override
  String get energyDistributionChartMissingHint =>
      'Energianjakokaavio näytetään vain, jos olet asettanut kaloritavoitteen ja tavoitteen vähintään yhdelle makroravintoaineelle.';

  @override
  String get percentOfTotalEnergy => 'Prosenttia kokonaisenergiasta';

  @override
  String get selectedMacronutrient => 'Valittu makroravintoaine';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalorit, proteiini, hiilihydraatit, rasva';

  @override
  String get display => 'Näyttö';

  @override
  String get displayHint => 'Mukauta käyttöliittymä tarpeittesi mukaan';

  @override
  String get groupFoodsToMeals => 'Ryhmittele elintarvikkeet aterioihin';

  @override
  String get groupFoodsToMealsHint =>
      'Ryhmittää automaattisesti hyvin lyhyin väliajoin nautitut elintarvikkeet ateriaksi';

  @override
  String get preferServingSizes => 'Suositeltavat annoskoot';

  @override
  String get preferServingSizesHint =>
      'Kun jäljität uutta ruokaa, annoskoko valitaan valmiiksi, jos sellainen on olemassa';

  @override
  String mealAt(String time) {
    return 'Ateria $time';
  }

  @override
  String get databaseManagement => 'Tietokannan hallinta';

  @override
  String get databaseManagementHint =>
      'Valitse kysyttävät elintarviketietokannat';

  @override
  String get storedOnDevice => 'Tallennettu laitteeseen';

  @override
  String get swissFoodCompositionDatabase =>
      'Sveitsin elintarvikkeiden koostumustietokanta';

  @override
  String get version => 'Versio';

  @override
  String get language => 'Kieli';

  @override
  String get languages => 'Kielet';

  @override
  String get german => 'Saksan';

  @override
  String get italian => 'Italian';

  @override
  String get french => 'Ranskan';

  @override
  String get publisher => 'Julkaisija';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Liittovaltion elintarviketurvallisuus- ja eläinlääkintätoimisto';

  @override
  String get switzerland => 'Sveitsi';

  @override
  String get generalInformation => 'Yleisiä tietoja';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Tämä tietokanta tarjoaa noin 1 100 yleistä tuotetta ja monia hivenaineita. Koska se on tallennettu laitteeseesi, se toimii offline-tilassa.';

  @override
  String get source => 'Lähde';

  @override
  String get tapHereForFurtherInformation =>
      'Napauta tästä saadaksesi lisätietoja.';

  @override
  String get serverBased => 'Palvelimiin perustuva';

  @override
  String get openFoodFactsVariousLanguagesText => 'Erilaiset';

  @override
  String get nonProfitInstitution => 'Voittoa tavoittelematon laitos';

  @override
  String get france => 'Ranska';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Huomaa, että koska tämä tietokanta on hyvin laaja, tiedot voivat olla puutteellisia tai vanhentuneita. Jokainen rekisteröitynyt käyttäjä voi päivittää ravinnearvoja. Uusien tuotteiden lisääminen on mahdollista ilman tilin luomista. Tämän tietokannan poistaminen käytöstä sisältää myös EAN-skannauksen, joten voit skannata mukautettuja elintarvikkeita vain EAN-koodin perusteella.';

  @override
  String get termsOfUse => 'Käytön ehdot';

  @override
  String get openFoodFactsTermsText =>
      'Aktivoimalla tämän tietokannan hyväksyt ehdot.';

  @override
  String get contribute => 'Osallistu';

  @override
  String get databaseContributeText =>
      'Katso, miten voit auttaa parantamaan tätä tietokantaa.';

  @override
  String get english => 'Englanti';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central on Yhdysvaltain maatalousministeriön elintarvike- ja ravintotietokanta. Tiedot ovat julkisia, ja ne sisältävät noin 200 peruselintarviketta ja yli 380 000 merkkituotetta.';

  @override
  String get backupAndRestore => 'Varmuuskopiointi ja palautus';

  @override
  String get backupAndRestoreHint =>
      'Tallenna tiedot paikallisesti tai WebDAV-yhteensopivaan pilvitallennukseen, kuten Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Varoitus: Asetukset, personoinnit ja kohteet eivät ole vielä mukana!';

  @override
  String get successfullyCreatedBackup => 'Onnistuneesti luotu varmuuskopio';

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

    return 'Viety $customFoodsCountString mukautetut elintarvikkeet ja $trackedFoodsCountString seuratut elintarvikkeet';
  }

  @override
  String get successfullyRestoredBackup =>
      'Onnistuneesti palautettu varmuuskopio';

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

    return 'Maahantuotu $customFoodsCountString räätälöidyt elintarvikkeet ja $trackedFoodsCountString seuratut elintarvikkeet';
  }

  @override
  String get createWebDAVBackup => 'Luo WebDAV-varmuuskopio';

  @override
  String get webDAVSettings => 'WebDAV-asetukset';

  @override
  String get serverURL => 'Palvelimen URL';

  @override
  String get invalidURL => 'URL on virheellinen';

  @override
  String get username => 'Käyttäjänimi';

  @override
  String get password => 'Salasana';

  @override
  String get pathAndFilename => 'Polku ja tiedostonimi';

  @override
  String energizeBackup(String appName) {
    return '$appName Varmuuskopiointi';
  }

  @override
  String get backupPasswordNotice =>
      'Ilman varmuuskopion salasanaa varmuuskopion palauttaminen on mahdotonta.';

  @override
  String get restoreWebDAVBackup => 'Palauta WebDAV-varmuuskopio';

  @override
  String get createLocalBackup => 'Luo paikallinen varmuuskopio';

  @override
  String get restoreLocalBackup => 'Paikallisen varmuuskopion palautus';

  @override
  String get aboutEnergize => 'Tietoja Energize';

  @override
  String get license => 'lisenssi';

  @override
  String get allLicenses => 'Kaikki lisenssit';

  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get logs => 'Lokit';

  @override
  String get reportIssue => 'Raportoi asiasta';

  @override
  String get proposeImprovement => 'Ehdotetaan parannusta';

  @override
  String get sourceCode => 'Lähdekoodi';

  @override
  String get translation => 'Käännös';

  @override
  String get contributors => 'Avustajat';

  @override
  String get thanksToContributorsText =>
      'Kiitos kaikille Energize osallistuneille. Teidän avullanne Energize tuli se, mikä se nyt on.';

  @override
  String get contributionTypeCodeAndConversations => 'Koodi ja keskustelut';

  @override
  String get contributionTypeAcrylicPicture => 'Akryyli kuva';

  @override
  String get allTranslatorsOnWeblate => 'Kaikki kääntäjät Weblate';

  @override
  String get contact => 'Ota yhteyttä';

  @override
  String get email => 'Sähköposti';

  @override
  String get emailHint =>
      'Käytä tätä vain muihin kuin edellä mainittuihin aiheisiin';

  @override
  String get supportMeByDonating => 'Tue minua lahjoittamalla';

  @override
  String get donate => 'Lahjoita';

  @override
  String get donationText =>
      'Jos haluat tukea kehitystä lahjoituksella, olet erittäin tervetullut tekemään niin! Tämän sovelluksen luominen on hauskaa, mutta myös hyvin aikaa vievää ja joskus johtaa pieneen turhautumiseen :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin-osoite kopioitu leikepöydälle';

  @override
  String get bankAccountOrCreditCard => 'Pankkitili tai luottokortti';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Olet tervetullut kirjoittamaan minulle sähköpostia saadaksesi lisää lahjoitusvaihtoehtoja';

  @override
  String get energyAndMacronutrients => 'Energia ja makroravintoaineet';

  @override
  String get vitamins => 'Vitamiinit';

  @override
  String get vitaminA => 'A-vitamiini';

  @override
  String get vitaminB1 => 'B1 (tiamiini)';

  @override
  String get vitaminB2 => 'B2 (Riboflaviini)';

  @override
  String get vitaminB3 => 'B3 (Niasiini)';

  @override
  String get vitaminB5 => 'B5 (Pantoteenihappo)';

  @override
  String get vitaminB6 => 'B6-vitamiinia';

  @override
  String get vitaminB7 => 'B7 (Biotiini)';

  @override
  String get vitaminB9 => 'B9 (Folaatti)';

  @override
  String get vitaminB12 => 'B12 (Kobalamiini)';

  @override
  String get vitaminC => 'C-Vitamiini';

  @override
  String get vitaminD => 'D-Vitamiini';

  @override
  String get vitaminE => 'E-Vitamiini';

  @override
  String get vitaminK => 'K-Vitamiini';

  @override
  String get minerals => 'Mineraalit';

  @override
  String get majorMinerals => 'Merkittävimmät mineraalit';

  @override
  String get calcium => 'Kalsium';

  @override
  String get chloride => 'Kloridi';

  @override
  String get magnesium => 'Maagnesium';

  @override
  String get phosphorous => 'Fosfori';

  @override
  String get potassium => 'Kalium';

  @override
  String get sodium => 'Natrium';

  @override
  String get traceElements => 'Hivenaineita';

  @override
  String get chromium => 'Kromi';

  @override
  String get iron => 'Rauta';

  @override
  String get fluorine => 'Fluori';

  @override
  String get iodine => 'Jodi';

  @override
  String get copper => 'Kupari';

  @override
  String get manganese => 'Mangaani';

  @override
  String get molybdenum => 'Molybdeeni';

  @override
  String get selenium => 'Seleeni';

  @override
  String get zinc => 'Sinkki';

  @override
  String get fats => 'Rasvat';

  @override
  String get monounsaturatedFat => 'Kertatyydyttymätön rasva';

  @override
  String get polyunsaturatedFat => 'Monityydyttymätön rasva';

  @override
  String get omega3 => 'Omegaa 3';

  @override
  String get omega6 => 'Omegaa 6';

  @override
  String get saturatedFat => 'Tyydyttynyt rasva';

  @override
  String get transfat => 'Transfatti';

  @override
  String get cholesterol => 'Kolesteroli';

  @override
  String get fiber => 'Kuitu';

  @override
  String get sugar => 'Sokeri';

  @override
  String get sugarAlcohol => 'Sokerialkoholi';

  @override
  String get starch => 'Tärkkelys';

  @override
  String get other => 'Muut';

  @override
  String get water => 'Vesi';

  @override
  String get caffeine => 'Kofeiini';

  @override
  String get alcohol => 'Alkoholi';

  @override
  String get salt => 'Suola';

  @override
  String get servingSizes => 'Annoskoot';

  @override
  String get add => 'Lisää';

  @override
  String get noServingSizesText => 'Annoskokoja ei ole esitetty.';

  @override
  String get addServingSize => 'Lisää annoksen koko';

  @override
  String get typicalServingSizes => 'Tyypilliset annoskoot';

  @override
  String get or => 'taikka';

  @override
  String get servingSizeName => 'Annoskoko nimi';

  @override
  String get size => 'Koko';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'Pal.',
        'l10nPackage': 'Pak.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Pannukakkuja';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Hashbrownit';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Paistettu okra';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Skotlantilainen muna';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Yorkshiren vanukas';

  @override
  String get testCustomFood5Calories => '259';
}
