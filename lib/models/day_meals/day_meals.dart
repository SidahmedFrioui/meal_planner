import 'package:hive/hive.dart';
import 'package:meal_planner/models/meal/meal.dart';

part 'day_meals.g.dart';

@HiveType(typeId: 0)
class DayMeals {
  @HiveField(0)
  final String? identifiant;
  @HiveField(1)
  final String day;
  @HiveField(2)
  final List<Meal> listOfMeals;

  DayMeals({
    this.identifiant,
    required this.day,
    required this.listOfMeals,
  });
}
