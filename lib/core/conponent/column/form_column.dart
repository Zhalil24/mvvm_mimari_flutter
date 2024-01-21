import 'package:flutter/material.dart';

class FormColumn extends StatelessWidget {
  const FormColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: children,
          ),
        ),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
