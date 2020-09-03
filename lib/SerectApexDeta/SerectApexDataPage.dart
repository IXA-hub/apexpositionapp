import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'ApexListModel.dart';

class SerectApexDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_ListModel>(
      create: (_) => Apex_ListModel()..fetchApex_data(),
      // ignore: missing_return
      child: Consumer<Apex_ListModel>(builder: (context, model, child) {
        final apex_datas = model.apex_datas;
        final listTiles = apex_datas
            .map((apex_data) => Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0.0, -0.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(apex_data.title),
                      trailing: IconButton(
                        icon: Icon(Icons.movie),
                        onPressed: () async {
                          _showTextDialog(context, await model.getUrl());
                        },
                      ),
                    ),
                  ),
                ))
            .toList();
        return Stack(
          children: [
            Scaffold(
              body: Stack(
                children: [
                  Opacity(
                    opacity: model.list,
                    child: ListView(
                      children: listTiles,
                    ),
                  ),
                  Opacity(
                    opacity: model.sort,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueGrey,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 10.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.blueGrey,
                                    offset: Offset(0.0, -0.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text('field'),
                                      ToggleSwitch(
                                        minWidth: 90.0,
                                        minHeight: 70.0,
                                        initialLabelIndex: 0,
                                        cornerRadius: 40.0,
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        labels: ['', '', ''],
                                        icons: [
                                          Icons.all_inclusive,
                                          Icons.android,
                                          Icons.g_translate
                                        ],
                                        iconSize: 30.0,
                                        activeBgColors: [
                                          Colors.blue,
                                          Colors.pink,
                                          Colors.purple
                                        ],
                                        onToggle: (index) {
                                          model.SelectFieldState(index);
                                        },
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text('ローバ'),
                                                  ToggleSwitch(
                                                    minWidth: 90.0,
                                                    cornerRadius: 20.0,
                                                    activeBgColor: Colors.cyan,
                                                    activeFgColor: Colors.white,
                                                    inactiveBgColor:
                                                        Colors.grey,
                                                    inactiveFgColor:
                                                        Colors.white,
                                                    labels: ['OFF', 'ON'],
                                                    icons: [
                                                      Icons.not_interested,
                                                      Icons.offline_pin,
                                                    ],
                                                    onToggle: (index) {
                                                      model
                                                          .SelectLobaLimitedState(
                                                              index);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text('パスファインダー'),
                                                  ToggleSwitch(
                                                    minWidth: 90.0,
                                                    cornerRadius: 20.0,
                                                    activeBgColor: Colors.cyan,
                                                    activeFgColor: Colors.white,
                                                    inactiveBgColor:
                                                        Colors.grey,
                                                    inactiveFgColor:
                                                        Colors.white,
                                                    labels: ['OFF', 'ON'],
                                                    icons: [
                                                      Icons.not_interested,
                                                      Icons.offline_pin,
                                                    ],
                                                    onToggle: (index) {
                                                      model
                                                          .SelectpathfinderLimitedState(
                                                              index);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      IconButton(
                                        color: Colors.blue,
                                        icon: Icon(Icons.search),
                                        onPressed: () {
                                          model.changePage(1.0, 0.0);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                child: Text('Sort'),
                backgroundColor: Colors.lightBlue,
                onPressed: () {
                  model.changePage(0.0, 1.0);
                },
              ),
            ),
            model.isLoading
                ? Container(
                    child: Center(
                      child: SpinKitWave(
                        color: Colors.blueAccent,
                        size: 50.0,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        );
      }),
    );
  }
}

_showTextDialog(context, url) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(75.0)),
              )),
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
