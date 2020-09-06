import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppModel {
  // ignore: close_sinks
  final _userStateStreamController = StreamController<UserState>();
  Stream<UserState> get userState => _userStateStreamController.stream;

  UserState _state;

  // コンストラクタ
  AppModel() {
    _init();
  }

  Future _init() async {
    // firebaseの初期化(必須)とAPIキーの読み込み。
    await Firebase.initializeApp();
    await DotEnv().load('.env');

    UserState state = UserState.noLogin;

    if (await isLogin()) {
      state = UserState.okLogin;
    } else {
      state = UserState.noLogin;
    }

    _state = state;
    //loadingPage表示の為に待機
    await Future.delayed(Duration(microseconds: 1500));
    //stateの更新
    _userStateStreamController.sink.add(_state);
  }

  Future isLogin() async {
    if (await Auth.FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }
}

enum UserState {
  // 初期化中
  waiting,

  // 未ログイン
  noLogin,

  //ログイン
  okLogin,
}
