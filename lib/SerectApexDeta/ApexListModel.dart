import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apex_ListModel extends ChangeNotifier {
  Future getGif(String gifDirectory1, String gifDirectory2, String gif) async {
    final url = await FirebaseStorage.instance
        .ref()
        .child(gifDirectory1)
        .child(gifDirectory2)
        .child(gif)
        .getDownloadURL();
    return url;
  }

  double list = 1.0;
  double sort = 0.0;
  changePage(double x, double y) {
    list = x;
    sort = y;
    notifyListeners();
  }

  List<Apex_data> apex_datas = [];
  bool isLoading = false;

  startLoading() {
    isLoading = true;
  }

  stopLoading() {
    isLoading = false;
  }

  Future fetchApex_data() async {
    startLoading();
    final docs =
        await Firestore.instance.collection('Apex_Demodata').getDocuments();
    final apexdatas = docs.documents.map((doc) => Apex_data(doc)).toList();
    this.apex_datas = apexdatas;
    notifyListeners();
    stopLoading();
  }

  bool SortState = true;

  SortStateChangeTrue() {
    SortState = true;
  }

  SortStateChangeFalse() {
    SortState = false;
  }

  int LobaLimitedState = 0;
  int pathfinderLimitedState = 0;
  // ignore: non_constant_identifier_names
  Future SelectLobaLimitedState(int index) {
    switch (index) {
      case 0:
        LobaLimitedState = index;
        break;
      case 1:
        LobaLimitedState = index;
        break;
    }
  }

  Future SelectpathfinderLimitedState(int index) {
    switch (index) {
      case 0:
        pathfinderLimitedState = index;
        break;
      case 1:
        pathfinderLimitedState = index;
        break;
    }
  }

  int fieldState = 0;
  Future SelectFieldState(int index) {
    switch (index) {
      case 0:
        fieldState = index;
        break;
      case 1:
        fieldState = index;
        break;
      case 2:
        fieldState = index;
        break;
    }
  }

  Future SerchApexData() async {
    startLoading();
    if (fieldState == 0) {
      if (LobaLimitedState == 0 && pathfinderLimitedState == 0) {
        SortStateChangeFalse();
        final docs =
            await Firestore.instance.collection('Apex_Demodata').getDocuments();
        final apexdatas = docs.documents.map((doc) => Apex_data(doc)).toList();
        this.apex_datas = apexdatas;
        notifyListeners();
        SortStateChangeTrue();
      } else {
        SortStateChangeFalse();
        final docs = await Firestore.instance
            .collection('Apex_Demodata')
            .where("LobaLimited", isEqualTo: LobaLimitedState)
            .where("pathfinderLimited", isEqualTo: pathfinderLimitedState)
            .getDocuments();
        final apexdatas = docs.documents.map((doc) => Apex_data(doc)).toList();
        this.apex_datas = apexdatas;
        notifyListeners();
        SortStateChangeTrue();
      }
    } else {
      if (LobaLimitedState == 0 && pathfinderLimitedState == 0) {
        SortStateChangeFalse();
        final docs = await Firestore.instance
            .collection('Apex_Demodata')
            .where("field", isEqualTo: fieldState)
            .getDocuments();
        final apexdatas = docs.documents.map((doc) => Apex_data(doc)).toList();
        this.apex_datas = apexdatas;
        notifyListeners();
        SortStateChangeTrue();
      } else {
        SortStateChangeFalse();
        final docs = await Firestore.instance
            .collection('Apex_Demodata')
            .where("LobaLimited", isEqualTo: LobaLimitedState)
            .where("pathfinderLimited", isEqualTo: pathfinderLimitedState)
            .getDocuments();
        final apexdatas = docs.documents.map((doc) => Apex_data(doc)).toList();
        this.apex_datas = apexdatas;
        notifyListeners();
        SortStateChangeTrue();
      }
    }
    stopLoading();
    LobaLimitedState = 0;
    pathfinderLimitedState = 0;
    fieldState = 0;
  }
}

class Apex_data {
  String documentID;
  String title;
  String field;
  String gif;
  String gifDirectory1;
  String gifDirectory2;
  // ignore: non_constant_identifier_names
  int LobaLimited;
  int pathfinderLimited;

  // ignore: non_constant_identifier_names
  Apex_data(DocumentSnapshot ApexData) {
    documentID = ApexData.documentID;
    title = ApexData['title'];
    field = ApexData['field'];
    LobaLimited = ApexData['LobaLimited'];
    gif = ApexData['gif'];
    gifDirectory1 = ApexData['gifDirectory1'];
    gifDirectory2 = ApexData['gifDirectory2'];
    pathfinderLimited = ApexData['pathfinderLimited'];
  }
}
