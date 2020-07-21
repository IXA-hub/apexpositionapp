import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bookListModel.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) =>
      BookListModel()
        ..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('firestoreのModel'),
        ),
        body: Consumer<BookListModel>(builder: (context, model, child) {
          final books = model.books;
          final listTiles =
          books.map((book) =>
              ListTile(
                title: Text(book.title),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                ),
              )).toList();
          return ListView(
            children: listTiles,
          );
        }),
      ),
    );
  }
}