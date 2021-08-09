import 'package:flutter/material.dart';

class Hlistview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imagecaption: "aset/photo/tricot.png",
            subtitle: "shirt",
          ),
          Category(
            imagecaption: "aset/photo/dress.png",
            subtitle: "dress",
          ),
          Category(
            imagecaption: "aset/photo/jeans.png",
            subtitle: "jeans",
          ),
          Category(
            imagecaption: "aset/photo/formal.png",
            subtitle: "formal",
          ),
          Category(
            imagecaption: "aset/photo/informal.png",
            subtitle: "informal",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imagecaption;
  final String subtitle;

  Category({this.imagecaption, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imagecaption,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 12.0),
                )),
          ),
        ),
      ),
    );
  }
}
