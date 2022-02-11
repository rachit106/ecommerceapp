import 'package:ecommerceapp/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final item;

  const HomeDetailPage({Key? key,  this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
          ),
          backgroundColor: MyThemes.lightBrownColor,
          body: Column(
            children: [
              Hero(
                tag: Key(item["id"].toString()),
                child: Image.network(
                  item["image"],
                  height: 250,
                ),
              ).p16(),
              Expanded(
                  child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(20)),
                      Text(
                        item["name"],
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        item["desc"],
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
                "\$" + item["price"].toString(),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red[800]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(80, 50)),
                onPressed: () {},
                child: Text("buy",style: TextStyle(fontSize: 15),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
