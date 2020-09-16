import 'package:apexpositionapp/User/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserModel>(context);
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://pbs.twimg.com/profile_images/1105680721920704512/sd0mX_52_400x400.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ])),
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
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("NewNickName",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          TextField(
                            decoration: InputDecoration(hintText: 'username'),
                            onChanged: (text) {
                              model.newNickName = text;
                            },
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 138,
                              ),
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
                              SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    model.changeNicknameBoxState(true);
                                    model.changeNickname();
                                  }),
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
                child: Container(
                  width: 350,
                  height: 250,
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
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("現在のパスワード",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          decoration:
                              InputDecoration(hintText: 'CurrentPassword'),
                          onChanged: (text) {
                            model.currentPassword = text;
                          },
                        ),
                        SizedBox(height: 10),
                        Text("新しいパスワード",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          decoration: InputDecoration(hintText: 'NewPassword'),
                          onChanged: (text) {
                            model.newPassword = text;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              width: 138,
                            ),
                            GestureDetector(
                              onTap: () {
                                model.updatePassword();
                                model.changeefleshpasswordBoxState(true);
                                _showDialog(context);
                              },
                              child: Text(
                                '更新',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () {
                                  model.changeefleshpasswordBoxState(true);
                                }),
                          ],
                        ),
                      ],
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
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("DeleteUser",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          TextField(
                            decoration: InputDecoration(
                                hintText: model.user.nickname + '(名前を入力で削除可能)'),
                            onChanged: (text) {
                              model.deleteCheckchange(text);
                            },
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 138,
                              ),
                              Visibility(
                                visible:
                                    model.user.nickname == model.deleteCheck,
                                child: GestureDetector(
                                  onTap: () {
                                    model.deleteUserBoxStatechange(true);
                                    _showDialog(context);
                                  },
                                  child: Text(
                                    '削除',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    model.deleteUserBoxStatechange(true);
                                  }),
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
