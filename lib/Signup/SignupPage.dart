import 'package:apexpositionapp/Account/AcccountPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

import 'SignupModel.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: (Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _emailSignUpBox(context),
                  SizedBox(height: 50),
                  _emailSignUpButtom(context),
                  SizedBox(height: 50),
                  _line(context),
                  SizedBox(height: 50),
                  _googleSignUpButtom(context),
                  _githubSignUpButtom(context),
                ],
              ),
            );
          },
        ),
      )),
    );
  }

  Widget _emailSignUpBox(BuildContext context) {
    final model = Provider.of<SignUpModel>(context);
    return Center(
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
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: 'example@email'),
                onChanged: (text) {
                  model.email = text;
                },
              ),
              Text("Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: 'password'),
                onChanged: (text) {
                  model.password = text;
                },
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Text(
                      'passwordを忘れた場合',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailSignUpButtom(BuildContext context) {
    final model = Provider.of<SignUpModel>(context);
    return InkWell(
      child: Container(
        width: 190,
        height: 75,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
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
                await model.emaiSignUp();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPage()));
              } catch (e) {
                _showDialog(context, toString());
              }
            },
            child: Center(
                child: Text('新規登録',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ))),
          ),
        ),
      ),
    );
  }

  Widget _line(BuildContext context) {
    return Row(
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
    );
  }

  Widget _googleSignUpButtom(BuildContext context) {
    return SignInButton(
      Buttons.GoogleDark,
      text: "Googleログイン",
      onPressed: () {},
    );
  }

  Widget _githubSignUpButtom(BuildContext context) {
    return SignInButton(
      Buttons.GitHub,
      text: "GitHubログイン",
      onPressed: () {},
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text(title),
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
