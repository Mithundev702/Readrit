import 'package:flutter/material.dart';

class EngineeringChemistryBooksScreen extends StatefulWidget {
  @override
  _EngineeringChemistryBooksScreenState createState() => _EngineeringChemistryBooksScreenState();
}

class _EngineeringChemistryBooksScreenState extends State<EngineeringChemistryBooksScreen> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> books = [
    {
      'title': 'ENGINEERING CHEMISTRY VOL 1',
      'author': 'ANU SHARMA',
      'image': 'assets/chemistrybook1.jpg',
      'route': '/chemistrybook1',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'ENGINEERING CHEMISTRY',
      'author': 'B.S. CHAUHAN',
      'image': 'assets/chemistrybook2.jpeg',
      'route': '/chemistrybook2',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'CHEMISTRY FOR ENGINEERS',
      'author': 'ABHIJIT MALLICK',
      'image': 'assets/chemistrybook3.jpeg',
      'route': '/chemistrybook3',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'ENGINEERING CHEMISTRY',
      'author': 'SHIKA BASKER',
      'image': 'assets/chemistrybook4.jpeg',
      'route': '/chemistrybook4',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'ENGINEERING CHEMISTRY',
      'author': 'S.S. DARA',
      'image': 'assets/chemistrybook5.jpeg',
      'route': '/chemistrybook5',
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
        title: const Text('ENGINEERING CHEMISTRY'),
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
