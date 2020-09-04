import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class emailSignUpModel extends ChangeNotifier {
  String email = null;
  String password = null;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future emaiSignUp() async {
    if (email.isEmpty) {
      throw ('Emailを入力してください');
    }

    if (password.isEmpty) {
      throw ('passwordを入力してください');
    }

    final User user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    //.userのemailを取得
    final UserEmail = user.email;

    Firestore.instance.collection('users').add(
      {
        'Email': UserEmail,
        'createdAt': Timestamp.now(),
      },
    );
  }
}
