class Books {
  final String thumbnail;
  final String authors;
  final String title;
  final String subtitle;
  final String description;
  Books(
      {required this.thumbnail,
      required this.authors,
      required this.title,
      required this.subtitle,
      required this.description});

  static Books fromJson(Map<String, dynamic> json) => Books(
        thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? "",
        authors: json['volumeInfo']['authors'][0] ?? "",
        title: json['volumeInfo']['title'] ?? "",
        subtitle: json['volumeInfo']['subtitle'] ?? "",
        description: json['volumeInfo']['description'] ?? "NO DESCRIPTION",
      );
}
