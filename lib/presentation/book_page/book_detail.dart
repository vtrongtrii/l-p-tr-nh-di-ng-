import 'package:flutter/material.dart';
import 'package:laptrinhdidong/presentation/book_page/reading.dart';

class BookDetail extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String cover;
  final String url; // URL sẽ được truyền vào

  const BookDetail({
    super.key,
    required this.title,
    required this.author,
    required this.description,
    required this.cover,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 58, 67, 139),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.save, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 58, 67, 139), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Bìa sách nằm chính giữa
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    cover,
                    width: 250,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tác giả: $author',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style:
                    const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
             const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 105),
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadingPage(
                                    pdfUrl: url), // Dẫn đến trang đọc sách
                              ),
                            );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Đọc ngay', style: TextStyle(fontSize: 20), ),
                      SizedBox(width: 10, height: 30,),
                      Icon(Icons.arrow_circle_right)
                    ],
                  ),
                ),
              ),
            ],
          )
          ),
        ),
      );
  }
}
