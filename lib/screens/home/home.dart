import 'package:elite_academy/screens/home/quiz/quiz.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  static const List<Widget> pages = [
    QuizPage(),
    QuizPage(),
    QuizPage(),
    QuizPage(),
    QuizPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
      // if (!(firebaseAuth.currentUser!.emailVerified)) {
      //   firebaseAuth.currentUser!.reload();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: pages[pageIndex],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Academics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: 2,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
