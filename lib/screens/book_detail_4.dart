import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookDetail4 extends StatefulWidget {
  @override
  _BookDetail4State createState() => _BookDetail4State();
}

class _BookDetail4State extends State<BookDetail4> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE0B2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5E17),
        title: const Text("ADVANCED ENGINEERING DRAWING"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/egbook4.jpg', height: 200),
            const SizedBox(height: 10),
            const Text("ADVANCED ENGINEERING DRAWING", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Author: L.J. SMITH", style: TextStyle(color: Colors.black87)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: index < _rating ? Colors.amber : Colors.grey,
                    size: 28,
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            const Text(
              "This book is a comprehensive guide to advanced engineering drawing techniques, focusing on complex geometrical shapes, sectional views, and 3D visualization.",
              textAlign: TextAlign.justify,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B3E0B),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {
                // Navigate to PDF viewer screen for Book 4
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookPDFViewer(
                      assetPath: 'assets/egbook.pdf.pdf', // Path for Book 4 PDF
                    ),
                  ),
                );
              },
              child: const Text("READ NOW", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class BookPDFViewer extends StatelessWidget {
  final String assetPath;

  const BookPDFViewer({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Book"),
        backgroundColor: const Color(0xFF8B5E17),
      ),
      body: SfPdfViewer.asset(assetPath),  // Display PDF from assets
    );
  }
}
