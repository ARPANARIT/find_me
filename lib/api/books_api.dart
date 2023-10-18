import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/books.dart';

class BooksApi {
  static Future<List<Books>> getBooks(String name) async {
    var url =
        'https://www.googleapis.com/books/v1/volumes?q=$name&key=AIzaSyAqvVjt7kquGVPOz9ZaW-Z7OiNUM4NRjiU';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body.toString());
    final books = body['items'];
    List<Books> BooksList = books.map<Books>((book) {
      return Books.fromJson(book);
    }).toList();
    return BooksList;
  }

  static Future<Uint8List> loadImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
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
}
