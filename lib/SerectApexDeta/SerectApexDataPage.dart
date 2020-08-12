import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import 'ApexListModel.dart';
import 'ApexListPage.dart';
import 'Sort.dart';

class SerectApexDataPage extends StatelessWidget {
  int _page = 0;

  final _pageWidgets = [
    ApexListPage(),
    SortSettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_ListModel>(
      create: (_) => Apex_ListModel(),
      // ignore: missing_return
      child: Consumer<Apex_ListModel>(builder: (context, model, child) {
        return Stack(
          children: <Widget>[
            DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: GradientAppBar(
                  title: Text('HidePositionSelect!'),
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.deepPurpleAccent
                  ]),
                  bottom: TabBar(
                      onTap: (index) {
                        model.setPage(index);
                        _page = model.getPage();
                      },
                      tabs: <Widget>[
                        Tab(
                          child: Icon(Icons.add_to_home_screen),
                        ),
                        Tab(
                          child: Icon(Icons.add_to_home_screen),
                        ),
                      ]),
                ),
                body: _pageWidgets.elementAt(_page),
              ),
            ),
          ],
        );
      }),
    );
  }
}
