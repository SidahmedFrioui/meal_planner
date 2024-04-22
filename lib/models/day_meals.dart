import 'package:meal_planner/models/meal.dart';

class DayMeals {
  final String day;
  final List<Meal> listOfMeals;

  DayMeals({
    required this.day,
    required this.listOfMeals,
  });
}
