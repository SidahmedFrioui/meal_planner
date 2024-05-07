import 'package:flutter/material.dart';
import 'package:meal_planner/models/day_meals/day_meals.dart';
import 'package:meal_planner/pages/new_meal_page.dart';

class DaysCard extends StatelessWidget {
  final DayMeals dayAndItsMealsList;

  const DaysCard({
    super.key,
    required this.dayAndItsMealsList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  dayAndItsMealsList.day,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility),
                    color: Colors.black87,
                    onPressed: () => {
                      Navigator.pushReplacementNamed(
                        context,
                        '/detail',
                        arguments: dayAndItsMealsList,
                      ),
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.black87,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewMeal(
                            day: dayAndItsMealsList.day,
                          ),
                        ),
                      ),
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
