import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/cloud_firestore/firestore_services.dart';
import 'package:meal_planner/constants/day_list.dart';
import 'package:meal_planner/models/day_meals/day_meals.dart';
import 'package:meal_planner/models/meal/meal.dart';
import 'package:meal_planner/widgets/days_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FireStoreServices fs = FireStoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () => Navigator.pushReplacementNamed(context, '/user'),
        ),
        title: const Center(
          child: Text('Home Page'),
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
      body: FutureBuilder<List<DayMeals>>(
        future: _fetchDayMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return DaysCard(dayAndItsMealsList: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }

  Future<List<DayMeals>> _fetchDayMeals() async {
    List<DayMeals> dayMealsList = [];
    final currentUser = FirebaseAuth.instance.currentUser;
    for (String day in dayList) {
      Map<String, dynamic> currentDay = {'day': day, 'id': currentUser?.uid};
      await fs.addDay(currentDay);
      List<Meal>? meals = await fs.getMeals(currentDay);
      if (meals != null) {
        dayMealsList.add(DayMeals(day: day, listOfMeals: meals));
      }
    }
    return dayMealsList;
  }
}
