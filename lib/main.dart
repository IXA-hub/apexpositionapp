import 'package:apexpositionapp/MainServise/MainServisePage.dart';
import 'package:apexpositionapp/SerectApexDeta/SerectApexDataPage.dart';
import 'package:apexpositionapp/Signup/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:simple_search_bar/simple_search_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainServisePage(),
    );
  }
}

