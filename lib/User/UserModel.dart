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
  String userID = '';
  User user;
  Future getUser() async {
    userID = FirebaseAuth.instance.currentUser.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    User user = User.doc(doc);
    this.user = user;
    notifyListeners();
  }

  String currentPassword = '';
  String newPassword = '';
  bool refleshpasswordBoxState = true;

  changeefleshpasswordBoxState(bool x) {
    refleshpasswordBoxState = x;
    notifyListeners();
  }

  Future updatePassword() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser
        .reauthenticateWithCredential(EmailAuthProvider.credential(
      email: firebaseUser.email,
      password: currentPassword,
    ));
    await firebaseUser.updatePassword(newPassword);
  }

  bool nicknameBoxState = true;
  String newNickName = '';
  changeNicknameBoxState(bool x) {
    nicknameBoxState = x;
    notifyListeners();
  }

  Future changeNickname() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .update({'nickname': newNickName});
    await getUser();
  }

  bool deleteUserBoxState = true;
  String deleteCheck = '';
  deleteCheckchange(String x) {
    deleteCheck = x;
    notifyListeners();
  }

  deleteUserBoxStatechange(bool x) {
    deleteUserBoxState = x;
    notifyListeners();
  }

  Future deleteUsr() async {}

  String title;
  String mailbody;
  String Email;
  Future emailSend() {
    FirebaseFirestore.instance.collection('email').add({
      'title': title,
      'email': Email,
      'mailbody': mailbody,
      'createdAt': Timestamp.now(),
    });
  }
}

class User {
  String id;
  String nickname;
  String Email;

  User.doc(DocumentSnapshot doc) {
    this.id = doc.id;
    this.nickname = doc.data()['nickname'];
    this.Email = doc.data()['Email'];
  }
}
