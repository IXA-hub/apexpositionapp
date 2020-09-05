import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool> isLogin() async =>
    await Auth.FirebaseAuth.instance.currentUser != null;

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

    // ログイン状態の変化を監視し、変更があればUserStateをstreamで通知する

    UserState state = UserState.noLogin;

    if (await isLogin()) {
      state = UserState.okLogin;
    } else {
      state = UserState.noLogin;
    }

    _state = state;

    // noLogin の場合すぐに SplashPage が閉じてしまうので少し待つ
    if (_state == UserState.noLogin) {
      await Future.delayed(Duration(seconds: 3));
    }
    _userStateStreamController.sink.add(_state);
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
