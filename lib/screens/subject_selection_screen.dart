import 'package:flutter/material.dart';

class SubjectSelectionScreen extends StatelessWidget {
  final List<String> subjects = [
    'Engineering graphics',
    'Engineering mathematics',
    'Engineering physics',
    'Engineering chemistry',
    'Python programming',
    'C programming',
    'Software engineering',
    'Artificial Intelligence',
    'DBMS',
    'Professional Ethics',
    'Computer Networks',
    'EMS',
    'MPMC',
    'Operating Systems',
    'ERP',
    'Embedded system and IOT',
  ];

  final Map<String, String> subjectRoutes = {
    'Engineering graphics': '/engineering-graphics',
    'Engineering mathematics': '/engineering-mathematics',
    'Engineering physics': '/engineering-physics',
    'Engineering chemistry': '/engineering-chemistry',
    'Python programming': '/python-programming',
    'C programming': '/c-programming', // ✅ Added C programming route here
    // Other subjects will show "Coming Soon"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2C16C),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2C16C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4E2C0C)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Subjects',
          style: TextStyle(
            color: Color(0xFF4E2C0C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 179 / 74,
                ),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];

                  return GestureDetector(
                    onTap: () {
                      if (subjectRoutes.containsKey(subject)) {
                        Navigator.pushNamed(context, subjectRoutes[subject]!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Screen for "$subject" coming soon!'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF5B3E0B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        subject,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
