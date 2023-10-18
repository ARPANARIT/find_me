import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/news.dart';

class NewsApi {
  static Future<List<News>> getNews() async {
    var url =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-07-22&sortBy=publishedAt&apiKey=b22be8a74ffe4fe19d9716299a398c88';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body.toString());
    final articles = body['articles'];
    print(articles);
    List<News> newsList = articles.map<News>((article) {
      return News.fromJson(article);
    }).toList();

    return newsList;
  }

  static Future<Uint8List> loadImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        print(response.bodyBytes);
        return response.bodyBytes;
      } else {
        // Handle non-200 status codes, including 403
        throw Exception(
            'Failed to load image, statusCode: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any other errors that might occur during the HTTP request
      throw Exception('Failed to load image: $e');
      print(e);
    }
  }
  // This loadImage function takes an imageUrl as an argument and returns a Future<Uint8List> representing the image data as bytes. It uses the http.get method to perform an HTTP GET request to fetch the image.
  //
  // If the response's status code is 200 (OK), it returns the body bytes of the response. If the status code is not 200, it throws an exception indicating the failure.
  //
  // Remember that this is a basic implementation and error handling can be further customized based on your application's needs. Make sure to handle exceptions and errors properly in your application code.
}
