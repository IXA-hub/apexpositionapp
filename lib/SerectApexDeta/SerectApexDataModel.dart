import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Apex_dataModel extends ChangeNotifier {
  List<Apex_data> apex_data = [];

  Future fetchApex_data() async {
    final docs = await Firestore.instance.collection('Apex_Demodata').getDocuments();
    final apexdata = docs.documents.map((doc) => Apex_data(doc)).toList();
    this.apex_data = apexdata;
    notifyListeners();
  }

}

class Apex_data {

  String documentID;
  String title;
  String field;
  String yCoordinate;
  String xCoordinate;
  // ignore: non_constant_identifier_names
  bool LobaLimited;
  bool pathfinderLimited;


  // ignore: non_constant_identifier_names
  Apex_data(DocumentSnapshot ApexData){
    documentID = ApexData.documentID;
    title = ApexData['title'];
    field = ApexData['field'];
    yCoordinate = ApexData['yCoordinate'];
    xCoordinate = ApexData['xCoordinate'];
    LobaLimited = ApexData['LobaLimited'];
    pathfinderLimited = ApexData['pathfinderLimited'];
  }
}