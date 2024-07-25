import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:pilot/models/catalog.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:pilot/utils/routes.dart';
import 'package:pilot/utils/widgets/drawer.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_header.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_list.dart';
import 'package:pilot/utils/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.hintColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}