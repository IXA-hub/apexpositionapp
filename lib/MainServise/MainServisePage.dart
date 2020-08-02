import 'package:apexpositionapp/Book_list/Book_List_page.dart';
import 'package:apexpositionapp/EmailSender/EmailSenderPage.dart';
import 'package:apexpositionapp/SerectApexDeta/SerectApexDataPage.dart';
import 'package:apexpositionapp/Signup/SignupPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SelectServiceModel.dart';

class MainServicePage extends StatelessWidget {

  final _pageWidgets = [
    SerectApexDataPage(),
    SignupPage(),
    EmailSenderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Selectpage_Model>(
      create: (_) => Selectpage_Model(),
      child: Consumer<Selectpage_Model>(builder: (context,model,child){
        final int _page = model.getPage();
            return Scaffold(
              body: _pageWidgets.elementAt(_page),
              bottomNavigationBar: CurvedNavigationBar(
                index: 0,
                height: 75.0,
                items: <Widget>[
                  Icon(Icons.youtube_searched_for, size: 30,color:Colors.white),
                  Icon(Icons.account_box, size: 30,color:Colors.white),
                  Icon(Icons.email, size: 30,color:Colors.white),
                ],
                color: Colors.lightBlueAccent,
                buttonBackgroundColor: Colors.lightBlueAccent,
                backgroundColor: Colors.white,
                animationCurve: Curves.ease,
                animationDuration: Duration(milliseconds: 600),
                onTap: (index) {
                  model.setPage(index);
                },
              ),
            );
          },)
    );
  }
}

