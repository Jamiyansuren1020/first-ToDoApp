import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  VoidCallback onPressed;

  MyButton({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(btnText),
      );
  }
}