import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_search_bar/simple_search_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SortSettingPage extends StatelessWidget{

  final AppBarController appBarController = AppBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        primary: Theme.of(context).primaryColor,
        appBarController: appBarController,
        // You could load the bar with search already active
        autoSelected: true,
        searchHint: "Pesquise aqui...",
        mainTextColor: Colors.white,
        onChange: (String value) {
          //Your function to filter list. It should interact with
          //the Stream that generate the final list
        },
        //Will show when SEARCH MODE wasn't active
        mainAppBar: AppBar(
          title: Text("Yout Bar Title"),
          actions: <Widget>[
            InkWell(
              child: Icon(
                Icons.search,
              ),
              onTap: () {
                //This is where You change to SEARCH MODE. To hide, just
                //add FALSE as value on the stream
                appBarController.stream.add(true);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ToggleSwitch(
                      minWidth: 90.0,
                      minHeight: 70.0,
                      initialLabelIndex: 2,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: ['ALL', 'KingsCanyon', 'WorldsEdge'],
                      iconSize: 30.0,
                      activeBgColors: [Colors.blue, Colors.pink, Colors.purple],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                    ToggleSwitch(
                      minWidth: 90.0,
                      minHeight: 70.0,
                      initialLabelIndex: 2,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: ['X1', 'X2', 'X3'],
                      iconSize: 30.0,
                      activeBgColors: [Colors.blue, Colors.pink, Colors.purple],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                    ToggleSwitch(
                      minWidth: 90.0,
                      minHeight: 70.0,
                      initialLabelIndex: 2,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: ['Y1', 'Y2', 'Y3'],
                      iconSize: 30.0,
                      activeBgColors: [Colors.blue, Colors.pink, Colors.purple],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('pathfinderLimited'),
                          ToggleSwitch(
                            minWidth: 90.0,
                            initialLabelIndex: 1,
                            cornerRadius: 20.0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            labels: ['Male', 'Female'],
                            activeBgColors: [Colors.blue, Colors.pink],
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('LobaLimited'),
                          ToggleSwitch(
                            minWidth: 90.0,
                            initialLabelIndex: 1,
                            cornerRadius: 20.0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            labels: ['Male', 'Female'],
                            activeBgColors: [Colors.blue, Colors.pink],
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}