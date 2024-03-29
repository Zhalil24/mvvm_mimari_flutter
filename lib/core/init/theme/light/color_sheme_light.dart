import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    if (_instance == null) _instance = ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xffc10e0e);
  final Color white = const Color(0xffffffff);
  final Color gray = const Color(0xffa5a6ae);
  final Color lightGray = const Color(0xfff7f7f7);
  final Color darkGray = const Color(0xff676870);
  final Color black = const Color(0xff020306);
}
