import 'package:flutter/material.dart';

class TitleTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const TitleTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(20),
      elevation: 20,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
