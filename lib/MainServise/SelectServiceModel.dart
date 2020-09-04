import 'package:flutter/cupertino.dart';

class Selectpage_Model extends ChangeNotifier {
  int _page = 0;

  getPage() {
    return _page;
  }

  setPage(int x) {
    _page = x;
    notifyListeners();
  }
}
