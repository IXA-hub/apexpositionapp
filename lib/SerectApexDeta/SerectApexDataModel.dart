import 'package:flutter/cupertino.dart';

class Apex_dataModel extends ChangeNotifier {

  int _page = 0;

  getPage() {
    return _page;
  }

  setPage(int x) {
    _page = x;
    notifyListeners();
  }

}



