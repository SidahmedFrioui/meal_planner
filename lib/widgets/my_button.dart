import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPress;

  const MyButton({
    super.key,
    required this.buttonLabel,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.black,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.orange,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          buttonLabel,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
