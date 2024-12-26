import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/presentation/book_page/book_detail.dart';

class AuthorDetail extends StatelessWidget {
  final String name;
  final String description;
  final String url;

  const AuthorDetail({
    super.key,
    required this.name,
    required this.description,
    required this.url,
  });

  // Hàm lấy danh sách sách từ Firestore
  Future<List<Map<String, dynamic>>> fetchBooksByAuthor(String author) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('books') // Tên collection chứa dữ liệu sách
        .where('author', isEqualTo: author) // Lọc theo tên tác giả
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return {
        'title': data['title'] ?? 'No title',
        'cover': data['cover'] ?? '',
        'author': data['author'] ?? 'Unknown',
        'description': data['description'] ?? 'No description',
        'url': data['url'] ?? '',
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 137, 67, 122),
        title: const Text("Tác giả"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 137, 67, 122), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Hiển thị ảnh tác giả
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      url,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 50),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Hiển thị tên tác giả
                Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Hiển thị mô tả tác giả
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                // Tiêu đề danh sách sách
                const Text(
                  "Sách của tác giả:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Danh sách sách
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: fetchBooksByAuthor(name),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('Không tìm thấy sách nào.'),
                      );
                    }

                    List<Map<String, dynamic>> books = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap:
                          true, // Đảm bảo danh sách không chiếm toàn bộ màn hình
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              book['cover'],
                              width: 50,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          title: Text(book['title']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetail(
                                  title: book['title'],
                                  author: book['author'],
                                  description: book['description'],
                                  cover: book['cover'],
                                  url: book['url'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
