import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppModel {
  // ignore: close_sinks
  //streambuilderをcontorolする変数
  final _userStateStreamController = StreamController<UserState>();
  Stream<UserState> get userState => _userStateStreamController.stream;

  UserState _state;

  /// コンストラクタ
  AppModel() {
    _init(); // 初期化処理は非同期で行うため await しない
  }

  /// 初期化処理
  Future _init() async {
    // firebaseの初期化(必須)とAPIキーの読み込み。
    await Firebase.initializeApp();
    await DotEnv().load('.env');

    // ログイン状態の変化を監視し、変更があればUserStateをstreamで通知する
    Auth.FirebaseAuth.instance.authStateChanges().listen((firebaseUser) async {
      UserState state = UserState.noLogin;
      final user = await _fetchUser(firebaseUser);
      if (user != null) {
        state = UserState.okLogin;
      }

      _state = state;

      // noLogin の場合すぐに SplashPage が閉じてしまうので少し待つ
      if (_state == UserState.noLogin) {
        await Future.delayed(Duration(seconds: 3));
      }
      _userStateStreamController.sink.add(_state);
    });
  }

  /// ユーザを取得する
  Future<User> _fetchUser(Auth.User firebaseUser) async {
    if (firebaseUser == null) {
      return null;
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get();
    if (!doc.exists) {
      return null;
    }
    User user = User.doc(doc);
    return user;
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

class User {
  final String id;

  User._(
    this.id,
  );

  factory User.doc(DocumentSnapshot doc) {
    final data = doc.data();
    return User._(
      doc.id,
    );
  }
}
