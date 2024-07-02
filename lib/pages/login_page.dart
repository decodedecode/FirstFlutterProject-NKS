import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // Set the background color to white
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login.png", fit: BoxFit.cover),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Hi Sarthak");
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
