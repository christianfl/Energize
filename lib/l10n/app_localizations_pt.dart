// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Acompanhe a sua alimentação e nutrição de forma fácil e rápida.';

  @override
  String get appDescription =>
      'Acompanhe a sua alimentação e nutrição de forma fácil e rápida. Escaneie os seus produtos ou pesquise manualmente em diferentes bancos de dados.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Por favor, insira um valor';

  @override
  String get onlyNumbersAllowed => 'Apenas números são permitidos';

  @override
  String get undo => 'Desfazer';

  @override
  String get deleted => 'apagado';

  @override
  String get loading => 'A carregar';

  @override
  String somethingNotFound(String something) {
    return '$something não encontrado';
  }

  @override
  String get unknownErrorText => 'Ocorreu um erro desconhecido';

  @override
  String get tracking => 'A rastrear';

  @override
  String get energy => 'Energia';

  @override
  String get protein => 'Proteína';

  @override
  String get carbs => 'Carboidratos';

  @override
  String get fat => 'Gordura';

  @override
  String get detailedSummary => 'Sumário detalhado';

  @override
  String get dayComplete => 'Dia concluído';

  @override
  String get markedDayAsComplete => 'Marcar dia como concluído';

  @override
  String get dayIncomplete => 'Dia incompleto';

  @override
  String get unmarkedDayAsComplete => 'Desmarcar dia como concluído';

  @override
  String get trackFood => 'Acompanhar alimentação';

  @override
  String get timeSetHelpText =>
      'Ao registar os alimentos, este horário será usado como modelo para o horário de consumo.';

  @override
  String get useAsTemplateForCustomFood =>
      'Usar como modelo para alimentos personalizados';

  @override
  String get additionalInformation => 'Informação adicional';

  @override
  String get completeProductName => 'Nome completo do produto';

  @override
  String get addedDate => 'Adicionado';

  @override
  String get consumedDate => 'Consumido';

  @override
  String get nutrients => 'Nutrientes';

  @override
  String get labelingEu => 'Rotulagem (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit inclui';
  }

  @override
  String get dailyTarget => 'meta diária';

  @override
  String get general => 'Geral';

  @override
  String get micronutrients => 'Micronutrientes';

  @override
  String get editTrackedFood => 'Editar meta de alimentação';

  @override
  String get scanBarcode => 'Escanear código de barras';

  @override
  String get searchFood => 'Buscar alimento';

  @override
  String get productOrBrand => 'Produto ou marca';

  @override
  String get searchError => 'Erro durante a pesquisa';

  @override
  String get searchErrorHint =>
      'Não foi possível aceder pelo menos um banco de dados de composição de alimentos. Tente novamente mais tarde ou desative temporariamente os bancos de dados não funcionais nas configurações.';

  @override
  String get affectedDatabases => 'Bancos de dados afetados';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Nem em alimentos personalizados nem no Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Não encontrado em alimentos personalizados, o Open Food Facts precisa de acesso à internet';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Não encontrado em alimentos personalizados, a pesquisa em Open Food Facts apresentou um erro';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Não encontrado em alimentos personalizados, o Open Food Facts não está ativado';

  @override
  String get barcodeScanningUnsupported =>
      'Atualmente, a leitura de códigos de barras com a câmara do dispositivo é compatível apenas com o Android.';

  @override
  String get customFood => 'Alimentação personalizada';

  @override
  String get searchCustomFood => 'Buscar alimentação personalizada';

  @override
  String get addCustomFood => 'Adicionar alimentação personalizada';

  @override
  String get editCustomFood => 'Editar alimentação personalizada';

  @override
  String get title => 'Título';

  @override
  String get barcode => 'Código de barras';

  @override
  String get settings => 'Configurações';

  @override
  String get yourPersonalNutritionNeeds =>
      'As suas necessidades nutricionais pessoal';

  @override
  String get personalNutritionNeedsHint =>
      'Calcule as suas necessidades nutricionais pessoais ou defina-as você mesmo';

  @override
  String get calculate => 'Calcular';

  @override
  String get energyDistribution => 'Distribuição energética';

  @override
  String get yourBody => 'O seu corpo';

  @override
  String get age => 'Idade';

  @override
  String get years => 'anos';

  @override
  String get sex => 'Sexo';

  @override
  String get female => 'Feminino';

  @override
  String get male => 'Masculino';

  @override
  String get weight => 'Peso';

  @override
  String get height => 'Altura';

  @override
  String get behaviourAndTarget => 'Comportamento e meta';

  @override
  String get activityLevel => 'Nível de atividade (PAL)';

  @override
  String get activityLevel1_0 => 'Faz basicamente nada além de dormir';

  @override
  String get activityLevel1_1 => 'Está deitado na sua cama todo o dia';

  @override
  String get activityLevel1_2 => 'Está sentado na sua cama todo o dia';

  @override
  String get activityLevel1_3 => 'Não sai muitas vezes';

  @override
  String get activityLevel1_4 => 'Não é nem um pouco ativo';

  @override
  String get activityLevel1_5 => 'Trabalha em escritório';

  @override
  String get activityLevel1_6 =>
      'É um pouco ativo, trabalha e às vezes pratica desporto';

  @override
  String get activityLevel1_7 => 'Se exercita com frequência';

  @override
  String get activityLevel1_8 => 'Se exercita vigorosamente regularmente';

  @override
  String get activityLevel1_9 =>
      'É muito ativo, faz exercícios e não tem um trabalho de escritório';

  @override
  String get activityLevel2_0 =>
      'Tem um trabalho fisicamente ativo e se exercita vigorosamente com frequência';

  @override
  String get noActivityLevelDescription =>
      'Nenhuma descrição do nível de atividade';

  @override
  String get weightTarget => 'Meta de peso';

  @override
  String get weightTargetStrongLoss => 'Grande perda';

  @override
  String get weightTargetModerateLoss => 'Perda moderada';

  @override
  String get weightTargetSlightLoss => 'Pequena perda';

  @override
  String get weightTargetMaintaining => 'Manutenção';

  @override
  String get weightTargetSlightGain => 'Pequeno ganho';

  @override
  String get weightTargetModerateGain => 'Ganho moderado';

  @override
  String get weightTargetStrongGain => 'Grande ganho';

  @override
  String get calculateNutritionTargets => 'Calcular metas nutricionais';

  @override
  String get calculationInfo => 'Informações sobre o cálculo';

  @override
  String get calculationInfoText1 =>
      'O cálculo da ingestão de calorias baseia-se na fórmula Mifflin-St.Jeor. Esteja ciente de que ela funciona apenas como uma aproximação dos valores do mundo real. Estes valores diferem de pessoa para pessoa, pois as suas condições corporais podem divergir em maior ou menor grau.';

  @override
  String get formulaForFemales => 'Fórmula para mulheres';

  @override
  String get weightInKg => 'Peso em kg';

  @override
  String get heightInCm => 'Altura em cm';

  @override
  String get ageInYears => 'Idade em anos';

  @override
  String get formulaForMales => 'Fórmula para homens';

  @override
  String get calculationInfoText2 =>
      'O resultado desse cálculo é definido como a taxa metabólica basal (TMB). Ela é multiplicada pelo seu fator de atividade para receber a sua conversão total de energia. Esta é a sua ingestão de energia calculada em kcal.';

  @override
  String get calculatedNutritionTargets => 'Metas nutricionais calculadas';

  @override
  String get calculatedNutritionTargetsHint =>
      'Sinta-se à vontade para editar as metas calculadas de acordo com as suas necessidades antes de aplicá-las.';

  @override
  String get percentOfCalories => '% de kcal';

  @override
  String get proteinRatio => 'Proporção de proteína';

  @override
  String get carbsRatio => 'Proporção de carboidrato';

  @override
  String get fatRatio => 'Proporção de gordura';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Estabeleça também metas de micronutrientes com base na idade e no sexo';

  @override
  String get alsoSetMicronutrientsHint =>
      'Values depend on age and sex. Data based on DGE reference values from 2022 with a partly update from 2025.';

  @override
  String get apply => 'Aplicar';

  @override
  String get targetsApplied => 'As metas nutricionais foram aplicadas';

  @override
  String get targetsApplyError =>
      'As metas nutricionais não puderam ser aplicadas';

  @override
  String get totalEnergy => 'Energia total';

  @override
  String get energyDistributionChartMissingHint =>
      'O gráfico de distribuição de energia só é exibido se definiu uma meta de calorias e uma meta para pelo menos um dos macronutrientes.';

  @override
  String get percentOfTotalEnergy => 'Percentagem da energia total';

  @override
  String get selectedMacronutrient => 'Macronutriente selecionado';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calorias, proteínas, carboidratos, gorduras';

  @override
  String get display => 'Ecrã';

  @override
  String get displayHint =>
      'Personalize a interface do utilizador de acordo com as suas necessidades';

  @override
  String get groupFoodsToMeals => 'Agrupar alimentos em refeições';

  @override
  String get groupFoodsToMealsHint =>
      'Agrupa automaticamente os alimentos consumidos em intervalos muito curtos como uma refeição';

  @override
  String get preferServingSizes => 'Preferir as doses';

  @override
  String get preferServingSizesHint =>
      'Ao rastrear um novo alimento, será pré-selecionado um tamanho de porção, se existir';

  @override
  String mealAt(String time) {
    return 'Refeição em $time';
  }

  @override
  String get databaseManagement => 'Gestão de banco de dados';

  @override
  String get databaseManagementHint =>
      'Selecione os bancos de dados de alimentos a serem consultados';

  @override
  String get storedOnDevice => 'Armazenado no dispositivo';

  @override
  String get swissFoodCompositionDatabase =>
      'Banco de dados suíço de composição de alimentos';

  @override
  String get version => 'Versão';

  @override
  String get language => 'Língua';

  @override
  String get languages => 'Línguas';

  @override
  String get german => 'Alemão';

  @override
  String get italian => 'Italiano';

  @override
  String get french => 'Francês';

  @override
  String get publisher => 'Editor(a)';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Serviço Federal de Segurança Alimentar e Veterinária';

  @override
  String get switzerland => 'Suíça';

  @override
  String get generalInformation => 'Informações gerais';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Este banco de dados oferece cerca de 1.100 produtos gerais e muitos micronutrientes. Como é armazenado no seu dispositivo, funciona offline.';

  @override
  String get source => 'Fonte';

  @override
  String get tapHereForFurtherInformation =>
      'Toque aqui para mais informações.';

  @override
  String get serverBased => 'Baseado em servidor';

  @override
  String get openFoodFactsVariousLanguagesText => 'Diversos';

  @override
  String get nonProfitInstitution => 'Instituição sem fins lucrativos';

  @override
  String get france => 'França';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Esteja ciente de que, como este banco de dados é muito grande, as informações podem estar incompletas ou desatualizadas. Todos os utilizadores registados podem atualizar os valores dos nutrientes. A adição de novos produtos é possível sem a criação de uma conta. A desativação desse banco de dados também inclui a digitalização EAN, portanto, só poderá digitalizar alimentos personalizados pelo código EAN.';

  @override
  String get termsOfUse => 'Termos de uso';

  @override
  String get openFoodFactsTermsText =>
      'Ao ativar este banco de dados, concorda com os termos.';

  @override
  String get contribute => 'Contribuir';

  @override
  String get databaseContributeText =>
      'Veja como pode ajudar a melhorar este banco de dados.';

  @override
  String get english => 'Inglês';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'O FoodData Central é um banco de dados de alimentos e nutrientes do Departamento de Agricultura dos EUA. Os dados são de domínio público e contêm cerca de 200 alimentos básicos e mais que 380.000 alimentos de marca.';

  @override
  String get backupAndRestore => 'Backup e Restauração';

  @override
  String get backupAndRestoreHint =>
      'Armazene os seus dados localmente ou num armazenamento em nuvem compatível com WebDAV, como o Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Aviso: Configurações, personalizações e metas ainda não estão incluídas!';

  @override
  String get successfullyCreatedBackup => 'Backup criado com sucesso';

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

    return 'Exportou $customFoodsCountString alimentos personalizados e $trackedFoodsCountString alimentos rastreados';
  }

  @override
  String get successfullyRestoredBackup => 'Backup restaurado com sucesso';

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

    return 'Importou $customFoodsCountString alimentos personalizados e $trackedFoodsCountString alimentos rastreados';
  }

  @override
  String get createWebDAVBackup => 'Criar backup WebDAV';

  @override
  String get webDAVSettings => 'Configurações do WebDAV';

  @override
  String get serverURL => 'URL do servidor';

  @override
  String get invalidURL => 'A URL é inválida';

  @override
  String get username => 'Nome do utilizador';

  @override
  String get password => 'Palvra-passe';

  @override
  String get pathAndFilename => 'Caminho e nome do ficheiro';

  @override
  String energizeBackup(String appName) {
    return '$appName Apoio';
  }

  @override
  String get backupPasswordNotice =>
      'Sem a palavra-passe do backup, é impossível restaurar um backup.';

  @override
  String get restoreWebDAVBackup => 'Restaurar backup WebDAV';

  @override
  String get createLocalBackup => 'Criar backup local';

  @override
  String get restoreLocalBackup => 'Restaurar backup local';

  @override
  String get aboutEnergize => 'Sobre o Energize';

  @override
  String get license => 'licença';

  @override
  String get allLicenses => 'Todas as licenças';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get logs => 'Registos';

  @override
  String get reportIssue => 'Relatar problema';

  @override
  String get proposeImprovement => 'Propor melhorias';

  @override
  String get sourceCode => 'Código-fonte';

  @override
  String get translation => 'Tradução';

  @override
  String get contributors => 'Contribuintes';

  @override
  String get thanksToContributorsText =>
      'Obrigado a todas as pessoas que contribuíram para o Energize. Graças à sua ajuda, o Energize pôde se tornar o que é hoje.';

  @override
  String get contributionTypeCodeAndConversations => 'Código e conversas';

  @override
  String get contributionTypeAcrylicPicture => 'Quadro em acrílico';

  @override
  String get allTranslatorsOnWeblate => 'Todos os tradutores no Weblate';

  @override
  String get contact => 'Contato';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Por favor, use isto apenas para outros tópicos além dos mencionados acima';

  @override
  String get supportMeByDonating => 'Apoie-me fazendo uma doação';

  @override
  String get donate => 'Doação';

  @override
  String get donationText =>
      'Se quiser apoiar o desenvolvimento com uma doação, será muito bem-vindo! Criar esta app é muito divertido, mas também é uma tarefa que consome muito tempo e, às vezes, leva a um pouco de frustração :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Endereço Bitcoin copiado para a área de transferência';

  @override
  String get bankAccountOrCreditCard => 'Conta bancária ou cartão de crédito';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'É bem-vindo a me escrever um e-mail para obter mais opções de doação';

  @override
  String get energyAndMacronutrients => 'Energia e macronutrientes';

  @override
  String get vitamins => 'Vitaminas';

  @override
  String get vitaminA => 'Vitamina A';

  @override
  String get vitaminB1 => 'B1 (Tiamina)';

  @override
  String get vitaminB2 => 'B2 (Riboflavina)';

  @override
  String get vitaminB3 => 'B3 (Niacina)';

  @override
  String get vitaminB5 => 'B5 (Ácido pantotênico)';

  @override
  String get vitaminB6 => 'Vitamina B6';

  @override
  String get vitaminB7 => 'B7 (Biotina)';

  @override
  String get vitaminB9 => 'B9 (Folato)';

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
  String get minerals => 'Minerais';

  @override
  String get majorMinerals => 'Minerais principais';

  @override
  String get calcium => 'Cálcio';

  @override
  String get chloride => 'Cloreto';

  @override
  String get magnesium => 'Magnésio';

  @override
  String get phosphorous => 'Fósforo';

  @override
  String get potassium => 'Potássio';

  @override
  String get sodium => 'Sódio';

  @override
  String get traceElements => 'Microelementos';

  @override
  String get chromium => 'Cromo';

  @override
  String get iron => 'Ferro';

  @override
  String get fluorine => 'Flúor';

  @override
  String get iodine => 'Iodo';

  @override
  String get copper => 'Cobre';

  @override
  String get manganese => 'Manganês';

  @override
  String get molybdenum => 'Molibdênio';

  @override
  String get selenium => 'Selênio';

  @override
  String get zinc => 'Zinco';

  @override
  String get fats => 'Gorduras';

  @override
  String get monounsaturatedFat => 'Gordura monoinsaturada';

  @override
  String get polyunsaturatedFat => 'Gordura poli-insaturada';

  @override
  String get omega3 => 'Ômega 3';

  @override
  String get omega6 => 'Ômega 6';

  @override
  String get saturatedFat => 'Gordura saturada';

  @override
  String get transfat => 'Gordura trans';

  @override
  String get cholesterol => 'Colesterol';

  @override
  String get fiber => 'Fibra';

  @override
  String get sugar => 'Açúcar';

  @override
  String get sugarAlcohol => 'Álcool de açúcar';

  @override
  String get starch => 'Amido';

  @override
  String get other => 'Outros';

  @override
  String get water => 'Água';

  @override
  String get caffeine => 'Cafeína';

  @override
  String get alcohol => 'Álcool';

  @override
  String get salt => 'Sal';

  @override
  String get servingSizes => 'Tamanhos das doses';

  @override
  String get add => 'Adicionar';

  @override
  String get noServingSizesText => 'Não estão presentes tamanhos de porções.';

  @override
  String get addServingSize => 'Adicionar tamanho da dose';

  @override
  String get typicalServingSizes => 'Tamanhos típicos das doses';

  @override
  String get or => 'ou';

  @override
  String get servingSizeName => 'Nome da dose';

  @override
  String get size => 'Tamanho';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': 'Por.',
      'l10nPackage': 'Emb.',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Panquecas';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Amoras';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Quiabo frito';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Ovo escocês';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Pudim de Yorkshire';

  @override
  String get testCustomFood5Calories => '259';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appDescriptionShort =>
      'Acompanhe sua alimentação e nutrição de forma fácil e rápida.';

  @override
  String get appDescription =>
      'Acompanhe sua alimentação e nutrição de forma fácil e rápida. Escaneie seus produtos ou pesquise manualmente em diferentes bancos de dados.';

  @override
  String get ok => 'OK';

  @override
  String get fieldMandatory => 'Por favor, insira um valor';

  @override
  String get onlyNumbersAllowed => 'Apenas números são permitidos';

  @override
  String get undo => 'Desfazer';

  @override
  String get deleted => 'apagado';

  @override
  String get loading => 'Carregando';

  @override
  String somethingNotFound(String something) {
    return '$something não encontrado';
  }

  @override
  String get unknownErrorText => 'Ocorreu um erro desconhecido';

  @override
  String get tracking => 'Rastreando';

  @override
  String get energy => 'Energia';

  @override
  String get protein => 'Proteína';

  @override
  String get carbs => 'Carboidratos';

  @override
  String get fat => 'Gordura';

  @override
  String get detailedSummary => 'Sumário detalhado';

  @override
  String get dayComplete => 'Dia concluído';

  @override
  String get markedDayAsComplete => 'Marcar dia como concluído';

  @override
  String get dayIncomplete => 'Dia incompleto';

  @override
  String get unmarkedDayAsComplete => 'Desmarcar dia como concluído';

  @override
  String get trackFood => 'Acompanhar alimentação';

  @override
  String get timeSetHelpText =>
      'Ao registrar os alimentos, esse horário será usado como modelo para o horário de consumo.';

  @override
  String get useAsTemplateForCustomFood =>
      'Usar como modelo para alimentos personalizados';

  @override
  String get additionalInformation => 'Informação adicional';

  @override
  String get completeProductName => 'Nome completo do produto';

  @override
  String get addedDate => 'Adicionado';

  @override
  String get consumedDate => 'Consumido';

  @override
  String get nutrients => 'Nutrientes';

  @override
  String get labelingEu => 'Rotulagem (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit inclui';
  }

  @override
  String get dailyTarget => 'meta diária';

  @override
  String get general => 'Geral';

  @override
  String get micronutrients => 'Micronutrientes';

  @override
  String get editTrackedFood => 'Editar meta de alimentação';

  @override
  String get scanBarcode => 'Escanear código de barras';

  @override
  String get searchFood => 'Buscar alimento';

  @override
  String get productOrBrand => 'Produto ou marca';

  @override
  String get searchError => 'Erro durante a pesquisa';

  @override
  String get searchErrorHint =>
      'Não foi possível acessar pelo menos um banco de dados de composição de alimentos. Tente novamente mais tarde ou desative temporariamente os bancos de dados não funcionais nas configurações.';

  @override
  String get affectedDatabases => 'Bancos de dados afetados';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Nem em alimentos personalizados nem no Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Não encontrado em alimentos personalizados, o Open Food Facts precisa de acesso à internet';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Não encontrado em alimentos personalizados, a pesquisa em Open Food Facts apresentou um erro';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Não encontrado em alimentos personalizados, o Open Food Facts não está ativado';

  @override
  String get barcodeScanningUnsupported =>
      'Atualmente, a leitura de códigos de barras com a câmera do dispositivo é compatível apenas com o Android.';

  @override
  String get customFood => 'Alimentação personalizada';

  @override
  String get searchCustomFood => 'Buscar alimentação personalizada';

  @override
  String get addCustomFood => 'Adicionar alimentação personalizada';

  @override
  String get editCustomFood => 'Editar alimentação personalizada';

  @override
  String get title => 'Título';

  @override
  String get barcode => 'Código de barras';

  @override
  String get settings => 'Configurações';

  @override
  String get yourPersonalNutritionNeeds =>
      'Suas necessidades nutricionais pessoal';

  @override
  String get personalNutritionNeedsHint =>
      'Calcule suas necessidades nutricionais pessoais ou defina-as você mesmo';

  @override
  String get calculate => 'Calcular';

  @override
  String get energyDistribution => 'Distribuição energética';

  @override
  String get yourBody => 'Seu corpo';

  @override
  String get age => 'Idade';

  @override
  String get years => 'anos';

  @override
  String get sex => 'Sexo';

  @override
  String get female => 'Feminino';

  @override
  String get male => 'Masculino';

  @override
  String get weight => 'Peso';

  @override
  String get height => 'Altura';

  @override
  String get behaviourAndTarget => 'Comportamento e meta';

  @override
  String get activityLevel => 'Nível de atividade (PAL)';

  @override
  String get activityLevel1_0 => 'Você faz basicamente nada além de dormir';

  @override
  String get activityLevel1_1 => 'Você fica deitado em sua cama o dia todo';

  @override
  String get activityLevel1_2 => 'Você fica sentado na cama o dia inteiro';

  @override
  String get activityLevel1_3 => 'Você não sai de casa com muita frequência';

  @override
  String get activityLevel1_4 => 'Você não é nem um pouco ativo';

  @override
  String get activityLevel1_5 => 'Você trabalha em escritório';

  @override
  String get activityLevel1_6 =>
      'Você é um pouco ativo, trabalha e às vezes pratica esportes';

  @override
  String get activityLevel1_7 => 'Você se exercita com frequência';

  @override
  String get activityLevel1_8 => 'Você se exercita vigorosamente regularmente';

  @override
  String get activityLevel1_9 =>
      'Você é muito ativo, faz exercícios e não tem um trabalho de escritório';

  @override
  String get activityLevel2_0 =>
      'Você tem um trabalho fisicamente ativo e se exercita vigorosamente com frequência';

  @override
  String get noActivityLevelDescription =>
      'Nenhuma descrição do nível de atividade';

  @override
  String get weightTarget => 'Meta de peso';

  @override
  String get weightTargetStrongLoss => 'Grande perda';

  @override
  String get weightTargetModerateLoss => 'Perda moderada';

  @override
  String get weightTargetSlightLoss => 'Pequena perda';

  @override
  String get weightTargetMaintaining => 'Manutenção';

  @override
  String get weightTargetSlightGain => 'Pequeno ganho';

  @override
  String get weightTargetModerateGain => 'Ganho moderado';

  @override
  String get weightTargetStrongGain => 'Grande ganho';

  @override
  String get calculateNutritionTargets => 'Calcular metas nutricionais';

  @override
  String get calculationInfo => 'Informações sobre o cálculo';

  @override
  String get calculationInfoText1 =>
      'O cálculo da ingestão de calorias baseia-se na fórmula Mifflin-St.Jeor. Esteja ciente de que ela funciona apenas como uma aproximação dos valores do mundo real. Esses valores diferem de pessoa para pessoa, pois suas condições corporais podem divergir em maior ou menor grau.';

  @override
  String get formulaForFemales => 'Fórmula para mulheres';

  @override
  String get weightInKg => 'Peso em kg';

  @override
  String get heightInCm => 'Altura em cm';

  @override
  String get ageInYears => 'Idade em anos';

  @override
  String get formulaForMales => 'Fórmula para homens';

  @override
  String get calculationInfoText2 =>
      'O resultado desse cálculo é definido como a taxa metabólica basal (TMB). Ela é multiplicada pelo seu fator de atividade para receber sua conversão total de energia. Essa é sua ingestão de energia calculada em kcal.';

  @override
  String get calculatedNutritionTargets => 'Metas nutricionais calculadas';

  @override
  String get calculatedNutritionTargetsHint =>
      'Sinta-se à vontade para editar as metas calculadas de acordo com suas necessidades antes de aplicá-las.';

  @override
  String get percentOfCalories => '% de kcal';

  @override
  String get proteinRatio => 'Proporção de proteína';

  @override
  String get carbsRatio => 'Proporção de carboidrato';

  @override
  String get fatRatio => 'Proporção de gordura';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Estabeleça também metas de micronutrientes com base na idade e no sexo';

  @override
  String get apply => 'Aplicar';

  @override
  String get targetsApplied => 'As metas nutricionais foram aplicadas';

  @override
  String get targetsApplyError =>
      'As metas nutricionais não puderam ser aplicadas';

  @override
  String get totalEnergy => 'Energia total';

  @override
  String get energyDistributionChartMissingHint =>
      'O gráfico de distribuição de energia só é exibido se você definiu uma meta de calorias e uma meta para pelo menos um dos macronutrientes.';

  @override
  String get percentOfTotalEnergy => 'Porcentagem da energia total';

  @override
  String get selectedMacronutrient => 'Macronutriente selecionado';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calorias, proteínas, carboidratos, gorduras';

  @override
  String get display => 'Tela';

  @override
  String get displayHint =>
      'Personalize a interface do usuário de acordo com suas necessidades';

  @override
  String get groupFoodsToMeals => 'Agrupar alimentos em refeições';

  @override
  String get groupFoodsToMealsHint =>
      'Agrupa automaticamente os alimentos consumidos em intervalos muito curtos como uma refeição';

  @override
  String mealAt(String time) {
    return 'Refeição em $time';
  }

  @override
  String get databaseManagement => 'Gerenciamento de banco de dados';

  @override
  String get databaseManagementHint =>
      'Selecione os bancos de dados de alimentos a serem consultados';

  @override
  String get storedOnDevice => 'Armazenado no dispositivo';

  @override
  String get swissFoodCompositionDatabase =>
      'Banco de dados suíço de composição de alimentos';

  @override
  String get version => 'Versão';

  @override
  String get language => 'Língua';

  @override
  String get languages => 'Línguas';

  @override
  String get german => 'Alemão';

  @override
  String get italian => 'Italiano';

  @override
  String get french => 'Francês';

  @override
  String get publisher => 'Editor(a)';

  @override
  String get switzerland => 'Suíça';

  @override
  String get generalInformation => 'Informações gerais';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Esse banco de dados oferece cerca de 1.100 produtos gerais e muitos micronutrientes. Como é armazenado em seu dispositivo, ele funciona offline.';

  @override
  String get source => 'Fonte';

  @override
  String get tapHereForFurtherInformation =>
      'Toque aqui para mais informações.';

  @override
  String get serverBased => 'Baseado em servidor';

  @override
  String get openFoodFactsVariousLanguagesText => 'Diversos';

  @override
  String get nonProfitInstitution => 'Instituição sem fins lucrativos';

  @override
  String get france => 'França';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Esteja ciente de que, como esse banco de dados é muito grande, as informações podem estar incompletas ou desatualizadas. Todos os usuários registrados podem atualizar os valores dos nutrientes. A adição de novos produtos é possível sem a criação de uma conta. A desativação desse banco de dados também inclui a digitalização EAN, portanto, você só poderá digitalizar alimentos personalizados pelo código EAN.';

  @override
  String get termsOfUse => 'Termos de uso';

  @override
  String get openFoodFactsTermsText =>
      'Ao ativar esse banco de dados, você concorda com os termos.';

  @override
  String get contribute => 'Contribuir';

  @override
  String get databaseContributeText =>
      'Veja como você pode ajudar a melhorar esse banco de dados.';

  @override
  String get english => 'Inglês';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'O FoodData Central é um banco de dados de alimentos e nutrientes do Departamento de Agricultura dos EUA. Os dados são de domínio público e contêm cerca de 200 alimentos básicos e mais de 380.000 alimentos de marca.';

  @override
  String get backupAndRestore => 'Backup e Restauração';

  @override
  String get backupAndRestoreHint =>
      'Armazene seus dados localmente ou em um armazenamento em nuvem compatível com WebDAV, como o Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Aviso: Configurações, personalizações e metas ainda não estão incluídas!';

  @override
  String get successfullyCreatedBackup => 'Backup criado com sucesso';

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

    return 'Exportou $customFoodsCountString alimentos personalizados e $trackedFoodsCountString alimentos rastreados';
  }

  @override
  String get successfullyRestoredBackup => 'Backup restaurado com sucesso';

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

    return 'Importou $customFoodsCountString alimentos personalizados e $trackedFoodsCountString alimentos rastreados';
  }

  @override
  String get createWebDAVBackup => 'Criar backup WebDAV';

  @override
  String get restoreWebDAVBackup => 'Restaurar backup WebDAV';

  @override
  String get createLocalBackup => 'Criar backup local';

  @override
  String get restoreLocalBackup => 'Restaurar backup local';

  @override
  String get aboutEnergize => 'Sobre o Energize';

  @override
  String get license => 'licença';

  @override
  String get allLicenses => 'Todas as licenças';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get reportIssue => 'Relatar problema';

  @override
  String get proposeImprovement => 'Propor melhorias';

  @override
  String get sourceCode => 'Código-fonte';

  @override
  String get translation => 'Tradução';

  @override
  String get contributors => 'Contribuintes';

  @override
  String get thanksToContributorsText =>
      'Obrigado a todas as pessoas que contribuíram para o Energize. Graças à sua ajuda, o Energize pôde se tornar o que é hoje.';

  @override
  String get contributionTypeCodeAndConversations => 'Código e conversas';

  @override
  String get contributionTypeAcrylicPicture => 'Quadro em acrílico';

  @override
  String get allTranslatorsOnWeblate => 'Todos os tradutores no Weblate';

  @override
  String get contact => 'Contato';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint =>
      'Por favor, use isso apenas para outros tópicos além dos mencionados acima';

  @override
  String get supportMeByDonating => 'Apoie-me fazendo uma doação';

  @override
  String get donate => 'Doação';

  @override
  String get donationText =>
      'Se você quiser apoiar o desenvolvimento com uma doação, será muito bem-vindo! Criar este aplicativo é muito divertido, mas também é uma tarefa que consome muito tempo e, às vezes, leva a um pouco de frustração :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Endereço Bitcoin copiado para a área de transferência';

  @override
  String get bankAccountOrCreditCard => 'Conta bancária ou cartão de crédito';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Você é bem-vindo a me escrever um e-mail para obter mais opções de doação';

  @override
  String get energyAndMacronutrients => 'Energia e macronutrientes';

  @override
  String get vitamins => 'Vitaminas';

  @override
  String get vitaminA => 'Vitamina A';

  @override
  String get vitaminB1 => 'B1 (Tiamina)';

  @override
  String get vitaminB2 => 'B2 (Riboflavina)';

  @override
  String get vitaminB3 => 'B3 (Niacina)';

  @override
  String get vitaminB5 => 'B5 (Ácido pantotênico)';

  @override
  String get vitaminB6 => 'Vitamina B6';

  @override
  String get vitaminB7 => 'B7 (Biotina)';

  @override
  String get vitaminB9 => 'B9 (Folato)';

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
  String get minerals => 'Minerais';

  @override
  String get majorMinerals => 'Minerais principais';

  @override
  String get calcium => 'Cálcio';

  @override
  String get chloride => 'Cloreto';

  @override
  String get magnesium => 'Magnésio';

  @override
  String get phosphorous => 'Fósforo';

  @override
  String get potassium => 'Potássio';

  @override
  String get sodium => 'Sódio';

  @override
  String get traceElements => 'Microelementos';

  @override
  String get chromium => 'Cromo';

  @override
  String get iron => 'Ferro';

  @override
  String get fluorine => 'Flúor';

  @override
  String get iodine => 'Iodo';

  @override
  String get copper => 'Cobre';

  @override
  String get manganese => 'Manganês';

  @override
  String get molybdenum => 'Molibdênio';

  @override
  String get selenium => 'Selênio';

  @override
  String get zinc => 'Zinco';

  @override
  String get fats => 'Gorduras';

  @override
  String get monounsaturatedFat => 'Gordura monoinsaturada';

  @override
  String get polyunsaturatedFat => 'Gordura poli-insaturada';

  @override
  String get omega3 => 'Ômega 3';

  @override
  String get omega6 => 'Ômega 6';

  @override
  String get saturatedFat => 'Gordura saturada';

  @override
  String get transfat => 'Gordura trans';

  @override
  String get cholesterol => 'Colesterol';

  @override
  String get fiber => 'Fibra';

  @override
  String get sugar => 'Açúcar';

  @override
  String get sugarAlcohol => 'Álcool de açúcar';

  @override
  String get starch => 'Amido';

  @override
  String get other => 'Outros';

  @override
  String get water => 'Água';

  @override
  String get caffeine => 'Cafeína';

  @override
  String get alcohol => 'Álcool';

  @override
  String get salt => 'Sal';
}
