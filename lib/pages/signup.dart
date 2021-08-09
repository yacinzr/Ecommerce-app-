import 'dart:ffi';

import 'package:ecommerceapp/db/users.dart';
import 'package:ecommerceapp/pages/home.dart';
import 'package:ecommerceapp/pages/logiine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _nameditingController = TextEditingController();
  TextEditingController _confirmepassEditingController =
      TextEditingController();
  userservices _userservice = userservices();
  bool hidpass = true;
  bool loding = false;
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final formkey = new GlobalKey<FormState>();

  Future<Void> validateform() async {
    FormState formState = formkey.currentState;
    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();
      
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailEditingController.text,
                password: _passwordEditingController.text)
            .then((user) => {
                  _userservice.creatuser( {
                    "username":_nameditingController.text,
                    "email": _emailEditingController.text,
                    "userid": user.user.uid,
                  })
                })
            .catchError((err) => {print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Myappp()));}
      }
      else{ Fluttertoast.showToast(msg: "marahse takhdem ya zah ");}
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
            height: MediaQuery.of(context).size.height / 2.7,
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
                      "Sign up ",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            )),
        Container(
          padding: EdgeInsets.only(top: 58),
          child: Form(
            key: formkey,
            child: Column(
              children: buildinput() + submitbutton(),
            ),
          ),
        ),
      ],
    ))));
  }

  List<Widget> submitbutton() {
    return [
      InkWell(
        onTap: validateform,
        child: Container(
          margin: EdgeInsets.only(
            top: 30,
          ),
          height: 55,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orangeAccent[100], Colors.orangeAccent]),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Center(
            child: Text(
              "sign up".toUpperCase(),
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
          ),
        ),
      ),
      InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => new Login2()));
          },
          child: Center(
              child: Text(
            "login".toUpperCase(),
          ))),
    ];
  }

  List<Widget> buildinput() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Container(
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
            controller: _nameditingController,
            // onSaved: (value) => _email = value,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Full name",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
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
            controller: _emailEditingController,
            // onSaved: (value) => _email = value,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              prefixIcon: Icon(
                Icons.alternate_email,
                color: Colors.grey,
              ),
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
          validator: (value) {
            if (value.isEmpty) {
              return ' passe is impty';
            } else if (value.length < 7) {
              return "your password is weak";
            }
          },
          controller: _passwordEditingController,
          //onSaved: (value) => _password = value,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "password",
            prefixIcon: Icon(
              Icons.security,
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
          controller: _confirmepassEditingController,
          // onSaved: (value) => _password = value,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Confirm password",
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
