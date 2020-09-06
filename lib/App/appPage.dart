import 'package:apexpositionapp/MainServise/MainService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appModel.dart';
import 'loadingPage.dart';

class App extends StatelessWidget {
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
          //snapshotはUserState
          final UserState state = snapshot.data;
          return _convertPage(state);
        },
      ),
    );
  }

  StatelessWidget _convertPage(UserState state) {
    switch (state) {
      case UserState.waiting: // 初期化中
        return LoadingPage();

      case UserState.noLogin: // 未ログイン
        return SelectServicePage(false);

      case UserState.okLogin:
        return SelectServicePage(true);
    }
  }
}
