import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laptrinhdidong/presentation/splash/pages/splash.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Đảm bảo Flutter đã được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Chạy ứng dụng sau khi khởi tạo xong
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}
