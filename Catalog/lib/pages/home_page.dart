// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart_Model.dart';
import 'package:catalog/myroutes.dart';
import 'package:flutter/cupertino.dart';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/home_widgets/catalog_header.dart';
import 'package:catalog/widgets/home_widgets/catalog_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadState();
  }

  loadState() async {
    var catalogJson =
        await rootBundle.loadString("assets/images/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, __) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoute.cartroute),
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Vx.white,
            ),
          ).badge(
              color: Colors.red[500],
              size: 22,
              count: _cart.items.length,
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m16,
            child: Column(
              children: [
                CatalogHeader(),
                // ignore: unnecessary_null_comparison
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator().expand(),
                  )
              ],
            ),
          ),
        ),
        drawer: MyDrawer());
  }
}
