import 'package:ecommerceapp/Pages/cart_page.dart';
import 'package:ecommerceapp/Pages/home_page.dart';
import 'package:ecommerceapp/Pages/login_page.dart';
import 'package:ecommerceapp/utils/routes.dart';
import 'package:ecommerceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,devicetype){
return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.defaultTheme(context),
      routes: {
        "/":(context)=>LoginPage(),
        MyRoute.homeRoute:(context)=>HomePage(),
        MyRoute.loginRoute:(context)=>LoginPage(),
        MyRoute.cartRoute:(context)=>CartPage(),
      },
    );
    });
    
  }

  
  
}

