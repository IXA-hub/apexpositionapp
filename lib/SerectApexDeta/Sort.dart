import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'ApexListModel.dart';

class SortSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_ListModel>(
      create: (_) => Apex_ListModel(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Consumer<Apex_ListModel>(builder: (context, model, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      ToggleSwitch(
                        minWidth: 90.0,
                        minHeight: 70.0,
                        initialLabelIndex: 2,
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
                          print('switched to: $index');
                        },
                      ),
                      SizedBox(height: 20),
                      ToggleSwitch(
                        minWidth: 90.0,
                        minHeight: 70.0,
                        initialLabelIndex: 2,
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
                          print('switched to: $index');
                        },
                      ),
                      SizedBox(height: 20),
                      ToggleSwitch(
                        minWidth: 90.0,
                        minHeight: 70.0,
                        initialLabelIndex: 2,
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
                          print('switched to: $index');
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          children: <Widget>[
                            ToggleSwitch(
                              minWidth: 90.0,
                              cornerRadius: 20.0,
                              activeBgColor: Colors.cyan,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              labels: ['ON', 'OFF'],
                              icons: [Icons.offline_pin, Icons.not_interested],
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                            SizedBox(width: 10),
                            ToggleSwitch(
                              minWidth: 90.0,
                              cornerRadius: 20.0,
                              activeBgColor: Colors.cyan,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              labels: ['ON', 'OFF'],
                              icons: [Icons.offline_pin, Icons.not_interested],
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      model.SortState
                          ? InkWell(
                              child: Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF17ead9),
                                      Color(0xFF6078ea)
                                    ]),
                                    borderRadius: BorderRadius.circular(75.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0.0, 8.0),
                                          blurRadius: 8.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      await model.SerchApex_data();
                                      print('実行されてるよ');
                                    },
                                    child: Center(
                                        child: Text('SORT',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ))),
                                  ),
                                ),
                              ),
                            )
                          : SpinKitRotatingCircle(
                              color: Colors.red,
                              size: 50.0,
                            ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
