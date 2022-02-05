import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.accentColor),
        elevation: 0.0,
        backgroundColor: context.theme.appBarTheme.color,
        title: "Cart".text.color(context.accentColor).center.make(),
      ),
    );
  }
}
