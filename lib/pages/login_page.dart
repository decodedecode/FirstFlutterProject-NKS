import 'package:flutter/material.dart';
import 'package:pilot/utils/routes.dart';
import 'package:pilot/utils/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyTheme.backgroundColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.fitWidth,
                ).py16(),
              ),
              SizedBox(height: 20.0),
              Text(
                "Welcome, $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                        labelStyle: TextStyle(color: MyTheme.darkColor),
                        hintStyle: TextStyle(color: MyTheme.lightColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyTheme.primaryColor),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be empty.";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        labelStyle: TextStyle(color: MyTheme.darkColor),
                        hintStyle: TextStyle(color: MyTheme.lightColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyTheme.primaryColor),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty.";
                        } else if (value.length < 6) {
                          return "Password must contain minimum 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50.0),
                    Material(
                      borderRadius:
                      BorderRadius.circular(changeButton ? 50 : 8),
                      color: MyTheme.primaryColor,
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                              : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
