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

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}