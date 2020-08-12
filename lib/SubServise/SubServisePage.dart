import 'package:apexpositionapp/Deveroper/DeveloperPage.dart';
import 'package:apexpositionapp/EmailSender/EmailSenderPage.dart';
import 'package:apexpositionapp/Explanation/ExplanationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubServisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('サブメニュー'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
              title: Text('お問い合わせ'),
              subtitle: Text('管理者への連絡はこちら'),
              trailing: Icon(Icons.mail),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmailSenderPage()));
              }),
          Divider(
            color: Colors.black45,
          ),
          ListTile(
              title: Text('使用方法について'),
              trailing: Icon(Icons.add_to_home_screen),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExplanationPage()));
              }),
          Divider(
            color: Colors.black45,
          ),
          ListTile(
              title: Text('本アプリについて'),
              trailing: Icon(Icons.developer_board),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeveloperPage()));
              }),
          Divider(
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
