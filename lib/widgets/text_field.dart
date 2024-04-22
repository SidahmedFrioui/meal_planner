import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Icon myIcon;
  final String myHintText;
  final String? Function(String?)? myValidator;

  const MyTextField({
    super.key,
    required this.myIcon,
    required this.myHintText,
    this.myValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: myValidator,
      decoration: InputDecoration(
        hintText: myHintText,
        prefixIcon: myIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.grey[300],
        filled: true,
      ),
    );
  }
}
