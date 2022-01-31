// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "Catalog App",
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
            // ignore: avoid_unnecessary_containers
            child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModel.items.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        item: CatalogModel.items[index],
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  )),
        drawer: MyDrawer());
  }
}
