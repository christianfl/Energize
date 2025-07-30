// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Легко и быстро отслеживайте свою пищу и питание.';

  @override
  String get appDescription =>
      'Легко и быстро отслеживайте свою пищу и питание. Сканируйте свои продукты или ищите вручную в различных базах данных.';

  @override
  String get ok => 'ОК';

  @override
  String get fieldMandatory => 'Пожалуйста, введите значение';

  @override
  String get onlyNumbersAllowed => 'Разрешены только цифры';

  @override
  String get undo => 'Отменить';

  @override
  String get deleted => 'удалено';

  @override
  String get loading => 'Загрузка';

  @override
  String somethingNotFound(String something) {
    return '$something не найдено';
  }

  @override
  String get unknownErrorText => 'Произошла неизвестная ошибка';

  @override
  String get tracking => 'Отслеживание';

  @override
  String get energy => 'Энергия';

  @override
  String get protein => 'Белок';

  @override
  String get carbs => 'Углеводы';

  @override
  String get fat => 'Жир';

  @override
  String get detailedSummary => 'Подробное резюме';

  @override
  String get dayComplete => 'День завершён';

  @override
  String get markedDayAsComplete => 'День отмечен как завершённый';

  @override
  String get dayIncomplete => 'День не завершён';

  @override
  String get unmarkedDayAsComplete => 'День, не отмеченный как завершенный';

  @override
  String get trackFood => 'Отслеживать пищу';

  @override
  String get timeSetHelpText =>
      'При отслеживании пищи это время будет использоваться в качестве шаблона для времени потребления.';

  @override
  String get useAsTemplateForCustomFood =>
      'Использовать как шаблон для пользовательского продукта';

  @override
  String get additionalInformation => 'Дополнительная информация';

  @override
  String get completeProductName => 'Полное название продукта';

  @override
  String get addedDate => 'Добавлено';

  @override
  String get consumedDate => 'Потреблено';

  @override
  String get nutrients => 'Питательные вещества';

  @override
  String get labelingEu => 'Маркировка (ЕС)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit содержать';
  }

  @override
  String get dailyTarget => 'ежедневная цель';

  @override
  String get general => 'Общие';

  @override
  String get micronutrients => 'Микронутриенты';

  @override
  String get editTrackedFood => 'Редактировать отслеживаемую пищу';

  @override
  String get scanBarcode => 'Сканировать штрих-код';

  @override
  String get searchFood => 'Поиск пищи';

  @override
  String get productOrBrand => 'Продукт или бренд';

  @override
  String get searchError => 'Ошибка при поиске';

  @override
  String get searchErrorHint =>
      'По крайней мере одна база данных о составе продуктов питания недоступна. Пожалуйста, попробуйте позже или временно отключите неработающие базы данных в настройках.';

  @override
  String get affectedDatabases => 'Затронутые базы данных';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ни в пользовательских продуктах, ни на Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Не найдено в пользовательских продуктах, Open Food Facts требует доступ к интернету';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Не найдено в пользовательских продуктах, при поиске в Open Food Facts произошла ошибка';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Не найдено в пользовательских продуктах, Open Food Facts не активирован';

  @override
  String get barcodeScanningUnsupported =>
      'Сканирование штрих-кодов с помощью камеры устройства в настоящее время поддерживается только на Android.';

  @override
  String get customFood => 'Пользовательские продукты';

  @override
  String get searchCustomFood => 'Поиск среди ваших продуктов';

  @override
  String get addCustomFood => 'Добавить пользовательский продукт';

  @override
  String get editCustomFood => 'Редактировать свою еду';

  @override
  String get title => 'Название';

  @override
  String get barcode => 'Штрих-код';

  @override
  String get settings => 'Настройки';

  @override
  String get yourPersonalNutritionNeeds => 'Ваши личные потребности в питании';

  @override
  String get personalNutritionNeedsHint =>
      'Рассчитайте свои личные потребности в питании или установите их самостоятельно';

  @override
  String get calculate => 'Рассчитать';

  @override
  String get energyDistribution => 'Распределение энергии';

  @override
  String get yourBody => 'Ваше тело';

  @override
  String get age => 'Возраст';

  @override
  String get years => 'лет';

  @override
  String get sex => 'Пол';

  @override
  String get female => 'Женский';

  @override
  String get male => 'Мужской';

  @override
  String get weight => 'Вес';

  @override
  String get height => 'Рост';

  @override
  String get behaviourAndTarget => 'Поведение и цель';

  @override
  String get activityLevel => 'Уровень активности (PAL)';

  @override
  String get activityLevel1_0 =>
      'Вы практически ничего не делаете, кроме того, что спите';

  @override
  String get activityLevel1_1 => 'Вы целыми днями лежите в своей постели';

  @override
  String get activityLevel1_2 => 'Вы целыми днями сидите в своей постели';

  @override
  String get activityLevel1_3 => 'Вы не очень часто бываете на улице';

  @override
  String get activityLevel1_4 => 'Вы совсем не активны';

  @override
  String get activityLevel1_5 => 'Вы работаете в офисе';

  @override
  String get activityLevel1_6 =>
      'Вы немного активны, работаете и иногда занимаетесь спортом';

  @override
  String get activityLevel1_7 => 'Вы часто занимаетесь спортом';

  @override
  String get activityLevel1_8 => 'Вы регулярно усердно тренируетесь';

  @override
  String get activityLevel1_9 =>
      'Вы очень активны, занимаетесь спортом и не работаете в офисе';

  @override
  String get activityLevel2_0 =>
      'Вы занимаетесь физически активной работой и усердно регулярно тренируетесь';

  @override
  String get noActivityLevelDescription => 'Нет описания уровня активности';

  @override
  String get weightTarget => 'Целевой вес';

  @override
  String get weightTargetStrongLoss => 'Значительная потеря веса';

  @override
  String get weightTargetModerateLoss => 'Умеренная потеря веса';

  @override
  String get weightTargetSlightLoss => 'Небольшая потеря веса';

  @override
  String get weightTargetMaintaining => 'Поддержание веса';

  @override
  String get weightTargetSlightGain => 'Небольшое увеличение веса';

  @override
  String get weightTargetModerateGain => 'Умеренный прирост веса';

  @override
  String get weightTargetStrongGain => 'Сильное увеличение веса';

  @override
  String get calculateNutritionTargets =>
      'Рассчитать целевые показатели питания';

  @override
  String get calculationInfo => 'Информация о расчёте';

  @override
  String get calculationInfoText1 =>
      'Расчет потребления калорий основан на формуле Миффлина-Сан-Жеора. Пожалуйста, имейте в виду, что она может служить только приближением к реальным значениям. Которые различаются у разных людей, так как состояние их организма может варьироваться.';

  @override
  String get formulaForFemales => 'Формула для женщин';

  @override
  String get weightInKg => 'Вес в кг';

  @override
  String get heightInCm => 'Рост в см';

  @override
  String get ageInYears => 'Возраст в годах';

  @override
  String get formulaForMales => 'Формула для мужчин';

  @override
  String get calculationInfoText2 =>
      'Результат этого расчёта определяется как основной обмен веществ (BMR - basal metabolic rate). Он умножается на ваш коэффициент активности для получения общего энергетического обмена. Это ваше рассчитанное потребление энергии в ккал.';

  @override
  String get calculatedNutritionTargets => 'Рассчитанные цели по питанию';

  @override
  String get calculatedNutritionTargetsHint =>
      'Не стесняйтесь редактировать рассчитанные цели в соответствии с вашими потребностями перед их применением.';

  @override
  String get percentOfCalories => '% от ккал';

  @override
  String get proteinRatio => 'Соотношение белков';

  @override
  String get carbsRatio => 'Соотношение углеводов';

  @override
  String get fatRatio => 'Соотношение жиров';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Также установлены цели по микроэлементам с учетом возраста и пола';

  @override
  String get apply => 'Применить';

  @override
  String get targetsApplied => 'Применены целевые показатели по питанию';

  @override
  String get targetsApplyError =>
      'Целевые показатели по питанию не могут быть применены';

  @override
  String get totalEnergy => 'Общая энергия';

  @override
  String get energyDistributionChartMissingHint =>
      'Диаграмма распределения энергии отображается только в случае, если вы установили цель по калориям и цель по хотя бы одному из макронутриентов.';

  @override
  String get percentOfTotalEnergy => 'Процент от общей энергии';

  @override
  String get selectedMacronutrient => 'Выбранный макронутриент';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Калории, белки, углеводы, жиры';

  @override
  String get display => 'Дисплей';

  @override
  String get displayHint =>
      'Настройте пользовательский интерфейс в соответствии с вашими потребностями';

  @override
  String get groupFoodsToMeals => 'Группируйте продукты по блюдам';

  @override
  String get groupFoodsToMealsHint =>
      'Автоматически объединяет продукты, потребляемые через очень короткие промежутки времени, в один приём пищи';

  @override
  String get preferServingSizes => 'Предпочтение размеров порций';

  @override
  String get preferServingSizesHint =>
      'При добавлении нового продукта будет автоматически выбран размер порции, если он доступен';

  @override
  String mealAt(String time) {
    return 'Еда в $time';
  }

  @override
  String get databaseManagement => 'Управление базой данных';

  @override
  String get databaseManagementHint =>
      'Выберите, к каким базам данных продуктов питания следует обращаться с запросами';

  @override
  String get storedOnDevice => 'Сохранено на устройстве';

  @override
  String get swissFoodCompositionDatabase =>
      'Швейцарская база данных о составе пищи';

  @override
  String get version => 'Версия';

  @override
  String get language => 'Язык';

  @override
  String get languages => 'Языки';

  @override
  String get german => 'Немецкий';

  @override
  String get italian => 'Итальянский';

  @override
  String get french => 'Французский';

  @override
  String get publisher => 'Издатель';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Федеральное управление по безопасности пищевых продуктов и ветеринарии';

  @override
  String get switzerland => 'Швейцария';

  @override
  String get generalInformation => 'Общая информация';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Эта база данных предлагает около 1.100 общих продуктов и множество микроэлементов. Поскольку она хранится на вашем устройстве, она работает в автономном режиме.';

  @override
  String get source => 'Источник';

  @override
  String get tapHereForFurtherInformation =>
      'Нажмите здесь для получения дополнительной информации.';

  @override
  String get serverBased => 'На основе сервера';

  @override
  String get openFoodFactsVariousLanguagesText => 'Различные';

  @override
  String get nonProfitInstitution => 'Некоммерческая организация';

  @override
  String get france => 'Франция';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Пожалуйста, обратите внимание, что хотя эта база данных очень большая, записи могут быть неполными или устаревшими. Каждый зарегистрированный пользователь может обновлять значения питательных веществ. Добавление новых продуктов возможно без создания аккаунта. Отключение этой базы данных также включает сканирование EAN, поэтому вы сможете сканировать только пользовательские продукты по EAN-коду.';

  @override
  String get termsOfUse => 'Условия использования';

  @override
  String get openFoodFactsTermsText =>
      'Активируя эту базу данных, вы соглашаетесь с условиями.';

  @override
  String get contribute => 'Внести вклад';

  @override
  String get databaseContributeText =>
      'Узнайте, как вы можете помочь улучшить эту базу данных.';

  @override
  String get english => 'Английский';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central - это база данных о продуктах питания и питательных веществах от Министерства сельского хозяйства США. Данные находятся в общественном достоянии и содержат около 200 основных продуктов и более 380 000 фирменных продуктов.';

  @override
  String get backupAndRestore => 'Резервное копирование и восстановление';

  @override
  String get backupAndRestoreHint =>
      'Храните ваши данные локально или в облачном хранилище, совместимом с WebDAV, например, в Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Предупреждение: Настройки, персонализации и цели пока не включены!';

  @override
  String get successfullyCreatedBackup => 'Резервная копия успешно создана';

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

    return 'Экспортировано $customFoodsCountString пользовательских продуктов и $trackedFoodsCountString отслеживаемых продуктов';
  }

  @override
  String get successfullyRestoredBackup =>
      'Резервная копия успешно восстановлена';

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

    return 'Импортировано $customFoodsCountString пользовательских продуктов и $trackedFoodsCountString отслеживаемых продуктов';
  }

  @override
  String get createWebDAVBackup => 'Создать резервную копию WebDAV';

  @override
  String get webDAVSettings => 'Параметры WebDAV';

  @override
  String get serverURL => 'URL сервера';

  @override
  String get invalidURL => 'URL недействителен';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get pathAndFilename => 'Путь и имя файла';

  @override
  String energizeBackup(String appName) {
    return '$appName Резервная копия';
  }

  @override
  String get backupPasswordNotice =>
      'Без пароля резервной копии невозможно восстановить резервную копию.';

  @override
  String get restoreWebDAVBackup => 'Восстановить резервную копию WebDAV';

  @override
  String get createLocalBackup => 'Создать локальную резервную копию';

  @override
  String get restoreLocalBackup => 'Восстановить локальную резервную копию';

  @override
  String get aboutEnergize => 'О программе Energize';

  @override
  String get license => 'лицензия';

  @override
  String get allLicenses => 'Все лицензии';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get logs => 'Логи';

  @override
  String get reportIssue => 'Сообщить о проблеме';

  @override
  String get proposeImprovement => 'Предложить улучшение';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get translation => 'Перевод';

  @override
  String get contributors => 'Участники';

  @override
  String get thanksToContributorsText =>
      'Благодарим всех людей, которые внесли свой вклад в Energize. Благодаря вашей помощи Energize стала такой, какая она есть сейчас.';

  @override
  String get contributionTypeCodeAndConversations => 'Код и разговоры';

  @override
  String get contributionTypeAcrylicPicture => 'Акриловая картина';

  @override
  String get allTranslatorsOnWeblate => 'Все переводчики на Weblate';

  @override
  String get contact => 'Контактные данные';

  @override
  String get email => 'Электронная почта';

  @override
  String get emailHint =>
      'Пожалуйста, используйте это только для других тем, кроме вышеуказанных';

  @override
  String get supportMeByDonating => 'Поддержите меня, сделав пожертвование';

  @override
  String get donate => 'Пожертвовать';

  @override
  String get donationText =>
      'Если вы хотите поддержать разработку пожертвованием, будем очень признательны! Создание этого приложения - очень увлекательное занятие, но также и очень трудоёмкая задача, которая иногда приводит к небольшому разочарованию :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Биткоин-адрес скопирован в буфер обмена';

  @override
  String get bankAccountOrCreditCard => 'Банковский счёт или кредитная карта';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Вы можете написать мне электронное письмо для получения информации о дополнительных вариантах пожертвования';

  @override
  String get energyAndMacronutrients =>
      'Энергетическая ценность и макроэлементы';

  @override
  String get vitamins => 'Витамины';

  @override
  String get vitaminA => 'А (Жирорастворимые ретиноиды)';

  @override
  String get vitaminB1 => 'В1 (Тиамин)';

  @override
  String get vitaminB2 => 'В2 (Рибофлавин)';

  @override
  String get vitaminB3 => 'В3 (Ниацин)';

  @override
  String get vitaminB5 => 'В5 (Пантотеновая кислота)';

  @override
  String get vitaminB6 => 'B6 (Пиридоксин, пиридоксаль, пиридоксамин)';

  @override
  String get vitaminB7 => 'В7 (Биотин)';

  @override
  String get vitaminB9 => 'В9 (Фолиевая кислота)';

  @override
  String get vitaminB12 => 'В12 (Кобаламин)';

  @override
  String get vitaminC => 'Витамин C';

  @override
  String get vitaminD => 'Витамин D';

  @override
  String get vitaminE => 'Витамин E';

  @override
  String get vitaminK => 'Витамин K';

  @override
  String get minerals => 'Минералы';

  @override
  String get majorMinerals => 'Основные минералы';

  @override
  String get calcium => 'Кальций';

  @override
  String get chloride => 'Хлор';

  @override
  String get magnesium => 'Магний';

  @override
  String get phosphorous => 'Фосфор';

  @override
  String get potassium => 'Калий';

  @override
  String get sodium => 'Натрий';

  @override
  String get traceElements => 'Следовые элементы';

  @override
  String get chromium => 'Хром';

  @override
  String get iron => 'Железо';

  @override
  String get fluorine => 'Фтор';

  @override
  String get iodine => 'Йод';

  @override
  String get copper => 'Медь';

  @override
  String get manganese => 'Марганец';

  @override
  String get molybdenum => 'Молибден';

  @override
  String get selenium => 'Селен';

  @override
  String get zinc => 'Цинк';

  @override
  String get fats => 'Жиры';

  @override
  String get monounsaturatedFat => 'Мононенасыщенные жиры';

  @override
  String get polyunsaturatedFat => 'Полиненасыщенные жиры';

  @override
  String get omega3 => 'Омега 3';

  @override
  String get omega6 => 'Омега 6';

  @override
  String get saturatedFat => 'Насыщенные жиры';

  @override
  String get transfat => 'Транс-жиры';

  @override
  String get cholesterol => 'Холестерин';

  @override
  String get fiber => 'Клетчатка';

  @override
  String get sugar => 'Сахар';

  @override
  String get sugarAlcohol => 'Сахарный спирт';

  @override
  String get starch => 'Крахмал';

  @override
  String get other => 'Прочее';

  @override
  String get water => 'Вода';

  @override
  String get caffeine => 'Кофеин';

  @override
  String get alcohol => 'Алкоголь';

  @override
  String get salt => 'Соль';

  @override
  String get servingSizes => 'Размеры порций';

  @override
  String get add => 'Добавить';

  @override
  String get noServingSizesText => 'Размеры порций отсутствуют.';

  @override
  String get addServingSize => 'Ввести размер порции';

  @override
  String get typicalServingSizes => 'Стандартные размеры порций';

  @override
  String get or => 'или';

  @override
  String get servingSizeName => 'Обозначение порции';

  @override
  String get size => 'Количество';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': 'Порц.',
      'l10nPackage': 'Упак.',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Панкейки';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Картофельные драники';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Жареный окра';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Яйцо в кляре';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Йоркширский пудинг';

  @override
  String get testCustomFood5Calories => '259';
}
