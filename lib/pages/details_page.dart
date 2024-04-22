import 'package:flutter/material.dart';
import 'package:meal_planner/models/day_meals.dart';
import 'package:meal_planner/models/meal.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final receivedData = ModalRoute.of(context)?.settings.arguments as DayMeals;
    List<Meal> myListofMeals = receivedData.listOfMeals;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.pushReplacementNamed(context, '/home'),
          },
        ),
        title: const Center(
          child: Text("Details"),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  if (myListofMeals.isNotEmpty)
                    Image.network(
                      myListofMeals[index].imgPath,
                      height: 60,
                    ),
                  if (myListofMeals.isNotEmpty) Text(myListofMeals[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
