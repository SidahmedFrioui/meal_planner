import 'package:flutter/material.dart';
import 'package:meal_planner/constants/day_list.dart';
import 'package:meal_planner/models/day_meals.dart';
import 'package:meal_planner/widgets/days_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Page'),
        ),
      ),
      body: ListView.builder(
        itemCount: dayList.length,
        itemBuilder: (BuildContext context, int index) {
          DayMeals day = DayMeals(
            day: dayList[index],
            listOfMeals: [],
          );
          return DaysCard(dayAndItsMealsList: day);
        },
      ),
    );
  }
}
