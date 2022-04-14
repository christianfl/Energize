// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      id: json['id'] as String,
      title: json['title'] as String,
      origin: json['origin'] as String,
      ean: json['ean'] as String?,
      imageUrl: json['imageUrl'] as String?,
      imageThumbnailUrl: json['imageThumbnailUrl'] as String?,
      calories: (json['calories'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      carbs: (json['carbs'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      vitaminA: (json['vitaminA'] as num?)?.toDouble(),
      vitaminB1: (json['vitaminB1'] as num?)?.toDouble(),
      vitaminB2: (json['vitaminB2'] as num?)?.toDouble(),
      vitaminB3: (json['vitaminB3'] as num?)?.toDouble(),
      vitaminB5: (json['vitaminB5'] as num?)?.toDouble(),
      vitaminB6: (json['vitaminB6'] as num?)?.toDouble(),
      vitaminB7: (json['vitaminB7'] as num?)?.toDouble(),
      vitaminB9: (json['vitaminB9'] as num?)?.toDouble(),
      vitaminB12: (json['vitaminB12'] as num?)?.toDouble(),
      vitaminC: (json['vitaminC'] as num?)?.toDouble(),
      vitaminD: (json['vitaminD'] as num?)?.toDouble(),
      vitaminE: (json['vitaminE'] as num?)?.toDouble(),
      vitaminK: (json['vitaminK'] as num?)?.toDouble(),
      calcium: (json['calcium'] as num?)?.toDouble(),
      chloride: (json['chloride'] as num?)?.toDouble(),
      magnesium: (json['magnesium'] as num?)?.toDouble(),
      phosphorus: (json['phosphorus'] as num?)?.toDouble(),
      potassium: (json['potassium'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      chromium: (json['chromium'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
      fluorine: (json['fluorine'] as num?)?.toDouble(),
      iodine: (json['iodine'] as num?)?.toDouble(),
      copper: (json['copper'] as num?)?.toDouble(),
      manganese: (json['manganese'] as num?)?.toDouble(),
      molybdenum: (json['molybdenum'] as num?)?.toDouble(),
      selenium: (json['selenium'] as num?)?.toDouble(),
      zinc: (json['zinc'] as num?)?.toDouble(),
      monounsaturatedFat: (json['monounsaturatedFat'] as num?)?.toDouble(),
      polyunsaturatedFat: (json['polyunsaturatedFat'] as num?)?.toDouble(),
      omega3: (json['omega3'] as num?)?.toDouble(),
      omega6: (json['omega6'] as num?)?.toDouble(),
      saturatedFat: (json['saturatedFat'] as num?)?.toDouble(),
      transFat: (json['transFat'] as num?)?.toDouble(),
      cholesterol: (json['cholesterol'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble(),
      sugarAlcohol: (json['sugarAlcohol'] as num?)?.toDouble(),
      starch: (json['starch'] as num?)?.toDouble(),
      water: (json['water'] as num?)?.toDouble(),
      caffeine: (json['caffeine'] as num?)?.toDouble(),
      alcohol: (json['alcohol'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FoodToJson(Food instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'origin': instance.origin,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ean', instance.ean);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('imageThumbnailUrl', instance.imageThumbnailUrl);
  writeNotNull('calories', instance.calories);
  writeNotNull('protein', instance.protein);
  writeNotNull('carbs', instance.carbs);
  writeNotNull('fat', instance.fat);
  writeNotNull('vitaminA', instance.vitaminA);
  writeNotNull('vitaminB1', instance.vitaminB1);
  writeNotNull('vitaminB2', instance.vitaminB2);
  writeNotNull('vitaminB3', instance.vitaminB3);
  writeNotNull('vitaminB5', instance.vitaminB5);
  writeNotNull('vitaminB6', instance.vitaminB6);
  writeNotNull('vitaminB7', instance.vitaminB7);
  writeNotNull('vitaminB9', instance.vitaminB9);
  writeNotNull('vitaminB12', instance.vitaminB12);
  writeNotNull('vitaminC', instance.vitaminC);
  writeNotNull('vitaminD', instance.vitaminD);
  writeNotNull('vitaminE', instance.vitaminE);
  writeNotNull('vitaminK', instance.vitaminK);
  writeNotNull('calcium', instance.calcium);
  writeNotNull('chloride', instance.chloride);
  writeNotNull('magnesium', instance.magnesium);
  writeNotNull('phosphorus', instance.phosphorus);
  writeNotNull('potassium', instance.potassium);
  writeNotNull('sodium', instance.sodium);
  writeNotNull('chromium', instance.chromium);
  writeNotNull('iron', instance.iron);
  writeNotNull('fluorine', instance.fluorine);
  writeNotNull('iodine', instance.iodine);
  writeNotNull('copper', instance.copper);
  writeNotNull('manganese', instance.manganese);
  writeNotNull('molybdenum', instance.molybdenum);
  writeNotNull('selenium', instance.selenium);
  writeNotNull('zinc', instance.zinc);
  writeNotNull('monounsaturatedFat', instance.monounsaturatedFat);
  writeNotNull('polyunsaturatedFat', instance.polyunsaturatedFat);
  writeNotNull('omega3', instance.omega3);
  writeNotNull('omega6', instance.omega6);
  writeNotNull('saturatedFat', instance.saturatedFat);
  writeNotNull('transFat', instance.transFat);
  writeNotNull('cholesterol', instance.cholesterol);
  writeNotNull('fiber', instance.fiber);
  writeNotNull('sugar', instance.sugar);
  writeNotNull('sugarAlcohol', instance.sugarAlcohol);
  writeNotNull('starch', instance.starch);
  writeNotNull('water', instance.water);
  writeNotNull('caffeine', instance.caffeine);
  writeNotNull('alcohol', instance.alcohol);
  return val;
}
