import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
                  obscure: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myIcon: const Icon(Icons.lock),
                  myHintText: "Confirm Password",
                  myController: confirmPasswordController,
                  obscure: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  buttonLabel: "Sign Up",
                  onPress: () async {
                    if (myFormState.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        await credential.user?.sendEmailVerification();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.greenAccent,
                            content: Text(
                              "Verify your email to access your account",
                            ),
                            duration: Duration(
                              seconds: 2,
                            ),
                          ),
                        );
                        Navigator.pushReplacementNamed(context, '/login');
                      } catch (e) {
                        print(e);
                      }
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
                  onPress: () async {
                    // Trigger the authentication flow
                    final GoogleSignInAccount? googleUser =
                        await GoogleSignIn().signIn();

                    // Obtain the auth details from the request
                    final GoogleSignInAuthentication? googleAuth =
                        await googleUser?.authentication;

                    // Create a new credential
                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth?.accessToken,
                      idToken: googleAuth?.idToken,
                    );

                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    Navigator.pushReplacementNamed(context, '/home');
                  },
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
