import 'package:ecommerceapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ecommerce app"),
        ),
        drawer: MyDrawer(),
      );
    
  }
}