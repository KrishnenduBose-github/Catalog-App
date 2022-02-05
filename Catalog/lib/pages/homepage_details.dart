// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomepageDetails extends StatelessWidget {
  final Item catalog;
  const HomepageDetails({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.focusColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.theme.focusColor,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}"
                .text
                .color(context.theme.accentColor)
                .bold
                .xl3
                .make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    // ignore: prefer_const_constructors
                    child:
                        "Buy".text.xl.color(MyThemes().creamColor).bold.make())
                .wh(100, 50)
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(
                    catalog.image,
                    alignment: Alignment.bottomCenter,
                  ).p0()),
            ).h40(context),
            Expanded(
                child: VxArc(
                    edge: VxEdge.TOP,
                    arcType: VxArcType.CONVEX,
                    height: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0)),
                        color: context.cardColor,
                      ),
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.bold.lg
                              .color(context.accentColor)
                              .xl4
                              .make(),
                          catalog.desc.text.xl
                              .caption(context)
                              .color(context.accentColor)
                              .make(),
                          40.heightBox,
                          "Magna invidunt dolore et sanctus at diam, et dolore sanctus et no sanctus sit, sed consetetur est et sed diam sed dolores. Et et aliquyam diam sed. At sadipscing nonumy sed dolores et dolor eos. Consetetur takimata et et voluptua."
                              .text
                              .color(context.accentColor)
                              .make()
                        ],
                      ).py32(),
                    )))
          ],
        ),
      ),
    );
  }
}
