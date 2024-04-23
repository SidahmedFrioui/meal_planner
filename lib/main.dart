import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meal_planner/firebase_options.dart';
import 'package:meal_planner/models/day_meals.dart';
import 'package:meal_planner/models/meal.dart';
import 'package:meal_planner/pages/details_page.dart';
import 'package:meal_planner/pages/home_page.dart';
import 'package:meal_planner/pages/new_meal_page.dart';
import 'package:meal_planner/pages/user.dart';
import 'package:meal_planner/routes/routes.dart';
import 'package:meal_planner/pages/login.dart';
import 'package:meal_planner/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Hive.registerAdapter(DayMealsAdapter());
  Hive.registerAdapter(MealAdapter());
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _checkUserLogin();
  }

  _checkUserLogin() {
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.login: (context) => const Login(),
        Routes.signup: (context) => const SignUp(),
        Routes.detail: (context) => const DetailsPage(),
        Routes.addMeal: (context) => const NewMeal(),
        Routes.user: (context) => const UserPage(),
      },
      home: (_user != null) ? const HomePage() : const Login(),
      debugShowCheckedModeBanner: false,
      title: 'Meal Planner',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.orange,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.orange),
        ),
      ),
    );
  }
}
