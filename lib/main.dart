import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pilot/pages/cart_page.dart';
import 'package:pilot/core/store.dart';
import 'package:pilot/pages/home_page.dart';
import 'package:pilot/pages/login_page.dart';
import 'package:pilot/utils/routes.dart';
import 'package:pilot/utils/widgets/themes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  setPathUrlStrategy();
  final store = MyStore();

  runApp(VxState(
    store: store,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
