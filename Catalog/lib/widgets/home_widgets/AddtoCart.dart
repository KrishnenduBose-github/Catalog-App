import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart_Model.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  const AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    var isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        // ignore: prefer_const_constructors
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
