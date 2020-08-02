import 'package:apexpositionapp/Book_list/Book_List_page.dart';
import 'package:apexpositionapp/Sort/SortPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import 'SerectApexDataModel.dart';

class SerectApexDataPage extends StatelessWidget {

  int _page = 0;

  final _pageWidgets = [
    BookListPage(),
    SortSettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_dataModel>(
        create: (_) =>
        Apex_dataModel(),
        // ignore: missing_return
        child: Consumer<Apex_dataModel>(builder: (context, model, child){
          return Stack(
            children: <Widget>[
              DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: GradientAppBar(
                    title: Text('apex'),
                    gradient: LinearGradient(colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent]),
                    bottom: TabBar(tabs: <Widget>[
                      Tab(

                        icon: IconButton(
                            icon: Icon(Icons.video_library),
                            onPressed: (){
                              model.setPage(0);
                              _page = model.getPage();
                            }
                        ),
                      ),
                      Tab(
                        icon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: (){
                              model.setPage(1);
                              _page = model.getPage();
                            }
                        ),
                      )
                    ]),
                  ),
                  body:  _pageWidgets.elementAt(_page),
                ),
              ),
            ],
          );
        }),
    );
  }
}
