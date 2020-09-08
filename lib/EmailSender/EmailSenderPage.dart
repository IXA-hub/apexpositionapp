import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EmailsenderModel.dart';

class EmailSenderPage extends StatelessWidget {
  final String Email;
  EmailSenderPage(this.Email);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmailSenderModel>(
        create: (_) => EmailSenderModel(),
        child: Consumer<EmailSenderModel>(
          builder: (context, model, child) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _requestTextBox(context),
                      _UserEmailBox(context, Email),
                      _emailTextBox(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(Icons.info),
                              onPressed: () {
                                _showTextDialog(context, 'ok');
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                icon: Icon(Icons.send),
                label: Text('送信'),
                onPressed: () {
                  model.emailSend();
                  _showTextDialog(context, '送信されました');
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

Widget _UserEmailBox(BuildContext context, String Email) {
  final model = Provider.of<EmailSenderModel>(context);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      onChanged: (value) {
        model.Email = value;
      },
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: Email + ('(name)'),
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
        model.mailbody = value;
      },
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      maxLines: 10,
      decoration:
          InputDecoration(labelText: 'Body', border: OutlineInputBorder()),
    ),
  );
}

_showTextDialog(context, title) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Container(
            width: 300.0,
            height: 300.0,
            child: Text(title),
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
