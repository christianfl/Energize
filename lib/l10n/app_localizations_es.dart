// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Registre sus comidas y nutrición de una manera fácil y rápida.';

  @override
  String get appDescription =>
      'Registre sus comidas y nutrición de una forma fácil y rápida. Escanee sus productos o busque manualmente en diferentes bases de datos.';

  @override
  String get ok => 'De acuerdo';

  @override
  String get fieldMandatory => 'Introduzca un valor';

  @override
  String get onlyNumbersAllowed => 'Sólo se permiten números';

  @override
  String get undo => 'Deshacer';

  @override
  String get deleted => 'borrado';

  @override
  String get loading => 'Cargando';

  @override
  String somethingNotFound(String something) {
    return '$something no encontrado';
  }

  @override
  String get unknownErrorText => 'Se ha producido un error desconocido';

  @override
  String get tracking => 'Siguiendo';

  @override
  String get energy => 'Energía';

  @override
  String get protein => 'Proteína';

  @override
  String get carbs => 'Carbohidratos';

  @override
  String get fat => 'Grasa';

  @override
  String get detailedSummary => 'Resumen detallado';

  @override
  String get dayComplete => 'Día completo';

  @override
  String get markedDayAsComplete => 'Día marcado como completo';

  @override
  String get dayIncomplete => 'Día incompleto';

  @override
  String get unmarkedDayAsComplete => 'Día desmarcado como completo';

  @override
  String get trackFood => 'Registrar comida';

  @override
  String get timeSetHelpText =>
      'Al realizar el seguimiento de los alimentos, este tiempo se utilizará como una plantilla para la fecha de consumo.';

  @override
  String get useAsTemplateForCustomFood =>
      'Utilizar como plantilla para comida personalizada';

  @override
  String get additionalInformation => 'Información adicional';

  @override
  String get completeProductName => 'Nombre completo del producto';

  @override
  String get addedDate => 'Añadido';

  @override
  String get consumedDate => 'Consumido';

  @override
  String get nutrients => 'Nutrientes';

  @override
  String get labelingEu => 'Etiquetado (UE)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit contener';
  }

  @override
  String get dailyTarget => 'meta diaria';

  @override
  String get general => 'General';

  @override
  String get micronutrients => 'Micronutrientes';

  @override
  String get editTrackedFood => 'Editar comida registrada';

  @override
  String get scanBarcode => 'Escanear código de barras';

  @override
  String get searchFood => 'Buscar alimento';

  @override
  String get productOrBrand => 'Producto o marca';

  @override
  String get searchError => 'Error al buscar';

  @override
  String get searchErrorHint =>
      'No se pudo acceder al menos a una base de datos de alimentos. Inténtalo de nuevo más tarde o deshabilita temporalmente las bases de datos que no funcionan en la configuración.';

  @override
  String get affectedDatabases => 'Bases de datos afectadas';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Ni en los alimentos personalizados ni en Open Food Facts';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'No se encuentran en alimentos personalizados, Open Food Facts necesita acceso a Internet';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'No se ha encontrado en los alimentos personalizados, la búsqueda Open Food Facts tuvo un error';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'No se encuentra en alimentos personalizados, Open Food Facts no está activado';

  @override
  String get barcodeScanningUnsupported =>
      'El escaneo de códigos de barras con la cámara del dispositivo es actualmente sólo compatible en Android.';

  @override
  String get customFood => 'Alimento personalizado';

  @override
  String get searchCustomFood => 'Buscar alimento personalizado';

  @override
  String get addCustomFood => 'Añadir alimento personalizado';

  @override
  String get editCustomFood => 'Editar alimento personalizado';

  @override
  String get title => 'Título';

  @override
  String get barcode => 'Código de barras';

  @override
  String get settings => 'Configuración';

  @override
  String get yourPersonalNutritionNeeds =>
      'Sus necesidades nutricionales personales';

  @override
  String get personalNutritionNeedsHint =>
      'Calcular sus necesidades nutricionales personales o configúrelas usted mismo';

  @override
  String get calculate => 'Calcular';

  @override
  String get energyDistribution => 'Distribución de energía';

  @override
  String get yourBody => 'Su cuerpo';

  @override
  String get age => 'Edad';

  @override
  String get years => 'años';

  @override
  String get sex => 'Sexo';

  @override
  String get female => 'Mujer';

  @override
  String get male => 'Hombre';

  @override
  String get weight => 'Peso';

  @override
  String get height => 'Altura corporal';

  @override
  String get behaviourAndTarget => 'Actividad y objetivo';

  @override
  String get activityLevel => 'Nivel de Actividad';

  @override
  String get activityLevel1_0 => 'No hace absolutamente nada a parte de dormir';

  @override
  String get activityLevel1_1 => 'Está acostado en la cama todo el día';

  @override
  String get activityLevel1_2 => 'Esta sentado en la cama todo el día';

  @override
  String get activityLevel1_3 => 'No sale fuera a menudo';

  @override
  String get activityLevel1_4 => 'No es nada activo';

  @override
  String get activityLevel1_5 => 'Hace trabajo de oficina';

  @override
  String get activityLevel1_6 =>
      'Hace un poco de actividad, trabaja y a veces hace deporte';

  @override
  String get activityLevel1_7 => 'Hace ejercicio a menudo';

  @override
  String get activityLevel1_8 => 'Hace ejercicio intenso regularmente';

  @override
  String get activityLevel1_9 =>
      'Es muy activo, hace ejercicio y no tiene un trabajo de oficina';

  @override
  String get activityLevel2_0 =>
      'Realiza un trabajo físico y hace ejercicio intenso con regularidad';

  @override
  String get noActivityLevelDescription =>
      'No hay descripción de nivel de actividad';

  @override
  String get weightTarget => 'Peso objetivo';

  @override
  String get weightTargetStrongLoss => 'Pérdida fuerte';

  @override
  String get weightTargetModerateLoss => 'Pérdida moderada';

  @override
  String get weightTargetSlightLoss => 'Pérdida ligera';

  @override
  String get weightTargetMaintaining => 'Mantenimiento';

  @override
  String get weightTargetSlightGain => 'Ganancia ligera';

  @override
  String get weightTargetModerateGain => 'Ganancia moderada';

  @override
  String get weightTargetStrongGain => 'Ganancia fuerte';

  @override
  String get calculateNutritionTargets => 'Calcular objetivos nutricionales';

  @override
  String get calculationInfo => 'Información sobre el cálculo';

  @override
  String get calculationInfoText1 =>
      'Los cálculos de ingesta de calorías están basados en la fórmula Mifflin-St.Jeor. Tenga en cuenta que los valores son una aproximación del mundo real. Estos pueden diferir más o menos entre diferentes personas debido a sus condiciones físicas.';

  @override
  String get formulaForFemales => 'Fórmula para mujeres';

  @override
  String get weightInKg => 'Peso en kg';

  @override
  String get heightInCm => 'Altura en cm';

  @override
  String get ageInYears => 'Edad en años';

  @override
  String get formulaForMales => 'Fórmula para hombres';

  @override
  String get calculationInfoText2 =>
      'El resultado de este cálculo está definido por la tasa de metabolismo basal (TMB). Se obtiene multiplicándolo por el factor de su actividad para obtener el total de energía necesaria. Este representa la cantidad de energía que necesita en kcal.';

  @override
  String get calculatedNutritionTargets => 'Objetivos nutricionales calculados';

  @override
  String get calculatedNutritionTargetsHint =>
      'Puede editar libremente los objetivos de acuerdo con sus necesidades antes de guardarlos.';

  @override
  String get percentOfCalories => '% de kcal';

  @override
  String get proteinRatio => 'Ratio de proteínas';

  @override
  String get carbsRatio => 'Ratio de carbohidratos';

  @override
  String get fatRatio => 'Ratio de grasa';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Establecer también los objetivos de micronutrientes basados en la edad y el género';

  @override
  String get apply => 'Aplicar';

  @override
  String get targetsApplied => 'Los objetivos nutricionales fueron aplicados';

  @override
  String get targetsApplyError =>
      'Los objetivos nutricionales no pudieron ser aplicados';

  @override
  String get totalEnergy => 'Energía total';

  @override
  String get energyDistributionChartMissingHint =>
      'El gráfico de distribución de energía sólo se muestra si ha establecido un objetivo de calorías y un objetivo para al menos uno de los macronutrientes.';

  @override
  String get percentOfTotalEnergy => 'Porcentaje de energía total';

  @override
  String get selectedMacronutrient => 'Macronutriente seleccionado';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Calorías, proteínas, carbohidratos, grasas';

  @override
  String get display => 'Apariencia';

  @override
  String get displayHint =>
      'Personalizar la interfaz de usuario a sus necesidades';

  @override
  String get groupFoodsToMeals => 'Agrupar alimentos en comidas';

  @override
  String get groupFoodsToMealsHint =>
      'Agrupa automáticamente alimentos consumidos en intervalos muy cortos como comida';

  @override
  String get preferServingSizes => 'Prefer serving sizes';

  @override
  String get preferServingSizesHint =>
      'When tracking new food, a serving size will be preselected, if any';

  @override
  String mealAt(String time) {
    return 'Comida a las $time';
  }

  @override
  String get databaseManagement => 'Gestión de la base de datos';

  @override
  String get databaseManagementHint =>
      'Seleccione que base de datos de alimentos consultar';

  @override
  String get storedOnDevice => 'Guardado en el dispositivo';

  @override
  String get swissFoodCompositionDatabase =>
      'Base de datos suiza de valores nutricionales';

  @override
  String get version => 'Versión';

  @override
  String get language => 'Idioma';

  @override
  String get languages => 'Idiomas';

  @override
  String get german => 'Alemán';

  @override
  String get italian => 'Italiano';

  @override
  String get french => 'Francés';

  @override
  String get publisher => 'Editor';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Oficina Federal de Seguridad Alimentaria y Veterinaria';

  @override
  String get switzerland => 'Suiza';

  @override
  String get generalInformation => 'Información general';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Esta base de datos ofrece más de 1.100 productos generales y muchos micronutrientes. Además al guardarse en su dispositivo funciona sin conexión.';

  @override
  String get source => 'Fuente';

  @override
  String get tapHereForFurtherInformation => 'Toque aquí para más información.';

  @override
  String get serverBased => 'Basado en servidor';

  @override
  String get openFoodFactsVariousLanguagesText => 'Varios';

  @override
  String get nonProfitInstitution => 'Institución sin ánimo de lucro';

  @override
  String get france => 'Francia';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Tenga en cuenta que aunque esta base de datos es muy grande, el contenido puede ser incompleto u obsoleto. Todo usuario registrado puede actualizar los valores de nutrientes. Añadir nuevos productos es posible sin crear cuenta alguna. Si desactiva esta base de datos, también desactivará el escaneo EAN, por lo que sólo podrá escanear alimentos personalizados por su código EAN.';

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get openFoodFactsTermsText =>
      'Al activar esta base de datos acepta sus términos.';

  @override
  String get contribute => 'Contribuir';

  @override
  String get databaseContributeText =>
      'Mire como puede ayudar a mejorar esta base de datos.';

  @override
  String get english => 'Inglés';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central es una base de datos de alimentos y nutricional del departamento de agricultura de los EE.UU. Los datos incluidos son de dominio público y contiene unas 200 fundaciones alimentarias y 380.000 marcas.';

  @override
  String get backupAndRestore => 'Copia y Restauración de seguridad';

  @override
  String get backupAndRestoreHint =>
      'Almacena tus datos localmente o en un almacenamiento en la nube compatible con WebDAV como Nextcloud';

  @override
  String get missingBackupPartsHint =>
      'Advertencia: ¡Las configuraciones, personalizaciones y objetivos aún no están incluidos!';

  @override
  String get successfullyCreatedBackup =>
      'Copia de seguridad creada correctamente';

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

    return 'Exportado $customFoodsCountString alimentos personalizados y $trackedFoodsCountString alimentos rastreados';
  }

  @override
  String get successfullyRestoredBackup =>
      'Copia de seguridad restaurada correctamente';

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

    return 'Importados $customFoodsCountString alimentos personalizados y $trackedFoodsCountString alimentos rastreados';
  }

  @override
  String get createWebDAVBackup => 'Crear copia de seguridad de WebDAV';

  @override
  String get webDAVSettings => 'Configuración de WebDAV';

  @override
  String get serverURL => 'URL del Servidor';

  @override
  String get invalidURL => 'La URL no es válida';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get pathAndFilename => 'Ruta y nombre del archivo';

  @override
  String energizeBackup(String appName) {
    return '$appName Copia de seguridad';
  }

  @override
  String get backupPasswordNotice =>
      'Sin la contraseña de la copia de seguridad, no es posible restaurarla.';

  @override
  String get restoreWebDAVBackup => 'Restaurar copia de seguridad de WebDAV';

  @override
  String get createLocalBackup => 'Crear copia de seguridad local';

  @override
  String get restoreLocalBackup => 'Restaurar copia de seguridad local';

  @override
  String get aboutEnergize => 'Sobre Energize';

  @override
  String get license => 'licencia';

  @override
  String get allLicenses => 'Todas las licencias';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get logs => 'Logs';

  @override
  String get reportIssue => 'Notificar error';

  @override
  String get proposeImprovement => 'Proponer mejoras';

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get translation => 'Traducción';

  @override
  String get contributors => 'Colaboradores';

  @override
  String get thanksToContributorsText =>
      'Gracias a todas las personas que han contribuido a Energize. Gracias a su ayuda, Energize pudo convertirse en lo que es ahora.';

  @override
  String get contributionTypeCodeAndConversations => 'Código y discusiones';

  @override
  String get contributionTypeAcrylicPicture => 'Imagen acrílica';

  @override
  String get allTranslatorsOnWeblate => 'Todos los traductores de Weblate';

  @override
  String get contact => 'Contacto';

  @override
  String get email => 'Correo';

  @override
  String get emailHint =>
      'Por favor, utilice esto solo para otros temas además de los anteriores';

  @override
  String get supportMeByDonating => 'Ayúdeme donando';

  @override
  String get donate => 'Donar';

  @override
  String get donationText =>
      'Si quiere ayudar al desarrollo con una donación, es más que bienvenida. Crear esta aplicación es muy ameno pero también consume mucho tiempo y a veces un poco de frustración aparece :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'La dirección de Bitcoin se copió al portapapeles';

  @override
  String get bankAccountOrCreditCard => 'Cuenta bancaria o tarjeta de crédito';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Puede enviarme un correo electrónico si necesita más opciones para donar';

  @override
  String get energyAndMacronutrients => 'Energía y macronutrientes';

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
  String get minerals => 'Minerales';

  @override
  String get majorMinerals => 'Minerales principales';

  @override
  String get calcium => 'Calcio';

  @override
  String get chloride => 'Cloruro';

  @override
  String get magnesium => 'Magnesio';

  @override
  String get phosphorous => 'Fósforo';

  @override
  String get potassium => 'Potasio';

  @override
  String get sodium => 'Sodio';

  @override
  String get traceElements => 'Oligoelementos';

  @override
  String get chromium => 'Cromo';

  @override
  String get iron => 'Hierro';

  @override
  String get fluorine => 'Flúor';

  @override
  String get iodine => 'Yodo';

  @override
  String get copper => 'Cobre';

  @override
  String get manganese => 'Manganeso';

  @override
  String get molybdenum => 'Molibdeno';

  @override
  String get selenium => 'Selenio';

  @override
  String get zinc => 'Zinc';

  @override
  String get fats => 'Grasas';

  @override
  String get monounsaturatedFat => 'Grasas monosaturadas';

  @override
  String get polyunsaturatedFat => 'Grasas polisaturadas';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Grasas saturadas';

  @override
  String get transfat => 'Grasas trans';

  @override
  String get cholesterol => 'Colesterol';

  @override
  String get fiber => 'Fibra';

  @override
  String get sugar => 'Azúcar';

  @override
  String get sugarAlcohol => 'Glicitol';

  @override
  String get starch => 'Almidón';

  @override
  String get other => 'Otros';

  @override
  String get water => 'Agua';

  @override
  String get caffeine => 'Cafeína';

  @override
  String get alcohol => 'Alcohol';

  @override
  String get salt => 'Sal';

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
  String get testCustomFood1Name => 'Tortitas';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Pan tostado';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Okra frita';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Huevo Escocés';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Pudín de Yorkshire';

  @override
  String get testCustomFood5Calories => '259';
}
