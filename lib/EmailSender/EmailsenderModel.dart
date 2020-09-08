import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EmailSenderModel extends ChangeNotifier {
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
