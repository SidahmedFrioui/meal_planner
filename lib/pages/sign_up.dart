import 'package:flutter/material.dart';
import 'package:meal_planner/validators/validators.dart';
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
  GlobalKey<FormState> myFormState = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
              children: [
                const Text("Create your account"),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.person),
                  myHintText: "Username",
                  myValidator: emptyCheck,
                  myController: usernameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.message),
                  myHintText: "Email",
                  myValidator: myValidateEmailFct,
                  myController: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.lock),
                  myHintText: "Password",
                  myValidator: myValidatePwdFct,
                  myController: passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.lock),
                  myHintText: "Confirm Password",
                  myController: confirmPasswordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  buttonLabel: "Sign Up",
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
                        Navigator.pushReplacementNamed(context, '/login'),
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
