import 'package:apexpositionapp/MainServise/MainServisePage.dart';
import 'package:apexpositionapp/SerectApexDeta/SerectApexDataPage.dart';
import 'package:flutter/material.dart';

import 'SerectApexDeta/ApexListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainServicePage(),
    );
  }
}
