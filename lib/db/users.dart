import 'package:firebase_database/firebase_database.dart';

class userservices {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";
  creatuser(Map value) {
    _database
        .reference()
        .child(ref)
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }
}
