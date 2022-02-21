import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatefulWidget {
  final item;

  const HomeDetailPage({Key? key, this.item}) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: MyThemes.lightBrownColor,
          body: Column(
            children: [
              Hero(
                tag: Key(widget.item["id"].toString()),
                child: Image.network(
                  widget.item["image"],
                  height: 35.0.h ,
                ),
              ).p16(),
              Expanded(
                  child: VxArc(
                height: 4.h,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(20)),
                      Text(
                        widget.item["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        widget.item["desc"],
                        style: Theme.of(context).textTheme.caption,
                        textScaleFactor: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          bottomNavigationBar: ButtonBar(
            buttonPadding: EdgeInsets.all(32),
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + widget.item["price"].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 3.h,
                    color: Colors.red[800]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(20.w, 8.h)),
                onPressed: () {
                  if (!Cart.items.contains(widget.item)) {
                    Cart.items.add(widget.item);
                  }
          
                  setState(() {});
                },
                child: Cart.items.contains(widget.item)
                    ? const Icon(Icons.done)
                    : const Icon(CupertinoIcons.cart),
              )
            ],
          ),
        ),
      ),
    );
  }
}
