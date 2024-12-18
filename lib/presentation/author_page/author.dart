import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  const Author({super.key});

  Widget author(BuildContext context) {
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
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://media.newyorker.com/photos/5c5371239d69a04dde6b2a5e/master/w_2560%2Cc_limit/TNYInterview-Murakami.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Haruki Murakami',
                    style: TextStyle(
                      fontFamily: 'Magra',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'http://phunuvietnam.mediacdn.vn/media/news/44c9a4254627e41e9842bbf690a37dcc/1-nv.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nguyễn Nhật Ánh',
                    style: TextStyle(
                      fontFamily: 'Magra',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://lovebookslovelife.vn/wp-content/uploads/2019/11/jjk-01-1200x1200.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'J.K.Rowling',
                    style: TextStyle(
                      fontFamily: 'Magra',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://hips.hearstapps.com/hmg-prod/images/gettyimages-187751114.jpg?resize=1200:*',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Stephen King',
                    style: TextStyle(
                      fontFamily: 'Magra',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
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
    return author(context);
  }
}
