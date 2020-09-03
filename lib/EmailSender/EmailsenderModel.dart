import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EmailSenderModel extends ChangeNotifier {
  String title;
  String email;
  String name;
  Future emailSend() {
    Firestore.instance.collection('email').add({
      'title': title,
      'name': name,
      'Email': email,
      'createdAt': Timestamp.now(),
    });
  }
}
