import 'dart:async';

import 'package:apexpositionapp/domain/Menbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppModel extends ChangeNotifier {
  // ignore: close_sinks
  bool isLoading = true;
  bool LoginState = false;

  // コンストラクタ
  AppModel() {
    _init();
  }

  Future _init() async {
    if (isLoading == false) {
      isLoading = true;
    }
    // firebaseの初期化(必須)とAPIキーの読み込み。
    await Firebase.initializeApp();
    await DotEnv().load('.env');

    if (await isLogin()) {
      isLoading = false;
      LoginState = true;
      getUser();
    } else {
      isLoading = false;
      LoginState = false;
    }
    //loadingPage表示の為に待機
    await Future.delayed(Duration(seconds: 3));
    notifyListeners();
  }

  Future isLogin() async {
    if (await FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }

  int page = 0;

  setPage(int index) {
    page = index;
    notifyListeners();
  }

  bool x = true;
  String userID = '';
  Menbar menbar;
  Future getUser() async {
    userID = FirebaseAuth.instance.currentUser.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    Menbar menbar = Menbar.doc(doc);
    this.menbar = menbar;
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
  String deleteCheckPassword = '';
  String deleteCheck = '';
  deleteCheckchange(String x) {
    deleteCheck = x;
    notifyListeners();
  }

  deleteCheckchangePassword(String x) {
    deleteCheckPassword = x;
  }

  deleteUserBoxStatechange(bool x) {
    deleteUserBoxState = x;
    notifyListeners();
  }

  Future deleteUser() async {
    print(deleteCheckPassword);
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser
        .reauthenticateWithCredential(EmailAuthProvider.credential(
      email: firebaseUser.email,
      password: deleteCheckPassword,
    ));
    //todo LoadingPageを挟む　& リファクタ
    await firebaseUser.delete();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .delete();
    _init();
  }

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

  String userEmail = '';
  Future sendPasswordResetEmail() async {
    final Auth = FirebaseAuth.instance;
    userEmail = Auth.currentUser.email;
    await Auth.sendPasswordResetEmail(email: userEmail);
  }

  bool deleteuserNextBotton = true;
  bool deleteuserRunButton = false;
  deleteuserNextBottonChange(bool x) {
    deleteuserNextBotton = x;
    notifyListeners();
  }

  deleteuserRunButtonChange(bool x) {
    deleteuserRunButton = x;
    notifyListeners();
  }
}
