// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Surveiller votre alimentation et votre nutrition facilement et rapidement.';

  @override
  String get appDescription =>
      'Surveiller votre alimentation et votre nutrition facilement et rapidement. Scannez vos produits ou recherchez manuellement dans différentes bases de données.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Veuillez saisir une valeur';

  @override
  String get onlyNumbersAllowed => 'Seuls les chiffres sont autorisés';

  @override
  String get undo => 'Annuler';

  @override
  String get deleted => 'Supprimé';

  @override
  String get loading => 'Chargement';

  @override
  String somethingNotFound(String something) {
    return '$something introuvable';
  }

  @override
  String get unknownErrorText => 'Une erreur inconnue s\'est produite';

  @override
  String get tracking => 'Suivi';

  @override
  String get energy => 'Énergie';

  @override
  String get protein => 'Protéine';

  @override
  String get carbs => 'Glucide';

  @override
  String get fat => 'Graisse';

  @override
  String get detailedSummary => 'Résumé détaillé';

  @override
  String get dayComplete => 'Journée complète';

  @override
  String get markedDayAsComplete => 'Marquer comme journée complète';

  @override
  String get dayIncomplete => 'Journée incomplète';

  @override
  String get unmarkedDayAsComplete => 'Mention de journée complète retirée';

  @override
  String get trackFood => 'Surveiller la nourriture';

  @override
  String get timeSetHelpText =>
      'Lors du suivi des aliments, cette fois sera utilisé comme modèle pour le moment de consommation.';

  @override
  String get useAsTemplateForCustomFood =>
      'Utiliser comme modèle pour des aliments personnalisés';

  @override
  String get additionalInformation => 'Information additionnelle';

  @override
  String get completeProductName => 'Nom de produit complet';

  @override
  String get addedDate => 'Ajouté';

  @override
  String get consumedDate => 'Consommé';

  @override
  String get nutrients => 'Nutriments';

  @override
  String get labelingEu => 'Étiquetage (UE)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit contiennent';
  }

  @override
  String get dailyTarget => 'Cible quotidienne';

  @override
  String get general => 'Général';

  @override
  String get micronutrients => 'Micronutriments';

  @override
  String get editTrackedFood => 'Modifier les aliments suivis';

  @override
  String get scanBarcode => 'Scanner le code-barre';

  @override
  String get searchFood => 'Rechercher des aliments';

  @override
  String get productOrBrand => 'Produit ou marque';

  @override
  String get searchError => 'Erreur lors de la recherche';

  @override
  String get searchErrorHint =>
      'Au moins une base de données de composition alimentaire n\'a pas pu être atteinte. Veuillez réessayer ultérieurement ou désactiver temporairement les bases de données non fonctionnelles dans les paramètres.';

  @override
  String get affectedDatabases => 'Bases de données concernées';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ni dans les aliments personnalisés ni sur Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Non trouvé dans des aliments personnalisés, Open Food Facts a besoin d\'un accès à Internet';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Non trouvé dans les aliments personnalisés, la recherche sur Open Food Facts avait une erreur';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Non trouvé dans les aliments personnalisés, Open Food Facts n\'est pas activé';

  @override
  String get barcodeScanningUnsupported =>
      'La lecture de codes-barres à l\'aide de l\'appareil photo de l\'appareil n\'est actuellement possible que sur Android.';

  @override
  String get customFood => 'Aliment personnalisé';

  @override
  String get searchCustomFood => 'Rechercher un aliment personnalisé';

  @override
  String get addCustomFood => 'Ajouter un aliment personnalisé';

  @override
  String get editCustomFood => 'Modifier un aliment personnalisé';

  @override
  String get title => 'Titre';

  @override
  String get barcode => 'Code-barre';

  @override
  String get settings => 'Paramètres';

  @override
  String get yourPersonalNutritionNeeds =>
      'Vos besoins nutritionnels personnels';

  @override
  String get personalNutritionNeedsHint =>
      'Calculez vos besoins nutritionnels personnels ou définissez-les vous-même';

  @override
  String get calculate => 'Calculer';

  @override
  String get energyDistribution => 'Distribution d\'énergie';

  @override
  String get yourBody => 'Votre corps';

  @override
  String get age => 'Âge';

  @override
  String get years => 'ans';

  @override
  String get sex => 'Genre';

  @override
  String get female => 'Féminin';

  @override
  String get male => 'Masculin';

  @override
  String get weight => 'Masse';

  @override
  String get height => 'Taille';

  @override
  String get behaviourAndTarget => 'Comportement et objectif';

  @override
  String get activityLevel => 'Niveau d\'activité (NAP)';

  @override
  String get activityLevel1_0 => 'Vous ne faites rien d\'autre que dormir';

  @override
  String get activityLevel1_1 => 'Vous êtes dans votre lit toute la journée';

  @override
  String get activityLevel1_2 =>
      'Vous êtes assis·e dans votre lit toute la journée';

  @override
  String get activityLevel1_3 => 'Vous ne sortez pas très souvent';

  @override
  String get activityLevel1_4 => 'Vous n\'avez pas beaucoup d\'activité';

  @override
  String get activityLevel1_5 => 'Vous faites un travail de bureau';

  @override
  String get activityLevel1_6 =>
      'Vous êtes un peu actif•ve, vous travaillez et faites parfois du sport';

  @override
  String get activityLevel1_7 => 'Vous faites souvent de l\'exercice';

  @override
  String get activityLevel1_8 => 'Vous vous entraînez régulièrement';

  @override
  String get activityLevel1_9 =>
      'Vous êtes très actif•ve, faites de l\'exercice et n\'avez pas de travail de bureau';

  @override
  String get activityLevel2_0 =>
      'Vous avez un travail physiquement actif et vous vous entraînez régulièrement';

  @override
  String get noActivityLevelDescription =>
      'Pas de description du niveau d\'activité';

  @override
  String get weightTarget => 'Objectif de masse';

  @override
  String get weightTargetStrongLoss => 'Forte perte';

  @override
  String get weightTargetModerateLoss => 'Perte modérée';

  @override
  String get weightTargetSlightLoss => 'Légère perte';

  @override
  String get weightTargetMaintaining => 'Maintien';

  @override
  String get weightTargetSlightGain => 'Prise de masse légère';

  @override
  String get weightTargetModerateGain => 'Prise de masse modérée';

  @override
  String get weightTargetStrongGain => 'Forte prise de masse';

  @override
  String get calculateNutritionTargets =>
      'Calculer les objectifs nutritionnels';

  @override
  String get calculationInfo => 'Informations sur le calcul';

  @override
  String get calculationInfoText1 =>
      'Le calcul de l\'apport calorique est basé sur la formule Mifflin-St.Jeor. Sachez qu\'elle ne peut servir que d\'approximation aux valeurs réelles. Celles-ci diffèrent d\'une personne à l\'autre, car leurs conditions corporelles peuvent diverger plus ou moins.';

  @override
  String get formulaForFemales => 'Formule pour les femmes';

  @override
  String get weightInKg => 'Masse en kg';

  @override
  String get heightInCm => 'Taille en cm';

  @override
  String get ageInYears => 'Âge en années';

  @override
  String get formulaForMales => 'Formule pour les hommes';

  @override
  String get calculationInfoText2 =>
      'Le résultat de ce calcul est défini comme le métabolisme de base (MB). Il est multiplié par votre facteur d\'activité pour obtenir votre conversion totale d\'énergie. C\'est votre apport énergétique calculé en kcal.';

  @override
  String get calculatedNutritionTargets => 'Objectifs nutritionnels calculés';

  @override
  String get calculatedNutritionTargetsHint =>
      'N\'hésitez pas à modifier les objectifs calculés en fonction de vos besoins avant de les appliquer.';

  @override
  String get percentOfCalories => '% des kcals';

  @override
  String get proteinRatio => 'Taux de protéines';

  @override
  String get carbsRatio => 'Taux de glucides';

  @override
  String get fatRatio => 'Taux de graisses';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Fixer également des objectifs en matière de micronutriments en fonction de l\'âge et du genre';

  @override
  String get apply => 'Appliquer';

  @override
  String get targetsApplied => 'Les objectifs nutritionnels ont été appliqués';

  @override
  String get targetsApplyError =>
      'Les objectifs nutritionnels n\'ont pas pu être appliqués';

  @override
  String get totalEnergy => 'Énergie totale';

  @override
  String get energyDistributionChartMissingHint =>
      'Le graphique de distribution d\'énergie n\'est affiché que si vous avez défini un objectif de calories et un objectif pour au moins un des macronutriments.';

  @override
  String get percentOfTotalEnergy => 'Pourcentage de l\'énergie totale';

  @override
  String get selectedMacronutrient => 'Macronutriments sélectionnés';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calories, protéines, glucides, graisses';

  @override
  String get display => 'Affichage';

  @override
  String get displayHint => 'Adapter l\'interface utilisateur à vos besoins';

  @override
  String get groupFoodsToMeals => 'Regrouper les aliments en repas';

  @override
  String get groupFoodsToMealsHint =>
      'Regroupe automatiquement les aliments consommés à très court terme en tant que repas';

  @override
  String get preferServingSizes => 'Privilégier les tailles de portion';

  @override
  String get preferServingSizesHint =>
      'Quand vous suivez un nouvel aliment, une taille de portion sera présélectionnée si disponible';

  @override
  String mealAt(String time) {
    return 'Repas à $time';
  }

  @override
  String get databaseManagement => 'Gestion des bases de données';

  @override
  String get databaseManagementHint =>
      'Sélectionnez les bases de données alimentaires à interroger';

  @override
  String get storedOnDevice => 'Stocké sur l\'appareil';

  @override
  String get swissFoodCompositionDatabase =>
      'Base de données suisse des valeurs nutritives';

  @override
  String get version => 'Version';

  @override
  String get language => 'Langue';

  @override
  String get languages => 'Langues';

  @override
  String get german => 'Allemand';

  @override
  String get italian => 'Italien';

  @override
  String get french => 'Français';

  @override
  String get publisher => 'Éditeur';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Office fédéral de la securité alimentaire et des affaires vétérinaires';

  @override
  String get switzerland => 'Suisse';

  @override
  String get generalInformation => 'Informations générales';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Cette base de données propose environ 1 100 produits généraux et de nombreux micronutriments. Comme elle est stockée sur votre appareil et elle fonctionne hors ligne.';

  @override
  String get source => 'Source';

  @override
  String get tapHereForFurtherInformation =>
      'Cliquez ici pour plus d\'informations.';

  @override
  String get serverBased => 'Basé sur le serveur';

  @override
  String get openFoodFactsVariousLanguagesText => 'Diverses';

  @override
  String get nonProfitInstitution => 'Institution à but non lucratif';

  @override
  String get france => 'France';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Veuillez noter qu\'étant donné que cette base de données est très vaste, les entrées peuvent être incomplètes ou obsolètes. Chaque utilisateur enregistré peut mettre à jour les valeurs nutritives. L\'ajout de nouveaux produits est possible sans créer de compte. La désactivation de cette base de données inclut également la numérisation des codes EAN. Vous ne pourrez donc plus numériser les aliments personnalisés que par code EAN.';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get openFoodFactsTermsText =>
      'En activant cette base de données, vous en acceptez les conditions.';

  @override
  String get contribute => 'Contribuer';

  @override
  String get databaseContributeText =>
      'Voyez comment vous pouvez contribuer à améliorer cette base de données.';

  @override
  String get english => 'Anglais';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central est une base de données sur les aliments et les nutriments du département de l\'Agriculture des États-Unis. Les données sont dans le domaine public et contiennent environ 200 aliments de base et plus de 380 000 marques alimentaires.';

  @override
  String get backupAndRestore => 'Sauvegarde et restauration';

  @override
  String get backupAndRestoreHint =>
      'Stockez vos données localement ou sur un stockage cloud compatible WebDAV comme Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Attention : les paramètres, les personnalisations et les cibles ne sont pas encore inclus !';

  @override
  String get successfullyCreatedBackup => 'Sauvegarde créée avec succès';

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

    return '$customFoodsCountString aliments personnalisés exportés et $trackedFoodsCountString aliments suivis';
  }

  @override
  String get successfullyRestoredBackup => 'Sauvegarde restaurée avec succès';

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

    return '$customFoodsCountString aliments personnalisés importés et $trackedFoodsCountString aliments suivis';
  }

  @override
  String get createWebDAVBackup => 'Créer une sauvegarde WebDAV';

  @override
  String get webDAVSettings => 'Paramètres WebDAV';

  @override
  String get serverURL => 'URL du serveur';

  @override
  String get invalidURL => 'L\'URL est invalide';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get pathAndFilename => 'Emplacement et nom du fichier';

  @override
  String energizeBackup(String appName) {
    return 'Sauvegarde $appName';
  }

  @override
  String get backupPasswordNotice =>
      'Sans le mot de passe de sauvegarde, il est impossible de restaurer une sauvegarde.';

  @override
  String get restoreWebDAVBackup => 'Restaurer la sauvegarde WebDAV';

  @override
  String get createLocalBackup => 'Créer une sauvegarde locale';

  @override
  String get restoreLocalBackup => 'Restaurer la sauvegarde locale';

  @override
  String get aboutEnergize => 'À propos d\'Energize';

  @override
  String get license => 'Licence';

  @override
  String get allLicenses => 'Toutes les licences';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Signaler un problème';

  @override
  String get proposeImprovement => 'Proposer une amélioration';

  @override
  String get sourceCode => 'Code source';

  @override
  String get translation => 'Traduction';

  @override
  String get contributors => 'Contributeurs';

  @override
  String get thanksToContributorsText =>
      'Merci à tous ceux qui ont contribué à Energize. Grâce à votre aide, Energize a pu devenir ce qu\'il est aujourd\'hui.';

  @override
  String get contributionTypeCodeAndConversations => 'Code et conversations';

  @override
  String get contributionTypeAcrylicPicture => 'Tableau acrylique';

  @override
  String get allTranslatorsOnWeblate => 'Tous les traducteurs sur Weblate';

  @override
  String get contact => 'Contact';

  @override
  String get email => 'Courriel';

  @override
  String get emailHint =>
      'Veuillez utiliser ceci uniquement pour d\'autres sujets que ceux ci-dessus';

  @override
  String get supportMeByDonating => 'Soutenez-moi en faisant un don';

  @override
  String get donate => 'Faire un don';

  @override
  String get donationText =>
      'Si vous souhaitez soutenir le développement par un don, nous vous en remercions ! La création de cette application est très amusante, mais elle prend aussi beaucoup de temps et entraîne parfois une certaine frustration :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Adresse Bitcoin copiée dans le presse-papiers';

  @override
  String get bankAccountOrCreditCard => 'Compte bancaire ou carte de crédit';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Vous pouvez m\'écrire un courriel pour d\'autres options concernant les dons';

  @override
  String get energyAndMacronutrients => 'Énergie et macronutriments';

  @override
  String get vitamins => 'Vitamines';

  @override
  String get vitaminA => 'Vitamine A';

  @override
  String get vitaminB1 => 'B1 (Thiamine)';

  @override
  String get vitaminB2 => 'B2 (Riboflavine)';

  @override
  String get vitaminB3 => 'B3 (Niacine)';

  @override
  String get vitaminB5 => 'B5 (Acide pantothénique)';

  @override
  String get vitaminB6 => 'Vitamine B6';

  @override
  String get vitaminB7 => 'B7 (Biotine)';

  @override
  String get vitaminB9 => 'B9 (Acide folique)';

  @override
  String get vitaminB12 => 'B12 (Cobalamine)';

  @override
  String get vitaminC => 'Vitamine C';

  @override
  String get vitaminD => 'Vitamine D';

  @override
  String get vitaminE => 'Vitamine E';

  @override
  String get vitaminK => 'Vitamine K';

  @override
  String get minerals => 'Minéraux';

  @override
  String get majorMinerals => 'Principaux minéraux';

  @override
  String get calcium => 'Calcium';

  @override
  String get chloride => 'Chlorure';

  @override
  String get magnesium => 'Magnésium';

  @override
  String get phosphorous => 'Phosphore';

  @override
  String get potassium => 'Potassium';

  @override
  String get sodium => 'Sodium';

  @override
  String get traceElements => 'Oligo-éléments';

  @override
  String get chromium => 'Chrome';

  @override
  String get iron => 'Fer';

  @override
  String get fluorine => 'Fluor';

  @override
  String get iodine => 'Iode';

  @override
  String get copper => 'Cuivre';

  @override
  String get manganese => 'Manganèse';

  @override
  String get molybdenum => 'Molybdène';

  @override
  String get selenium => 'Sélénium';

  @override
  String get zinc => 'Zinc';

  @override
  String get fats => 'Graisses';

  @override
  String get monounsaturatedFat => 'Graisses monoinsaturées';

  @override
  String get polyunsaturatedFat => 'Graisses polyinsaturées';

  @override
  String get omega3 => 'Oméga 3';

  @override
  String get omega6 => 'Oméga 6';

  @override
  String get saturatedFat => 'Graisses saturées';

  @override
  String get transfat => 'Graisses trans';

  @override
  String get cholesterol => 'Cholestérol';

  @override
  String get fiber => 'Fibres';

  @override
  String get sugar => 'Sucre';

  @override
  String get sugarAlcohol => 'Polyols';

  @override
  String get starch => 'Amidons';

  @override
  String get other => 'Autres';

  @override
  String get water => 'Eau';

  @override
  String get caffeine => 'Caféine';

  @override
  String get alcohol => 'Alcool';

  @override
  String get salt => 'Sel';

  @override
  String get servingSizes => 'Tailles de portion';

  @override
  String get add => 'Ajouter';

  @override
  String get noServingSizesText => 'Aucune taille de portion n\'est indiquée.';

  @override
  String get addServingSize => 'Ajouter une taille de portion';

  @override
  String get typicalServingSizes => 'Tailles de portion habituelles';

  @override
  String get or => 'ou';

  @override
  String get servingSizeName => 'Nom de la taille de portion';

  @override
  String get size => 'Taille';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'l10nServing': 'Port.',
        'l10nPackage': 'Emb.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Pancakes';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Röstis';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Gombo frit';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Œuf en croûte';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Yorkshire pudding';

  @override
  String get testCustomFood5Calories => '259';
}
