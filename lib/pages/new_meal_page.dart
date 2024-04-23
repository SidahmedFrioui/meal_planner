import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meal_planner/models/day_meals.dart';
import 'package:meal_planner/validators/validators.dart';
import 'package:meal_planner/widgets/my_button.dart';
import 'package:meal_planner/widgets/text_field.dart';

class NewMeal extends StatefulWidget {
  const NewMeal({super.key});

  @override
  State<NewMeal> createState() => _NewMealState();
}

class _NewMealState extends State<NewMeal> {
  List<MyTextField> listOfMyTextField = [];
  GlobalKey<FormState> myFormState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "New meal",
          ),
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
            key: myFormState,
            child: Column(
              children: [
                const MyTextField(
                  myIcon: Icon(Icons.restaurant_menu),
                  myHintText: "Enter meal name",
                  myValidator: emptyCheck,
                ),
                const SizedBox(
                  height: 10,
                ),
                const MyTextField(
                  myIcon: Icon(Icons.image),
                  myHintText: "Enter image path",
                  myValidator: emptyCheck,
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("List of ingredients"),
                            IconButton(
                              onPressed: () => {
                                setState(() {
                                  if (listOfMyTextField.isNotEmpty) {
                                    listOfMyTextField.removeLast();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "La liste des ingrédients est déja vide",
                                        ),
                                        duration: Duration(
                                          seconds: 2,
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                            ),
                            IconButton(
                              onPressed: () => {
                                setState(() {
                                  listOfMyTextField.add(
                                    const MyTextField(
                                      myIcon: Icon(Icons.abc),
                                      myHintText: "Ingredient name",
                                      myValidator: emptyCheck,
                                    ),
                                  );
                                }),
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: listOfMyTextField.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: listOfMyTextField[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                MyButton(
                  buttonLabel: "Add the meal",
                  onPress: () {
                    if (myFormState.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
