import 'package:catalog/pages/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App"
              .text
              .xl5
              .bold
              .color(context.theme.accentColor)
              .make()
              .pLTRB(0, 10, 120, 0),
          "Trending Products"
              .text
              .color(context.theme.accentColor)
              .xl2
              .make()
              .pLTRB(0, 5, 64, 10)
        ],
      ),
    );
  }
}
