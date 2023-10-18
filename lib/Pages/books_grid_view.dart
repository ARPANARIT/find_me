import 'package:flutter/material.dart';
import 'package:news_feed/api/books_api.dart';
import '../model/books.dart';
import 'book_cell_page.dart';
import 'book_detail_page.dart';

class BooksGridViewPage extends StatefulWidget {
  final String bookName;
  BooksGridViewPage({required this.bookName});

  @override
  State<BooksGridViewPage> createState() => _BooksGridViewPageState();
}

class _BooksGridViewPageState extends State<BooksGridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              child: FutureBuilder<List<Books>>(
            future: BooksApi.getBooks(widget.bookName),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return gridView(snapshot);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ))
        ],
      ),
    );
  }

  gridView(AsyncSnapshot<List<Books>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((book) {
          return GestureDetector(
            child: GridTile(
              child: BookCell(book),
            ),
            onTap: () {
              goToDetailPage(context, book);
            },
          );
        }).toList(), // Convert the Iterable to a List
      ),
    );
  }

  goToDetailPage(BuildContext context, Books book) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GridDetail(book: book);
    }));
  }
}
