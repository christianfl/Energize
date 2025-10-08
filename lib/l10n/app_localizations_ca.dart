// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Fes el seguiment dels teus àpats i nutrició en un dit i fet.';

  @override
  String get appDescription =>
      'Fes el seguiment dels teus àpats i nutrició en un dit i fet. Escaneja els teus productes o cerca\'ls manualment a diferents base de dades.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Introduïu un valor, si us plau';

  @override
  String get onlyNumbersAllowed => 'Només es permeten números';

  @override
  String get undo => 'Undo';

  @override
  String get deleted => 'deleted';

  @override
  String get loading => 'Loading';

  @override
  String somethingNotFound(String something) {
    return '$something not found';
  }

  @override
  String get unknownErrorText => 'An unknown error has occured';

  @override
  String get tracking => 'Seguint';

  @override
  String get energy => 'Energia';

  @override
  String get protein => 'Proteïna';

  @override
  String get carbs => 'Carbohidrats';

  @override
  String get fat => 'Greix';

  @override
  String get detailedSummary => 'Resum detallat';

  @override
  String get dayComplete => 'Dia complet';

  @override
  String get markedDayAsComplete => 'Marcat dia com complet';

  @override
  String get dayIncomplete => 'Dia incomplet';

  @override
  String get unmarkedDayAsComplete => 'Desmarcat dia com complet';

  @override
  String get trackFood => 'Registrar àpats';

  @override
  String get timeSetHelpText =>
      'When tracking food, this time will be used as a template for the time of consume.';

  @override
  String get useAsTemplateForCustomFood =>
      'Utilitzar com a plantilla per al aliments personalitzats';

  @override
  String get additionalInformation => 'Additional information';

  @override
  String get completeProductName => 'Complete product name';

  @override
  String get addedDate => 'Added';

  @override
  String get consumedDate => 'Consumed';

  @override
  String get nutrients => 'Nutrients';

  @override
  String get labelingEu => 'Labeling (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit contain';
  }

  @override
  String get dailyTarget => 'daily target';

  @override
  String get general => 'General';

  @override
  String get micronutrients => 'Micronutrients';

  @override
  String get editTrackedFood => 'Editar àpats registrats';

  @override
  String get scanBarcode => 'Scan barcode';

  @override
  String get searchFood => 'Cercar aliment';

  @override
  String get productOrBrand => 'Product or brand';

  @override
  String get searchError => 'Error during search';

  @override
  String get searchErrorHint =>
      'At least one food composition database could not be reached. Please try again later or temporarily disable non-functional databases in the settings.';

  @override
  String get affectedDatabases => 'Affected databases';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Neither in custom foods nor on Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Not found in custom foods, Open Food Facts needs internet access';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Not found in custom foods, Open Food Facts search had an error';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Not found in custom foods, Open Food Facts is not activated';

  @override
  String get barcodeScanningUnsupported =>
      'Scanning barcodes with the device camera is currently only supported on Android.';

  @override
  String get customFood => 'Aliment personalitzat';

  @override
  String get searchCustomFood => 'Cercar aliment personalitzat';

  @override
  String get addCustomFood => 'Afegir aliment personalitzat';

  @override
  String get editCustomFood => 'Editar aliment personalitzat';

  @override
  String get title => 'Títol';

  @override
  String get barcode => 'Codi de barres';

  @override
  String get settings => 'Paràmetres';

  @override
  String get yourPersonalNutritionNeeds =>
      'Les vostres necessitats personals de nutrició';

  @override
  String get personalNutritionNeedsHint =>
      'Calculeu les vostres necessitats personals de nutrició o configureu-les vosaltres mateixos';

  @override
  String get calculate => 'Calcular';

  @override
  String get energyDistribution => 'Distribució d\'energia';

  @override
  String get yourBody => 'El vostre cos';

  @override
  String get age => 'Edat';

  @override
  String get years => 'anys';

  @override
  String get sex => 'Gènere';

  @override
  String get female => 'Dona';

  @override
  String get male => 'Home';

  @override
  String get weight => 'Pes';

  @override
  String get height => 'Alçada corporal';

  @override
  String get behaviourAndTarget => 'Activitat i objectiu';

  @override
  String get activityLevel => 'Nivell d\'activitat (NAF)';

  @override
  String get activityLevel1_0 => 'No feu res més que dormir';

  @override
  String get activityLevel1_1 => 'Esteu llitat al llit tot el dia';

  @override
  String get activityLevel1_2 => 'Esteu asseguts al llit tot el dia';

  @override
  String get activityLevel1_3 => 'No eixiu fora molt a sovint';

  @override
  String get activityLevel1_4 => 'No sou res actius';

  @override
  String get activityLevel1_5 => 'Feu treball d\'oficina';

  @override
  String get activityLevel1_6 =>
      'Sou un poc actius, treballeu i a vegades feu esport';

  @override
  String get activityLevel1_7 => 'Feu exercici a sovint';

  @override
  String get activityLevel1_8 => 'Feu exercici exigent amb regularitat';

  @override
  String get activityLevel1_9 =>
      'Sou molt actius, feu exercici i no feu treball d\'oficina';

  @override
  String get activityLevel2_0 =>
      'Feu un treball amb activitat física i feu exercici exigent amb regularitat';

  @override
  String get noActivityLevelDescription =>
      'No hi ha descripció del nivell d\'activitat';

  @override
  String get weightTarget => 'Pes objectiu';

  @override
  String get weightTargetStrongLoss => 'Forta pèrdua';

  @override
  String get weightTargetModerateLoss => 'Pèrdua moderada';

  @override
  String get weightTargetSlightLoss => 'Pèrdua lleugera';

  @override
  String get weightTargetMaintaining => 'Manteniment';

  @override
  String get weightTargetSlightGain => 'Guany lleuger';

  @override
  String get weightTargetModerateGain => 'Guany moderat';

  @override
  String get weightTargetStrongGain => 'Fort guany';

  @override
  String get calculateNutritionTargets => 'Calcular objectius de nutrició';

  @override
  String get calculationInfo => 'Informació quant a càlculs';

  @override
  String get calculationInfoText1 =>
      'Els càlculs de presa de calories està basat en la formula Mifflin-St.Jeor. Si us plau, tingueu en compte que açò només és una aproximació dels valors al món real. Aquests canvien, més o menys, depenent de la persona i de les seves condicions físiques.';

  @override
  String get formulaForFemales => 'Formula per a dones';

  @override
  String get weightInKg => 'Pes en kg';

  @override
  String get heightInCm => 'Alçada en cm';

  @override
  String get ageInYears => 'Edat en anys';

  @override
  String get formulaForMales => 'Formula per a homes';

  @override
  String get calculationInfoText2 =>
      'El resultat d\'aquest càlcul està definit per la taxa de metabolisme basal (TMB). S\'obté multiplicant-ho amb el teu factor d\'activat per a rebre el total d\'energia necessària. Aquest càlcul representa la quantitat d\'energia que us cal prendre representat en kcal.';

  @override
  String get calculatedNutritionTargets => 'Objectius de nutrició calculats';

  @override
  String get calculatedNutritionTargetsHint =>
      'Sou lliures de modificar els objectius calculats d\'acord amb les vostres necessitats abans de desar-les.';

  @override
  String get percentOfCalories => '% de kcal';

  @override
  String get proteinRatio => 'Ràtio de Proteïna';

  @override
  String get carbsRatio => 'Ràtio de carbohidrats';

  @override
  String get fatRatio => 'Ràtio de greix';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Establiu també els objectius de micronutrients basats en l\'edat i el gènere';

  @override
  String get alsoSetMicronutrientsHint =>
      'Values depend on age and sex. Data based on DGE reference values from 2022 with a partly update from 2025.';

  @override
  String get apply => 'Aplicar';

  @override
  String get targetsApplied => 'Els objectius de nutrició han estat aplicats';

  @override
  String get targetsApplyError =>
      'No s\'ha pogut aplicar els objectius de nutrició';

  @override
  String get totalEnergy => 'Energia total';

  @override
  String get energyDistributionChartMissingHint =>
      'The energy distribution chart is only shown if you have set a calories target and a target for at least one of the macronutrients.';

  @override
  String get percentOfTotalEnergy => 'Percentatge de l\'energia total';

  @override
  String get selectedMacronutrient => 'Macronutrient seleccionat';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calories, proteïnes, carbohidrats, greix';

  @override
  String get display => 'Display';

  @override
  String get displayHint => 'Customize the user interface to your needs';

  @override
  String get groupFoodsToMeals => 'Group foods to meals';

  @override
  String get groupFoodsToMealsHint =>
      'Automatically groups together foods consumed in very short intervals as a meal';

  @override
  String get preferServingSizes => 'Prefer serving sizes';

  @override
  String get preferServingSizesHint =>
      'When tracking new food, a serving size will be preselected, if any';

  @override
  String mealAt(String time) {
    return 'Meal at $time';
  }

  @override
  String get databaseManagement => 'Gestió de la base de dades';

  @override
  String get databaseManagementHint =>
      'Seleccioneu de quina base de dades consultar els aliments';

  @override
  String get storedOnDevice => 'Desat al dispositiu';

  @override
  String get swissFoodCompositionDatabase =>
      'Base de dades suís de valors nutritius';

  @override
  String get version => 'Version';

  @override
  String get language => 'Llengua';

  @override
  String get languages => 'Languages';

  @override
  String get german => 'Alemany';

  @override
  String get italian => 'Italian';

  @override
  String get french => 'French';

  @override
  String get publisher => 'Editor';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federal Food Safety and Veterinary Office';

  @override
  String get switzerland => 'Suïssa';

  @override
  String get generalInformation => 'Informació general';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Aquesta base de dades ofereix al voltant de 1.100 productes generals i molts micronutrients. Com es desa al vostre dispositiu, també funcionarà sense connexió.';

  @override
  String get source => 'Font';

  @override
  String get tapHereForFurtherInformation => 'Toqueu ací per a més informació.';

  @override
  String get serverBased => 'Basat en servidor';

  @override
  String get openFoodFactsVariousLanguagesText => 'Diverses';

  @override
  String get nonProfitInstitution => 'Institució sense ànim de lucre';

  @override
  String get france => 'França';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Tingueu en compte que malgrat aquesta base de dades és molt gran, el contingut pot ser incomplet o obsolet. Qualssevol usuari registrat pot actualitzar els valors de nutrients. Afegir nous productes és possible sense crear cap compte. Desactivar aquesta base de dades, desactiva al mateix temps l\'escaneig EAN, per tant només podreu escanejar aliments personalitzats pel codi EAN.';

  @override
  String get termsOfUse => 'Condicions d\'ús';

  @override
  String get openFoodFactsTermsText =>
      'Si activeu aquesta base de dades esteu acceptant les condicions.';

  @override
  String get contribute => 'Contribuir';

  @override
  String get databaseContributeText =>
      'Mireu com podeu ajudar a millorar aquesta base de dades.';

  @override
  String get english => 'Anglès';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central és una base de dades d\'aliments i nutrició del departament d\'agricultura dels EUA. La informació que conté es de domini públic amb 200 bases d\'aliments i més de 380.000 marques.';

  @override
  String get backupAndRestore => 'Còpia de seguretat i Restauració';

  @override
  String get backupAndRestoreHint =>
      'Desa les vostres dades a un servidor d\'emmagatzematge compatible amb WebDAV com Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Warning: Settings, personalizations and targets are not yet included!';

  @override
  String get successfullyCreatedBackup => 'Successfully created backup';

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

    return 'Exported $customFoodsCountString custom foods and $trackedFoodsCountString tracked foods';
  }

  @override
  String get successfullyRestoredBackup => 'Successfully restored backup';

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

    return 'Imported $customFoodsCountString custom foods and $trackedFoodsCountString tracked foods';
  }

  @override
  String get createWebDAVBackup => 'Create WebDAV backup';

  @override
  String get webDAVSettings => 'WebDAV settings';

  @override
  String get serverURL => 'Server URL';

  @override
  String get invalidURL => 'The URL is invalid';

  @override
  String get username => 'Username';

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
  String get restoreWebDAVBackup => 'Restore WebDAV backup';

  @override
  String get createLocalBackup => 'Create local backup';

  @override
  String get restoreLocalBackup => 'Restore local backup';

  @override
  String get aboutEnergize => 'Quant a Energize';

  @override
  String get license => 'llicència';

  @override
  String get allLicenses => 'Totes les llicencies';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Comuniqueu un problema';

  @override
  String get proposeImprovement => 'Propose improvement';

  @override
  String get sourceCode => 'Codi font';

  @override
  String get translation => 'Traducció';

  @override
  String get contributors => 'Contributors';

  @override
  String get thanksToContributorsText =>
      'Thanks to all people who contributed to Energize. Due to your help, Energize could become what it is now.';

  @override
  String get contributionTypeCodeAndConversations => 'Code and conversations';

  @override
  String get contributionTypeAcrylicPicture => 'Acrylic picture';

  @override
  String get allTranslatorsOnWeblate => 'All translators on Weblate';

  @override
  String get contact => 'Contacte';

  @override
  String get email => 'Correu';

  @override
  String get emailHint =>
      'Si us plau, només utilitzeu-ho per a missatges personals. Per a comunicar problemes, suggeriments de millora o obtindre més ajuda, feu ús dels enllaços a sota.';

  @override
  String get supportMeByDonating => 'Ajudeu-me amb una donació';

  @override
  String get donate => 'Fer una donació';

  @override
  String get donationText =>
      'Si voleu ajudar al desenvolupament amb una donació, sou benvinguts! Crear aquesta aplicació és molt amè però també consumeix molt de temps i de vegades amb un poc de frustració :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'L\'adreça Bitcoin s\'ha desat al porta-retalls';

  @override
  String get bankAccountOrCreditCard => 'Compte bancari o targeta de crèdit';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Si ho voleu, podeu enviar un correu per a aconseguir altres opcions de donació';

  @override
  String get energyAndMacronutrients => 'Energia i macronutrients';

  @override
  String get vitamins => 'Vitamines';

  @override
  String get vitaminA => 'Vitamina A';

  @override
  String get vitaminB1 => 'B1 (Tiamina)';

  @override
  String get vitaminB2 => 'B2 (Riboflavina)';

  @override
  String get vitaminB3 => 'B3 (Niacina)';

  @override
  String get vitaminB5 => 'B5 (Ácido pantoténico)';

  @override
  String get vitaminB6 => 'Vitamina B6';

  @override
  String get vitaminB7 => 'B7 (Biotina)';

  @override
  String get vitaminB9 => 'B9 (Ácido fólico)';

  @override
  String get vitaminB12 => 'B12 (Cobalamina)';

  @override
  String get vitaminC => 'Vitamina C';

  @override
  String get vitaminD => 'Vitamina D';

  @override
  String get vitaminE => 'Vitamina E';

  @override
  String get vitaminK => 'Vitamina K';

  @override
  String get minerals => 'Minerals';

  @override
  String get majorMinerals => 'Minerals principals';

  @override
  String get calcium => 'Calci';

  @override
  String get chloride => 'Clorur';

  @override
  String get magnesium => 'Magnesi';

  @override
  String get phosphorous => 'Fosfor';

  @override
  String get potassium => 'Potassi';

  @override
  String get sodium => 'Sodi';

  @override
  String get traceElements => 'Oligoelements';

  @override
  String get chromium => 'Crom';

  @override
  String get iron => 'Ferro';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Iode';

  @override
  String get copper => 'Cobre';

  @override
  String get manganese => 'Magnesi';

  @override
  String get molybdenum => 'Molibdè';

  @override
  String get selenium => 'Seleni';

  @override
  String get zinc => 'Zinc';

  @override
  String get fats => 'Àcids grassos';

  @override
  String get monounsaturatedFat => 'Àcid gras monoinsaturat';

  @override
  String get polyunsaturatedFat => 'Àcid gras poliinsaturat';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Àcid gras saturat';

  @override
  String get transfat => 'Àcid gras trans';

  @override
  String get cholesterol => 'Colesterol';

  @override
  String get fiber => 'Fibra';

  @override
  String get sugar => 'Sucre';

  @override
  String get sugarAlcohol => 'Sucre alcohòlic';

  @override
  String get starch => 'Midó';

  @override
  String get other => 'Altres';

  @override
  String get water => 'Aigua';

  @override
  String get caffeine => 'Cafeïna';

  @override
  String get alcohol => 'Alcohol';

  @override
  String get salt => 'Salt';

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
