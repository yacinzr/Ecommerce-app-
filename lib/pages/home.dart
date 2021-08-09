import 'package:ecommerceapp/pages/cart.dart';
import 'package:ecommerceapp/pages/logiine.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:ecommerceapp/componnet/horisental_listview.dart';
import 'package:ecommerceapp/componnet/Product.dart';

class Myappp extends StatefulWidget {
  @override
  _MyapppState createState() => _MyapppState();
}

class _MyapppState extends State<Myappp> {
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
            new IconButton(
              icon: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new Cart()));
                  },
                  child: Icon(Icons.shopping_cart)),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.orangeAccent),
                  accountEmail: Text("zerikatyacine@gmail.com"),
                  accountName: Text("Zerikat Yacine"),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  )),
              ListTile(
                title: Text("home"),
                leading: Icon(Icons.home, color: Colors.orangeAccent),
                onTap: () {},
              ),
              ListTile(
                title: Text("my accounte"),
                leading: Icon(
                  Icons.person,
                  color: Colors.orangeAccent,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text('my orders'),
                leading:
                    Icon(Icons.shopping_basket, color: Colors.orangeAccent),
                onTap: () {},
              ),
              ListTile(
                title: Text('categories'),
                leading: Icon(Icons.category, color: Colors.orangeAccent),
                onTap: () {},
              ),
              ListTile(
                title: Text('favorites'),
                leading: Icon(Icons.favorite, color: Colors.orangeAccent),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text('log out '),
                leading: Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                ),
                onTap: () {
                  /*Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>new Login2()));*/
                },
              ),
            ],
          ),
        ),
        body: new ListView(
          children: <Widget>[
            SizedBox(
                height: 180.0,
                width: 440.0,
                child: Carousel(
                  images: [
                    ExactAssetImage("aset/photo/photo0.jpg"),
                    ExactAssetImage("aset/photo/photo1.jpg"),
                    ExactAssetImage("aset/photo/photo2.jpg"),
                  ],
                  autoplay: true,
                  dotSize: 4.0,
                  indicatorBgPadding: 10.0,
                  dotBgColor: Colors.transparent,
                )),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("categories"),
            ),
            Hlistview(),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text("Recent product"),
            ),
            new Container(
              width: 350.0,
              height: 300.0,
              child: Product(),
            )
          ],
        ));
  }
}
