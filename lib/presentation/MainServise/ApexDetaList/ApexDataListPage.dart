import 'package:apexpositionapp/widgets/LoadingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'ApexDataListModel.dart';

class ApexDataListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApexDataListModel>(
      create: (_) => ApexDataListModel()..fetchApexData(),
      // ignore: missing_return
      child: Consumer<ApexDataListModel>(builder: (context, model, child) {
        return model.isLoading
            ? LoadingPage()
            : Stack(
                children: [
                  Visibility(
                    visible: model.page == 0,
                    maintainState: true,
                    child: _apexDataList(context),
                  ),
                  Visibility(
                    visible: model.page == 1,
                    maintainState: true,
                    child: _sortBox(context),
                  ),
                ],
              );
      }),
    );
  }
}

class _apexDataCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ApexDataListModel>(context);
    final List<Card> apexDataCard = model.ApexDatas.map((apexData) => Card(
          child: Visibility(
            visible: apexData.sortState,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 5.0,
                  ),
                  BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(0.0, -0.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: ListTile(
                title: Text(apexData.title),
                trailing: IconButton(
                  icon: Icon(Icons.movie),
                  onPressed: () async {
                    String url = await model.getGif(apexData.gifDirectory1,
                        apexData.gifDirectory2, apexData.gif);
                    _showGifMovie(context, url);
                  },
                ),
              ),
            ),
          ),
        )).toList();
    return ListView(
      shrinkWrap: true,
      children: apexDataCard,
    );
  }
}

Widget _apexDataList(BuildContext context) {
  final TextEditingController searchController = TextEditingController();
  final model = Provider.of<ApexDataListModel>(context);
  return Scaffold(
    resizeToAvoidBottomPadding: false,
    resizeToAvoidBottomInset: false,
    body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              _serchBar(context, searchController),
              model.ApexDatas.length == 0
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            height: 65,
                            width: 325,
                            child: Center(
                              child: Text(
                                '該当するデータはありません',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FloatingActionButton(
                            heroTag: 'refresh',
                            backgroundColor: Colors.white70,
                            child: Icon(
                              Icons.refresh,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              model.fetchApexData();
                            },
                          ),
                        ],
                      ),
                    )
                  : _apexDataCardList(),
            ],
          ),
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
        heroTag: 'ApexDataList',
        backgroundColor: Colors.blueAccent,
        child: Text('Sort'),
        onPressed: () {
          model.changePage();
        }),
  );
}

Widget _serchBar(BuildContext context, TextEditingController searchController) {
  final model = Provider.of<ApexDataListModel>(context);
  return Container(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
    child: TextField(
      decoration: InputDecoration(
          hintText: '空白検索でリセット',
          border: OutlineInputBorder(),
          labelText: '検索',
          suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                model.sort(model.serchText);
              })),
      onChanged: (value) {
        model.serchText = value;
      },
    ),
  );
}

_showGifMovie(context, url) async {
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
                    image: NetworkImage(url), fit: BoxFit.cover),
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

Widget _sortBox(BuildContext context) {
  final model = Provider.of<ApexDataListModel>(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text('field'),
                    ToggleSwitch(
                      minWidth: 90.0,
                      minHeight: 70.0,
                      initialLabelIndex: 0,
                      cornerRadius: 40.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: ['ALL', 'Kings', 'Edge'],
                      iconSize: 30.0,
                      activeBgColors: [Colors.blue, Colors.pink, Colors.purple],
                      onToggle: (index) {
                        model.SelectFieldState(index);
                      },
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('ローバ'),
                                ToggleSwitch(
                                  minWidth: 70.0,
                                  cornerRadius: 20.0,
                                  activeBgColor: Colors.cyan,
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  labels: ['OFF', 'ON'],
                                  icons: [
                                    Icons.not_interested,
                                    Icons.offline_pin,
                                  ],
                                  onToggle: (index) {
                                    model.SelectLobaLimitedState(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('パスファインダー'),
                                ToggleSwitch(
                                  minWidth: 70.0,
                                  cornerRadius: 20.0,
                                  activeBgColor: Colors.cyan,
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  labels: ['OFF', 'ON'],
                                  icons: [
                                    Icons.not_interested,
                                    Icons.offline_pin,
                                  ],
                                  onToggle: (index) {
                                    model.SelectpathfinderLimitedState(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    IconButton(
                      icon: Icon(Icons.search_rounded),
                      color: Colors.blueAccent,
                      onPressed: () {
                        model.changePage();
                        model.SerchApexData();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
