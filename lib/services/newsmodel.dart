class NewsModel {
//   String? v;
// late  String
  late Source source;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  NewsModel(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  NewsModel.extractFromJSON(Map<String, dynamic> map) {
    author = map['author'] ?? "nor avl";
    title = map['title'] ?? "nor avl";
    description = map['description'] ?? "nor avl";
    url = map['url'] ?? "nor avl";
    urlToImage = map['urlToImage'] ??
        "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg"; // image link (default image is shown when the data from API is null)
    publishedAt = map['publishedAt'] ?? "nor avl";
    content = map['content'] ?? "nor avl";
  }
}

class Source {
  late String id;
  late String name;
  Source({required this.id, required this.name});
  Source.extractFromSource(Map<String, dynamic> map) {
    id = map['id'] ?? "nor avl";
    name = map['name'] ?? "nor avl";
  }
}
