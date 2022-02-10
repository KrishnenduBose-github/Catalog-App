// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart_Model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appBarTheme.color,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.accentColor),
        elevation: 0.0,
        backgroundColor: context.theme.appBarTheme.color,
        title:
            Center(child: "Cart".text.color(context.accentColor).center.make()),
      ),
      body: Column(
        children: [CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, _, __) {
              return "Rs.${_cart.totalprice}"
                  .text
                  .xl2
                  .color(context.theme.accentColor)
                  .make()
                  .p12();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying is not yet supported".text.make(),
              ));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: "Buy".text.bold.white.make(),
          ).w32(context).px20()
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(
                    Icons.done,
                    color: context.theme.iconTheme.color,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                    icon: Icon(Icons.remove_circle_outline),
                    color: context.theme.iconTheme.color,
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
