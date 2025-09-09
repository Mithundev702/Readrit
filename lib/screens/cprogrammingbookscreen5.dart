import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CProgrammingBookScreen5 extends StatefulWidget {
  @override
  _CProgrammingBookScreen5State createState() => _CProgrammingBookScreen5State();
}

class _CProgrammingBookScreen5State extends State<CProgrammingBookScreen5> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5E17),
        title: const Text("C PROGRAMMING - 5"),
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
                    'assets/cprogramming5.jpeg',
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Head First C",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E342E),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Author: David Griffiths and Dawn Griffiths",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.brown,
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
                "Fun and engaging guide to learn C programming through puzzles, real-world examples, and exercises.",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookPDFViewer(
                          assetPath: 'assets/cprogramming4.pdf',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookPDFViewer extends StatelessWidget {
  final String assetPath;

  const BookPDFViewer({Key? key, required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Book"),
        backgroundColor: const Color(0xFF8B5E17),
      ),
      body: SfPdfViewer.asset(assetPath),
    );
  }
}
