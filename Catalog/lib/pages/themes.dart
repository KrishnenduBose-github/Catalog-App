import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.teal, fontFamily: GoogleFonts.lato().fontFamily);

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.lightBlue,
      );
}
