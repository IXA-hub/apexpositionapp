import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Deveroper/DeveloperPage.dart';
import 'Explanation/ExplanationPage.dart';

class SubServisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('サブメニュー'),
      ),
      body: Column(
        children: <Widget>[
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
