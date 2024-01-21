import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const IconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(20),
      elevation: 20,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
