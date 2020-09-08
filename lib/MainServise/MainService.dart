import 'package:apexpositionapp/Account/AcccountPage.dart';
import 'package:apexpositionapp/ApexDetaList/ApexDataListPage.dart';
import 'package:apexpositionapp/Signin/SigninPage.dart';
import 'package:apexpositionapp/SubServise/SubServisePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainServiceModel.dart';

class SelectServicePage extends StatelessWidget {
  final bool isLogin;
  SelectServicePage(this.isLogin);
  final List<Widget> _tabIcon = [
    Icon(Icons.account_circle, size: 30, color: Colors.white),
    Icon(Icons.youtube_searched_for, size: 30, color: Colors.white),
    Icon(Icons.settings, size: 30, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainServiceModel>(
        create: (_) => MainServiceModel(),
        child: Consumer<MainServiceModel>(
          builder: (context, model, child) {
            return Scaffold(
              body: _MainServicepPage(context, isLogin),
              bottomNavigationBar: CurvedNavigationBar(
                index: 1,
                height: 75.0,
                items: _tabIcon,
                color: Colors.lightBlueAccent,
                buttonBackgroundColor: Colors.lightBlueAccent,
                backgroundColor: Colors.white,
                animationCurve: Curves.ease,
                animationDuration: Duration(milliseconds: 600),
                onTap: (index) {
                  model.setPage(index);
                },
              ),
            );
          },
        ));
  }
}

Widget _MainServicepPage(BuildContext context, bool isLogin) {
  final model = Provider.of<MainServiceModel>(context);
  return Stack(
    children: [
      _tabPage(model.page, 0, isLogin ? AccountPage() : SigninPage()),
      _tabPage(model.page, 1, ApexDataListPage()),
      _tabPage(model.page, 2, SubServisePage()),
    ],
  );
}

Widget _tabPage(int currentIndex, int tabIndex, StatelessWidget page) {
  return Visibility(
    visible: currentIndex == tabIndex,
    maintainState: true,
    child: page,
  );
}
