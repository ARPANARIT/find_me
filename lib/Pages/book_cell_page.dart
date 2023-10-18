import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:news_feed/api/books_api.dart';
import '../model/books.dart';

class BookCell extends StatefulWidget {
  @required
  final Books book;
  BookCell(this.book);

  @override
  State<BookCell> createState() => _BookCellState();
}

class _BookCellState extends State<BookCell> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        child: Column(
          children: [
            Flexible(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: 'image${widget.book.title}',
                child: FutureBuilder<Uint8List>(
                  future: BooksApi.loadImage(widget.book.thumbnail),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Image.asset('images/NoImageFound.jpg');
                    } else if (snapshot.hasData) {
                      return Image.memory(snapshot.data!);
                    } else {
                      return Image.asset('images/NoImageFound.jpg');
                    }
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
