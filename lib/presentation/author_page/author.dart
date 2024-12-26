import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/presentation/author_page/author_detail.dart';

class Author extends StatelessWidget {
  const Author({super.key});

  // Hàm lấy danh sách tác giả từ Firestore
  Future<List<Map<String, dynamic>>> fetchAuthor() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('author').get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return {
        'name': data['name'] ?? 'No name',
        'description': data['description'] ?? 'No Description',
        'url': data['url'] ?? '',
      };
    }).toList();
  }

  Widget author(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchAuthor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No author found'));
          }

          List<Map<String, dynamic>> authors = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: authors.map((author) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0), // Khoảng cách giữa các phần tử
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthorDetail(
                            name: author['name'],
                            description: author['description'],
                            url: author['url'],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(author['url']),
                          onBackgroundImageError: (_, __) =>
                              const Icon(Icons.error, size: 50),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          author['name'],
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
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
    return author(context);
  }
}
