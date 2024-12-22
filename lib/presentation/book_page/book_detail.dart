import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String cover;

  const BookDetail({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 58, 67, 139) ,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Biểu tượng quay lại
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black,), // Biểu tượng yêu thích
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black,), // Biểu tượng chia sẻ
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.save, color: Colors.black,), // Biểu tượng chia sẻ
            onPressed: () {},
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
          // Sử dụng LinearGradient để tạo nền chuyển màu
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 58, 67, 139), Colors.white], // Màu xanh ngọc và trắng
            begin: Alignment.topCenter, // Bắt đầu từ trên
            end: Alignment.bottomCenter, // Kết thúc ở dưới
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  cover,
                  width: 600,
                  height: 400,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tác giả: $author',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
