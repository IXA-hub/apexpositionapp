import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EmailSenderModel extends ChangeNotifier {
  String title;
  String email;
  String name;
  Future emailSend() {
    FirebaseFirestore.instance.collection('email').add({
      'title': title,
      'name': name,
      'Email': email, //todo 登録時のemail
      'createdAt': Timestamp.now(),
    });
  }
}
