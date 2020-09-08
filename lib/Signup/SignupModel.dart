import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpModel extends ChangeNotifier {
  String email;
  String password;
  String username;

  Future emaiSignUp() async {
    final User user =
        (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
            .user;

    FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      {
        'uid': user.uid,
        'nickname': username,
        'Email': user.email,
        'createdAt': Timestamp.now(),
      },
    );
  }
}
