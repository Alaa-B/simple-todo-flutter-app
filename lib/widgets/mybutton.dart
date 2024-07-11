import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber[400],
          elevation: 0.5,
        ),
        onPressed: onTap,
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Color.fromARGB(167, 0, 0, 0), fontWeight: FontWeight.bold),
        ));
  }
}
