import 'package:flutter/material.dart';

import 'MainServise/SelectServisePage.dart';
import 'mainModel.dart';

void main() async {
  // main内で非同期処理を呼び出す場合runApp前に初期化が必要
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final model = AppModel();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        //userStateを検知して画面を生成。初期はwaiting
        stream: model.userState,
        initialData: UserState.waiting,
        builder: (context, AsyncSnapshot<UserState> snapshot) {
          //userのstateがwaitingと一致していたらwaiting。それ以外はsnapshotを参照する。
          final UserState state =
              snapshot.connectionState == ConnectionState.waiting
                  ? UserState.waiting
                  : snapshot.data;
          return _convertPage(state);
        },
      ),
    );
  }

  StatelessWidget _convertPage(UserState state) {
    switch (state) {
      case UserState.waiting: // 初期化中
        return SplashPage();

      case UserState.noLogin: // 未ログイン
        return SelectServicePage(false);

      case UserState.okLogin:
        return SelectServicePage(true);
    }
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 96,
                  child: Image.asset('resources/img_app_icon.jpg'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
