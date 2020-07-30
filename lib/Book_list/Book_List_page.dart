import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Book.dart';
import 'book_list_model.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) =>
      BookListModel()
        ..fetchBooks(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: Text('firestoreのModel'),
            ),
            body: Consumer<BookListModel>(builder: (context, model, child) {
              final books = model.books;
              final listTiles =
              books.map((book) =>
                  ListTile(
                    leading: Image.network(
                      book.imageURL
                    ),
                    title: Text(book.title),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                    ),
                    onLongPress: () async {
                      //todo　削除
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('${book.title}を削除しますか？'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  await deleteBook(context,model,book);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  )).toList();

              return ListView(
                children: listTiles,
              );
            }),
            floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
              return FloatingActionButton(
                child: Icon(Icons.add),
              );
            }),
          ),
          Consumer<BookListModel>(builder: (context,model,child){
            return model.isLoading
                ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                :SizedBox();
          },)
        ],
      ),
    );
  }

  Future deleteBook(BuildContext context,BookListModel model,Book book) async {
    try {
      await model.deleteBook(book);
      await model.fetchBooks();
    } catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      Navigator.of(context).pop();
    }
  }
}

