import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import 'SerectApexDataModel.dart';

class SerectApexDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Apex_dataModel>(
      create: (_) =>
      Apex_dataModel()
        ..fetchApex_data(),
      child: Stack(
        children: <Widget>[
          DefaultTabController(
            length: 2,
            child: Scaffold(
              // ignore: missing_return
              appBar: GradientAppBar(
                title: Text('apex'),
                gradient: LinearGradient(colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent]),
                bottom: TabBar(tabs: <Widget>[
                  Tab(
                    icon: IconButton(
                      icon: Icon(Icons.video_library),
                      onPressed: (){
                        // todo
                        // model.setPage();
                      }
                    ),
                  ),
                  Tab(
                    icon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: (){
                          // todo
                          //model.setPage();
                        }
                    ),
                  )
                ]),
              ),
              body: Consumer<Apex_dataModel>(builder: (context, model, child){
                final apexDatas = model.apex_datas;
                final listTiles =
                apexDatas.map((Apex_data) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                            ),
                            BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(-1.0, -1.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(Apex_data.title),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    )).toList();
                return ListView(
                  children: listTiles,
                );
              }),
            ),
          ),
          Consumer<Apex_dataModel>(builder: (context,model,child){
            return model.isLoading
                ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                :SizedBox();
          },)
        ],
      ),
    );
  }
}