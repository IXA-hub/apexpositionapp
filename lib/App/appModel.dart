import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppModel extends ChangeNotifier {
  // ignore: close_sinks
  bool isLoading = false;
  bool LoginState = false;

  // コンストラクタ
  AppModel() {
    _init();
  }

  Future _init() async {
    // firebaseの初期化(必須)とAPIキーの読み込み。
    await Firebase.initializeApp();
    await DotEnv().load('.env');

    if (await isLogin()) {
      LoginState = true;
      isLoading = true;
    } else {
      LoginState = false;
      isLoading = true;
    }
    //loadingPage表示の為に待機
    await Future.delayed(Duration(seconds: 3));
    //stateの更新
    notifyListeners();
  }

  Future isLogin() async {
    if (await Auth.FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }
}
