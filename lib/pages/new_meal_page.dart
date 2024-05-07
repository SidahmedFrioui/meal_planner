import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/cloud_firestore/firestore_services.dart';
import 'package:meal_planner/models/meal/meal.dart';
//import 'package:hive/hive.dart';
//import 'package:meal_planner/models/day_meals.dart';
//import 'package:meal_planner/models/meal.dart';
import 'package:meal_planner/validators/validators.dart';
import 'package:meal_planner/widgets/my_button.dart';
import 'package:meal_planner/widgets/text_field.dart';

class NewMeal extends StatefulWidget {
  final String day;
  const NewMeal({
    super.key,
    required this.day,
  });

  @override
  State<NewMeal> createState() => _NewMealState();
}

class _NewMealState extends State<NewMeal> {
  List<MyTextField> listOfMyTextField = [];
  List<String> listOfIngredient = [];
  GlobalKey<FormState> myFormState = GlobalKey<FormState>();

  FireStoreServices fs = FireStoreServices();

  final TextEditingController _mealNameController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

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
                MyTextField(
                  myIcon: Icon(Icons.restaurant_menu),
                  myHintText: "Enter meal name",
                  myValidator: emptyCheck,
                  myController: _mealNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myIcon: Icon(Icons.image),
                  myHintText: "Enter image path",
                  myValidator: emptyCheck,
                  myController: _imagePathController,
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
                                    MyTextField(
                                      myIcon: Icon(Icons.abc),
                                      myHintText: "Ingredient name",
                                      myValidator: emptyCheck,
                                      myController: TextEditingController(),
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
                  onPress: () async {
                    if (myFormState.currentState!.validate()) {
                      Map<String, dynamic> currentDay = {
                        'id': FirebaseAuth.instance.currentUser!.uid,
                        'day': widget.day,
                      };
                      if (listOfMyTextField.isNotEmpty) {
                        Meal meal = new Meal(
                          name: _mealNameController.text,
                          imgPath: _imagePathController.text,
                          listOfIngredient: listOfIngredient,
                        );
                        listOfMyTextField.forEach((field) {
                          listOfIngredient.add(field.myController!.text);
                        });
                        await fs.addDayDoc(
                          currentDay,
                          meal,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.greenAccent,
                            content: Text(
                              "Meal added",
                            ),
                            duration: Duration(
                              seconds: 2,
                            ),
                          ),
                        );
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    }
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
