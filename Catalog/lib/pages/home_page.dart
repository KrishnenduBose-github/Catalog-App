import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App"),
        ),
        body: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: const Text("hello world"),
          ),
        ),
        drawer: Drawer());
  }
}