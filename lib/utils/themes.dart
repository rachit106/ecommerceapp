import 'package:flutter/material.dart';

class MyThemes{
  static ThemeData defaultTheme(BuildContext context) =>ThemeData(
      primarySwatch: Colors.deepPurple,
    );
    static ThemeData darkTheme(BuildContext context) =>ThemeData(
      brightness: Brightness.dark
    );

    static Color lightBrownColor = const Color(0xffefebe9);
}