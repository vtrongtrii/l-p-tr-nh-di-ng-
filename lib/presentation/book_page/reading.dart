import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingPage extends StatelessWidget {
  final String pdfUrl; // URL của file PDF

  const ReadingPage({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đọc sách'),
      ),
      body: SfPdfViewer.network(
        pdfUrl, // URL file PDF
        onDocumentLoadFailed: (details) {
          // Xử lý nếu URL lỗi
          debugPrint('Lỗi tải PDF: ${details.error}');
        },
      ),
    );
  }
}
