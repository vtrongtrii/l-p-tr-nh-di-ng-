class Author {
  final String id;
  final String name;
  final String description;
  final String url;

  Author({
    required this.id,
    required this.name,
    required this.description,
    required this.url
  });

  // Chuyển từ Map Firestore sang Entity
  factory Author.fromMap(Map<String, dynamic> data, String documentId) {
    return Author(
      id: documentId,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      url: data['url'] ?? ''
    );
  }

  // Chuyển Entity thành Map để lưu vào Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'url': url
    };
  }
}
