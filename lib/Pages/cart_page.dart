import 'package:ecommerceapp/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

 
 refresh(){
   setState(() {
     
   });

   
 }

  @override
  Widget build(BuildContext context) {
    num total = 0;
    num price = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Expanded(child: CartList(notifyrefresh:refresh)),
          Divider(),
          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$" + Cart.totalcost().toString(),
                  style: TextStyle(fontSize: 30),
                ),
                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Buying not supported")));
                    },
                    child: Text("Buy"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  final Function() notifyrefresh;
  const CartList({Key? key,required this.notifyrefresh}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    print(Cart.items);
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
            onPressed: () {
              Cart.items.remove(Cart.items[index]);
              setState(() {
                widget.notifyrefresh();
              });
            },
            icon: Icon(Icons.remove_circle_outline)),
        title: Text(Cart.items[index]["name"]),
      ),
      itemCount: Cart.items.length,
    );
  }
}
