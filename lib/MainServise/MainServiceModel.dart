import 'package:flutter/cupertino.dart';

class MainServiceModel extends ChangeNotifier {
  int page = 1;

  setPage(int x) {
    page = x;
    notifyListeners();
  }
}
