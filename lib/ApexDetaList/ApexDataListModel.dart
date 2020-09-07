import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApexDataListModel extends ChangeNotifier {
  int page = 0;
  changePage() {
    if (page == 0) {
      page = 1;
    } else {
      page = 0;
    }
    notifyListeners();
  }

  bool isLoading = false;
  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future getGif(String gifDirectory1, String gifDirectory2, String gif) async {
    final url = await FirebaseStorage.instance
        .ref()
        .child(gifDirectory1)
        .child(gifDirectory2)
        .child(gif)
        .getDownloadURL();
    return url;
  }

  List<ApexData> ApexDatas = [];
  Future fetchApexData() async {
    startLoading();
    final docs =
        await FirebaseFirestore.instance.collection('Apex_Demodata').get();
    final ApexDatas = docs.docs
        .map((doc) => ApexData(
            id: doc.data()['id'],
            title: doc.data()['title'],
            field: doc.data()['field'],
            gif: doc.data()['gif'],
            gifDirectory1: doc.data()['gifDirectory1'],
            gifDirectory2: doc.data()['gifDirectory2'],
            LobaLimited: doc.data()['LobaLimited'],
            pathfinderLimited: doc.data()['pathfinderLimited']))
        .toList();
    this.ApexDatas = ApexDatas;
    stopLoading();
  }

  int LobaLimitedState = 0;
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

  int pathfinderLimitedState = 0;
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
        final docs =
            await FirebaseFirestore.instance.collection('Apex_Demodata').get();
        final apexdatas = docs.docs
            .map((doc) => ApexData(
                id: doc.data()['id'],
                title: doc.data()['title'],
                field: doc.data()['field'],
                gif: doc.data()['gif'],
                gifDirectory1: doc.data()['gifDirectory1'],
                gifDirectory2: doc.data()['gifDirectory2'],
                LobaLimited: doc.data()['LobaLimited'],
                pathfinderLimited: doc.data()['pathfinderLimited']))
            .toList();
        this.ApexDatas = apexdatas;
      } else {
        final docs = await FirebaseFirestore.instance
            .collection('Apex_Demodata')
            .where("LobaLimited", isEqualTo: LobaLimitedState)
            .where("pathfinderLimited", isEqualTo: pathfinderLimitedState)
            .get();
        final apexdatas = docs.docs
            .map((doc) => ApexData(
                id: doc.data()['id'],
                title: doc.data()['title'],
                field: doc.data()['field'],
                gif: doc.data()['gif'],
                gifDirectory1: doc.data()['gifDirectory1'],
                gifDirectory2: doc.data()['gifDirectory2'],
                LobaLimited: doc.data()['LobaLimited'],
                pathfinderLimited: doc.data()['pathfinderLimited']))
            .toList();
        this.ApexDatas = apexdatas;
      }
    } else {
      if (LobaLimitedState == 0 && pathfinderLimitedState == 0) {
        final docs = await FirebaseFirestore.instance
            .collection('Apex_Demodata')
            .where("field", isEqualTo: fieldState)
            .get();
        final apexdatas = docs.docs
            .map((doc) => ApexData(
                id: doc.data()['id'],
                title: doc.data()['title'],
                field: doc.data()['field'],
                gif: doc.data()['gif'],
                gifDirectory1: doc.data()['gifDirectory1'],
                gifDirectory2: doc.data()['gifDirectory2'],
                LobaLimited: doc.data()['LobaLimited'],
                pathfinderLimited: doc.data()['pathfinderLimited']))
            .toList();
        this.ApexDatas = apexdatas;
      } else {
        final docs = await FirebaseFirestore.instance
            .collection('Apex_Demodata')
            .where("LobaLimited", isEqualTo: LobaLimitedState)
            .where("pathfinderLimited", isEqualTo: pathfinderLimitedState)
            .get();
        final apexdatas = docs.docs
            .map((doc) => ApexData(
                id: doc.data()['id'],
                title: doc.data()['title'],
                field: doc.data()['field'],
                gif: doc.data()['gif'],
                gifDirectory1: doc.data()['gifDirectory1'],
                gifDirectory2: doc.data()['gifDirectory2'],
                LobaLimited: doc.data()['LobaLimited'],
                pathfinderLimited: doc.data()['pathfinderLimited']))
            .toList();
        this.ApexDatas = apexdatas;
      }
    }
    LobaLimitedState = 0;
    pathfinderLimitedState = 0;
    fieldState = 0;
    stopLoading();
    notifyListeners();
  }
}

class ApexData {
  ApexData(
      {this.id,
      this.title,
      this.field,
      this.gif,
      this.gifDirectory1,
      this.gifDirectory2,
      this.LobaLimited,
      this.pathfinderLimited});
  String id;
  String title;
  String gif;
  String gifDirectory1;
  String gifDirectory2;
  // ignore: non_constant_identifier_names
  int field;
  int LobaLimited;
  int pathfinderLimited;

  // ignore: non_constant_identifier_names
  dynamic toJson() => {
        'id': id,
        'title': title,
        'field': field,
        'gif': gif,
        'gifDirectory1': gifDirectory1,
        'gifDirectory2': gifDirectory2,
        'LobaLimited': LobaLimited,
        'pathfinderLimited': pathfinderLimited
      };
}
