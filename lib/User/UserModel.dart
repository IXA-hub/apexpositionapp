import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
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
    notifyListeners();
  }

  String title;
  String mailbody;
  String Email;
  Future emailSend() {
    FirebaseFirestore.instance.collection('email').add({
      'title': title,
      'email': Email,
      'mailbody': mailbody, //todo 登録時のemail
      'createdAt': Timestamp.now(),
    });
  }
}

class User {
  String id;
  String username;
  String Email;

  User.doc(DocumentSnapshot doc) {
    this.id = doc.id;
    this.username = doc.data()['username'];
    this.Email = doc.data()['Email'];
  }
}
