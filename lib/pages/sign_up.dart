import 'package:flutter/material.dart';
import 'package:meal_planner/pages/login.dart';
import 'package:meal_planner/widgets/my_button.dart';
import 'package:meal_planner/widgets/my_text_button.dart';
import 'package:meal_planner/widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        child: Column(children: [
          const Text("Create your account"),
          const SizedBox(
            height: 15,
          ),
          const MyTextField(
            myIcon: Icon(Icons.person),
            myHintText: "Username",
          ),
          const SizedBox(
            height: 10,
          ),
          const MyTextField(
            myIcon: Icon(Icons.message),
            myHintText: "Email",
          ),
          const SizedBox(
            height: 10,
          ),
          const MyTextField(
            myIcon: Icon(Icons.lock),
            myHintText: "Password",
          ),
          const SizedBox(
            height: 10,
          ),
          const MyTextField(
            myIcon: Icon(Icons.lock),
            myHintText: "Confirm Password",
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            buttonLabel: "Sign Up",
            onPress: () => {},
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Or"),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            buttonLabel: "Sign in with Google",
            onPress: () => {},
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account"),
              MyTextButton(
                label: "Login",
                onPress: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  ),
                },
              )
            ],
          )
        ]),
      )),
    );
  }
}
