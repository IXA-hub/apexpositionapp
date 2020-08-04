import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import 'ApexListModel.dart';

class ApexListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_ListModel>(
      create: (_) =>
      Apex_ListModel()
        ..fetchApex_data(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Consumer<Apex_ListModel>(builder: (context, model, child) {
              final books = model.apex_datas;
              final listTiles =
              books.map((book) =>
                  ListTile(
                    title: Text(book.title),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                    ),
                  )).toList();
              return ListView(
                children: listTiles,
              );
            }),
          ),
          Consumer<Apex_ListModel>(builder: (context, model, child) {
            return model.isLoading
                ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : SizedBox();
          },)
        ],
      ),
    );
  }
}