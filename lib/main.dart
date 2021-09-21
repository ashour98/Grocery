import 'package:flutter/material.dart';
import 'package:grocery_app/UI%20Screen/About.dart';
import 'package:grocery_app/UI%20Screen/CartScreen.dart';
import 'package:grocery_app/UI%20Screen/productinfo.dart';
import 'UI Screen/Homepage.dart';
import 'UI Screen/Login.dart';
import 'UI Screen/SignUpScreen.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => LoginScreen(),
          "SignUpScreen": (context) => SignUpScreen(),
          "HomePage":(context)=> HomePage(),
          "ProductInfo":(context)=> ProductInfo(),
          "CartScreen":(context)=>CartScreen(),
          "About":(context)=>About(),

        });
  }
}

