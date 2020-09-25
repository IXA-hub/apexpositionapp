import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplanationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('使用方法'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Container(
                width: 350,
                height: 550,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Text(
                        '使用方法',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1.基本的にログインは不要!',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('アプリをダウンロードしたら,'),
                            Text('即いろんなポジションを探してみてください！'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2.プレイ中の街の名前で検索！',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('検索Barに文字を打ちこんで検索すると、'),
                            Text('一致する文字をもつデータが出てきます！'),
                            Text('プレイ中の街の名前を入力してみよう！'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('3.Sort機能も便利！',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('sort機能で欲しいデータをさらに絞り込もう！'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('4.パスファインダー専なんで、、、',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('そんな方でも大丈夫！'),
                            Text('sort機能からパス限定のあんなポジションや'),
                            Text('こんなポジションを簡単に探せます！'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('5.あれ？知ってるポジションがデータにない、、、',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('もっとこんな機能欲しい！',
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            Text('俺の知ってるポジションがない！',
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            Text('ごめんなさい！一手間お掛けしますが、'),
                            Text('ユーザー登録後にリクエスト機能から'),
                            Text('情報共有お願いいたします！とても助かります。'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
