import 'dart:math';

import 'package:ecommerceapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MYapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecomerce app",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Loginpage(),
    );
  }
}

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

enum Formtype { login, register }

class _LoginpageState extends State<Loginpage> {
  final formkey = new GlobalKey<FormState>();
  String _email;
  String _password;
  Formtype _formtype = Formtype.login;

  bool validate() {
    final form = formkey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateandsubmit() async {
    if (validate()) {
      try {
        if (_formtype == Formtype.login) {
          FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _email, password: _password)) as FirebaseUser;
          print("user ${user.uid}");
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Myappp() ));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Myappp() ));
          FirebaseUser user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password)) as FirebaseUser;
          print('register${user.uid}');
        }
      } catch (e) {
        print("error $e");
      }
    }
  }

  void registanaccount() {
    formkey.currentState.reset();
    setState(() {
      _formtype = Formtype.register;
    });
  }

  void movetologin() {
    formkey.currentState.reset();
    setState(() {
      _formtype = Formtype.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orangeAccent[100], Colors.orangeAccent],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(150.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 80.0,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32, bottom: 32),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 58),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: buildinput() + submitbutton(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> submitbutton() {
    if (_formtype == Formtype.login) {
      return [
        InkWell(
          onTap: validateandsubmit,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              child: Text("D'ont have an account"),
              padding: const EdgeInsets.only(
                top: 16,
                right: 32,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: registanaccount,
          child: Container(
            margin: EdgeInsets.only(top: 40),
            height: 55,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orangeAccent[100], Colors.orangeAccent]),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Text(
                "login".toUpperCase(),
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
            ),
          ),
        )
      ];
    } else {
      return [
        InkWell(
          onTap: validateandsubmit,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              child: Text("creat a count"),
              padding: const EdgeInsets.only(
                top: 16,
                right: 32,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: movetologin,
          child: Container(
            margin: EdgeInsets.only(top: 40),
            height: 55,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orangeAccent[100], Colors.orangeAccent]),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Text(
                "you have an account! login ".toUpperCase(),
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
            ),
          ),
        )
      ];
    }
  }

  List<Widget> buildinput() {
    return [
      Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
              ),
            ]),
        child: TextFormField(
          onSaved: (value) => _email = value,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        margin: EdgeInsets.only(top: 32),
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          right: 16,
          left: 16,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
              ),
            ]),
        child: TextFormField(
          onSaved: (value) => _password = value,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "password",
            prefixIcon: Icon(
              Icons.security,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ];
  }
}
