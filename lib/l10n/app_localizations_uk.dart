// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Відстежуйте свою їжу та харчування легко та швидко.';

  @override
  String get appDescription =>
      'Відстежуйте свою їжу та харчування легко та швидко. Скануйте свої продукти або шукайте вручну в різних базах даних.';

  @override
  String get ok => 'ГАРАЗД';

  @override
  String get fieldMandatory => 'Будь ласка, введіть значення';

  @override
  String get onlyNumbersAllowed => 'Допускаються тільки цифри';

  @override
  String get undo => 'Відмінити';

  @override
  String get deleted => 'видалено';

  @override
  String get loading => 'Завантаження';

  @override
  String somethingNotFound(String something) {
    return '$something не знайдено';
  }

  @override
  String get unknownErrorText => 'Виникла невідома помилка';

  @override
  String get tracking => 'Відстеження';

  @override
  String get energy => 'Енергетична цінність';

  @override
  String get protein => 'Білки';

  @override
  String get carbs => 'Вуглеводи';

  @override
  String get fat => 'Жир';

  @override
  String get detailedSummary => 'Детальний підсумок';

  @override
  String get dayComplete => 'День завершено';

  @override
  String get markedDayAsComplete => 'Відмічено день як завершений';

  @override
  String get dayIncomplete => 'День незавершений';

  @override
  String get unmarkedDayAsComplete => 'День не позначено як завершений';

  @override
  String get trackFood => 'Відстеження їжі';

  @override
  String get timeSetHelpText =>
      'При відстеженні їжі цей час буде використовуватися як шаблон для часу споживання.';

  @override
  String get useAsTemplateForCustomFood =>
      'Використовувати як шаблон для власної їжі';

  @override
  String get additionalInformation => 'Додаткова інформація';

  @override
  String get completeProductName => 'Повна назва продукту';

  @override
  String get addedDate => 'Додано';

  @override
  String get consumedDate => 'Спожито';

  @override
  String get nutrients => 'Поживні речовини';

  @override
  String get labelingEu => 'Маркування (ЄС)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit містять';
  }

  @override
  String get dailyTarget => 'щоденна мета';

  @override
  String get general => 'Головна';

  @override
  String get micronutrients => 'Мікродобрива';

  @override
  String get editTrackedFood => 'Редагувати відстежуему їжу';

  @override
  String get scanBarcode => 'Сканувати штрих-код';

  @override
  String get searchFood => 'Шукати їжу';

  @override
  String get productOrBrand => 'Продукт або торгова марка';

  @override
  String get searchError => 'Помилка під час пошуку';

  @override
  String get searchErrorHint =>
      'Не вдалося отримати доступ принаймні до однієї бази даних про склад харчових продуктів. Будь ласка, повторіть спробу пізніше або тимчасово вимкніть неробочі бази даних у налаштуваннях.';

  @override
  String get affectedDatabases => 'Постраждалі бази даних';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ні в спеціальних продуктах харчування, ні на Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Не міститься в індивідуальних продуктах харчування, Open Food Facts потребує доступу до Інтернету';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Не знайдено в нестандартних продуктах харчування, у пошуку Open Food Facts виникла помилка';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Не виявлено в нестандартних продуктах харчування, функція Open Food Facts не активована';

  @override
  String get barcodeScanningUnsupported =>
      'Сканування штрих-кодів за допомогою камери пристрою наразі підтримується лише на Android.';

  @override
  String get customFood => 'Власна Їжа';

  @override
  String get searchCustomFood => 'Шукати власну їжу';

  @override
  String get addCustomFood => 'Додати власну їжу';

  @override
  String get editCustomFood => 'Редагувати власну їжу';

  @override
  String get title => 'Назва';

  @override
  String get barcode => 'Штрих-код';

  @override
  String get settings => 'Налаштування';

  @override
  String get yourPersonalNutritionNeeds => 'Ваші особисті потреби в харчуванні';

  @override
  String get personalNutritionNeedsHint =>
      'Розрахуйте свої особисті потреби у харчуванні або встановіть їх самостійно';

  @override
  String get calculate => 'Розрахувати';

  @override
  String get energyDistribution => 'Розподіл енергії';

  @override
  String get yourBody => 'Ваше Тіло';

  @override
  String get age => 'Вік';

  @override
  String get years => 'років';

  @override
  String get sex => 'Стать';

  @override
  String get female => 'Жінка';

  @override
  String get male => 'Чоловік';

  @override
  String get weight => 'Вага';

  @override
  String get height => 'Висота тіла';

  @override
  String get behaviourAndTarget => 'Поведінка та мета';

  @override
  String get activityLevel => 'Рівень Активності (PAL)';

  @override
  String get activityLevel1_0 =>
      'Ви практично нічого не робите, крім того, що спите';

  @override
  String get activityLevel1_1 => 'Ви цілими днями лежите у своєму ліжку';

  @override
  String get activityLevel1_2 => 'Ви цілими днями сидите в своєму ліжку';

  @override
  String get activityLevel1_3 => 'Ви не дуже часто буваєте на вулиці';

  @override
  String get activityLevel1_4 => 'Ви не такі вже й активні';

  @override
  String get activityLevel1_5 => 'Ви виконуєте офісну роботу';

  @override
  String get activityLevel1_6 =>
      'Ви трохи активні, працюєте, іноді займаєтеся спортом';

  @override
  String get activityLevel1_7 => 'Ви часто тренуєтеся';

  @override
  String get activityLevel1_8 => 'Ви регулярно інтенсивно тренуєтеся';

  @override
  String get activityLevel1_9 =>
      'Ви дуже активні, займаєтеся спортом і не маєте офісної роботи';

  @override
  String get activityLevel2_0 =>
      'Ви займаєтеся фізично активною роботою і регулярно тренуєтеся';

  @override
  String get noActivityLevelDescription => 'Опис рівня активності відсутній';

  @override
  String get weightTarget => 'Цільова вага';

  @override
  String get weightTargetStrongLoss => 'Сильні втрати';

  @override
  String get weightTargetModerateLoss => 'Помірні втрати';

  @override
  String get weightTargetSlightLoss => 'Невеликі втрати';

  @override
  String get weightTargetMaintaining => 'Підтримання';

  @override
  String get weightTargetSlightGain => 'Невеликий приріст';

  @override
  String get weightTargetModerateGain => 'Помірний приріст';

  @override
  String get weightTargetStrongGain => 'Сильний приріст';

  @override
  String get calculateNutritionTargets =>
      'Розрахувати цільові показники харчування';

  @override
  String get calculationInfo => 'Інформація про розрахунок';

  @override
  String get calculationInfoText1 =>
      'Розрахунок калорійності базується на формулі Міффліна-Сен-Жора. Будь ласка, майте на увазі, що вона може бути лише наближеним до реальних значень. Які відрізняються від людини до людини, оскільки стан їх організму може відрізнятися в більшій чи меншій мірі.';

  @override
  String get formulaForFemales => 'Формула для жінок';

  @override
  String get weightInKg => 'Вага в кг';

  @override
  String get heightInCm => 'Висота в см';

  @override
  String get ageInYears => 'Вік у роках';

  @override
  String get formulaForMales => 'Формула для чоловіків';

  @override
  String get calculationInfoText2 =>
      'Результат цього розрахунку визначається як основний метаболізм (BMR). Він множиться на ваш коефіцієнт активності, щоб отримати загальне перетворення енергії. Це і є ваше розрахункове споживання енергії в ккал.';

  @override
  String get calculatedNutritionTargets => 'Розраховані цілі по харчуванню';

  @override
  String get calculatedNutritionTargetsHint =>
      'Не соромтеся редагувати розраховані цілі відповідно до ваших потреб перед їх застосуванням.';

  @override
  String get percentOfCalories => '% від ккал';

  @override
  String get proteinRatio => 'Співвідношення білків';

  @override
  String get carbsRatio => 'Співвідношення вуглеводів';

  @override
  String get fatRatio => 'Співвідношення жирів';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Також встановлені цілі по мікроелементам з урахуванням віку та статі';

  @override
  String get apply => 'Застосувати';

  @override
  String get targetsApplied => 'Застосовано цільові показники по харчуванню';

  @override
  String get targetsApplyError =>
      'Цільові показники харчування не можуть бути застосовані';

  @override
  String get totalEnergy => 'Загальна енергетична цінність';

  @override
  String get energyDistributionChartMissingHint =>
      'Таблиця розподілу енергії відображається лише в тому випадку, якщо ви встановили ціль споживання калорій і принаймні одного з макроелементів.';

  @override
  String get percentOfTotalEnergy => 'Відсоток загальної енергетичної цінності';

  @override
  String get selectedMacronutrient => 'Обраний макроелемент';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Калорії, білки, вуглеводи, жири';

  @override
  String get display => 'Дисплей';

  @override
  String get displayHint =>
      'Налаштуйте інтерфейс користувача відповідно до ваших потреб';

  @override
  String get groupFoodsToMeals => 'Групуйте продукти в окремі страви';

  @override
  String get groupFoodsToMealsHint =>
      'Автоматично груповати продукти, що вживаються в їжу через дуже короткі проміжки часу';

  @override
  String get preferServingSizes => 'Бажані розміри порцій';

  @override
  String get preferServingSizesHint =>
      'Під час відстеження нових страв буде попередньо вибрано розмір порції, якщо такий є';

  @override
  String mealAt(String time) {
    return 'Прийом їжі в $time';
  }

  @override
  String get databaseManagement => 'Управління базами даних';

  @override
  String get databaseManagementHint =>
      'Виберіть, до яких продовольчих баз даних робити запит';

  @override
  String get storedOnDevice => 'Зберігається на пристрої';

  @override
  String get swissFoodCompositionDatabase =>
      'Швейцарська База Даних Про Склад Їжі';

  @override
  String get version => 'Версія';

  @override
  String get language => 'Мова';

  @override
  String get languages => 'Мови';

  @override
  String get german => 'Німецька';

  @override
  String get italian => 'Італійська';

  @override
  String get french => 'Французька';

  @override
  String get publisher => 'Видавець';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Федеральне управління з безпеки харчових продуктів та ветеринарії';

  @override
  String get switzerland => 'Швейцарія';

  @override
  String get generalInformation => 'Загальна інформація';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Ця база даних пропонує близько 1.100 загальних продуктів та багато мікроелементів. Оскільки вона зберігається на вашому пристрої, вона працює в автономному режимі.';

  @override
  String get source => 'Джерело';

  @override
  String get tapHereForFurtherInformation =>
      'Натисніть тут для отримання додаткової інформації.';

  @override
  String get serverBased => 'На основі сервера';

  @override
  String get openFoodFactsVariousLanguagesText => 'Різна';

  @override
  String get nonProfitInstitution => 'Неприбуткова організація';

  @override
  String get france => 'Франція';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Будь ласка, зверніть увагу, що, незважаючи на те, що ця база даних дуже велика, записи можуть бути неповними або застарілими. Кожен зареєстрований користувач може оновлювати значення поживних речовин. Додавання нових продуктів можливе без створення облікового запису. Деактивація цієї бази даних також включає сканування EAN, тому ви зможете сканувати продукти за кодом EAN лише після цього.';

  @override
  String get termsOfUse => 'Умови використання';

  @override
  String get openFoodFactsTermsText =>
      'Активуючи цю базу даних, ви погоджуєтеся з умовами.';

  @override
  String get contribute => 'Зробити внесок';

  @override
  String get databaseContributeText =>
      'Дізнайтеся, як ви можете допомогти поліпшити цю базу даних.';

  @override
  String get english => 'Англійська';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central - це база даних про продукти харчування та поживні речовини від Міністерства сільського господарства США. Дані знаходяться у відкритому доступі та містять близько 200 основних продуктів харчування та понад 380.000 брендованих продуктів харчування.';

  @override
  String get backupAndRestore => 'Резервне копіювання та відновлення';

  @override
  String get backupAndRestoreHint =>
      'Зберігайте дані локально або в хмарному сховищі з підтримкою WebDAV, наприклад, у Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Увага! Налаштування, персоналізації та цілі ще не включені!';

  @override
  String get successfullyCreatedBackup => 'Успішно створено резервну копію';

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

    return 'Експортовані $customFoodsCountString спеціальні продукти та $trackedFoodsCountString відстежувані продукти';
  }

  @override
  String get successfullyRestoredBackup => 'Успішно відновлена резервна копія';

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

    return 'Імпортовані $customFoodsCountString спеціальні продукти та $trackedFoodsCountString відстежувані продукти';
  }

  @override
  String get createWebDAVBackup => 'Створення резервної копії WebDAV';

  @override
  String get webDAVSettings => 'Налаштування WebDAV';

  @override
  String get serverURL => 'URL сервера';

  @override
  String get invalidURL => 'URL недійсний';

  @override
  String get username => 'Ім\'я користувача';

  @override
  String get password => 'Пароль';

  @override
  String get pathAndFilename => 'Шлях і назва файлу';

  @override
  String energizeBackup(String appName) {
    return '$appName Резервне копіювання';
  }

  @override
  String get backupPasswordNotice =>
      'Без пароля резервної копії неможливо відновити резервну копію.';

  @override
  String get restoreWebDAVBackup => 'Відновити резервну копію WebDAV';

  @override
  String get createLocalBackup => 'Створіть локальну резервну копію';

  @override
  String get restoreLocalBackup => 'Відновити локальну резервну копію';

  @override
  String get aboutEnergize => 'Про Energize';

  @override
  String get license => 'ліцензія';

  @override
  String get allLicenses => 'Всі ліцензії';

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get logs => 'Журнали';

  @override
  String get reportIssue => 'Надіслати звіт';

  @override
  String get proposeImprovement => 'Пропонуйте покращення';

  @override
  String get sourceCode => 'Вихідний код';

  @override
  String get translation => 'Переклад';

  @override
  String get contributors => 'Укладач';

  @override
  String get thanksToContributorsText =>
      'Дякуємо всім, хто зробив свій внесок у Energize. Завдяки вашій допомозі Energize зміг стати тим, чим він є зараз.';

  @override
  String get contributionTypeCodeAndConversations => 'Код і розмови';

  @override
  String get contributionTypeAcrylicPicture => 'Акрилова картина';

  @override
  String get allTranslatorsOnWeblate => 'Всі перекладачі на Weblate';

  @override
  String get contact => 'Контактні дані';

  @override
  String get email => 'Електронна пошта';

  @override
  String get emailHint =>
      'Будь ласка, використовуйте це посилання лише для інших тем, окрім вищезазначених';

  @override
  String get supportMeByDonating => 'Підтримайте мене, зробивши пожертву';

  @override
  String get donate => 'Пожертвувати';

  @override
  String get donationText =>
      'Якщо ви хочете підтримати розробку пожертвуванням, будь ласка, зробіть це! Створення цього додатку - це дуже веселе, але також дуже трудомістке завдання, яке іноді призводить до невеликого розчарування :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin адреса скопійована в буфер обміну';

  @override
  String get bankAccountOrCreditCard =>
      'Банківський рахунок або кредитна картка';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Ви можете написати мені на електронну пошту для подальших варіантів пожертвування';

  @override
  String get energyAndMacronutrients => 'Енергетична цінність та макроелементи';

  @override
  String get vitamins => 'Вітаміни';

  @override
  String get vitaminA => 'А (Жиророзчінні ретиноїди)';

  @override
  String get vitaminB1 => 'В1 (Тіамін)';

  @override
  String get vitaminB2 => 'В2 (Рибофлавін)';

  @override
  String get vitaminB3 => 'В3 (Ніацин)';

  @override
  String get vitaminB5 => 'В5 (Пантотенова кислота)';

  @override
  String get vitaminB6 => 'В6 (Піридоксин, піридоксаль, піридоксамін)';

  @override
  String get vitaminB7 => 'В7 (Біотин)';

  @override
  String get vitaminB9 => 'В9 (Фолат)';

  @override
  String get vitaminB12 => 'В12 (Кобаламін)';

  @override
  String get vitaminC => 'Вітамін С';

  @override
  String get vitaminD => 'Вітамін D';

  @override
  String get vitaminE => 'Вітамін Е';

  @override
  String get vitaminK => 'Вітамін К';

  @override
  String get minerals => 'Мінерали';

  @override
  String get majorMinerals => 'Основні мінерали';

  @override
  String get calcium => 'Кальцій';

  @override
  String get chloride => 'Хлор';

  @override
  String get magnesium => 'Магній';

  @override
  String get phosphorous => 'Фосфор';

  @override
  String get potassium => 'Калій';

  @override
  String get sodium => 'Натрій';

  @override
  String get traceElements => 'Микроелементи';

  @override
  String get chromium => 'Хром';

  @override
  String get iron => 'Залізо';

  @override
  String get fluorine => 'Фтор';

  @override
  String get iodine => 'Йод';

  @override
  String get copper => 'Мідь';

  @override
  String get manganese => 'Марганець';

  @override
  String get molybdenum => 'Молібден';

  @override
  String get selenium => 'Селен';

  @override
  String get zinc => 'Цинк';

  @override
  String get fats => 'Жири';

  @override
  String get monounsaturatedFat => 'Мононенасичені жири';

  @override
  String get polyunsaturatedFat => 'Поліненасичені жири';

  @override
  String get omega3 => 'Омега 3';

  @override
  String get omega6 => 'Омега 6';

  @override
  String get saturatedFat => 'Насичені жири';

  @override
  String get transfat => 'Трансжири';

  @override
  String get cholesterol => 'Холестерин';

  @override
  String get fiber => 'Волокна';

  @override
  String get sugar => 'Цукор';

  @override
  String get sugarAlcohol => 'Цукровий спирт';

  @override
  String get starch => 'Крохмаль';

  @override
  String get other => 'Інше';

  @override
  String get water => 'Вода';

  @override
  String get caffeine => 'Кофеїн';

  @override
  String get alcohol => 'Алкоголь';

  @override
  String get salt => 'Сіль';

  @override
  String get servingSizes => 'Розміри порцій';

  @override
  String get add => 'Додати';

  @override
  String get noServingSizesText => 'Розміри порцій не вказані.';

  @override
  String get addServingSize => 'Додати розмір порції';

  @override
  String get typicalServingSizes => 'Типові розміри порцій';

  @override
  String get or => 'або';

  @override
  String get servingSizeName => 'Назва розміру порції';

  @override
  String get size => 'Розмір';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'Пор.',
        'l10nPackage': 'Упа.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Млинець';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Картопляні оладки';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Смажена бамія';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Яйце по-шотландськи';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Йоркширський пудинг';

  @override
  String get testCustomFood5Calories => '259';
}
