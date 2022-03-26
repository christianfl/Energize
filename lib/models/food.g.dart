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

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'origin': instance.origin,
      'ean': instance.ean,
      'imageUrl': instance.imageUrl,
      'imageThumbnailUrl': instance.imageThumbnailUrl,
      'calories': instance.calories,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fat': instance.fat,
      'vitaminA': instance.vitaminA,
      'vitaminB1': instance.vitaminB1,
      'vitaminB2': instance.vitaminB2,
      'vitaminB3': instance.vitaminB3,
      'vitaminB5': instance.vitaminB5,
      'vitaminB6': instance.vitaminB6,
      'vitaminB7': instance.vitaminB7,
      'vitaminB9': instance.vitaminB9,
      'vitaminB12': instance.vitaminB12,
      'vitaminC': instance.vitaminC,
      'vitaminD': instance.vitaminD,
      'vitaminE': instance.vitaminE,
      'vitaminK': instance.vitaminK,
      'calcium': instance.calcium,
      'chloride': instance.chloride,
      'magnesium': instance.magnesium,
      'phosphorus': instance.phosphorus,
      'potassium': instance.potassium,
      'sodium': instance.sodium,
      'chromium': instance.chromium,
      'iron': instance.iron,
      'fluorine': instance.fluorine,
      'iodine': instance.iodine,
      'copper': instance.copper,
      'manganese': instance.manganese,
      'molybdenum': instance.molybdenum,
      'selenium': instance.selenium,
      'zinc': instance.zinc,
      'monounsaturatedFat': instance.monounsaturatedFat,
      'polyunsaturatedFat': instance.polyunsaturatedFat,
      'omega3': instance.omega3,
      'omega6': instance.omega6,
      'saturatedFat': instance.saturatedFat,
      'transFat': instance.transFat,
      'cholesterol': instance.cholesterol,
      'fiber': instance.fiber,
      'sugar': instance.sugar,
      'sugarAlcohol': instance.sugarAlcohol,
      'starch': instance.starch,
      'water': instance.water,
      'caffeine': instance.caffeine,
      'alcohol': instance.alcohol,
    };
