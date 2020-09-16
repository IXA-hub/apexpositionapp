import 'package:apexpositionapp/Account/AcccountPage.dart';
import 'package:apexpositionapp/EmailSender/EmailSenderPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserModel.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel>(
        create: (_) => UserModel()..getUser(),
        // ignore: missing_return
        child: Consumer<UserModel>(builder: (context, model, child) {
          if (model.user == null) {
            return Center(child: CircularProgressIndicator());
          }
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text(model.user.nickname),
                //同様の使い方のEmailはセーフ,
                bottom: TabBar(
                  onTap: (index) {
                    model.setPage(index);
                  },
                  tabs: [
                    Tab(
                      child: Icon(Icons.account_circle),
                    ),
                    Tab(
                      child: Icon(Icons.contact_mail),
                    ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Visibility(
                    visible: model.page == 0,
                    child: AccountPage(),
                  ),
                  Visibility(
                    visible: model.page == 1,
                    child: EmailSenderPage(),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
