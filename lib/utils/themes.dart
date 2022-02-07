import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
  static ThemeData defaultTheme(BuildContext context) =>ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily
    );
    static ThemeData darkTheme(BuildContext context) =>ThemeData(
      brightness: Brightness.dark
    );
}