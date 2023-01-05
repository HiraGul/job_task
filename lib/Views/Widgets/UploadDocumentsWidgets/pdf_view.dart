import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfView extends StatelessWidget {
  final String pdfUrl;
  const PdfView({required this.pdfUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: pdfUrl,
        enableSwipe: false,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {},
        onPageError: (page, error) {},
      ),
    );
  }
}
