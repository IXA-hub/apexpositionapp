import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'ApexListModel.dart';

class ApexListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Model = Provider.of<Apex_ListModel>(context);
    return ChangeNotifierProvider.value(
        value: Model,
        child: Consumer<Apex_ListModel>(builder: (context, model, child) {
          final apex_datas = model.apex_datas;
          final listTiles = apex_datas
              .map((apex_data) => Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                          ),
                          BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(0.0, -0.0),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(apex_data.title),
                        trailing: IconButton(
                          icon: Icon(Icons.movie),
                          onPressed: () {
                            _showTextDialog(context);
                          },
                        ),
                      ),
                    ),
                  ))
              .toList();
          return Stack(
            children: [
              Scaffold(
                body: ListView(
                  children: listTiles,
                ),
                floatingActionButton: FloatingActionButton(
                  child: Text('Sort'),
                  backgroundColor: Colors.lightBlue,
                  onPressed: () async {
                    await model.SerchApexData();
                  },
                ),
              ),
              model.isLoading
                  ? Container(
                      child: Center(
                        child: SpinKitWave(
                          color: Colors.blueAccent,
                          size: 50.0,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          );
        }));
  }
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://firealpaca.com/images/douga/alpaca_gifanime.gif'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(75.0)),
              )),
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
