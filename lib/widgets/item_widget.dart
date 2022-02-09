import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemWidget extends StatelessWidget {
  final product;

  const ItemWidget({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(product["image"])
            .box
            .rounded
            .p8
            .color(Color(0xffefebe9))
            .make()
            .p16()
            .w(155),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product["name"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(product["desc"], style: Theme.of(context).textTheme.caption),
            SizedBox(height: 20,),
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + product["price"].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("buy"),
                  
                )
              ],
            ).pOnly(right: 10)
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py(16);
    //(
    //     child: ListTile(
    //   title: Text(product["name"]),
    //   onTap: () {
    //     print(product["name"] + "pressed");
    //   },
    //   leading: Image.network(product["image"]),
    //   subtitle: Text(product["desc"]),
    //   trailing: Text(
    //     "\$${product["price"]}",
    //     textScaleFactor: 1.5,
    //     style: TextStyle(
    //       color: Colors.deepPurple,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // )
    //);
  }
}
