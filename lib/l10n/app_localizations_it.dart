// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Traccia il tuo cibo e la tua nutrizione in modo facile e veloce.';

  @override
  String get appDescription =>
      'Traccia il tuo cibo e la tua nutrizione in modo facile e veloce. Scansiona i tuoi prodotti o cerca manualmente in diverse banche dati.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Inserisci un valore';

  @override
  String get onlyNumbersAllowed => 'Sono ammessi solo i numeri';

  @override
  String get undo => 'Annulla';

  @override
  String get deleted => 'eliminato';

  @override
  String get loading => 'Caricamento';

  @override
  String somethingNotFound(String something) {
    return '$something non trovato';
  }

  @override
  String get unknownErrorText => 'Si è verificato un errore sconosciuto';

  @override
  String get tracking => 'Tracciamento';

  @override
  String get energy => 'Energia';

  @override
  String get protein => 'Proteina';

  @override
  String get carbs => 'Carboidrati';

  @override
  String get fat => 'Lipidi';

  @override
  String get detailedSummary => 'Riassunto dettagliato';

  @override
  String get dayComplete => 'Giorno completo';

  @override
  String get markedDayAsComplete => 'Giorno contrassegnato come completo';

  @override
  String get dayIncomplete => 'Giorno incompleto';

  @override
  String get unmarkedDayAsComplete => 'Giorno non segnato come completo';

  @override
  String get trackFood => 'Tieni traccia del cibo';

  @override
  String get timeSetHelpText =>
      'Questo orario sarà utilizzato come modello per l\'ora di consumo quando si tiene traccia degli alimenti.';

  @override
  String get useAsTemplateForCustomFood =>
      'Usa come modello per alimenti personalizzati';

  @override
  String get additionalInformation => 'Informazioni aggiuntive';

  @override
  String get completeProductName => 'Nome prodotto completo';

  @override
  String get addedDate => 'Aggiunto';

  @override
  String get consumedDate => 'Consumato';

  @override
  String get nutrients => 'Nutrienti';

  @override
  String get labelingEu => 'Etichettatura (UE)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit contengono';
  }

  @override
  String get dailyTarget => 'obiettivo giornaliero';

  @override
  String get general => 'Generale';

  @override
  String get micronutrients => 'Micronutrienti';

  @override
  String get editTrackedFood => 'Modifica il cibo tracciato';

  @override
  String get scanBarcode => 'Scansione codice a barre';

  @override
  String get searchFood => 'Cerca cibo';

  @override
  String get productOrBrand => 'Prodotto o marca';

  @override
  String get searchError => 'Errore nella ricerca';

  @override
  String get searchErrorHint =>
      'Non è stato possibile raggiungere almeno un database di composizione degli alimenti. Riprova più tardi o disattiva temporaneamente i database non funzionanti nelle impostazioni.';

  @override
  String get affectedDatabases => 'Database interessati';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Né negli alimenti personalizzati né su Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Non trovato negli alimenti personalizzati, Open Food Facts richiede l\'accesso a Internet';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Non trovato negli alimenti personalizzati, la ricerca di Open Food Facts è fallita';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Non trovato negli alimenti personalizzati, Open Food Facts non è attivo';

  @override
  String get barcodeScanningUnsupported =>
      'La scansione dei codici a barre con la fotocamera è attualmente supportata solo su Android.';

  @override
  String get customFood => 'Cibo personalizzato';

  @override
  String get searchCustomFood => 'Cerca cibo personalizzato';

  @override
  String get addCustomFood => 'Aggiungi cibo personalizzato';

  @override
  String get editCustomFood => 'Modifica cibo personalizzato';

  @override
  String get title => 'Titolo';

  @override
  String get barcode => 'Codice a barre';

  @override
  String get settings => 'Impostazioni';

  @override
  String get yourPersonalNutritionNeeds =>
      'Le tue esigenze nutrizionali personali';

  @override
  String get personalNutritionNeedsHint =>
      'Calcola il fabbisogno nutrizionale personale o stabiliscilo da soli';

  @override
  String get calculate => 'Calcola';

  @override
  String get energyDistribution => 'Distribuzione di energia';

  @override
  String get yourBody => 'Il tuo corpo';

  @override
  String get age => 'Età';

  @override
  String get years => 'anni';

  @override
  String get sex => 'Sesso';

  @override
  String get female => 'Femmina';

  @override
  String get male => 'Maschio';

  @override
  String get weight => 'Peso';

  @override
  String get height => 'Altezza';

  @override
  String get behaviourAndTarget => 'Comportamento e obiettivi';

  @override
  String get activityLevel => 'Livello di attività (PAL)';

  @override
  String get activityLevel1_0 => 'Non fai altro che dormire';

  @override
  String get activityLevel1_1 => 'Sei nel tuo letto tutto il giorno';

  @override
  String get activityLevel1_2 =>
      'Sei seduto/seduta nel tuo letto tutto il giorno';

  @override
  String get activityLevel1_3 => 'Non esci molto spesso all\'aperto';

  @override
  String get activityLevel1_4 => 'Non sei affatto attivo/attiva';

  @override
  String get activityLevel1_5 => 'Fai un lavoro d\'ufficio';

  @override
  String get activityLevel1_6 =>
      'Sei un po\' attivo/attiva, lavori e a volte fai sport';

  @override
  String get activityLevel1_7 => 'Ti alleni spesso';

  @override
  String get activityLevel1_8 => 'Ti alleni duramente regolarmente';

  @override
  String get activityLevel1_9 =>
      'Sei molto attivo/attiva, ti alleni e non hai un lavoro d\'ufficio';

  @override
  String get activityLevel2_0 =>
      'Hai un lavoro fisicamente attivo e ti alleni regolarmente';

  @override
  String get noActivityLevelDescription =>
      'Nessuna descrizione del livello di attività';

  @override
  String get weightTarget => 'Obiettivo di peso';

  @override
  String get weightTargetStrongLoss => 'Forte perdita';

  @override
  String get weightTargetModerateLoss => 'Perdita moderata';

  @override
  String get weightTargetSlightLoss => 'Leggera perdita';

  @override
  String get weightTargetMaintaining => 'Mantenimento';

  @override
  String get weightTargetSlightGain => 'Leggero aumento di peso';

  @override
  String get weightTargetModerateGain => 'Moderato aumento di peso';

  @override
  String get weightTargetStrongGain => 'Forte aumento di peso';

  @override
  String get calculateNutritionTargets => 'Calcola gli obiettivi nutrizionali';

  @override
  String get calculationInfo => 'Informazioni sul calcolo';

  @override
  String get calculationInfoText1 =>
      'Il calcolo dell\'apporto calorico si basa sulla formula di Mifflin-St.Jeor. Si tenga presente che essa può fungere solo da approssimazione ai valori reali. Questi variano da persona a persona, poiché le condizioni corporee possono essere più o meno diverse.';

  @override
  String get formulaForFemales => 'Formula per le donne';

  @override
  String get weightInKg => 'Peso in kg';

  @override
  String get heightInCm => 'Altezza in cm';

  @override
  String get ageInYears => 'Età in anni';

  @override
  String get formulaForMales => 'Formula per gli uomini';

  @override
  String get calculationInfoText2 =>
      'Il risultato di questo calcolo è definito come metabolismo basale (MB). Viene moltiplicato con il fattore di attività per ottenere la conversione energetica totale. Questo è l\'apporto energetico calcolato in kcal.';

  @override
  String get calculatedNutritionTargets => 'Obiettivi nutrizionali calcolati';

  @override
  String get calculatedNutritionTargetsHint =>
      'Non esitare a modificare gli obiettivi calcolati in base alle tue esigenze prima di applicarli.';

  @override
  String get percentOfCalories => '% delle kcal';

  @override
  String get proteinRatio => 'Rapporto di proteine';

  @override
  String get carbsRatio => 'Livelli di carboidrati';

  @override
  String get fatRatio => 'Livello di grasso';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Stabilisci anche gli obiettivi di micronutrienti in base all\'età e al sesso';

  @override
  String get apply => 'Applica';

  @override
  String get targetsApplied =>
      'Gli obiettivi nutrizionali sono stati applicati';

  @override
  String get targetsApplyError =>
      'Non è stato possibile applicare gli obiettivi nutrizionali';

  @override
  String get totalEnergy => 'Energia totale';

  @override
  String get energyDistributionChartMissingHint =>
      'Il grafico della distribuzione energetica è visualizzato solo se si è impostato un obiettivo calorico e un obiettivo per almeno uno dei macronutrienti.';

  @override
  String get percentOfTotalEnergy => 'Percentuale di energia totale';

  @override
  String get selectedMacronutrient => 'Macronutrienti selezionati';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calorie, proteine, carboidrati, grassi';

  @override
  String get display => 'Schermo';

  @override
  String get displayHint =>
      'Personalizza l\'interfaccia utente in base alle tue esigenze';

  @override
  String get groupFoodsToMeals => 'Raggruppa alimenti per pasto';

  @override
  String get groupFoodsToMealsHint =>
      'Raggruppa automaticamente per pasto gli alimenti consumati a intervalli molto brevi';

  @override
  String get preferServingSizes => 'Prefer serving sizes';

  @override
  String get preferServingSizesHint =>
      'Quando si traccia un nuovo alimento, viene preselezionata la dimensione della porzione, se presente';

  @override
  String mealAt(String time) {
    return 'Pasto alle $time';
  }

  @override
  String get databaseManagement => 'Gestione della banca dati';

  @override
  String get databaseManagementHint =>
      'Seleziona quali banche dati alimentari interrogare';

  @override
  String get storedOnDevice => 'Memorizzato sul dispositivo';

  @override
  String get swissFoodCompositionDatabase =>
      'Banca dati svizzera dei valori nutritivi';

  @override
  String get version => 'Versione';

  @override
  String get language => 'Lingua';

  @override
  String get languages => 'Lingue';

  @override
  String get german => 'tedesco';

  @override
  String get italian => 'Italiano';

  @override
  String get french => 'Francese';

  @override
  String get publisher => 'Editore';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Ufficio federale della sicurezza alimentare e di veterinaria';

  @override
  String get switzerland => 'Svizzera';

  @override
  String get generalInformation => 'Informazioni generali';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Questa banca dati offre circa 1 100 prodotti generali e molti micronutrienti. Visto che è memorizzata sul tuo dispositivo, funziona senza rete dati.';

  @override
  String get source => 'Fonte';

  @override
  String get tapHereForFurtherInformation =>
      'Tocca qui per ulteriori informazioni.';

  @override
  String get serverBased => 'Basato su server';

  @override
  String get openFoodFactsVariousLanguagesText => 'Diverse';

  @override
  String get nonProfitInstitution => 'Istituzione senza scopo di lucro';

  @override
  String get france => 'Francia';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Si tenga presente che, essendo questa base di dati molto ampio, le voci possono essere incomplete o non aggiornate. Ogni utente registrato può aggiornare i valori dei nutrienti. L\'aggiunta di nuovi prodotti è possibile senza creare un account. La disattivazione di questa base di dati include anche la scansione EAN, quindi sarà possibile scansionare gli alimenti personalizzati solo in base al codice EAN.';

  @override
  String get termsOfUse => 'Condizioni d\'uso';

  @override
  String get openFoodFactsTermsText =>
      'Attivando questa banca dati, accetti le condizioni.';

  @override
  String get contribute => 'Contribuire';

  @override
  String get databaseContributeText =>
      'Vedi come puoi aiutare a migliorare questa banca dati.';

  @override
  String get english => 'inglese';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central è una banca dati di alimenti e nutrizioni del Dipartimento dell\'agricoltura degli Stati Uniti. I dati sono di dominio pubblico e contengono circa 200 alimenti di fondazione e oltre 380 000 alimenti di marca.';

  @override
  String get backupAndRestore => 'Backup e ripristino';

  @override
  String get backupAndRestoreHint =>
      'Memorizza i tuoi dati su un server compatibile con WebDAV come Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Attenzione: Impostazioni, personalizzazioni e obiettivi non sono ancora inclusi!';

  @override
  String get successfullyCreatedBackup => 'Backup creato con successo';

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

    return '$customFoodsCountString alimenti personalizzati e $trackedFoodsCountString alimenti tracciati esportati';
  }

  @override
  String get successfullyRestoredBackup => 'Backup ripristinato con successo';

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

    return '$customFoodsCountString alimenti personalizzati e $trackedFoodsCountString alimenti tracciati importati';
  }

  @override
  String get createWebDAVBackup => 'Crea backup WebDAV';

  @override
  String get webDAVSettings => 'Impostazioni WebDAV';

  @override
  String get serverURL => 'URL del server';

  @override
  String get invalidURL => 'L\'URL non è valido';

  @override
  String get username => 'Nome utente';

  @override
  String get password => 'Password';

  @override
  String get pathAndFilename => 'Percorso e nome del file';

  @override
  String energizeBackup(String appName) {
    return '$appName Backup';
  }

  @override
  String get backupPasswordNotice =>
      'Senza la password di backup, è impossibile ripristinare un backup.';

  @override
  String get restoreWebDAVBackup => 'Ripristina backup WebDAV';

  @override
  String get createLocalBackup => 'Crea backup locale';

  @override
  String get restoreLocalBackup => 'Ripristina backup locale';

  @override
  String get aboutEnergize => 'Informazioni su Energize';

  @override
  String get license => 'licenza';

  @override
  String get allLicenses => 'Tutte le licenze';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Segnala un problema';

  @override
  String get proposeImprovement => 'Suggerisci miglioramento';

  @override
  String get sourceCode => 'Codice sorgente';

  @override
  String get translation => 'Traduzione';

  @override
  String get contributors => 'Contributori';

  @override
  String get thanksToContributorsText =>
      'Grazie a tutte le persone che hanno contribuito a Energize. Grazie al vostro aiuto, Energize ha potuto diventare ciò che è ora.';

  @override
  String get contributionTypeCodeAndConversations => 'Codice e conversazioni';

  @override
  String get contributionTypeAcrylicPicture => 'Immagine acrilica';

  @override
  String get allTranslatorsOnWeblate => 'Tutti i traduttori su Weblate';

  @override
  String get contact => 'Contatto';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Usa solo per argomenti diversi da quelli riportati sopra';

  @override
  String get supportMeByDonating => 'Sostienimi donando';

  @override
  String get donate => 'Dona';

  @override
  String get donationText =>
      'Se volete sostenere lo sviluppo con una donazione, vi ringrazio! Creare questa applicazione è molto divertente, ma anche un compito che richiede molto tempo e che a volte porta a un po\' di frustrazione :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Indirizzo Bitcoin copiato negli appunti';

  @override
  String get bankAccountOrCreditCard => 'Conto bancario o carta di credito';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Puoi scrivermi un\'e-mail per ulteriori opzioni di donazione';

  @override
  String get energyAndMacronutrients => 'Energia e macronutrienti';

  @override
  String get vitamins => 'Vitamine';

  @override
  String get vitaminA => 'Vitamina A';

  @override
  String get vitaminB1 => 'B1 (Tiamina)';

  @override
  String get vitaminB2 => 'B2 (Riboflavina)';

  @override
  String get vitaminB3 => 'B3 (Niacina)';

  @override
  String get vitaminB5 => 'B5 (Acido pantotenico)';

  @override
  String get vitaminB6 => 'Vitamina B6';

  @override
  String get vitaminB7 => 'B7 (Biotina)';

  @override
  String get vitaminB9 => 'B9 (Acido folico)';

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
  String get minerals => 'Minerali';

  @override
  String get majorMinerals => 'Minerali principali';

  @override
  String get calcium => 'Calcio';

  @override
  String get chloride => 'Cloruro';

  @override
  String get magnesium => 'Magnesio';

  @override
  String get phosphorous => 'Fosforo';

  @override
  String get potassium => 'Potassio';

  @override
  String get sodium => 'Sodio';

  @override
  String get traceElements => 'Oligoelementi';

  @override
  String get chromium => 'Cromo';

  @override
  String get iron => 'Ferro';

  @override
  String get fluorine => 'Fluoro';

  @override
  String get iodine => 'Iodio';

  @override
  String get copper => 'Rame';

  @override
  String get manganese => 'manganese';

  @override
  String get molybdenum => 'Molibdeno';

  @override
  String get selenium => 'Selenio';

  @override
  String get zinc => 'Zinco';

  @override
  String get fats => 'Acidi grassi';

  @override
  String get monounsaturatedFat => 'Acido grasso monoinsaturo';

  @override
  String get polyunsaturatedFat => 'Acido grasso polinsaturo';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Acido grasso saturo';

  @override
  String get transfat => 'Acido grasso trans';

  @override
  String get cholesterol => 'Colesterolo';

  @override
  String get fiber => 'Fibra';

  @override
  String get sugar => 'Zucchero';

  @override
  String get sugarAlcohol => 'Alcol di zucchero';

  @override
  String get starch => 'Amido';

  @override
  String get other => 'Altro';

  @override
  String get water => 'Acqua';

  @override
  String get caffeine => 'Caffeina';

  @override
  String get alcohol => 'Alcol';

  @override
  String get salt => 'Sale';

  @override
  String get servingSizes => 'Porzioni';

  @override
  String get add => 'Aggiungi';

  @override
  String get noServingSizesText =>
      'Non sono presenti le dimensioni delle porzioni.';

  @override
  String get addServingSize => 'Aggiungere le dimensioni della porzione';

  @override
  String get typicalServingSizes => 'Dimensioni tipiche delle porzioni';

  @override
  String get or => 'o';

  @override
  String get servingSizeName => 'Nome della porzione';

  @override
  String get size => 'Dose';

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
  String get testCustomFood1Name => 'Pancake';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Hashbrown';

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
