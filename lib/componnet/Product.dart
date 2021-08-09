import 'package:ecommerceapp/pages/productdetailles.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var productlist = [
    {
      "name": "Blazer",
      "image": "aset/product/blazer1.jpeg",
      "oldprice": 250,
      "newprice": 200,
    },
    {
      "name": "shoes",
      "image": "aset/product/shoe1.jpg",
      "oldprice": 140,
      "newprice": 80,
    },
    {
      "name": "formal",
      "image": "aset/photo/formal.png",
      "oldprice": 180,
      "newprice": 60,
    },
    {
      "name": "informal",
      "image": "aset/photo/informal.png",
      "oldprice": 180,
      "newprice": 100,
    },
    {
      "name": "blazer1",
      "image": "aset/product/blazer1.jpeg",
      "oldprice": 180,
      "newprice": 200,
    },
    {
      "name": "blazer2",
      "image": "aset/product/blazer2.jpeg",
      "oldprice": 180,
      "newprice": 120,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productlist.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Singleproduct(
            productname: productlist[index]["name"],
            imagepecture: productlist[index]["image"],
            oldprice: productlist[index]["oldprice"],
            newprice: productlist[index]["newprice"],
          );
        });
  }
}

class Singleproduct extends StatelessWidget {
  final productname;
  final imagepecture;
  final oldprice;
  final newprice;

  Singleproduct(
      {Key key,
      this.productname,
      this.imagepecture,
      this.oldprice,
      this.newprice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productname,
        child: new Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Procductdetaills(
                      dtaillenom: productname,
                      dtailpicture: imagepecture,
                      dtailoldprice: oldprice,
                      detailnewprice: newprice,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    productname,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "\$$newprice",
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(
                    "\$$oldprice",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(
                imagepecture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
