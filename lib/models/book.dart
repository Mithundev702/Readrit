class Book {
  String title;
  String author;
  String image;
  int rating;
  List<String> comments;

  Book({
    required this.title,
    required this.author,
    required this.image,
    this.rating = 0,
    List<String>? comments,
  }) : comments = comments ?? [];
}
