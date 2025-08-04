// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort => '轻松快速地记录您的饮食和帮助您了解营养摄入情况。';

  @override
  String get appDescription =>
      '轻松快速地记录您的饮食和帮助您了解营养摄入情况。扫描食品条形码或者在不同的数据库中手动搜索进行记录。';

  @override
  String get ok => '确定';

  @override
  String get fieldMandatory => '请输入一个值';

  @override
  String get onlyNumbersAllowed => '只允许输入数字';

  @override
  String get undo => '取消';

  @override
  String get deleted => '删除';

  @override
  String get loading => '加载中';

  @override
  String somethingNotFound(String something) {
    return '没有找到$something';
  }

  @override
  String get unknownErrorText => '出现未知错误';

  @override
  String get tracking => '营养情况';

  @override
  String get energy => '热量';

  @override
  String get protein => '蛋白质';

  @override
  String get carbs => '碳水化合物';

  @override
  String get fat => '脂肪';

  @override
  String get detailedSummary => '详细数据';

  @override
  String get dayComplete => '标记为今日已完成';

  @override
  String get markedDayAsComplete => '已将日期标记为已完成';

  @override
  String get dayIncomplete => '标记为今日未完成';

  @override
  String get unmarkedDayAsComplete => '已将日期标记为未完成';

  @override
  String get trackFood => '食物营养成分';

  @override
  String get timeSetHelpText => '当控制饮食时，这个时间将被用作摄入营养的截止时间。';

  @override
  String get useAsTemplateForCustomFood => '用作自定义食物的模板';

  @override
  String get additionalInformation => '附加说明';

  @override
  String get completeProductName => '完整的产品名称';

  @override
  String get addedDate => '添加';

  @override
  String get consumedDate => '摄入';

  @override
  String get nutrients => '营养素';

  @override
  String get labelingEu => '标签';

  @override
  String amountContain(String amountWithUnit) {
    return '每$amountWithUnit 包含';
  }

  @override
  String get dailyTarget => '每日目标';

  @override
  String get general => '大致信息';

  @override
  String get micronutrients => '微量营养素';

  @override
  String get editTrackedFood => '编辑食物营养信息';

  @override
  String get scanBarcode => '扫描条形码';

  @override
  String get searchFood => '搜索食物';

  @override
  String get productOrBrand => '搜索食物或品牌';

  @override
  String get searchError => '搜索过程中出错';

  @override
  String get searchErrorHint => '至少有一个食品成分数据库无法连接。请稍后再试，或者暂时在设置中禁用无法正常使用的数据库。';

  @override
  String get affectedDatabases => '受影响的数据库';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      '无论是在 自定义食物 还是在 Open Food Facts 食品数据库中都没有找到相关信息';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      '在 自定义食物 中未找到相关信息，Open Food Facts 食品数据库需要联网才能使用';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      '在 自定义食物 中未找到相关信息，Open Food Facts 食品数据库搜索出错';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      '在 自定义食物 中未找到相关信息，Open Food Facts 食品数据库未开启';

  @override
  String get barcodeScanningUnsupported => '扫描条形码功能目前仅在Android上支持。';

  @override
  String get customFood => '自定义食物';

  @override
  String get searchCustomFood => '搜索自定义食物';

  @override
  String get addCustomFood => '添加自定义食物';

  @override
  String get editCustomFood => '编辑自定义食物';

  @override
  String get title => '食物名称';

  @override
  String get barcode => '食品条形码';

  @override
  String get settings => '设置';

  @override
  String get yourPersonalNutritionNeeds => '营养需求';

  @override
  String get personalNutritionNeedsHint => '计算您的营养需求，或者自定义您的营养需求';

  @override
  String get calculate => '计算';

  @override
  String get energyDistribution => '能量百分比';

  @override
  String get yourBody => '身体数据';

  @override
  String get age => '年龄';

  @override
  String get years => '岁';

  @override
  String get sex => '性别';

  @override
  String get female => '女性';

  @override
  String get male => '男性';

  @override
  String get weight => '体重';

  @override
  String get height => '身高';

  @override
  String get behaviourAndTarget => '行为和目标';

  @override
  String get activityLevel => '活动级别(PAL)';

  @override
  String get activityLevel1_0 => '基本上除了睡觉什么都不做';

  @override
  String get activityLevel1_1 => '整天都躺在床上';

  @override
  String get activityLevel1_2 => '一整天都坐在床上';

  @override
  String get activityLevel1_3 => '不经常外出';

  @override
  String get activityLevel1_4 => '不怎么运动';

  @override
  String get activityLevel1_5 => '长时间坐着工作/学习';

  @override
  String get activityLevel1_6 => '有点活跃，有时做运动';

  @override
  String get activityLevel1_7 => '经常锻炼';

  @override
  String get activityLevel1_8 => '经常努力锻炼';

  @override
  String get activityLevel1_9 => '非常活跃，经常锻炼，没有久坐';

  @override
  String get activityLevel2_0 => '从事体力活动，并定期努力锻炼';

  @override
  String get noActivityLevelDescription => '没有活动级别描述';

  @override
  String get weightTarget => '重量目标';

  @override
  String get weightTargetStrongLoss => '大幅减少';

  @override
  String get weightTargetModerateLoss => '中度减少';

  @override
  String get weightTargetSlightLoss => '少量减少';

  @override
  String get weightTargetMaintaining => '维持现状';

  @override
  String get weightTargetSlightGain => '少量增长';

  @override
  String get weightTargetModerateGain => '中度增长';

  @override
  String get weightTargetStrongGain => '大幅增长';

  @override
  String get calculateNutritionTargets => '计算营养目标';

  @override
  String get calculationInfo => '关于计算的说明';

  @override
  String get calculationInfoText1 =>
      '卡路里摄入量的计算是基于 Mifflin-St.Jeor公式。该计算结果只能作为实际摄入量的近似值，因为每个人的身体状况或多或少存在差异，所需的卡路里摄入量也不同。';

  @override
  String get formulaForFemales => '女性公式';

  @override
  String get weightInKg => '体重(kg)';

  @override
  String get heightInCm => '身高(cm)';

  @override
  String get ageInYears => '年龄(岁)';

  @override
  String get formulaForMales => '男性公式';

  @override
  String get calculationInfoText2 =>
      '该计算结果称为基础代谢率(BMR)。将它与你的活动系数相乘，就能得出你的总能量消耗。这就是您所需的能量摄入量，单位是kcal(千卡)。';

  @override
  String get calculatedNutritionTargets => '设置营养目标';

  @override
  String get calculatedNutritionTargetsHint => '请根据自身情况修改各项指标。';

  @override
  String get percentOfCalories => '% kcal(千卡)';

  @override
  String get proteinRatio => '蛋白质比率';

  @override
  String get carbsRatio => '碳水化合物比率';

  @override
  String get fatRatio => '脂肪比率';

  @override
  String get alsoSetMicronutrientsSwitch => '根据年龄和性别自动计算所需微量营养素目标';

  @override
  String get alsoSetMicronutrientsHint =>
      'Based on DGE reference values from 2022 with a partly update from 2025';

  @override
  String get apply => '保存';

  @override
  String get targetsApplied => '已设定营养指标';

  @override
  String get targetsApplyError => '营养目标无法实施';

  @override
  String get totalEnergy => '摄入能量';

  @override
  String get energyDistributionChartMissingHint =>
      '只有您设定了卡路里目标和至少一种常量营养素的目标时，才会显示能量分布图。';

  @override
  String get percentOfTotalEnergy => '摄入能量的百分比';

  @override
  String get selectedMacronutrient => '选择营养物质';

  @override
  String get energyAndMacronutrientsTargetsHint => '卡路里，蛋白质，碳水化合物，脂肪';

  @override
  String get display => '显示';

  @override
  String get displayHint => '根据您的需要自定义用户界面';

  @override
  String get groupFoodsToMeals => '将食物分组到正餐';

  @override
  String get groupFoodsToMealsHint => '自动将短时间内多次食用归为一餐';

  @override
  String get preferServingSizes => '首选份量';

  @override
  String get preferServingSizesHint => '当添加新的摄入食物时，如果有的话，一份食物的量将被预先选定';

  @override
  String mealAt(String time) {
    return '在 $time 用餐';
  }

  @override
  String get databaseManagement => '数据库管理';

  @override
  String get databaseManagementHint => '选择要查询的食品数据库';

  @override
  String get storedOnDevice => '存储在设备上的数据库';

  @override
  String get swissFoodCompositionDatabase => '瑞士食物成分数据库';

  @override
  String get version => '版本';

  @override
  String get language => '语言';

  @override
  String get languages => '语言';

  @override
  String get german => '德语';

  @override
  String get italian => '意大利语';

  @override
  String get french => '法语';

  @override
  String get publisher => '出版者';

  @override
  String get federalFoodSafetyAndVeterinaryOffice => '联邦食品安全和兽医办公室';

  @override
  String get switzerland => '瑞士';

  @override
  String get generalInformation => '说明';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      '该数据库提供了大约1100种常见食品以及众多微量营养素数据。由于它存储在您的设备上，所以无需联网即可使用。';

  @override
  String get source => '资料来源';

  @override
  String get tapHereForFurtherInformation => '点击此处了解更多信息。';

  @override
  String get serverBased => '基于服务器的数据库';

  @override
  String get openFoodFactsVariousLanguagesText => '支持多种语言';

  @override
  String get nonProfitInstitution => '非营利机构';

  @override
  String get france => '法国';

  @override
  String get openFoodFactsGeneralInformationText =>
      '请注意，虽然这个数据库规模庞大，但其中的信息可能并不完整或者已经过时。每个注册用户都可以更新食品营养值。无需创建帐户即可添加新产品。停用这个数据库也包括停用条形码扫描功能，关闭之后您将只能通过条形码搜索自定义食物。';

  @override
  String get termsOfUse => '使用条款';

  @override
  String get openFoodFactsTermsText => '激活此数据库即表示您同意这些条款。';

  @override
  String get contribute => '帮助完善数据库';

  @override
  String get databaseContributeText => '了解可以如何协助完善这个数据库。';

  @override
  String get english => '英语';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central是美国农业部建立的一个有关食品和营养成分的数据库。该数据库属于公共财产，涵盖约200种常见食品以及超过38万种品牌食品的信息。';

  @override
  String get backupAndRestore => '备份和恢复';

  @override
  String get backupAndRestoreHint => '将您的数据存储在本地或兼容WebDAV的云存储上，如Nextcloud';

  @override
  String get missingBackupPartsHint => '警告:尚未包括设置、个性化和目标！';

  @override
  String get successfullyCreatedBackup => '成功创建备份';

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

    return '已导出$customFoodsCountString个自定义食物和$trackedFoodsCountString个已记录食品';
  }

  @override
  String get successfullyRestoredBackup => '成功恢复备份';

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

    return '已导入$customFoodsCountString个自定义食物和$trackedFoodsCountString个已记录食品';
  }

  @override
  String get createWebDAVBackup => '创建WebDAV备份';

  @override
  String get webDAVSettings => 'WebDAV设置';

  @override
  String get serverURL => '服务URL';

  @override
  String get invalidURL => '该URL无效';

  @override
  String get username => '用户名称';

  @override
  String get password => '密码';

  @override
  String get pathAndFilename => '路径和文件名';

  @override
  String energizeBackup(String appName) {
    return '$appName备份';
  }

  @override
  String get backupPasswordNotice => '如果备份密码忘记，就无法恢复备份。';

  @override
  String get restoreWebDAVBackup => '恢复WebDAV备份';

  @override
  String get createLocalBackup => '创建本地备份';

  @override
  String get restoreLocalBackup => '恢复本地备份';

  @override
  String get aboutEnergize => '关于Energize';

  @override
  String get license => '许可证';

  @override
  String get allLicenses => '所有许可证';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get logs => '日志';

  @override
  String get reportIssue => '报告问题';

  @override
  String get proposeImprovement => '提出改进建议';

  @override
  String get sourceCode => '源代码';

  @override
  String get translation => '翻译';

  @override
  String get contributors => '贡献者';

  @override
  String get thanksToContributorsText =>
      '感谢所有为Energize做出贡献的人，有了你们的帮助，Energize才有如今的模样。';

  @override
  String get contributionTypeCodeAndConversations => '代码编写与沟通协调';

  @override
  String get contributionTypeAcrylicPicture => '丙烯画画家(应用图标参考)';

  @override
  String get allTranslatorsOnWeblate => '以及Weblate上的所有翻译贡献者';

  @override
  String get contact => '通过电子邮件联系我';

  @override
  String get email => '电子邮件';

  @override
  String get emailHint => '请仅将此用于上述选项之外其他方面的问题';

  @override
  String get supportMeByDonating => '通过捐赠支持我';

  @override
  String get donate => '捐赠';

  @override
  String get donationText =>
      '如果你想通过捐赠来支持软件开发，我们非常欢迎你这样做！开发这个应用程序很有趣，但同时也是一项非常耗时的任务，有时会遇到一些挫折:-)。';

  @override
  String get bitcoinAddressCopiedToClipboard => '已复制比特币地址到剪贴板';

  @override
  String get bankAccountOrCreditCard => '银行账户或信用卡';

  @override
  String get writeMeAnEmailForFurtherDonationOptions => '欢迎您给我写电子邮件，了解更多的捐赠选择';

  @override
  String get energyAndMacronutrients => '能量和宏量营养素';

  @override
  String get vitamins => '维生素';

  @override
  String get vitaminA => '维生素A';

  @override
  String get vitaminB1 => '维生素B1(硫胺素)';

  @override
  String get vitaminB2 => '维生素B2(核黄素)';

  @override
  String get vitaminB3 => '维生素B3(烟酸)';

  @override
  String get vitaminB5 => '维生素B5(泛酸)';

  @override
  String get vitaminB6 => '维生素B6';

  @override
  String get vitaminB7 => '维生素B7(生物素)';

  @override
  String get vitaminB9 => '维生素B9(叶酸)';

  @override
  String get vitaminB12 => '维生素B12(钴胺素)';

  @override
  String get vitaminC => '维生素C';

  @override
  String get vitaminD => '维生素D';

  @override
  String get vitaminE => '维生素E';

  @override
  String get vitaminK => '维生素K';

  @override
  String get minerals => '矿物质';

  @override
  String get majorMinerals => '主要矿物质';

  @override
  String get calcium => '钙';

  @override
  String get chloride => '氯化物';

  @override
  String get magnesium => '镁';

  @override
  String get phosphorous => '磷';

  @override
  String get potassium => '钾';

  @override
  String get sodium => '钠';

  @override
  String get traceElements => '微量元素';

  @override
  String get chromium => '铬';

  @override
  String get iron => '铁';

  @override
  String get fluorine => '氟';

  @override
  String get iodine => '碘';

  @override
  String get copper => '铜';

  @override
  String get manganese => '锰';

  @override
  String get molybdenum => '钼';

  @override
  String get selenium => '硒';

  @override
  String get zinc => '锌';

  @override
  String get fats => '脂肪';

  @override
  String get monounsaturatedFat => '单不饱和脂肪酸';

  @override
  String get polyunsaturatedFat => '多不饱和脂肪酸';

  @override
  String get omega3 => 'Ω-3脂肪酸';

  @override
  String get omega6 => 'Ω-6脂肪酸';

  @override
  String get saturatedFat => '饱和脂肪酸';

  @override
  String get transfat => '反式脂肪酸';

  @override
  String get cholesterol => '胆固醇';

  @override
  String get fiber => '膳食纤维';

  @override
  String get sugar => '糖';

  @override
  String get sugarAlcohol => '糖醇';

  @override
  String get starch => '淀粉';

  @override
  String get other => '其他';

  @override
  String get water => '水';

  @override
  String get caffeine => '咖啡因';

  @override
  String get alcohol => '酒精';

  @override
  String get salt => '盐';

  @override
  String get servingSizes => '份量说明';

  @override
  String get add => '添加';

  @override
  String get noServingSizesText => '缺少份量说明。';

  @override
  String get addServingSize => '添加份量说明';

  @override
  String get typicalServingSizes => '标准份量';

  @override
  String get or => '或者';

  @override
  String get servingSizeName => '份量名称';

  @override
  String get size => '份量值';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': '一份(Srv.)',
      'l10nPackage': '一包(Pck.)',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => '薄煎饼';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => '薯饼';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => '油炸秋葵';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => '苏格兰鸡蛋';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => '约克郡布丁';

  @override
  String get testCustomFood5Calories => '259';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appDescriptionShort => '轻松快速地跟踪您的食物和营养情况。';

  @override
  String get fat => '肥胖';
}
