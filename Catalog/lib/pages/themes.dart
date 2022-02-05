// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Vx.white,
      iconTheme: IconThemeData(color: Color(0xff403b58)),
      canvasColor: Color(0xfff5f5f5),
      buttonColor: Color(0xff403b58),
      accentColor: Color(0xff403b58),
      focusColor: Color(0xff403b58),
      appBarTheme: AppBarTheme(
          color: Vx.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Vx.white,
          ),
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.lightBlue,
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Vx.black,
      iconTheme: IconThemeData(color: Vx.white),
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Vx.white,
      focusColor: darkCreamColor,
      appBarTheme: AppBarTheme(
          color: darkCreamColor,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Vx.white,
          ),
          textTheme: TextTheme()));
  Color creamColor = const Color(0xfff5f5f5);
  Color darkBluishColor = const Color(0xff403b58);
  static Color darkCreamColor = Vx.gray900;
  static Color lightBluishColor = Vx.indigo500;
}
