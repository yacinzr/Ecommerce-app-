import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/pages/home.dart';
import 'package:ecommerceapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

enum Formtype { login, register }

class _Login2State extends State<Login2> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loding = false;
  bool islogedin = false;
  @override
  void initState() {
    issignin();
    super.initState();
  }

  void issignin() async {
    setState(() {
      loding = true;
    });
    preferences = await SharedPreferences.getInstance();
    islogedin = await googleSignIn.isSignedIn();

    await firebaseAuth.currentUser().then((user) {
      if (user != null) {
        setState(() {
          islogedin = true;
        });
      }
    });
    if (islogedin) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => new Myappp(),
          ));
    }
    setState(() {
      loding = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loding = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    FirebaseUser user =
        (await firebaseAuth.signInWithCredential(credential)).user;
    if (user != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        Firestore.instance.collection("users").document(user.uid).setData({
          "id": user.uid,
          "username": user.displayName,
          "profilepicture": user.photoUrl,
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("username", user.displayName);
        await preferences.setString("photourl", user.photoUrl);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photourl", documents[0]['photourl']);
      }
      Fluttertoast.showToast(msg: "login succ");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => new Myappp(),
          ));

      setState(() {
        loding = false;
      });
    } else {}
  }

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
        //if (_formtype == Formtype.login) {
          FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _email, password: _password)) .user;
          print("user ${user.uid}");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Myappp()));
        /*} else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Myappp()));
          FirebaseUser user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password)) as FirebaseUser;
          print('register${user.uid}');*/
        //}
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                ),
                child: Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.orangeAccent[100],
                                    Colors.orangeAccent
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 65,
                              height: 65,

                              /*child: RaisedButton(
                                color: Colors.grey,
                                onPressed: () {
                                  // handleSignIn();
                                },
                              ),*/
                            ),
                          ),
                        ),
                        Visibility(
                          child: Container(
                            color: Colors.white,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.orangeAccent),
                            ),
                          ),
                          visible: loding ?? true,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.orangeAccent[100],
                                      Colors.orangeAccent
                                    ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: 65,
                                height: 65,

                                /*child: RaisedButton(
                                  color: Colors.grey,
                                  onPressed: () {
                                    // handleSignIn();
                                  },
                                ),*/
                              ),
                            ),
                          ),
                          Visibility(
                            child: Container(
                              color: Colors.white,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.orangeAccent),
                              ),
                            ),
                            visible: loding ?? true,
                          )
                        ],
                      ),
                    ),
                  ],
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
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Signup()));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have an acount ?click here to  ",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Sign up ",
                      style: TextStyle(color: Colors.orangeAccent)),
                ]),
              ),
            ),
            padding: const EdgeInsets.only(
              top: 16,
              right: 32,
            ),
          ),
        ),
        InkWell(
          onTap: validateandsubmit,
          child: Container(
            margin: EdgeInsets.only(top: 30),
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
              border: InputBorder.none),
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
            border: InputBorder.none,
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
