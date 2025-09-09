import 'package:flutter/material.dart';

// --- Screens ---
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart'; // Corrected to 'HomeScreen'
import 'screens/subject_selection_screen.dart';
import 'screens/myprofilescreen.dart';

// --- Subject Book Listing Screens ---
import 'screens/engineering_graphics_books_screen.dart';
import 'screens/engineeringmathematicsbooksscreen.dart';
import 'screens/engineeringphysicsscreen.dart';
import 'screens/engineeringchemistrybookscreen.dart';
import 'screens/pythonprogrammingbookscreen.dart';
import 'screens/cprogrammingbookscreen.dart';

// --- Engineering Graphics Book Details ---
import 'screens/book_detail_1.dart';
import 'screens/book_detail_2.dart';
import 'screens/book_detail_3.dart';
import 'screens/book_detail_4.dart';
import 'screens/book_detail_5.dart';

// --- Engineering Mathematics Book Details ---
import 'screens/bookdetailmath1.dart';
import 'screens/bookdetailmath2.dart';
import 'screens/bookdetailmath3.dart';
import 'screens/bookdetailmath4.dart';
import 'screens/bookdetailmath5.dart';

// --- Engineering Physics Book Details ---
import 'screens/physicsbookscreen1.dart';
import 'screens/physicsbookscreen2.dart';
import 'screens/physicsbookscreen3.dart';
import 'screens/physicsbookscreen4.dart';
import 'screens/physicsbookscreen5.dart';

// --- Engineering Chemistry Book Details ---
import 'screens/chemistrybookscreen1.dart';
import 'screens/chemistrybookscreen2.dart';
import 'screens/chemistrybookscreen3.dart';
import 'screens/chemistrybookscreen4.dart';
import 'screens/chemistrybookscreen5.dart';

// --- Python Programming Book Details ---
import 'screens/pythonbookscreen1.dart';
import 'screens/pythonbookscreen2.dart';
import 'screens/pythonbookscreen3.dart';
import 'screens/pythonbookscreen4.dart';
import 'screens/pythonbookscreen5.dart';

// --- C Programming Book Details ---
import 'screens/cprogrammingbookscreen1.dart';
import 'screens/cprogrammingbookscreen2.dart';
import 'screens/cprogrammingbookscreen3.dart';
import 'screens/cprogrammingbookscreen4.dart';
import 'screens/cprogrammingbookscreen5.dart';

void main() {
  runApp(const ReadRitApp());
}

class ReadRitApp extends StatelessWidget {
  const ReadRitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadRit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF2C16C),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8B5E17),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),

        // --- Authentication ---
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),

        // --- Home & Subject Selection ---
        '/home': (context) => HomeScreen(userName: 'User'), // Passing a default username
        '/subjects': (context) => SubjectSelectionScreen(),

        // --- Engineering Graphics ---
        '/engineering-graphics': (context) => EngineeringGraphicsBooksScreen(),
        '/book1': (context) => BookDetail1(),
        '/book2': (context) => BookDetail2(),
        '/book3': (context) => BookDetail3(),
        '/book4': (context) => BookDetail4(),
        '/book5': (context) => BookDetail5(),

        // --- Engineering Mathematics ---
        '/engineering-mathematics': (context) => EngineeringMathematicsBooksScreen(),
        '/mathbook1': (context) => BookDetailMath1(),
        '/mathbook2': (context) => BookDetailMath2(),
        '/mathbook3': (context) => BookDetailMath3(),
        '/mathbook4': (context) => BookDetailMath4(),
        '/mathbook5': (context) => BookDetailMath5(),

        // --- Engineering Physics ---
        '/engineering-physics': (context) => EngineeringPhysicsBooksScreen(),
        '/physicsbook1': (context) => Physicsbookscreen1(),
        '/physicsbook2': (context) => PhysicsBookscreen2(),
        '/physicsbook3': (context) => PhysicsBookscreen3(),
        '/physicsbook4': (context) => PhysicsBookscreen4(),
        '/physicsbook5': (context) => PhysicsBookscreen5(),

        // --- Engineering Chemistry ---
        '/engineering-chemistry': (context) => EngineeringChemistryBooksScreen(),
        '/chemistrybook1': (context) => ChemistryBookScreen1(),
        '/chemistrybook2': (context) => ChemistryBookScreen2(),
        '/chemistrybook3': (context) => ChemistryBookScreen3(),
        '/chemistrybook4': (context) => ChemistryBookScreen4(),
        '/chemistrybook5': (context) => ChemistryBookScreen5(),

        // --- Python Programming ---
        '/python-programming': (context) => PythonProgrammingBooksScreen(),
        '/pythonbook1': (context) => PythonBookscreen1(),
        '/pythonbook2': (context) => PythonBookscreen2(),
        '/pythonbook3': (context) => PythonBookscreen3(),
        '/pythonbook4': (context) => PythonBookscreen4(),
        '/pythonbook5': (context) => PythonBookscreen5(),

        // --- C Programming ---
        '/c-programming': (context) => CProgrammingBooksScreen(),
        '/cprogramming1': (context) => CProgrammingBookScreen1(),
        '/cprogramming2': (context) => CProgrammingBookScreen2(),
        '/cprogramming3': (context) => CProgrammingBookScreen3(),
        '/cprogramming4': (context) => CProgrammingBookScreen4(),
        '/cprogramming5': (context) => CProgrammingBookScreen5(),
      },
    );
  }
}
