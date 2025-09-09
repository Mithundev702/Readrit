import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PythonBookscreen1 extends StatefulWidget {
  @override
  _PythonBookscreen1State createState() => _PythonBookscreen1State();
}

class _PythonBookscreen1State extends State<PythonBookscreen1> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];
  bool _showAllComments = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5E17),
        title: const Text("PYTHON PROGRAMMING FOR BEGINNERS"),
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
                    'assets/pythonbook1.jpeg',
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "PYTHON PROGRAMMING FOR BEGINNERS",
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
                  "Author: RYAN NICHOLS",
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
                "This book introduces Python programming in a beginner-friendly way.\n"
                "Covers basics like loops, functions, and file handling.\n"
                "Includes plenty of examples and practice questions.\n"
                "Explains problem-solving through coding exercises.\n"
                "Ideal for first-time programmers in any field.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              // Submit Rating Button
              ElevatedButton.icon(
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
                        assetPath: 'assets/pythonprogramming.pdf',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              // Comments Section
              const Text(
                "User Reviews:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Share your thoughts...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final text = _commentController.text.trim();
                      if (text.isNotEmpty) {
                        _comments.add(text);
                        _commentController.clear();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B5E17)),
                  child: const Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              // Display Comments
              if (_comments.isNotEmpty) ...[
                const SizedBox(height: 10),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      _showAllComments ? _comments.length : (_comments.length > 2 ? 2 : _comments.length),
                      (i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text('- ${_comments[i]}'),
                      ),
                    ),
                  ),
                ),
                if (_comments.length > 2)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showAllComments = !_showAllComments;
                      });
                    },
                    child: Text(_showAllComments ? 'Hide Comments' : 'View More Comments'),
                  ),
              ],
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
