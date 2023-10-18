import 'package:flutter/material.dart';
import '../constants/library_constanst.dart';
import '../model/books.dart';

class GridDetail extends StatefulWidget {
  final Books book;
  GridDetail({required this.book});

  @override
  State<GridDetail> createState() => _GridDetailState();
}

class _GridDetailState extends State<GridDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Hero(
                tag: 'image${widget.book.thumbnail}',
                child: FadeInImage.assetNetwork(
                    placeholder: 'images/NoImageFound.jpg',
                    image: widget.book.thumbnail),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'Author: ${widget.book.authors}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                widget.book.title,
                style: TextStyle(
                  color: Color(0xff3e2723),
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                widget.book.subtitle,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Color(0xff3e2723),
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Description: ${widget.book.description ?? "No description"}',
                softWrap: true,
                style: TextStyle(
                  color: Color(0xff3e2723),
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
