import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class functionTest extends StatefulWidget {
  @override
  _functionTest createState() => _functionTest();
}

class _functionTest extends State<functionTest> {
  String _response = 'no response';
  int _responseCount = 0;

  @override
  Widget build(BuildContext context) {
    final HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'repeat')
          ..timeout = const Duration(seconds: 30);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cloud Functions example app'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                Text('Response $_responseCount: $_response'),
                MaterialButton(
                  child: const Text('SEND REQUEST'),
                  onPressed: () async {
                    try {
                      final HttpsCallableResult result = await callable.call(
                        <String, dynamic>{
                          'message': 'hello world!',
                          'count': _responseCount,
                        },
                      );
                      print(result.data);
                      setState(() {
                        _response = result.data['repeat_message'];
                        _responseCount = result.data['repeat_count'];
                      });
                    } on CloudFunctionsException catch (e) {
                      print('caught firebase functions exception');
                      print(e.code);
                      print(e.message);
                      print(e.details);
                    } catch (e) {
                      print('caught generic exception');
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
