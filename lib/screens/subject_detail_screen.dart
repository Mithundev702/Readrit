import 'package:flutter/material.dart';
import '../models/book.dart';

class SubjectDetailScreen extends StatelessWidget {
  final String subject;
  final List<Book> books;

  const SubjectDetailScreen({required this.subject, required this.books, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2C16C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B3E0B),
        title: Text(subject.toUpperCase()),
        leading: const BackButton(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];

          return Card(
            color: Colors.grey[200],
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(book.image, height: 100, width: 70, fit: BoxFit.cover),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(book.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF4E342E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B3E0B),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/book${index + 1}');
                    },
                    child: const Text('READ NOW'),
                  ),
                  if (book.comments.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    const Text(
                      'User Comments:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...book.comments.map((comment) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text("- $comment"),
                    )),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
