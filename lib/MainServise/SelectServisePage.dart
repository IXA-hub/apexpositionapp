import 'package:apexpositionapp/Account/AcccountPage.dart';
import 'package:apexpositionapp/SerectApexDeta/SerectApexDataPage.dart';
import 'package:apexpositionapp/SubServise/SubServisePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SelectServiceModel.dart';

class SelectServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Selectpage_Model>(
        create: (_) => Selectpage_Model(),
        child: Consumer<Selectpage_Model>(
          builder: (context, model, child) {
            int _page = model.getPage();
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  Offstage(
                    offstage: _page != 0,
                    child: MaterialApp(
                      home: SerectApexDataPage(),
                    ),
                  ),
                  Offstage(
                    offstage: _page != 1,
                    child: TickerMode(
                      enabled: _page == 1,
                      child: MaterialApp(
                        home: AccountPage(),
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: _page != 2,
                    child: TickerMode(
                      enabled: _page == 2,
                      child: MaterialApp(
                        home: SubServisePage(),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: CurvedNavigationBar(
                index: 0,
                height: 75.0,
                items: <Widget>[
                  Icon(Icons.youtube_searched_for,
                      size: 30, color: Colors.white),
                  Icon(Icons.account_box, size: 30, color: Colors.white),
                  Icon(Icons.settings, size: 30, color: Colors.white),
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
          },
        ));
  }
}
