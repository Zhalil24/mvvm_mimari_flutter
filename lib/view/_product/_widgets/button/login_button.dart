import 'package:flutter/material.dart';

import '../../../../core/conponent/button/title_text_button.dart';

class MVVMLoginButton extends StatelessWidget {
  final Function(String data) onComplate;

  const MVVMLoginButton({super.key, required this.onComplate});

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
        onPressed: () {
          onComplate("OKEY");
        },
        text: "GİRİŞ");
  }
}
