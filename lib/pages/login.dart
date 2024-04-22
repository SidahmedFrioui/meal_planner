import 'package:firebase_auth/firebase_auth.dart';
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

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = _usernameController.text.trim();
      final String password = _passwordController.text.trim();

      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      print("user $user");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Email ou mot de passe est incorrect",
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

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
                  myController: _usernameController,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.lock),
                  myHintText: "Password",
                  myValidator: emptyCheck,
                  myController: _passwordController,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyButton(
                  buttonLabel: "Login",
                  onPress: () async {
                    if (myFormState.currentState!.validate()) {
                      await _signInWithEmailAndPassword();
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
