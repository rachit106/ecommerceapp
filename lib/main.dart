import 'package:ecommerceapp/Pages/home_page.dart';
import 'package:ecommerceapp/Pages/login_page.dart';
import 'package:ecommerceapp/utils/routes.dart';
import 'package:ecommerceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.defaultTheme(context),
      routes: {
        "/":(context)=>HomePage(),
        MyRoute.homeRoute:(context)=>HomePage(),
        MyRoute.loginRoute:(context)=>LoginPage()
      },
    );
  }

  
  
}

