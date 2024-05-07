import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planner/models/meal/meal.dart';

class FireStoreServices {
  final db = FirebaseFirestore.instance;

  Future<void> addDay(
    Map<String, dynamic> currentDay,
  ) async {
    await db
        .collection('days')
        .where('day', isEqualTo: currentDay['day'])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (data) async {
        if (data.docs.isEmpty) {
          await db.collection("days").doc().set(currentDay);
        }
      },
    );
  }

  Future<void> addDayDoc(Map<String, dynamic> currentDay, Meal? meal) async {
    await db
        .collection('days')
        .where('day', isEqualTo: currentDay['day'])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (data) async {
        if (data.docs.isEmpty) {
          await db.collection("days").doc().set(currentDay);
        } else {
          final dayDocRef = data.docs.first.reference;
          if (meal != null) {
            await dayDocRef.collection('meals').add(meal.toMap());
          }
        }
      },
    );
  }

  Future<List<Meal>?> getMeals(Map<String, dynamic> day) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return null;

    final QuerySnapshot daySnapshot = await db
        .collection('days')
        .where('day', isEqualTo: day['day'])
        .where('id', isEqualTo: currentUser.uid)
        .get();

    if (daySnapshot.docs.isNotEmpty) {
      final DocumentSnapshot dayDoc = daySnapshot.docs.first;
      final QuerySnapshot mealsSnapshot =
          await dayDoc.reference.collection('meals').get();

      final List<Meal> meals = mealsSnapshot.docs.map((doc) {
        return Meal.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return meals;
    }

    return null;
  }
}
