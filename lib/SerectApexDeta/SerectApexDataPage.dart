import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SerectApexDataModel.dart';

class MainServisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_dataModel>(
      create: (_) =>
      Apex_dataModel()
        ..fetchApex_data(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('firestoreのModel'),
        ),
        // ignore: missing_return
        body: Consumer<Apex_dataModel>(builder: (context, model, child) {
          final apexData = model.apex_data;
          final listTiles =
          apexData.map((Apex_data) =>
              ListTile(
                title: Text(Apex_data.title),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                ),
              )).toList();
          return ListView(
            children: listTiles,
          );
        }),
      ),
    );
  }
}