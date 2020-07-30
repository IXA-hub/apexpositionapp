import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc){
    documentID = doc.documentID;
    title = doc['title'];
    imageURL = doc['imageURL'];
  }

  String title;
  String documentID;
  String imageURL;
}