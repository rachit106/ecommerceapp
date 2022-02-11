import 'dart:convert';

import 'package:ecommerceapp/utils/routes.dart';
import 'package:ecommerceapp/widgets/drawer.dart';
import 'package:ecommerceapp/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      backgroundColor: Colors.brown[50],
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoute.cartRoute);
          },
          child:Icon(CupertinoIcons.cart),
        ),
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
