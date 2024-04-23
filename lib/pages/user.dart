import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserState();
}

class _UserState extends State<UserPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _userData();
  }

  _userData() {
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.pushReplacementNamed(context, '/home'),
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.person,
                size: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mon profile",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Adresse Email :${_user?.email ?? ''}",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
