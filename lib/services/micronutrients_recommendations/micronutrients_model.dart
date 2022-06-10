import '../../../models/food/food.dart';
import '../../models/person/enums/sex.dart';

class MicronutrientsModel {
  final List<int> ageGroup;
  final Sex sex;
  final Food nutritionRecommendationPerDay;

  MicronutrientsModel({
    required this.ageGroup,
    required this.sex,
    required this.nutritionRecommendationPerDay,
  });
}
