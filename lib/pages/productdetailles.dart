import 'package:ecommerceapp/pages/home.dart';
import 'package:flutter/material.dart';
//import 'package:ecommerceapp/main.dart';
import 'package:ecommerceapp/componnet/Product.dart';

class Procductdetaills extends StatefulWidget {
  final dtaillenom;
  final dtailpicture;
  final dtailoldprice;
  final detailnewprice;

  Procductdetaills(
      {this.dtaillenom,
      this.dtailpicture,
      this.dtailoldprice,
      this.detailnewprice});

  @override
  _ProcductdetaillsState createState() => _ProcductdetaillsState();
}

class _ProcductdetaillsState extends State<Procductdetaills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: InkWell(
            child: Text("first ecommerce "),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  new Myappp()));
            },
          ),
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
                height: 200.0,
                child: GridTile(
                  child: Container(
                    color: Colors.white,
                    child: Image.asset(widget.dtailpicture),
                  ),
                  footer: new Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: new Text(
                          widget.dtaillenom,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                        title: new Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              "${widget.dtailoldprice}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough),
                            )),
                            Expanded(
                                child: Text(
                              "${widget.detailnewprice}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ))
                          ],
                        )),
                  ),
                )),
            Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text("size"),
                            content: Text("choose your size "),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "size",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                )),
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text("color"),
                            content: Text("choose your color "),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "color",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                )),
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text("QTY"),
                            content: Text("choose your QTY "),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Qty",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                  onPressed: () {},
                  child: new Text("buy it "),
                  color: Colors.orangeAccent,
                )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart),
                    color: Colors.orangeAccent),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  color: Colors.orangeAccent,
                )
              ],
            ),
            Divider(),
            ListTile(
              title: Text("product detaille"),
              subtitle: Text(
                  "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker."),
            ),
            Divider(),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text("product name",
                      style: TextStyle(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(widget.dtaillenom),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text("product brand",
                      style: TextStyle(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("brand x "),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text(
                    "product condit",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("NEW"),
                )
              ],
            ),
            Container(
              color: Colors.white,
              height: 20.0,
            ),
            Container(
              color: Colors.white,
              height: 44.0,
              child: Text("semilair product",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 350.0,
              child: Semillairproduct(),
            )
          ],
        ));
  }
}

class Semillairproduct extends StatefulWidget {
  @override
  _SemillairproductState createState() => _SemillairproductState();
}

class _SemillairproductState extends State<Semillairproduct> {
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
