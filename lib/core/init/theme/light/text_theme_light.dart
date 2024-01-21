import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    if (_instance == null) _instance = TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w300, letterSpacing: -1.5);

  final TextStyle headline2 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline3 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline4 =
      TextStyle(fontSize: 40, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline5 =
      TextStyle(fontSize: 50, fontWeight: FontWeight.w300, letterSpacing: -1.5);
}
