class News {
  final String author;
  final String urlToImage;
  final String title;
  final String description;

  News(
      {required this.author,
      required this.urlToImage,
      required this.title,
      required this.description});

  static News fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] ?? "Anonymous",
      urlToImage: json['urlToImage'] ?? "No Image Seen",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
    );
  }
}
