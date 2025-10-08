// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Proste narzędzie ułatwiające monitorowanie spożytych posiłków i ich wartości odżywczej.';

  @override
  String get appDescription =>
      'Proste narzędzie ułatwiające monitorowanie spożytych posiłków i ich wartości odżywczej. Skanuj kody kreskowe lub wyszukaj produkty w bazach danych.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Wprowadź wartość';

  @override
  String get onlyNumbersAllowed => 'Wprowadź wartość liczbową';

  @override
  String get undo => 'Przywróć';

  @override
  String get deleted => 'został usunięty';

  @override
  String get loading => 'Ładowanie';

  @override
  String somethingNotFound(String something) {
    return 'Nie znaleziono $something';
  }

  @override
  String get unknownErrorText => 'Wystąpił nieznany błąd';

  @override
  String get tracking => 'Bilans';

  @override
  String get energy => 'Wartość energetyczna';

  @override
  String get protein => 'Białko';

  @override
  String get carbs => 'Węglowodany';

  @override
  String get fat => 'Tłuszcz';

  @override
  String get detailedSummary => 'Bilans szczegółowy';

  @override
  String get dayComplete => 'Dzień ukończony';

  @override
  String get markedDayAsComplete => 'Oznaczono dzień jako ukończony';

  @override
  String get dayIncomplete => 'Dzień nieukończony';

  @override
  String get unmarkedDayAsComplete => 'Oznaczono dzień jako nieukończony';

  @override
  String get trackFood => 'Wielkość porcji';

  @override
  String get timeSetHelpText =>
      'Ustaw domyślną godzinę spożywania posiłku przy dodawaniu produktu do bilansu dnia.';

  @override
  String get useAsTemplateForCustomFood =>
      'Użyj jako szablonu dla własnych produktów';

  @override
  String get additionalInformation => 'Szczegóły';

  @override
  String get completeProductName => 'Pełna nazwa produktu';

  @override
  String get addedDate => 'Data dodania';

  @override
  String get consumedDate => 'Data spożycia';

  @override
  String get nutrients => 'Wartość odżywcza';

  @override
  String get labelingEu => 'Etykieta (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return 'Zawartość w $amountWithUnit';
  }

  @override
  String get dailyTarget => 'dzienny cel';

  @override
  String get general => 'Ogólne';

  @override
  String get micronutrients => 'Mikroelementy';

  @override
  String get editTrackedFood => 'Edytuj wielkość porcji';

  @override
  String get scanBarcode => 'Skanuj kod kreskowy';

  @override
  String get searchFood => 'Szukaj produktów';

  @override
  String get productOrBrand => 'Produkt lub marka';

  @override
  String get searchError => 'Wystąpił błąd podczas wyszukiwania';

  @override
  String get searchErrorHint =>
      'Nie udało się połączyć z conajmniej jedną bazą danych. Proszę spróbować ponownie lub tymczasowo wyłączyć niedziałające bazy danych w Ustawieniach.';

  @override
  String get affectedDatabases => 'Niedziałające bazy danych';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Produktu nie ma na liście własnych produktów ani w bazie Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Nie znaleziono na liście własnych produktów. Połącz się z internetem, aby wyszukać w bazie Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Nie znaleziono na liście własnych produktów. Wystąpił błąd przy wyszukiwaniu w bazie Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Nie znaleziono na liście własnych produktów. Baza Open Food Facts nie jest aktywna';

  @override
  String get barcodeScanningUnsupported =>
      'Skanowanie kodów kreskowych za pomocą aparatu urządzenia jest obecnie obsługiwane tylko w systemie Android.';

  @override
  String get customFood => 'Własne produkty';

  @override
  String get searchCustomFood => 'Wyszukaj własne produkty';

  @override
  String get addCustomFood => 'Dodaj własny produkt';

  @override
  String get editCustomFood => 'Edytuj własny produkt';

  @override
  String get title => 'Nazwa';

  @override
  String get barcode => 'Kod kreskowy';

  @override
  String get settings => 'Ustawienia';

  @override
  String get yourPersonalNutritionNeeds => 'Indywidualne potrzeby żywieniowe';

  @override
  String get personalNutritionNeedsHint =>
      'Automatycznie oblicz swoje indywidualne potrzeby żywieniowe lub ustaw je samodzielnie';

  @override
  String get calculate => 'Oblicz';

  @override
  String get energyDistribution => 'Rozłożenie energii';

  @override
  String get yourBody => 'Ciało';

  @override
  String get age => 'Wiek';

  @override
  String get years => 'lat';

  @override
  String get sex => 'Płeć';

  @override
  String get female => 'Kobieta';

  @override
  String get male => 'Mężczyzna';

  @override
  String get weight => 'Waga';

  @override
  String get height => 'Wzrost';

  @override
  String get behaviourAndTarget => 'Aktywność i cel wagowy';

  @override
  String get activityLevel => 'Współczynnik aktywności fizycznej (PAL)';

  @override
  String get activityLevel1_0 => 'Śpię całymi dniami';

  @override
  String get activityLevel1_1 => 'Leżę w łóżku przez cały dzień';

  @override
  String get activityLevel1_2 => 'Siedzę na łóżku przez cały dzień';

  @override
  String get activityLevel1_3 => 'Rzadko wychodzę z domu';

  @override
  String get activityLevel1_4 =>
      'Poświęcam bardzo mało czasu na aktywność fizyczną';

  @override
  String get activityLevel1_5 => 'Pracuję w biurze';

  @override
  String get activityLevel1_6 => 'Pracuję, ale mam czas na aktywność fizyczną';

  @override
  String get activityLevel1_7 =>
      'Poświęcam umiarkowaną ilość czasu na aktywność fizyczną';

  @override
  String get activityLevel1_8 => 'Regularnie trenuję';

  @override
  String get activityLevel1_9 =>
      'Nie pracuję w biurze, prowadzę aktywny tryb życia i regularnie trenuję';

  @override
  String get activityLevel2_0 => 'Pracuję fizycznie i ciężko trenuję';

  @override
  String get noActivityLevelDescription => 'Brak opisu aktywności fizycznej';

  @override
  String get weightTarget => 'Cel wagowy';

  @override
  String get weightTargetStrongLoss => 'Znaczna redukcja';

  @override
  String get weightTargetModerateLoss => 'Średnia redukcja';

  @override
  String get weightTargetSlightLoss => 'Nieznaczna redukcja';

  @override
  String get weightTargetMaintaining => 'Utrzymanie';

  @override
  String get weightTargetSlightGain => 'Nieznaczny przyrost';

  @override
  String get weightTargetModerateGain => 'Średni przyrost';

  @override
  String get weightTargetStrongGain => 'Znaczny przyrost';

  @override
  String get calculateNutritionTargets => 'Oblicz cele żywieniowe';

  @override
  String get calculationInfo => 'Szczegóły kalkulacji';

  @override
  String get calculationInfoText1 =>
      'Użyta formuła jest oparta na równianiu Mifflina-St.Jeora. Miej na uwadze fakt, że podane progi są jedynie uśrednieniem rzeczywistych wartości.';

  @override
  String get formulaForFemales => 'Wzór dla kobiet';

  @override
  String get weightInKg => 'Waga (kg)';

  @override
  String get heightInCm => 'Wzrost (cm)';

  @override
  String get ageInYears => 'Wiek (lata)';

  @override
  String get formulaForMales => 'Wzór dla mężczyzn';

  @override
  String get calculationInfoText2 =>
      'Wynikiem obliczenia jest podstawowa przemiana baterii (PPM), która po pomnożeniu przez współczynnik aktywności daje wartość spożycia energii wyrażaną w kilokaloriach.';

  @override
  String get calculatedNutritionTargets => 'Obliczone cele żywieniowe';

  @override
  String get calculatedNutritionTargetsHint =>
      'Możesz dostosować obliczone cele żywieniowe do swoich potrzeb przed zaakceptowaniem.';

  @override
  String get percentOfCalories => '% kalorii';

  @override
  String get proteinRatio => 'Procent białka';

  @override
  String get carbsRatio => 'Procent węglowodanów';

  @override
  String get fatRatio => 'Procent tłuszczu';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Ustaw cele dotyczące mikroelementów na podstawie wieku i płci';

  @override
  String get alsoSetMicronutrientsHint =>
      'Values depend on age and sex. Data based on DGE reference values from 2022 with a partly update from 2025.';

  @override
  String get apply => 'Zatwierdź';

  @override
  String get targetsApplied => 'Wprowadzono cele żywieniowe';

  @override
  String get targetsApplyError => 'Nie udało się wprowadzić celów żywieniowych';

  @override
  String get totalEnergy => 'Zapotrzebowanie kaloryczne';

  @override
  String get energyDistributionChartMissingHint =>
      'Wykres podziału makroskładników zostanie wyświetlony po określeniu docelowej ilości kalorii oraz conajmniej jednego makroskładnika.';

  @override
  String get percentOfTotalEnergy => 'Procent kalorii';

  @override
  String get selectedMacronutrient => 'Wybrany makroskładnik';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalorie, białko, węglowodany, tłuszcz';

  @override
  String get display => 'Wygląd';

  @override
  String get displayHint => 'Dostosuj interfejs do swoich potrzeb';

  @override
  String get groupFoodsToMeals => 'Pogrupuj produkty w posiłki';

  @override
  String get groupFoodsToMealsHint =>
      'Automatycznie pogrupuj produkty spożyte w krótkich odstępach czasu w posiłki';

  @override
  String get preferServingSizes => 'Preferowane wielkości porcji';

  @override
  String get preferServingSizesHint =>
      'Podczas śledzenia nowej żywności zostanie wstępnie wybrana wielkość porcji, jeśli taka istnieje';

  @override
  String mealAt(String time) {
    return 'Posiłek o $time';
  }

  @override
  String get databaseManagement => 'Zarządzanie bazami danych';

  @override
  String get databaseManagementHint =>
      'Wybierz bazy danych, z których korzysta aplikacja';

  @override
  String get storedOnDevice => 'Dostępne lokalnie';

  @override
  String get swissFoodCompositionDatabase =>
      'Szwajcarska baza danych składu żywności';

  @override
  String get version => 'Wersja';

  @override
  String get language => 'Język';

  @override
  String get languages => 'Języki';

  @override
  String get german => 'Niemiecki';

  @override
  String get italian => 'Włoski';

  @override
  String get french => 'Francuski';

  @override
  String get publisher => 'Wydawca';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federalne Biuro Bezpieczeństwa Żywności i Weterynarii';

  @override
  String get switzerland => 'Szwajcaria';

  @override
  String get generalInformation => 'Informacje ogólne';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Ta baza danych oferuje informacje na temat około 1,100 produktów ogólnych i wielu mikroskładników. Działa w trybie offline, ponieważ jest przechowywana na urządzeniu.';

  @override
  String get source => 'Źródło';

  @override
  String get tapHereForFurtherInformation =>
      'Kliknij tutaj, aby uzyskać więcej informacji.';

  @override
  String get serverBased => 'Dostępne online';

  @override
  String get openFoodFactsVariousLanguagesText => 'Różne';

  @override
  String get nonProfitInstitution => 'Organizacja non-profit';

  @override
  String get france => 'Francja';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Pomimo obszerności tej bazy danych, należy mieć na uwadze, że większość pozycji może być niekompletna bądź nieaktualna. Każdy zarejestrowany użytkownik może uaktualnić wartości odżywcze produktów. Dodawanie nowych produktów jest możliwe bez konieczności zakładania konta. Po wyłączeniu tej opcji skanowanie kodów kreskowych będzie możliwe tylko w przypadku własnych produktów.';

  @override
  String get termsOfUse => 'Warunki użytkowania';

  @override
  String get openFoodFactsTermsText =>
      'Aktywując tę bazę danych zgadzasz się na warunki użytkowania.';

  @override
  String get contribute => 'Wesprzyj';

  @override
  String get databaseContributeText =>
      'Zobacz, jak możesz pomóc w ulepszaniu tej bazy danych.';

  @override
  String get english => 'Angielski';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central jest bazą danych produktów spożywczych i wartości odżywczych sporządzona przez Departament Rolnictwa Stanów Zjednoczonych. Zawiera dane na temat około 200 składników i ponad 380 tysięcy produktów spożywczych. Baza danych jest w domenie publicznej.';

  @override
  String get backupAndRestore => 'Kopia zapasowa';

  @override
  String get backupAndRestoreHint =>
      'Przechowuj dane na urządzeniu lub usłudze przechowywania w chmurze zgodnej z WebDAV, np: Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Uwaga: nie uwzględnia ustawień, treści aplikacji dostosowanych do użytkownika oraz celów!';

  @override
  String get successfullyCreatedBackup => 'Pomyślnie utworzono kopię zapasową';

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

    return 'Pomyślnie wyeksportowano! Własne produkty: $customFoodsCountString. Monitorowane produkty: $trackedFoodsCountString';
  }

  @override
  String get successfullyRestoredBackup =>
      'Pomyślnie przywrócono kopię zapasową';

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

    return 'Pomyślnie zaimportowano! Własne produkty: $customFoodsCountString. Monitorowane produkty: $trackedFoodsCountString';
  }

  @override
  String get createWebDAVBackup => 'Utwórz kopię zapasową WebDAV';

  @override
  String get webDAVSettings => 'WebDAV Ustawienia';

  @override
  String get serverURL => 'Adres URL serwera';

  @override
  String get invalidURL => 'Adres URL jest nieprawidłowy';

  @override
  String get username => 'Nazwa użytkownika';

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
  String get restoreWebDAVBackup => 'Przywróć kopię zapasową WebDAV';

  @override
  String get createLocalBackup => 'Utwórz lokalną kopię zapasową';

  @override
  String get restoreLocalBackup => 'Przywróć lokalną kopię zapasową';

  @override
  String get aboutEnergize => 'O Energize';

  @override
  String get license => 'Licencja';

  @override
  String get allLicenses => 'Wszystkie licencje';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Zgłoś problem';

  @override
  String get proposeImprovement => 'Zaproponuj poprawki';

  @override
  String get sourceCode => 'Kod źródłowy';

  @override
  String get translation => 'Tłumaczenie';

  @override
  String get contributors => 'Kontrybutorzy';

  @override
  String get thanksToContributorsText =>
      'Dziękuję wszystkim osobom, które włożyły swój wkład w tworzenie Energize. To dzięki wam aplikacja stała się tym, czym jest dzisiaj.';

  @override
  String get contributionTypeCodeAndConversations => 'Kod i rozmowy';

  @override
  String get contributionTypeAcrylicPicture => 'Obraz akrylowy';

  @override
  String get allTranslatorsOnWeblate => 'Wszystkim tłumaczom na Weblate';

  @override
  String get contact => 'Kontakt';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Proszę o nie wysyłanie wiadomości dotyczących kwestii wymienionych powyżej';

  @override
  String get supportMeByDonating => 'Wesprzyj autora przekazując darowiznę';

  @override
  String get donate => 'Przekaż darowiznę';

  @override
  String get donationText =>
      'Zachęcamy do wsparcia projektu darowizną! Tworzenie aplikacji jest oczywiście przyjemne, ale również czasochłonne i momentami frustrujące :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Skopiowano adres Bitcoin do schowka';

  @override
  String get bankAccountOrCreditCard =>
      'Płatność przelewem lub kartą kredytową';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Proszę o kontakt drogą mailową w kwestii korzystania z innych metod przekazywania darowizn';

  @override
  String get energyAndMacronutrients => 'Wartość energetyczna i makroskładniki';

  @override
  String get vitamins => 'Witaminy';

  @override
  String get vitaminA => 'Witamina A';

  @override
  String get vitaminB1 => 'B1 (Tiamina)';

  @override
  String get vitaminB2 => 'B2 (Ryboflawina)';

  @override
  String get vitaminB3 => 'B3 (Niacyna)';

  @override
  String get vitaminB5 => 'B5 (Kwas pantotenowy)';

  @override
  String get vitaminB6 => 'Witamina B6';

  @override
  String get vitaminB7 => 'B7 (Biotyna)';

  @override
  String get vitaminB9 => 'B9 (Kwas foliowy)';

  @override
  String get vitaminB12 => 'B12 (Kobalamina)';

  @override
  String get vitaminC => 'Witamina C';

  @override
  String get vitaminD => 'Witamina D';

  @override
  String get vitaminE => 'Witamina E';

  @override
  String get vitaminK => 'Witamina K';

  @override
  String get minerals => 'Składniki mineralne';

  @override
  String get majorMinerals => 'Główne składniki mineralne';

  @override
  String get calcium => 'Wapń';

  @override
  String get chloride => 'Chlor';

  @override
  String get magnesium => 'Magnez';

  @override
  String get phosphorous => 'Fosfor';

  @override
  String get potassium => 'Potas';

  @override
  String get sodium => 'Sód';

  @override
  String get traceElements => 'Pierwiastki śladowe';

  @override
  String get chromium => 'Chrom';

  @override
  String get iron => 'Żelazo';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Jod';

  @override
  String get copper => 'Miedź';

  @override
  String get manganese => 'Mangan';

  @override
  String get molybdenum => 'Molibden';

  @override
  String get selenium => 'Selen';

  @override
  String get zinc => 'Cynk';

  @override
  String get fats => 'Tłuszcze';

  @override
  String get monounsaturatedFat => 'Tłuszcze jednonienasycone';

  @override
  String get polyunsaturatedFat => 'Tłuszcze wielonienasycone';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Tłuszcze nasycone';

  @override
  String get transfat => 'Tłuszcze trans';

  @override
  String get cholesterol => 'Cholesterol';

  @override
  String get fiber => 'Błonnik';

  @override
  String get sugar => 'Cukier';

  @override
  String get sugarAlcohol => 'Alkohole cukrowe';

  @override
  String get starch => 'Skrobia';

  @override
  String get other => 'Inne';

  @override
  String get water => 'Woda';

  @override
  String get caffeine => 'Kofeina';

  @override
  String get alcohol => 'Alkohol';

  @override
  String get salt => 'Sól';

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
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': 'Srv.',
      'l10nPackage': 'Pck.',
      'other': '',
    });
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
