import 'package:flutter/material.dart';
import 'package:meal_planner/pages/details_page.dart';
import 'package:meal_planner/pages/home_page.dart';
import 'package:meal_planner/pages/login.dart';
import 'package:meal_planner/pages/sign_up.dart';
import 'package:meal_planner/pages/user.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String detail = '/detail';
  static const String addMeal = '/add';
  static const String user = '/user';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case detail:
        return MaterialPageRoute(builder: (_) => const DetailsPage());
      case user:
        return MaterialPageRoute(builder: (_) => UserPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
