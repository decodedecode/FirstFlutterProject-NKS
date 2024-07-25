import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:pilot/models/catalog.dart';
import 'package:pilot/utils/routes.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_header.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var itemsData = decodedData["items"]; // Use "items" as the key

    if (itemsData != null) {
      CatalogModel.items = List.from(itemsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    } else {
      print("Error: 'items' data is null or missing in the JSON file.");
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          // backgroundColor: context.theme.buttonColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}