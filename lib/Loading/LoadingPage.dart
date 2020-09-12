import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  int RandomNumber() {
    var random = new Random();
    int number = random.nextInt(3);
    return number;
  }

//  final List<Widget> LoadingAnimation = [
//    SpinKitCircle(color: Colors.red),
//    SpinKitChasingDots(color: Colors.red),
//    SpinKitDoubleBounce(
//      color: Colors.red,
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
