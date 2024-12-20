import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laptrinhdidong/presentation/book_page/book_detail.dart';

class TrendingBook extends StatelessWidget {
  final String genre;

  const TrendingBook({super.key, required this.genre});

  // Hàm lấy danh sách sách theo genre từ Firestore
  Future<List<Map<String, dynamic>>> fetchBooksByGenre() async {
    // Truy cập vào Firestore và lấy sách theo genre
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('books')
        .where('genre', isEqualTo: genre) // Lọc sách theo genre
        .get();

    // Trả về danh sách tài liệu với dữ liệu đầy đủ
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Widget book(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchBooksByGenre(), // Gọi hàm để lấy sách theo genre
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No books found for this genre'));
          }

          List<Map<String, dynamic>> books = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: books.map((book) {
                return GestureDetector(
                  onTap: () {
                    // Điều hướng đến trang chi tiết sách
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetail(
                          title: book['title'],
                          author: book['author'],
                          description: book['description'],
                          cover: book['cover'],
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
                          borderRadius: BorderRadius.circular(8.0), // Đặt độ bo góc
                          child: Image.network(
                            book['cover'],
                            width: 150,
                            height: 200,
                            fit: BoxFit.cover,
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
