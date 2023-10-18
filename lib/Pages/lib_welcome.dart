import 'package:flutter/material.dart';
import 'package:news_feed/Pages/books_grid_view.dart';
import 'package:news_feed/Pages/lib_result.dart';
import 'package:news_feed/api/books_api.dart';
import 'package:news_feed/constants/library_constanst.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_page';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _searchController = TextEditingController();

  void _submitSearch() {
    final searchParameter = _searchController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BooksGridViewPage(bookName: searchParameter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              'images/library.jpeg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color(0xff8d6e63),
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  labelText: 'Search here',
                  labelStyle: klib,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8d6e63),
                  ),
                  child: Text(
                    'Get Started',
                    style: klib,
                  ),
                  onPressed: _submitSearch),
            ),
          )
        ],
      ),
    );
  }
}
