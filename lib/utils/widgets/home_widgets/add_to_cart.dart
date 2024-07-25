import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pilot/models/cart.dart';
import 'dart:convert';
import 'package:pilot/models/catalog.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:pilot/utils/routes.dart';
import 'package:pilot/utils/widgets/drawer.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_header.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_list.dart';
import 'package:pilot/utils/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();

          _cart.catalog = _catalog;
          _cart.add(catalog);
        }
      },
      style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}