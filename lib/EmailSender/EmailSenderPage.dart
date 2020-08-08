import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'EmailsenderModel.dart';

class EmailSenderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['nikumathuri@gmail.com'],
      isHTML: false,
    );
    Future Send() async{
      try {
        await FlutterEmailSender.send(email);
      }catch(e){
        print(e.toString());
      }
    }

    return ChangeNotifierProvider<EmailSenderModel>(
        create: (_) => EmailSenderModel(),
        child: Consumer<EmailSenderModel>(builder: (context,model,child){
          return Scaffold(
            appBar: AppBar(
              title: Text('Email'),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.send),
                  onPressed: (){
                   Send();
                  },
                ),
                IconButton(icon: Icon(Icons.backspace),
                  onPressed: (){
                  Navigator.pop(context);
                },),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Recipient',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Subject',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
                            labelText: 'Body', border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: Icon(Icons.camera),
              label: Text('Add Image'),
            ),
          );
        },)
    );
  }
}