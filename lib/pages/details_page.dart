import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/models/day_meals/day_meals.dart';
import 'package:meal_planner/models/meal/meal.dart';
import 'package:meal_planner/widgets/my_button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receivedData =
        ModalRoute.of(context)?.settings.arguments as DayMeals?;
    List<Meal> myListofMeals = receivedData?.listOfMeals ?? [];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        title: const Center(
          child: Text("Details"),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              } catch (e) {
                rethrow;
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: myListofMeals.isEmpty
          ? Center(
              child: Text(
                "Meals list is empty",
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: myListofMeals.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  surfaceTintColor: Colors.white,
                                  title: Text("Ingredients"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: myListofMeals[index]
                                          .listOfIngredient
                                          .map((ingredient) {
                                        return ListTile(
                                          title: Text(ingredient),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    MyButton(
                                      buttonLabel: "Close",
                                      onPress: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                  'https://www.contentviewspro.com/wp-content/uploads/2017/07/default_image.png'),
                              Text(myListofMeals[index].name),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
