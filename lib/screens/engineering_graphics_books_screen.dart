import 'package:flutter/material.dart';

class EngineeringGraphicsBooksScreen extends StatefulWidget {
  @override
  _EngineeringGraphicsBooksScreenState createState() => _EngineeringGraphicsBooksScreenState();
}

class _EngineeringGraphicsBooksScreenState extends State<EngineeringGraphicsBooksScreen> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> books = [
    {
      'title': 'ENGINEERING DESIGN GRAPHICS',
      'author': 'FRANCIS MULAA',
      'image': 'assets/egbook1.jpg',
      'route': '/book1',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'ENGINEERING DRAWING-1',
      'author': 'K.R. TANWAR',
      'image': 'assets/egbook2.webp',
      'route': '/book2',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'ENGINEERING GRAPHICS PRINCIPLES',
      'author': 'E.MAX RAISOR FIAE',
      'image': 'assets/egbook3.jpg',
      'route': '/book3',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'ENGINEERING GRAPHICS',
      'author': 'SHIV KUMAR',
      'image': 'assets/egbook4.jpg',
      'route': '/book4',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
    {
      'title': 'ENGINEERING DESIGN GRAPHICS',
      'author': 'VICTOR GAMBHIR',
      'image': 'assets/egbook5.jpeg',
      'route': '/book5',
      'comments': <String>[],
      'rating': 0,
      'showAll': false,
    },
  ];

  final List<TextEditingController> _commentControllers = List.generate(5, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC73),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B5E17),
        title: Text('ENGINEERING GRAPHICS'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          final comments = book['comments'] as List<String>;
          final showAll = book['showAll'] as bool;
          final int currentRating = book['rating'];

          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(book['image'], height: 80),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Author: ${book['author']}'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5B3E0B),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, book['route']);
                      },
                      child: Text('READ NOW', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 10),

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

                // ✍🏼 TextField for adding comment
                TextField(
                  controller: _commentControllers[index],
                  decoration: InputDecoration(
                    hintText: 'Share your thoughts...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8B5E17)),
                    onPressed: () {
                      setState(() {
                        final text = _commentControllers[index].text.trim();
                        if (text.isNotEmpty) {
                          book['comments'].add(text);
                          _commentControllers[index].clear();
                        }
                      });
                    },
                    child: Text('Submit', style: TextStyle(color: Colors.white)),
                  ),
                ),

                // 🗨️ Animated Comments section
                if (comments.isNotEmpty) ...[
                  SizedBox(height: 10),
                  Text('User Reviews:', style: TextStyle(fontWeight: FontWeight.bold)),

                  // 🌀 Animate expand/collapse
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
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
                          book['showAll'] = !book['showAll'];
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
