import 'package:hive/hive.dart';

part 'meal.g.dart';

@HiveType(typeId: 1)
class Meal {
  @HiveField(0)
  final String? identifiant;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imgPath;
  @HiveField(3)
  final List<String> listOfIngredient;

  Meal({
    this.identifiant,
    required this.name,
    required this.imgPath,
    required this.listOfIngredient,
  });
}
