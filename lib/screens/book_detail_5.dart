import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookDetail5 extends StatefulWidget {
  @override
  _BookDetail5State createState() => _BookDetail5State();
}

class _BookDetail5State extends State<BookDetail5> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE0B2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5E17),
        title: const Text("ENGINEERING GRAPHICS DESIGN"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/egbook5.jpeg', height: 200),
            const SizedBox(height: 10),
            const Text("ENGINEERING GRAPHICS DESIGN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Author: J.H. STANFORD", style: TextStyle(color: Colors.black87)),
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
              "This book focuses on the practical aspects of engineering graphics design, including CAD modeling, technical drawing, and real-world applications.",
              textAlign: TextAlign.justify,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B3E0B),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {
                // Navigate to PDF viewer screen for Book 5
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookPDFViewer(
                      assetPath: 'assets/egbook.pdf.pdf', // Path for Book 5 PDF
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
