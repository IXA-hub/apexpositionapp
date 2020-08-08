import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.blue.withOpacity(0.8)),
              clipper: getClipper(),
            ),
           Container(
             width: double.infinity,
             height: 325,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 Container(
                     width: 150.0,
                     height: 150.0,
                     decoration: BoxDecoration(
                         image: DecorationImage(
                             image: NetworkImage(
                                 'https://pbs.twimg.com/profile_images/1105680721920704512/sd0mX_52_400x400.png'),
                             fit: BoxFit.cover),
                         borderRadius: BorderRadius.all(Radius.circular(75.0)),
                         boxShadow: [
                           BoxShadow(blurRadius: 7.0, color: Colors.black)
                         ])),
               ],
             ),
           ),
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}