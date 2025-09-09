import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookDetail1 extends StatefulWidget {
  @override
  _BookDetail1State createState() => _BookDetail1State();
}

class _BookDetail1State extends State<BookDetail1> {
  int _rating = 0; // Track the rating selected by the user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5E17),
        title: const Text("ENGINEERING GRAPHICS"),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/egbook1.jpg',
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "ENGINEERING DESIGN GRAPHICS",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E342E),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Author: ZABLON WEKESA",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.brown[700],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          _rating = index + 1; // Update rating on press
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
              ),
              const SizedBox(height: 20),
              const Text(
                "Overview",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5B3E0B),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "This course book and accompanying exercise books have been prepared with the aim of alleviating problems in geometric and Engineering Drawing courses. It provides foundational techniques and visual representation skills required in the modern engineering design field.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.menu_book, color: Colors.white),
                  label: const Text("READ NOW", style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B3E0B),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to PDF viewer screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookPDFViewer(
                          assetPath: 'assets/egbook.pdf.pdf',
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
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
