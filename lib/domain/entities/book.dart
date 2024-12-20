class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String cover;
  final String genre;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.cover,
    required this.genre
  });

  // Chuyển từ Map Firestore sang Entity
  factory Book.fromMap(Map<String, dynamic> data, String documentId) {
    return Book(
      id: documentId,
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      description: data['description'] ?? '',
      cover: data['cover'] ?? '',
      genre: data['genre'] ?? ''
    );
  }

  // Chuyển Entity thành Map để lưu vào Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'cover': cover,
      'genre': genre
    };
  }
}
