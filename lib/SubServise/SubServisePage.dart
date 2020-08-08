import 'package:apexpositionapp/EmailSender/EmailSenderPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SubServiseModel.dart';

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
              }
          ),
          Divider(
            color: Colors.black45,
          ),
          ListTile(
            title: Text('本アプリについて'),
            trailing: Icon(Icons.developer_board),
          ),
          Divider(
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}