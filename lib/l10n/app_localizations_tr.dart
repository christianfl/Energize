// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Energize';

  @override
  String get appDescriptionShort =>
      'Yiyeceklerinizi ve beslenmenizi kolay ve hızlı bir şekilde takip edin.';

  @override
  String get appDescription =>
      'Yiyeceklerinizi ve beslenmenizi kolay ve hızlı bir şekilde takip edin. Ürünlerinizi tarayın veya farklı veri tabanlarında elle arayın.';

  @override
  String get ok => 'Tamam';

  @override
  String get fieldMandatory => 'Lütfen bir değer girin';

  @override
  String get onlyNumbersAllowed => 'Yalnızca sayılara izin verilir';

  @override
  String get undo => 'Geri al';

  @override
  String get deleted => 'silindi';

  @override
  String get loading => 'Yükleniyor';

  @override
  String somethingNotFound(String something) {
    return '$something bulunamadı';
  }

  @override
  String get unknownErrorText => 'Bilinmeyen bir hata oluştu';

  @override
  String get tracking => 'Takip et';

  @override
  String get energy => 'Enerji';

  @override
  String get protein => 'Proteinler';

  @override
  String get carbs => 'Karbonhidrat';

  @override
  String get fat => 'Yağ';

  @override
  String get detailedSummary => 'Ayrıntılı özet';

  @override
  String get dayComplete => 'Gün tamamlandı';

  @override
  String get markedDayAsComplete => 'Gün tamamlandı olarak işaretlendi';

  @override
  String get dayIncomplete => 'Gün tamamlanmadı';

  @override
  String get unmarkedDayAsComplete => 'Gün tamamlandı işareti kaldırıldı';

  @override
  String get trackFood => 'Yiyecekleri takip et';

  @override
  String get timeSetHelpText =>
      'Yiyecekler takip edilirken, bu zaman tüketim zamanı için bir şablon olarak kullanılacaktır.';

  @override
  String get useAsTemplateForCustomFood =>
      'Özel yiyecekler için şablon olarak kullan';

  @override
  String get additionalInformation => 'Ek bilgiler';

  @override
  String get completeProductName => 'Tam ürün adı';

  @override
  String get addedDate => 'Eklendi';

  @override
  String get consumedDate => 'Tüketildi';

  @override
  String get nutrients => 'Besinler';

  @override
  String get labelingEu => 'Etiket (EU)';

  @override
  String amountContain(String amountWithUnit) {
    return '$amountWithUnit içerir';
  }

  @override
  String get dailyTarget => 'günlük hedef';

  @override
  String get general => 'Genel';

  @override
  String get micronutrients => 'Mikro besinler';

  @override
  String get editTrackedFood => 'Takip edilen yiyeceği düzenle';

  @override
  String get scanBarcode => 'Barkod tara';

  @override
  String get searchFood => 'Yiyecek ara';

  @override
  String get productOrBrand => 'Ürün veya marka';

  @override
  String get searchError => 'Arama sırasında hata oluştu';

  @override
  String get searchErrorHint =>
      'En az bir gıda bileşimi veri tabanına ulaşılamadı. Lütfen daha sonra tekrar deneyin veya ayarlardan çalışmayan olmayan veri tabanlarını geçici olarak devre dışı bırakın.';

  @override
  String get affectedDatabases => 'Etkilenen veri tabanları';

  @override
  String get notFoundInCustomFoodsOrOpenFoodFacts =>
      'Özel yiyeceklerde veya Açık Gıda Bilgilerinde yer almıyor';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNeedsInternet =>
      'Özel yiyeceklerde bulunamadı, Açık Gıda Gerçekleri için internet erişimi gerekir';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsHasError =>
      'Özel yiyeceklerde bulunamadı, Açık Gıda Gerçekleri aramasında hata oluştu';

  @override
  String get notFoundInCustomFoodsOpenFoodFactsNotActivated =>
      'Özel yiyeceklerde bulunamadı, Açık Gıda Gerçekleri etkinleştirilmedi';

  @override
  String get barcodeScanningUnsupported =>
      'Cihaz kamerasıyla barkod taramak an itibariyle sadece Android\'de destekli.';

  @override
  String get customFood => 'Özel Yiyecek';

  @override
  String get searchCustomFood => 'Özel yiyecek ara';

  @override
  String get addCustomFood => 'Özel yiyecek ekle';

  @override
  String get editCustomFood => 'Özel yiyecek düzenle';

  @override
  String get title => 'Başlık';

  @override
  String get barcode => 'Barkod';

  @override
  String get settings => 'Ayarlar';

  @override
  String get yourPersonalNutritionNeeds => 'Kişisel beslenme ihtiyaçlarınız';

  @override
  String get personalNutritionNeedsHint =>
      'Kişisel beslenme ihtiyaçlarınızı hesaplayın veya kendiniz belirleyin';

  @override
  String get calculate => 'Hesapla';

  @override
  String get energyDistribution => 'Enerji dağılımı';

  @override
  String get yourBody => 'Vücudunuz';

  @override
  String get age => 'Yaş';

  @override
  String get years => 'yaş';

  @override
  String get sex => 'Cinsiyet';

  @override
  String get female => 'Kadın';

  @override
  String get male => 'Erkek';

  @override
  String get weight => 'Kilo';

  @override
  String get height => 'Boy';

  @override
  String get behaviourAndTarget => 'Davranış ve hedef';

  @override
  String get activityLevel => 'Etkinlik Seviyesi (PAL)';

  @override
  String get activityLevel1_0 => 'Uyumaktan başka bir şey yapmıyorsunuz';

  @override
  String get activityLevel1_1 => 'Bütün gün yatağınızda yatıyorsunuz';

  @override
  String get activityLevel1_2 => 'Bütün gün yatağınızda oturuyorsunuz';

  @override
  String get activityLevel1_3 => 'Çok sık dışarı çıkmıyorsunuz';

  @override
  String get activityLevel1_4 => 'Fazla hareketli değilsiniz';

  @override
  String get activityLevel1_5 => 'Ofis işi yapıyorsunuz';

  @override
  String get activityLevel1_6 =>
      'Biraz hareketlisiniz, çalışıyorsunuz ve bazen spor yapıyorsunuz';

  @override
  String get activityLevel1_7 => 'Sık sık egzersiz yapıyorsunuz';

  @override
  String get activityLevel1_8 => 'Düzenli olarak sıkı egzersiz yapıyorsunuz';

  @override
  String get activityLevel1_9 =>
      'Çok hareketlisiniz, egzersiz yapıyorsunuz ve ofis işiniz yok';

  @override
  String get activityLevel2_0 =>
      'Fiziksel olarak hareketli bir iş yapıyorsunuz ve düzenli olarak sıkı egzersiz yapıyorsunuz';

  @override
  String get noActivityLevelDescription => 'Etkinlik düzeyi açıklaması yok';

  @override
  String get weightTarget => 'Kilo hedefi';

  @override
  String get weightTargetStrongLoss => 'Çok ver';

  @override
  String get weightTargetModerateLoss => 'Normal ver';

  @override
  String get weightTargetSlightLoss => 'Az ver';

  @override
  String get weightTargetMaintaining => 'Koru';

  @override
  String get weightTargetSlightGain => 'Az al';

  @override
  String get weightTargetModerateGain => 'Normal al';

  @override
  String get weightTargetStrongGain => 'Çok al';

  @override
  String get calculateNutritionTargets => 'Beslenme hedeflerini hesapla';

  @override
  String get calculationInfo => 'Hesaplama hakkında bilgi';

  @override
  String get calculationInfoText1 =>
      'Kalori alımı hesaplaması Mifflin-St.Jeor formülüne dayanmaktadır. Lütfen bunun gerçek dünya değerlerine yalnızca bir yaklaşım olacağını unutmayın. Vücut koşulları az ya da çok farklılık gösterebileceğinden bu değerler kişiden kişiye değişir.';

  @override
  String get formulaForFemales => 'Kadınlar için formül';

  @override
  String get weightInKg => 'kg cinsinden kilo';

  @override
  String get heightInCm => 'cm cinsinden boy';

  @override
  String get ageInYears => 'Yıl olarak yaş';

  @override
  String get formulaForMales => 'Erkekler için formül';

  @override
  String get calculationInfoText2 =>
      'Bu hesaplamanın çıktısı bazal metabolizma hızı (BMR) olarak tanımlanır. Toplam enerji dönüşümünüzü almak için etkinlik değerinizle çarpılır. Bu, kcal cinsinden hesaplanan enerji alımınızdır.';

  @override
  String get calculatedNutritionTargets => 'Hesaplanan beslenme hedefleri';

  @override
  String get calculatedNutritionTargetsHint =>
      'Uygulamadan önce hesaplanan hedefleri ihtiyaçlarınıza göre düzenlemekten çekinmeyin.';

  @override
  String get percentOfCalories => 'kcal yüzdesi';

  @override
  String get proteinRatio => 'Protein oranı';

  @override
  String get carbsRatio => 'Karbonhidrat oranı';

  @override
  String get fatRatio => 'Yağ oranı';

  @override
  String get alsoSetMicronutrientsSwitch =>
      'Ayrıca yaş ve cinsiyete göre mikro besin hedefleri belirle';

  @override
  String get alsoSetMicronutrientsHint =>
      'Based on DGE reference values from 2022 with a partly update from 2025';

  @override
  String get apply => 'Uygula';

  @override
  String get targetsApplied => 'Beslenme hedefleri uygulandı';

  @override
  String get targetsApplyError => 'Beslenme hedefleri uygulanamadı';

  @override
  String get totalEnergy => 'Toplam enerji';

  @override
  String get energyDistributionChartMissingHint =>
      'Enerji dağılım grafiği yalnızca bir kalori hedefi ve makro besinlerden en az biri için bir hedef belirlediyseniz gösterilir.';

  @override
  String get percentOfTotalEnergy => 'Toplam enerji yüzdesi';

  @override
  String get selectedMacronutrient => 'Seçilen makro besin';

  @override
  String get energyAndMacronutrientsTargetsHint =>
      'Kalori, protein, karbonhidrat, yağ';

  @override
  String get display => 'Görüntü';

  @override
  String get displayHint =>
      'İhtiyaçlarınıza göre kullanıcı arayüzünü kişileştirin';

  @override
  String get groupFoodsToMeals => 'Yemekleri öğünlere grupla';

  @override
  String get groupFoodsToMealsHint =>
      'Çok kısa aralıklarla tüketilen yemekleri bir öğün olarak beraber gruplar';

  @override
  String get preferServingSizes => 'Porsiyon boyutlarını tercih edin';

  @override
  String get preferServingSizesHint =>
      'Yeni gıdayı takip ederken, varsa bir porsiyon boyutu önceden seçilecektir';

  @override
  String mealAt(String time) {
    return '${time}da öğün';
  }

  @override
  String get databaseManagement => 'Veri tabanı yönetimi';

  @override
  String get databaseManagementHint =>
      'Hangi gıda veri tabanlarının sorgulanacağını seçin';

  @override
  String get storedOnDevice => 'Aygıtta saklanır';

  @override
  String get swissFoodCompositionDatabase =>
      'İsviçre Gıda Bileşimi Veri Tabanı';

  @override
  String get version => 'Sürüm';

  @override
  String get language => 'Dil';

  @override
  String get languages => 'Diller';

  @override
  String get german => 'Almanca';

  @override
  String get italian => 'İtalyanca';

  @override
  String get french => 'Fransızca';

  @override
  String get publisher => 'Yayınlayan';

  @override
  String get federalFoodSafetyAndVeterinaryOffice =>
      'Federal Gıda Güvenliği ve Veterinerlik Ofisi';

  @override
  String get switzerland => 'İsviçre';

  @override
  String get generalInformation => 'Genel bilgiler';

  @override
  String get swissFoodCompositionDatabaseGeneralInformationText =>
      'Bu veri tabanı yaklaşık 1.100 genel ürün ve birçok mikro besin sunar. Aygıtınızda saklandığı için çevrim dışı çalışır.';

  @override
  String get source => 'Kaynak';

  @override
  String get tapHereForFurtherInformation =>
      'Daha fazla bilgi için buraya dokunun.';

  @override
  String get serverBased => 'Sunucu tabanlı';

  @override
  String get openFoodFactsVariousLanguagesText => 'Çeşitli';

  @override
  String get nonProfitInstitution => 'Kar amacı gütmeyen kuruluş';

  @override
  String get france => 'Fransa';

  @override
  String get openFoodFactsGeneralInformationText =>
      'Lütfen bu veri tabanının çok büyük olmasına rağmen girdilerin eksik veya güncelliğini yitirmiş olabileceğini unutmayın. Kayıtlı her kullanıcı besin değerlerini güncelleyebilir. Hesap oluşturmadan yeni ürünler eklenebilir. Bu veri tabanının devre dışı bırakılması EAN taramasını da içerir, bu nedenle yalnızca özel gıdaları EAN koduna göre tarayabileceksiniz.';

  @override
  String get termsOfUse => 'Kullanım koşulları';

  @override
  String get openFoodFactsTermsText =>
      'Bu veri tabanını etkinleştirerek koşulları kabul etmiş olursunuz.';

  @override
  String get contribute => 'Katkıda bulun';

  @override
  String get databaseContributeText =>
      'Bu veri tabanını iyileştirmeye nasıl yardımcı olabileceğinize bakın.';

  @override
  String get english => 'İngilizce';

  @override
  String get usdaFoodDataCentralGeneralInformationText =>
      'FoodData Central, ABD tarım bakanlığına ait bir gıda ve besin veri tabanıdır. Veriler kamu malıdır ve yaklaşık 200 temel gıda ve 380.000\'den fazla markalı gıda içerir.';

  @override
  String get backupAndRestore => 'Yedekle & Geri Yükle';

  @override
  String get backupAndRestoreHint =>
      'Verilerinizi yerel olarak veya Nextcloud gibi WebDAV uyumlu bir bulut deposunda saklayın';

  @override
  String get missingBackupPartsHint =>
      'Uyarı: Ayarlar, kişiselleştirmeler ve hedefler henüz dahil edilmedi!';

  @override
  String get successfullyCreatedBackup => 'Yedekleme başarıyla oluşturuldu';

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

    return '$customFoodsCountString özel yiyecek ve $trackedFoodsCountString takip edilen yiyecek dışa aktarıldı';
  }

  @override
  String get successfullyRestoredBackup => 'Yedekleme başarıyla geri yüklendi';

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

    return '$customFoodsCountString özel yiyecek ve $trackedFoodsCountString takip edilen yiyecek içe aktarıldı';
  }

  @override
  String get createWebDAVBackup => 'WebDAV yedeklemesi oluştur';

  @override
  String get webDAVSettings => 'WebDAV ayarları';

  @override
  String get serverURL => 'Sunucu URLsi';

  @override
  String get invalidURL => 'URL geçersiz';

  @override
  String get username => 'Kullanıcı adı';

  @override
  String get password => 'Şifre';

  @override
  String get pathAndFilename => 'Yol ve dosya ismi';

  @override
  String energizeBackup(String appName) {
    return '$appName Yedek';
  }

  @override
  String get backupPasswordNotice =>
      'Yedek şifresi olmadan bir yedeği geri getirmek imkansızdır.';

  @override
  String get restoreWebDAVBackup => 'WebDAV yedeklemesini geri yükle';

  @override
  String get createLocalBackup => 'Yerel yedekleme oluştur';

  @override
  String get restoreLocalBackup => 'Yerel yedeklemeyi geri yükle';

  @override
  String get aboutEnergize => 'Energize Hakkında';

  @override
  String get license => 'lisans';

  @override
  String get allLicenses => 'Tüm lisanslar';

  @override
  String get privacyPolicy => 'Gizlilik politikası';

  @override
  String get logs => 'Günlükler';

  @override
  String get reportIssue => 'Sorun bildir';

  @override
  String get proposeImprovement => 'İyileştirme öner';

  @override
  String get sourceCode => 'Kaynak kodu';

  @override
  String get translation => 'Çeviri';

  @override
  String get contributors => 'Katkıda bulunanlar';

  @override
  String get thanksToContributorsText =>
      'Energize\'a katkıda bulunan herkese teşekkürler. Yardımlarınız sayesinde Energize şu anki haline gelebildi.';

  @override
  String get contributionTypeCodeAndConversations => 'Kod ve sohbetler';

  @override
  String get contributionTypeAcrylicPicture => 'Akrilik resim';

  @override
  String get allTranslatorsOnWeblate => 'Weblate\'teki tüm çevirmenler';

  @override
  String get contact => 'İletişim';

  @override
  String get email => 'E-Posta';

  @override
  String get emailHint =>
      'Lütfen bunu yalnızca yukarıdakiler dışındaki konular için kullanın';

  @override
  String get supportMeByDonating => 'Bağış yaparak beni destekleyin';

  @override
  String get donate => 'Bağış Yapın';

  @override
  String get donationText =>
      'Geliştirilmesini bağış yaparak desteklemek isterseniz, bunu memnuniyetle karşılarız! Bu uygulamayı oluşturmak çok eğlenceli ama aynı zamanda çok zaman alan bir görev ve bazen biraz yılgınlığa yol açıyor :-).';

  @override
  String get bitcoinAddressCopiedToClipboard =>
      'Bitcoin adresi panoya kopyalandı';

  @override
  String get bankAccountOrCreditCard => 'Banka hesabı veya kredi kartı';

  @override
  String get writeMeAnEmailForFurtherDonationOptions =>
      'Daha fazla bağış seçeneği için bana bir e-posta gönderebilirsiniz';

  @override
  String get energyAndMacronutrients => 'Enerji ve makro besinler';

  @override
  String get vitamins => 'Vitaminler';

  @override
  String get vitaminA => 'A vitamini';

  @override
  String get vitaminB1 => 'B1 (Tiamin)';

  @override
  String get vitaminB2 => 'B2 (Riboflavinler)';

  @override
  String get vitaminB3 => 'B3 (Niasin)';

  @override
  String get vitaminB5 => 'B5 (Pantotenik asit)';

  @override
  String get vitaminB6 => 'B6 vitamini';

  @override
  String get vitaminB7 => 'B7 (Biyotin)';

  @override
  String get vitaminB9 => 'B9 (Folat)';

  @override
  String get vitaminB12 => 'B12 (Kobalamin)';

  @override
  String get vitaminC => 'C vitamini';

  @override
  String get vitaminD => 'D vitamini';

  @override
  String get vitaminE => 'E vitamini';

  @override
  String get vitaminK => 'K vitamini';

  @override
  String get minerals => 'Mineraller';

  @override
  String get majorMinerals => 'Başlıca mineraller';

  @override
  String get calcium => 'Kalsiyum';

  @override
  String get chloride => 'Klorür';

  @override
  String get magnesium => 'Magnezyum';

  @override
  String get phosphorous => 'Fosfor';

  @override
  String get potassium => 'Potasyum';

  @override
  String get sodium => 'Sodyum';

  @override
  String get traceElements => 'Eser elementler';

  @override
  String get chromium => 'Krom';

  @override
  String get iron => 'Demir';

  @override
  String get fluorine => 'Flor';

  @override
  String get iodine => 'İyot';

  @override
  String get copper => 'Bakır';

  @override
  String get manganese => 'Manganez';

  @override
  String get molybdenum => 'Molibden';

  @override
  String get selenium => 'Selenyum';

  @override
  String get zinc => 'Çinko';

  @override
  String get fats => 'Yağlar';

  @override
  String get monounsaturatedFat => 'Tekli doymamış yağ';

  @override
  String get polyunsaturatedFat => 'Çoklu doymamış yağ';

  @override
  String get omega3 => 'Omega 3';

  @override
  String get omega6 => 'Omega 6';

  @override
  String get saturatedFat => 'Doymuş yağ';

  @override
  String get transfat => 'Trans yağ';

  @override
  String get cholesterol => 'Kolesterol';

  @override
  String get fiber => 'Lif';

  @override
  String get sugar => 'Şeker';

  @override
  String get sugarAlcohol => 'Şeker alkolü';

  @override
  String get starch => 'Nişasta';

  @override
  String get other => 'Diğer';

  @override
  String get water => 'Su';

  @override
  String get caffeine => 'Kafein';

  @override
  String get alcohol => 'Alkol';

  @override
  String get salt => 'Tuz';

  @override
  String get servingSizes => 'Porsiyon';

  @override
  String get add => 'Ekle';

  @override
  String get noServingSizesText => 'Mevcut porsiyon yok.';

  @override
  String get addServingSize => 'Porsiyon ekle';

  @override
  String get typicalServingSizes => 'Klasik porsiyonlar';

  @override
  String get or => 'ya da';

  @override
  String get servingSizeName => 'Porsiyon ismi';

  @override
  String get size => 'Boyut';

  @override
  String translatableServingSizeNames(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'l10nServing': 'Ser.',
      'l10nPackage': 'Pak.',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get testCustomFood1Name => 'Pankek';

  @override
  String get testCustomFood1Calories => '227';

  @override
  String get testCustomFood2Name => 'Yağlama';

  @override
  String get testCustomFood2Calories => '326';

  @override
  String get testCustomFood3Name => 'Bamya';

  @override
  String get testCustomFood3Calories => '260';

  @override
  String get testCustomFood4Name => 'Revani';

  @override
  String get testCustomFood4Calories => '228';

  @override
  String get testCustomFood5Name => 'Baklava';

  @override
  String get testCustomFood5Calories => '259';
}
