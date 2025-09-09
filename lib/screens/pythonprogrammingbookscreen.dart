import 'package:flutter/material.dart';

class PythonProgrammingBooksScreen extends StatefulWidget {
  @override
  _PythonProgrammingBooksScreenState createState() => _PythonProgrammingBooksScreenState();
}

class _PythonProgrammingBooksScreenState extends State<PythonProgrammingBooksScreen> {
  final List<Map<String, dynamic>> books = [
    {
      'title': 'Python Programming Book 1',
      'author': 'Author 1',
      'image': 'assets/pythonbook1.jpeg',
      'route': '/pythonbook1',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'Python Programming Book 2',
      'author': 'Author 2',
      'image': 'assets/pythonbook2.jpeg',
      'route': '/pythonbook2',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'Python Programming Book 3',
      'author': 'Author 3',
      'image': 'assets/pythonbook3.jpeg',
      'route': '/pythonbook3',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'Python Programming Book 4',
      'author': 'Author 4',
      'image': 'assets/pythonbook4.jpeg',
      'route': '/pythonbook4',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'Python Programming Book 5',
      'author': 'Author 5',
      'image': 'assets/pythonbook5.png',
      'route': '/pythonbook5',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
  ];

  final List<TextEditingController> _commentControllers = List.generate(5, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC73),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B5E17),
        title: const Text('Python Programming Books'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          final comments = book['comments'] as List<String>;
          final showAll = book['showAll'] as bool;
          final int currentRating = book['rating'];

          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(book['image'], height: 80, width: 60, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('Author: ${book['author']}'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B3E0B),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, book['route']);
                      },
                      child: const Text('READ NOW', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // ⭐ Star Rating Section
                Row(
                  children: List.generate(5, (starIndex) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          book['rating'] = starIndex + 1;
                        });
                      },
                      icon: Icon(
                        Icons.star,
                        color: starIndex < currentRating ? Colors.amber : Colors.grey,
                      ),
                    );
                  }),
                ),

                // ✍🏼 TextField for comment
                TextField(
                  controller: _commentControllers[index],
                  decoration: InputDecoration(
                    hintText: 'Share your thoughts...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B5E17)),
                    onPressed: () {
                      setState(() {
                        final text = _commentControllers[index].text.trim();
                        if (text.isNotEmpty) {
                          comments.add(text);
                          _commentControllers[index].clear();
                        }
                      });
                    },
                    child: const Text('Submit', style: TextStyle(color: Colors.white)),
                  ),
                ),

                // 🗨️ Comments Section
                if (comments.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  const Text('User Reviews:', style: TextStyle(fontWeight: FontWeight.bold)),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        showAll ? comments.length : (comments.length > 2 ? 2 : comments.length),
                        (i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text('- ${comments[i]}'),
                        ),
                      ),
                    ),
                  ),
                  if (comments.length > 2)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          book['showAll'] = !showAll;
                        });
                      },
                      child: Text(showAll ? 'Hide Comments' : 'View More Comments'),
                    ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
