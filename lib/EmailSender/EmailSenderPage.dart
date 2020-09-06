import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EmailsenderModel.dart';

class EmailSenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmailSenderModel>(
        create: (_) => EmailSenderModel(),
        child: Consumer<EmailSenderModel>(
          builder: (context, model, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text('リクエスト'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _requestTextBox(context),
                      _nameTextBox(context),
                      _emailTextBox(context),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                icon: Icon(Icons.send),
                label: Text('送信'),
                onPressed: () {
                  model.emailSend();
                  _showTextDialog(context);
                },
              ),
            );
          },
        ));
  }
}

Widget _requestTextBox(BuildContext context) {
  final model = Provider.of<EmailSenderModel>(context);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      onChanged: (value) {
        model.title = value;
      },
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Request',
      ),
    ),
  );
}

Widget _nameTextBox(BuildContext context) {
  final model = Provider.of<EmailSenderModel>(context);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      onChanged: (value) {
        model.name = value;
      },
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name',
      ),
    ),
  );
}

Widget _emailTextBox(BuildContext context) {
  final model = Provider.of<EmailSenderModel>(context);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      onChanged: (value) {
        model.email = value;
      },
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      maxLines: 10,
      decoration:
          InputDecoration(labelText: 'Body', border: OutlineInputBorder()),
    ),
  );
}

_showTextDialog(context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Container(
            width: 300.0,
            height: 300.0,
            child: Text('送信されました'),
          ),
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
