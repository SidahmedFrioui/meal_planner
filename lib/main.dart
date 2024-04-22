import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/firebase_options.dart';
import 'package:meal_planner/pages/details_page.dart';
import 'package:meal_planner/pages/home_page.dart';
import 'package:meal_planner/pages/new_meal_page.dart';
import 'package:meal_planner/routes/routes.dart';
import 'package:meal_planner/pages/login.dart';
import 'package:meal_planner/pages/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.login: (context) => const Login(),
        Routes.signup: (context) => const SignUp(),
        Routes.detail: (context) => const DetailsPage(),
        Routes.addMeal: (context) => const NewMeal(),
      },
      initialRoute: Routes.login,
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
