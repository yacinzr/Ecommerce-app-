import 'package:flutter/material.dart';

class Cartproduct extends StatefulWidget {
  @override
  _CartproductState createState() => _CartproductState();
}

class _CartproductState extends State<Cartproduct> {
  var productlist = [
    {
      "name": "Blazer",
      "image": "aset/product/blazer1.jpeg",
      "price": 250,
      "size": "M",
      "color": "red",
      "quantity": 1
    },
    {
      "name": "shoes",
      "image": "aset/product/shoe1.jpg",
      "price": 140,
      "size": "41",
      "color": "white",
      "quantity": 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productlist.length,
      itemBuilder: (BuildContext context, int index) {
        return new Singlecartproduct(
          namee: productlist[index]["name"],
          size: productlist[index]["size"],
          color: productlist[index]["color"],
          price: productlist[index]["price"],
          image: productlist[index]["image"],
        );
      },
    );
  }
}

class Singlecartproduct extends StatefulWidget {
  final namee;
  final image;
  final price;
  final size;
  final color;
  final quantity;

  Singlecartproduct(
      {this.namee,
      this.image,
      this.price,
      this.size,
      this.color,
      this.quantity});

  @override
  _SinglecartproductState createState() => _SinglecartproductState();
}

class _SinglecartproductState extends State<Singlecartproduct> {
      int quantitynumber = 1;

     void qplus (){
        quantitynumber = quantitynumber+1;
     }

       int qmoin (){
       return quantitynumber--;
     }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: Image.asset(widget.image),
            trailing: new Column(
              children: <Widget>[
               InkWell (onTap: (){ quantitynumber = quantitynumber+1;}, child: Icon(Icons.arrow_drop_up)),
                Text("$quantitynumber"),
                Expanded(child: InkWell(onTap: (){}, child: Icon(Icons.arrow_drop_down)))
              ],
            ),
            title: Text(widget.namee),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      child: Text("size:"),
                      padding: EdgeInsets.all(8.0),
                    ),
                    new Text(widget.size),
                    Padding(
                      child: Text("color:"),
                      padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: new Text(widget.color),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "\$${widget.price}",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                )
              ],
            )));
  }
}
