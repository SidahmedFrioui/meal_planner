import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Icon myIcon;
  final String myHintText;
  final String? Function(String?)? myValidator;
  final TextEditingController? myController;

  const MyTextField({
    super.key,
    required this.myIcon,
    required this.myHintText,
    this.myController,
    this.myValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: myValidator,
      controller: myController,
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
