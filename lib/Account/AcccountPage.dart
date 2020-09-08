import 'package:apexpositionapp/EmailSender/EmailSenderPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AccountModel.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountModel>(
      create: (_) => AccountModel()..getUser(),
      // ignore: missing_return
      child: Consumer<AccountModel>(builder: (context, model, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text('Account'),
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
                    maintainState: true,
                    child: Stack(
                      children: <Widget>[
                        ClipPath(
                          child: Container(color: Colors.blue.withOpacity(0.8)),
                          clipper: getClipper(),
                        ),
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 325,
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
                                            BoxShadow(
                                                blurRadius: 7.0,
                                                color: Colors.black)
                                          ])),
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            Text(model.user.username),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                      visible: model.page == 1,
                      maintainState: true,
                      child: EmailSenderPage(model.user.Email)),
                ],
              )),
        );
      }),
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
