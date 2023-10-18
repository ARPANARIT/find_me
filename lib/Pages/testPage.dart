import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:news_feed/api/news_api.dart';
import 'package:news_feed/constants/news_text_style.dart';

import '../model/news.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff212121),
          title: Text(
            'News Feed',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<News>>(
          future: NewsApi.getNews(),
          builder: (context, snapshot) {
            final news = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return buildNews(news!);
                }
            }
          },
        ));
  }
}

Widget buildNews(List<News> news) => ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        final newsArticle = news[index];
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
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: FutureBuilder<Uint8List>(
                          future: NewsApi.loadImage(newsArticle.urlToImage),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Image.asset('images/NoImageFound.jpg');
                            } else if (snapshot.hasData) {
                              return Image.memory(snapshot.data!);
                            } else {
                              return Image.asset('images/NoImageFound.jpg');
                            }
                          },
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Headline ${index + 1}',
                            style: kheadline,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            child: Text(
                              'By: ${newsArticle.author}',
                              style: kauthor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              'Title: ${newsArticle.title}',
                              style: ktitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7),
                      child: Text(
                        'Insights: ${newsArticle.description}', // Display the news article description here
                        style:
                            kdescription, // Define a style for the description text
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
