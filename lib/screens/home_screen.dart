import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MyProfileScreen.dart'; // ✅ Correct import (case-sensitive)
import 'login_Screen.dart'; // Add login screen import here

class HomeScreen extends StatefulWidget {
  final String userName; // Accept username to pass to profile screen

  HomeScreen({required this.userName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pageTurnAnimation;
  late Animation<double> _textFadeInAnimation;
  bool isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 700), // ✨ Made smoother (700ms instead of 1s)
      vsync: this,
    );

    _pageTurnAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic), // ✨ Smoother curve
    );

    _textFadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  void _flipBook() {
    setState(() {
      isFlipped = !isFlipped;
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2C16C),
        elevation: 0,
        title: Text(
          'ReadRit',
          style: GoogleFonts.robotoSlab(
            color: Color(0xFF4E2C0C),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF4E2C0C)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfileScreen(
                    userName: widget.userName, // Passing the username to the profile screen
                    booksRead: 5,
                    currentStreak: 7,
                    favoriteSubjects: ['Physics', 'Python Programming', 'C Programming'],
                    recentBooks: ['Python Crash Course', 'C Programming Basics', 'Engineering Graphics'],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: _flipBook, // Tap anywhere to flip the book
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF2C16C), Color(0xFFE9A94B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _flipBook, // Tap to flip the book
                    child: AnimatedBuilder(
                      animation: _pageTurnAnimation,
                      builder: (context, child) {
                        double rotation = isFlipped
                            ? 3.14 * _pageTurnAnimation.value
                            : 3.14 * (1 - _pageTurnAnimation.value);

                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(rotation)
                            ..scale(
                                (rotation % (2 * 3.14)) > 3.14 / 2 &&
                                        (rotation % (2 * 3.14)) < 3 * 3.14 / 2
                                    ? -1.0
                                    : 1.0,
                                1.0,
                                1.0),
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2C16C),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/book_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  FadeTransition(
                    opacity: _textFadeInAnimation,
                    child: Column(
                      children: [
                        Text(
                          'Welcome to',
                          style: GoogleFonts.robotoSlab(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3E2603),
                          ),
                        ),
                        Text(
                          'ReadRit!',
                          style: GoogleFonts.pacifico(
                            fontSize: 42,
                            color: Color(0xFF4E2C0C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    'Start your reading journey now!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5B3E0B),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5B3E0B),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                      shadowColor: Colors.brown.withOpacity(0.4),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/subjects');
                    },
                    child: Text(
                      'EXPLORE SUBJECTS',
                      style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
