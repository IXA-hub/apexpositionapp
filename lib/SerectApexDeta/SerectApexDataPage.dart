import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'ApexListModel.dart';

class SerectApexDataPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_ListModel>(
      create: (_) => Apex_ListModel()..fetchApexData(),
      // ignore: missing_return
      child: Consumer<Apex_ListModel>(builder: (context, model, child) {
        return model.isLoading
            ? Container(
                child: Center(
                  child: SpinKitWave(
                    color: Colors.blueAccent,
                    size: 50.0,
                  ),
                ),
              )
            : Stack(
                children: [
                  Scaffold(
                    body: Stack(
                      children: [
                        Offstage(
                          offstage: model.list != 1,
                          child: GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 40),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 5),
                                      child: TextField(
                                        controller: searchController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: '検索用',
                                            suffixIcon: IconButton(
                                                icon: Icon(Icons.search),
                                                onPressed: () {
                                                  //todo
                                                })),
                                        onChanged: (value) {
                                          String text = value;
                                        },
                                      ),
                                    ),
                                    apexDataList(
                                        context, model.ApexDatas, child),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: model.sort != 1,
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
                                                          activeBgColor:
                                                              Colors.cyan,
                                                          activeFgColor:
                                                              Colors.white,
                                                          inactiveBgColor:
                                                              Colors.grey,
                                                          inactiveFgColor:
                                                              Colors.white,
                                                          labels: ['OFF', 'ON'],
                                                          icons: [
                                                            Icons
                                                                .not_interested,
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
                                                          activeBgColor:
                                                              Colors.cyan,
                                                          activeFgColor:
                                                              Colors.white,
                                                          inactiveBgColor:
                                                              Colors.grey,
                                                          inactiveFgColor:
                                                              Colors.white,
                                                          labels: ['OFF', 'ON'],
                                                          icons: [
                                                            Icons
                                                                .not_interested,
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
                ],
              );
      }),
    );
  }
}

Widget apexDataList(BuildContext context, List<ApexData> ApexDatas, child) {
  final List<Card> apexDataCard = ApexDatas.map((apexData) => Card(
        child: ListTile(
          title: Text(apexData.title),
        ),
      )).toList();
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: apexDataCard,
  );
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
