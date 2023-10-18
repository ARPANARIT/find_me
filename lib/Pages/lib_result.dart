import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:news_feed/api/books_api.dart';

import '../model/books.dart';

class BookResults extends StatefulWidget {
  static const String id = 'results_page';
  final String searchString;
  BookResults({required this.searchString});
  @override
  State<BookResults> createState() => _BookResultsState();
}

class _BookResultsState extends State<BookResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/library.jpeg'),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 100, right: 100),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff6d4641), width: 2),
                  ),
                ),
                child: Text(
                  'HOME',
                  style: TextStyle(fontSize: 28, color: Color(0xff6d4641)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Books>>(
                future: BooksApi.getBooks(widget.searchString),
                builder: (context, snapshot) {
                  final books = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return buildBooks(books!);
                      }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildBooks(List<Books> books) => ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final bookCover = books[index];
        return Container(
          color: Colors.grey,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Image(
                        image: NetworkImage(bookCover.thumbnail),
                      ),
                    ),
                    Container(
                      child: Text(bookCover.title),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
