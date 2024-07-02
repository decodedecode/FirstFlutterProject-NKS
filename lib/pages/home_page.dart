import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name = "Sarthak";
  final int days = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Catalogue App"),
      ),
      body: Center(
        child: Container(
            child: Text("Hello Guys Im $name Learning Flutter in $days Days ")),
      ),
      drawer: Drawer(),
    );
  }
}
