import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import 'ApexListModel.dart';
import 'ApexListPage.dart';
import 'Sort.dart';

class SerectApexDataPage extends StatelessWidget {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_ListModel>(
      create: (_) => Apex_ListModel()..fetchApex_data(),
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
                body: Stack(
                  children: <Widget>[
                    Offstage(
                      offstage: _page != 0,
                      child: TickerMode(
                        enabled: _page == 0,
                        child: MaterialApp(
                          home: ApexListPage(),
                        ),
                      ),
                    ),
                    Offstage(
                      offstage: _page != 1,
                      child: TickerMode(
                        enabled: _page == 1,
                        child: MaterialApp(
                          home: SortSettingPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
