import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AccountModel extends ChangeNotifier {
  int page = 0;

  setPage(int index) {
    page = index;
    notifyListeners();
  }

  bool x = true;
  User user;
  Future getUser() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    User user = User.doc(doc);
    this.user = user;
  }
}

class User {
  final String id;
  final String username;
  final String Email;

  User._(
    this.id,
    this.username,
    this.Email,
  );

  factory User.doc(DocumentSnapshot doc) {
    final data = doc.data();
    return User._(
      doc.id,
      data['nickname'],
      data['Email'],
    );
  }
}
