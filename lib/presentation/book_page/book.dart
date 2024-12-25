import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laptrinhdidong/presentation/book_page/book_detail.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  // Hàm lấy danh sách sách từ Firestore
  Future<List<Map<String, dynamic>>> fetchBooks() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('books').get();

    // Duyệt qua từng tài liệu và kiểm tra dữ liệu
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>; // Ép kiểu dữ liệu
      return {
        'title': data['title'] ?? 'No Title', // Giá trị mặc định nếu thiếu
        'author': data['author'] ?? 'Unknown Author',
        'description': data['description'] ?? 'No Description',
        'cover': data['cover'] ?? '',
        'url':data['url'] ?? ''
      };
    }).toList();
  }

  Widget book(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchBooks(), // Gọi hàm đã sửa để lấy dữ liệu
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No books found'));
          }

          List<Map<String, dynamic>> books = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: books.map((book) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetail(
                          title: book['title'], // Truyền dữ liệu chi tiết
                          author: book['author'],
                          description: book['description'],
                          cover: book['cover'],
                          url: book['url'],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            book['cover'], // Hiển thị ảnh bìa
                            width: 150,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error), // Xử lý lỗi ảnh
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return book(context);
  }
}
