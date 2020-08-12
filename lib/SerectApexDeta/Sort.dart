import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SortSettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ToggleSwitch(
          minWidth: 90.0,
          minHeight: 70.0,
          initialLabelIndex: 2,
          cornerRadius: 20.0,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.white,
          labels: ['', '', ''],
          icons: [
            Icons.keyboard,
            Icons.keyboard,
            Icons.keyboard,
          ],
          iconSize: 30.0,
          activeBgColors: [Colors.blue, Colors.pink, Colors.purple],
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
      ],
    );
  }
}