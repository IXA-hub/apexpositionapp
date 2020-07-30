import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Book.dart';


class BookListModel extends ChangeNotifier {
  List<Book> books = [];
  bool isLoading = true;

  startLoading(){
    isLoading = true;
  }
  stopLoading(){
    isLoading = false;
  }

  Future fetchBooks() async {
    startLoading();
    final docs = await Firestore.instance.collection('books').getDocuments();
    final books = docs.documents.map((doc) => Book(doc)).toList();
    this.books = books;
    notifyListeners();
    stopLoading();
  }

  Future deleteBook(Book book) async{
    await Firestore.instance
        .collection('books')
        .document(book.documentID)
        .delete();

  }
}
