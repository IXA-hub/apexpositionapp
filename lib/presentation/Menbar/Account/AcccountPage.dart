import 'package:apexpositionapp/appModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppModel>(context);
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.blue.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 225,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset('images/default_Account_image1.png',
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.settings_applications),
                    onPressed: () {
                      model.changeefleshpasswordBoxState(true);
                      model.deleteUserBoxStatechange(true);
                      model.changeNicknameBoxState(false);
                    },
                  ),
                  IconButton(
                      icon: Icon(Icons.vpn_key),
                      onPressed: () {
                        model.changeNicknameBoxState(true);
                        model.deleteUserBoxStatechange(true);
                        model.changeefleshpasswordBoxState(false);
                      }),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      model.changeNicknameBoxState(true);
                      model.changeefleshpasswordBoxState(true);
                      model.deleteUserBoxStatechange(false);
                    },
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: model.nicknameBoxState,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, 10.0),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, -10.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text("NewNickName",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    model.changeNicknameBoxState(true);
                                    model.changeNickname();
                                  }),
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: 'username'),
                            onChanged: (text) {
                              model.newNickName = text;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  model.changeNickname();
                                  model.changeNicknameBoxState(true);
                                  _showDialog(context);
                                },
                                child: Text(
                                  '更新',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Offstage(
              offstage: model.refleshpasswordBoxState,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, 10.0),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, -10.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text("パスワードの変更",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    model.changeefleshpasswordBoxState(true);
                                  }),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              model.updatePassword();
                              model.changeefleshpasswordBoxState(true);
                              _showDialog(context);
                            },
                            child: Text(
                              '更新の為のメールを送信します',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Offstage(
              offstage: model.deleteUserBoxState,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, 10.0),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, -10.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("DeleteUser",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    model.deleteUserBoxStatechange(true);
                                    model.deleteuserNextBottonChange(true);
                                    model.deleteuserRunButtonChange(false);
                                  }),
                            ],
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Stack(
                            children: [
                              Visibility(
                                visible: model.deleteuserNextBotton,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextField(
                                      decoration:
                                          InputDecoration(hintText: 'password'),
                                      onChanged: (text) {
                                        model.deleteCheckchangePassword(text);
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                model
                                                    .deleteuserNextBottonChange(
                                                        false);
                                                model.deleteuserRunButtonChange(
                                                    true);
                                              },
                                              child: Text('次へ',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blueAccent))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: model.deleteuserRunButton,
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: model.menbar.nickname +
                                              '(名前を入力で削除可能)'),
                                      onChanged: (text) {
                                        model.deleteCheckchange(text);
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Visibility(
                                          visible: model.menbar.nickname ==
                                              model.deleteCheck,
                                          child: GestureDetector(
                                            onTap: () {
                                              model.deleteUserBoxStatechange(
                                                  true);
                                              model.deleteuserNextBottonChange(
                                                  true);
                                              model.deleteuserRunButtonChange(
                                                  false);
                                              model.deleteUser();
                                              _showDialog(context);
                                            },
                                            child: Text(
                                              '削除(この操作は取り消せません)',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

_showDialog(context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Container(
            width: 200,
            child: GestureDetector(
              child:
                  Text('更新成功しました！', style: TextStyle(color: Colors.blueAccent)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
