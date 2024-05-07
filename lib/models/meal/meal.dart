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

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      identifiant: map['identifiant'],
      name: map['name'],
      imgPath: map['imgPath'],
      listOfIngredient: List<String>.from(map['listOfIngredient']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'identifiant': identifiant,
      'name': name,
      'imgPath': imgPath,
      'listOfIngredient': listOfIngredient,
    };
  }
}
