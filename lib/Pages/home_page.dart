import 'dart:convert';

import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/utils/routes.dart';
import 'package:ecommerceapp/widgets/drawer.dart';
import 'package:ecommerceapp/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/src/flutter/badge.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogjson);
    products = decodedData["products"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //Sizes();
    WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {}));
    return Scaffold(
      backgroundColor: Colors.brown[50],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoute.cartRoute).then((_) {
            setState(() {});
          });
        },
        child: Icon(CupertinoIcons.cart),
      ).badge(
          color: Colors.red[50],
          size: 20,
          count: Cart.items.length,
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
      appBar: AppBar(
        title: Text("ecommerce app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (products != null && products.isNotEmpty)
            ? ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => ItemWidget(
                  product: products[index],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
