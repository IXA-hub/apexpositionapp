import 'package:apexpositionapp/MainServise/MainServisePage.dart';
import 'package:apexpositionapp/Signup/SignupPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainServisePage(),
    );
  }
}