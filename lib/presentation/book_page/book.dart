import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  Widget book(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12), // Khoảng cách cạnh màn hình
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Cho phép vuốt ngang
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Căn chỉnh các phần tử Row từ trái
          children: [
            GestureDetector(
              onTap: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://bizweb.dktcdn.net/thumb/large/100/363/455/products/rungnauy004-f9a8f341-50e7-47b2-bccf-6923e33c998d.jpg?v=1723778526173',
                    ),
                    width: 150,
                    height: 200, // Chiều cao hình ảnh
                    fit: BoxFit.cover, // Căn chỉnh hình ảnh
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://www.nxbtre.com.vn/Images/Book/nxbtre_full_29292017_042903.jpg',
                    ),
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://bizweb.dktcdn.net/thumb/large/100/381/999/products/it.jpg?v=1606876926790',
                    ),
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://www.nxbtre.com.vn/Images/Book/NXBTreStoryFull_02482010_104821.jpg',
                    ),
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return book(context);
  }
}
