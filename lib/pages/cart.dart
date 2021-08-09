import 'package:ecommerceapp/componnet/cartproduct.dart';
import 'package:flutter/material.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("first ecommerce "),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Cartproduct(),
    
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total"),
                subtitle: Text("40\$"),
              ),
            ),
            Expanded(
                child: MaterialButton(
              onPressed: () {},
              child: Text(
                "check out ",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.orangeAccent,
            ))
          ],
        ),
      ),
    );
  }
}
