import 'package:catalog/core/store.dart';
import 'package:catalog/pages/cart.dart';
import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/myroutes.dart';
import 'package:catalog/pages/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: MyThemes.lightTheme(context),
      dark: MyThemes.darkTheme(context),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        darkTheme: MyThemes.darkTheme(context),
        routes: {
          "/": (context) => Homepage(),
          MyRoute.homeroute: (context) => const Homepage(),
          MyRoute.loginroute: (context) => LoginPage(),
          MyRoute.cartroute: (context) => CartPage(),
        },
      ),
    );
  }
}
