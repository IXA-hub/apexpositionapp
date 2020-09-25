import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('ユーザー様へ'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                height: 650,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 10.0,
                    ),
                    BoxShadow(
                      color: Colors.blueGrey,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('本アプリをご利用いただきありがとうございます。',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text('当アプリはAPEXをプレイ中の',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('開発者当人が',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'みんな凄い所にハイドするなぁ、、。でも、全部のポジションなんて覚えられないし誰かまとめてくれないかぁ',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('と、考え出したことがきっかけです。',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('当方ランクはダイヤ帯に一度入った',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('ことがある程度ですがプラチナ帯でも',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'とんでもない所隠れてんなこの人、、、',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('と、なったり自分がハイドして',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('ハラハラしたりしております。',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('本アプリを手にとっていただいた、',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('ユーザーのAPEXライフが少しでも',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('楽しいものであったなら幸いです。',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('ここまでお読みいただきありがとう',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text('ございました。',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text('ご意見お待ちしております。',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('開発者',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
