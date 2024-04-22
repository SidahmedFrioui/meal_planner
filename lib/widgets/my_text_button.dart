import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;

  const MyTextButton({
    super.key,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      child: Text(label),
    );
  }
}
