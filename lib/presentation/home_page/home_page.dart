import 'package:flutter/material.dart';
import 'package:laptrinhdidong/presentation/author_page/author.dart';
import 'package:laptrinhdidong/presentation/book_page/book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  color: Colors.black,
                  iconSize: 30,
                ),
                const SizedBox(width: 200),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                        fontFamily: 'Magra',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Cùng khám phá nào!',
              style: TextStyle(
                fontFamily: 'Magra',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            search(context),
            const SizedBox(height: 20),
            const Image(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMJZDP8Zna-KEMyEvC2jR1kTTXLXeNmFAX4g&s')),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nhà văn nổi tiếng',
                      style: TextStyle(
                          fontFamily: 'Magra',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                          fontFamily: 'Magra',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xffC6C6C6)),
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(height: 10),
            const Author(),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đọc tiếp',
                      style: TextStyle(
                          fontFamily: 'Magra',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                          fontFamily: 'Magra',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xffC6C6C6)),
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(height: 10),
            const Book(),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sách thịnh hành',
                      style: TextStyle(
                          fontFamily: 'Magra',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                          fontFamily: 'Magra',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xffC6C6C6)),
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  Widget search(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 350,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 252, 245, 245),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color.fromARGB(255, 241, 241, 241), width: 1),
        ),
        child: TextField(
          controller: _searchController, // Using TextEditingController
          decoration: InputDecoration(
            hintText: 'Tìm kiếm',
            border: InputBorder.none,
            // Align the hint text with the icons properly
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
            icon: const Icon(Icons.search, color: Colors.black),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sort, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
