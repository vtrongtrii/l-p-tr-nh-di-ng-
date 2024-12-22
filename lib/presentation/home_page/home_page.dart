import 'package:flutter/material.dart';
import 'package:laptrinhdidong/presentation/author_page/author.dart';
import 'package:laptrinhdidong/presentation/book_page/book.dart';
import 'package:laptrinhdidong/presentation/trending_book/trending_book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white, // Màu icon menu
          iconSize: 30,
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            label: const Text(
              'Đăng nhập',
              style: TextStyle(
                  fontFamily: 'Magra',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white), // Màu chữ của nút Đăng nhập
            ),
            icon: const Icon(
              Icons.person,
              color: Colors.white, // Màu icon Đăng nhập
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Cùng khám phá nào!',
              style: TextStyle(
                fontFamily: 'Magra',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            search(context),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Đặt độ bo góc
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMJZDP8Zna-KEMyEvC2jR1kTTXLXeNmFAX4g&s',
                width: 380,
                height: 130,
                fit: BoxFit.cover, // Đảm bảo ảnh không bị méo
              ),
            ),
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
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
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
            const SizedBox(height: 5),
            const Author(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đọc tiếp',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
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
            const SizedBox(height: 5),
            const Book(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sách thịnh hành',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
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
            tabs(),
            const SizedBox(height: 5),
            SizedBox(
              height: 220,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  TrendingBook(genre: 'phiêu lưu'),
                  TrendingBook(genre: 'Lãng mạn'),
                  TrendingBook(genre: 'Kinh dị'),
                  TrendingBook(genre: 'Trinh thám'),
                ],
              ),
            ),
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
          border: Border.all(
              color: const Color.fromARGB(255, 241, 241, 241), width: 1),
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Tìm kiếm',
            hintStyle: const TextStyle(color: Color.fromARGB(255, 183, 178, 178)),
            border: InputBorder.none,
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

  Widget tabs() {
    return Center(
      child: TabBar(
        controller: _tabController,
        isScrollable: false,
        labelColor: Colors.white,
        indicatorColor: Colors.blueGrey,
        tabs: const [
          Text(
            'Phiêu lưu',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.5,
              color: Colors.white,
            ),
          ),
          Text(
            'Lãng mạn',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.5,
              color: Colors.white,
            ),
          ),
          Text(
            'Kinh dị',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.5,
              color: Colors.white,
            ),
          ),
          Text(
            'Trinh thám',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
