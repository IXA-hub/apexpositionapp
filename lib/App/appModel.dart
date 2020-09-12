import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppModel extends ChangeNotifier {
  // ignore: close_sinks
  bool isLoading = true;
  bool LoginState;

  // コンストラクタ
  AppModel() {
    _init();
  }

  Future _init() async {
    // firebaseの初期化(必須)とAPIキーの読み込み。
    await Firebase.initializeApp();
    await DotEnv().load('.env');

    if (await isLogin()) {
      isLoading = false;
      LoginState = true;
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
}
