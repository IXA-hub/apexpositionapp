import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

import 'SigninModel.dart';


class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();

    return ChangeNotifierProvider<emailSignInModel>(
      create: (_) => emailSignInModel(),
      child: (
          //ここから
          Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: true,
            body: Consumer<emailSignInModel>(
              builder: (context, model, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 350,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 10.0,
                              ),
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(0.0, -15.0),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Email",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                TextField(
                                  decoration:
                                  InputDecoration(hintText: 'example@email'),
                                  controller: emailcontroller,
                                  onChanged: (text) {
                                    model.email = text;
                                  },
                                ),
                                Text("Password",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: 'password'),
                                  controller: passwordcontroller,
                                  onChanged: (text) {
                                    model.password = text;
                                  },
                                  obscureText: true,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        // todo ここにパスワード紛失時の手続きを記述
                                        print("onTap called.");
                                      },
                                      child: (Text(
                                        'passwordを忘れた場合',
                                        style: TextStyle(color: Colors.blue),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ここまで
                      SizedBox(height: 50),
                      //ここから
                      InkWell(
                        child: Container(
                          width: 190,
                          height: 75,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF17ead9),
                                    Color(0xFF6078ea)
                                  ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                try {
                                  await model.emailSignIn();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SigninPage(),
                                    ),
                                  );
                                } catch (e) {
                                  _showDialog(context, 'このユーザーは既に使用されています...');
                                }
                              },
                              child: Center(
                                  child: Text('SIGN IN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ))),
                            ),
                          ),
                        ),
                      ),
                      //ここまで
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: 300,
                              height: 1.0,
                              color: Colors.black12.withOpacity(.2),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      SignInButton(
                        Buttons.GoogleDark,
                        text: "Googleログイン",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.GitHub,
                        text: "GitHubログイン",
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }

  Future _showDialog(BuildContext context,
      String title,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text(''),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
