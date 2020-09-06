import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignInModel extends ChangeNotifier {
  String email = '';
  String password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future emailSignIn() async {
    if (email.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
