import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const NormalButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(20),
      elevation: 20,
      onPressed: onPressed,
      child: child,
    );
  }
}
