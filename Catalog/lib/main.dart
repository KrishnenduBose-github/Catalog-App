import 'package:flutter/material.dart';
import 'package:radio/pages/home_page.dart';
import 'package:radio/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(primarySwatch: Colors.lightBlue),
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => const Homepage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
