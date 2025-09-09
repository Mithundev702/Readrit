import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String title;
  final String pdfUrl;

  const PdfViewerScreen({super.key, required this.title, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF5B3E0B), // Custom brown color
        leading: const BackButton(color: Colors.white),
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        initialZoomLevel: 1.0,  // Optional: Adjust zoom level for better readability
        enableDoubleTapZooming: true,  // Optional: Enable zooming on double tap
      ),
    );
  }
}
