import 'package:apexpositionapp/SerectApexDeta/SerectApexDataPage.dart';
import 'package:apexpositionapp/Sort/SortPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainServisePage extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<MainServisePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final _pageWidgets = [
    SerectApexDataPage(),
    SortSettingPage(),
    _body(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_page),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        color: Colors.lightBlueAccent,
        buttonBackgroundColor: Colors.lightBlueAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

class _body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Text('', textScaleFactor: 10.0),
            RaisedButton(
              child: Text('Go To Page of index 1'),
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}