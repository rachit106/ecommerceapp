import 'package:ecommerceapp/Pages/home_detail_page.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemWidget extends StatelessWidget {
  final product;

  const ItemWidget({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Hero(
          tag: Key(product["id"].toString()),
          child: Row(
              children: [
          Image.network(product["image"])
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
                      builder: (context) => HomeDetailPage(item: product))),
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product["name"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product["desc"], style: Theme.of(context).textTheme.caption),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.zero,
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$" + product["price"].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Cart.items.add(product);
                        },
                        child: Icon(CupertinoIcons.cart)
                      )
                    ],
                  ).pOnly(right: 10)
                ],
                          ),
                        ),
              ))
              ],
            ),
        )).white.roundedLg.square(150).make().py(16);
  }
}
