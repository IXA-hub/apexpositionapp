import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'ApexListModel.dart';

class SortSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Apex_ListModel>(context);
    return ChangeNotifierProvider.value(
      value: model,
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
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
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('X軸'),
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
                          print('switched to: $index');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('Y軸'),
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
                          print('switched to: $index');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              labels: ['OFF', 'ON'],
                              icons: [
                                Icons.not_interested,
                                Icons.offline_pin,
                              ],
                              onToggle: (index) {
                                model.SelectLobaLimitedState(index);
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
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              labels: ['OFF', 'ON'],
                              icons: [
                                Icons.not_interested,
                                Icons.offline_pin,
                              ],
                              onToggle: (index) {
                                model.SelectpathfinderLimitedState(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Consumer<Apex_ListModel>(
                  builder: (context, model, child) {
                    return InkWell(
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                            borderRadius: BorderRadius.circular(75.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF6078ea).withOpacity(.3),
                                  offset: Offset(0.0, 8.0),
                                  blurRadius: 8.0)
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            child: Center(
                                child: Text('SORT',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ))),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
