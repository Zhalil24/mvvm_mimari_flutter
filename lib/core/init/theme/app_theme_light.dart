import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/color_sheme_light.dart';
import 'light/text_theme_light.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();
  ThemeData get theme => ThemeData(
      colorScheme: _appColorScheme,
      scaffoldBackgroundColor: Color(0xfff1f3f8),
      textTheme: textTheme(),
      appBarTheme: ThemeData.light().appBarTheme.copyWith(iconTheme: IconThemeData(color: Colors.black, size: 21)),
      inputDecorationTheme: const InputDecorationTheme(
          focusColor: Colors.black12,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red))),
      floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
      tabBarTheme: tabBarTheme());

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
      labelColor: _appColorScheme.onSecondary,
      labelStyle: TextThemeLight.instance!.headline2,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.4),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
        headline1: TextThemeLight.instance!.headline1, headline2: TextThemeLight.instance!.headline2, overline: TextThemeLight.instance!.headline3);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: ColorSchemeLight.instance!.black,
        secondary: Colors.green,
        surface: Colors.blue,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Color(0xffffc93c),
        brightness: Brightness.light);
  }
}
