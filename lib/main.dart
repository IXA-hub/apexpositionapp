import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'MainServise/SelectServisePage.dart';
import 'Signup/SignupPage.dart';

//ログイン時はtrue
Future<bool> isLogin() async =>
    await FirebaseAuth.instance.currentUser() != null;

void main() async {
  // main内で非同期処理を呼び出す場合runApp前に初期化が必要
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv().load('.env');
  runApp(MyApp(await isLogin()));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  MyApp(this.isLogin);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLogin ? SelectServicePage() : SignupPage(),
    );
  }
}
