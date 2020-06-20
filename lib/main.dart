import 'package:cookingrecipe/ui/screen/LandingPage.dart';
import 'package:cookingrecipe/ui/screen/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String autoLoginToken;

  _autoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    autoLoginToken = (sharedPreferences.getString('token') ?? null);
  }

  @override
  void initState() {
    this._autoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: autoLoginToken == null ? SignInPage() : LandingPage(),
    );
  }
}
