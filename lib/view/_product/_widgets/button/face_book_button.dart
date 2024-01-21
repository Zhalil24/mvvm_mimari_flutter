import 'package:flutter/material.dart';

import '../../../../core/conponent/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  final Function(FaceBookModel? data, {String errorMessage}) onComplete;

  const FaceBookButton({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
        onPressed: () {
          final isLengthSixCharacter = "asasasas".length == 6;

          if (isLengthSixCharacter) {
            onComplete(FaceBookModel("asasas", "ASASAS"));
          } else {
            onComplete(null, errorMessage: "Facebook user not found");
          }
        },
        text: "FaceBook Login");
  }
}

class FaceBookModel {
  final String token;
  final String mail;

  FaceBookModel(this.token, this.mail);
}
