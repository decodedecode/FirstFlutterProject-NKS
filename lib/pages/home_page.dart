import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/core/store.dart';
import 'package:pilot/models/cart.dart';
import 'dart:convert';
import 'package:pilot/models/catalog.dart';
import 'package:pilot/utils/routes.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_header.dart';
import 'package:pilot/utils/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:pilot/utils/widgets/home_widgets/catalog_search_delegate.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Sarthak";
  final url = "https://api.jsonbin.io/v3/b/66a5dd1eacd3cb34a86c51d9";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(milliseconds: 1));
    final url = "https://api.jsonbin.io/v3/b/66a5dd1eacd3cb34a86c51d9";
    const String masterKey = r'$2a$10$GkESIgz5YCv7nL3QTGRNy.kt2vXRbgSJCPWBlNi5V/cP7pF.z6q.q';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'X-Master-Key': masterKey,
        },
      );

      if (response.statusCode == 200) {
        final catalogJson = response.body;
        final decodedData = jsonDecode(catalogJson);
        var itemsData = decodedData['record']['items']; // Ensure this matches your JSON structure

        if (itemsData != null) {
          CatalogModel.items = List.from(itemsData)
              .map<Item>((item) => Item.fromMap(item))
              .toList();
        } else {
          print("Error: 'items' data is null or missing in the JSON file.");
        }
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _, __) => FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: theme.primaryColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: Vx.red700,
          size: 22,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Neelkamal"),
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: CatalogSearchDelegate(CatalogModel.items));
          }, icon: Icon(Icons.search))
        ],
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
      ),
    );
  }
}
