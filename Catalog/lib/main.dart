import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/myroutes.dart';
import 'package:catalog/pages/themes.dart';
import 'package:flutter/material.dart';
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
      theme: MyThemes.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyThemes.darkTheme(context),
      routes: {
        "/": (context) => Homepage(),
        MyRoute.homeroute: (context) => const Homepage(),
        MyRoute.loginroute: (context) => LoginPage(),
      },
    );
  }
}
