import 'package:flutter/material.dart';
import 'package:laptrinhdidong/presentation/home_page/home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwgsUET2lDtwHFfkUvOhtjazNQCk6YYHa-Hg&s'))
        ),
      );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    
    // Check if the widget is still mounted before navigating
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }
}
