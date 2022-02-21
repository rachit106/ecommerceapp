
import 'package:ecommerceapp/Pages/home_detail_page.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemWidget extends StatefulWidget {
  final product;

  const ItemWidget({Key? key, this.product}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  bool isClicked = false;
  bool isInCart = false;

 
  @override
  Widget build(BuildContext context) {
    
    //WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {}));
    return VxBox(
        child: Hero(
      tag: Key(widget.product["id"].toString()),
      child: Row(
        children: [
          Image.network(widget.product["image"])
              .box
              .rounded
              .p8
              .color(MyThemes.lightBrownColor)
              .make()
              .p16()
              .w(155),
          Expanded(
              child: Material(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeDetailPage(item: widget.product))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product["name"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.product["desc"],
                      style: Theme.of(context).textTheme.caption),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$" + widget.product["price"].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (!Cart.items.contains(widget.product)) {
                              isClicked = isClicked.toggle();
                              Cart.items.add(widget.product);
                            }
                            setState(() {});
                          },
                          child: Cart.items.contains(widget.product)
                              ? const Icon(Icons.done)
                              : const Icon(CupertinoIcons.cart)),
                    ],
                  ).pOnly(right: 16)
                ],
              ),
            ),
          ))
        ],
      ),
    )).white.roundedLg.square(150).make().py(16);
  }
}
