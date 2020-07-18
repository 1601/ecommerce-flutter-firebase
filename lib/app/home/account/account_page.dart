import 'package:ecommerce_flutter_firebase/constants/keys.dart';
import 'package:ecommerce_flutter_firebase/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatelessWidget {
  final databaseReference = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.accountPage),
        actions: <Widget>[
          FlatButton(
            key: Key(Keys.logout),
            child: Text(
              Strings.logout,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => print('logout pressed'),
          ),
        ],
        // TODO: Add User Provider
      ),
    );
  }

  void getData() {
    databaseReference
        .collection("users")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }
}
