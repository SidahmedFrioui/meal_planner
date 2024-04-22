import 'package:flutter/material.dart';
import 'package:meal_planner/validators/validators.dart';
import 'package:meal_planner/widgets/my_button.dart';
import 'package:meal_planner/widgets/my_text_button.dart';
import 'package:meal_planner/widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> myFormState = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 50,
          ),
          alignment: Alignment.center,
          child: Form(
            key: myFormState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Welcome to my App',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.blue[700],
                ),
                const SizedBox(
                  height: 40,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.person),
                  myHintText: "Username",
                  myValidator: emptyCheck,
                  myController: usernameController,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.lock),
                  myHintText: "Password",
                  myValidator: myValidatePwdFct,
                  myController: passwordController,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyButton(
                  buttonLabel: "Login",
                  onPress: () => {
                    if (myFormState.currentState!.validate())
                      {
                        Navigator.pushReplacementNamed(context, '/home'),
                      }
                    else
                      {
                        print("Not Valide"),
                      }
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
                MyTextButton(
                  label: "Forgot Password?",
                  onPress: () => {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have an account?"),
                    MyTextButton(
                      label: "Sign up",
                      onPress: () => {
                        Navigator.pushReplacementNamed(context, '/signup'),
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
