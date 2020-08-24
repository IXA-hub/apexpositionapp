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
                          icon: Icon(Icons.edit),
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
