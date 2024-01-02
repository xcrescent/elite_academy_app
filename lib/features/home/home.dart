import 'package:auto_route/annotations.dart';
import 'package:elite_academy/features/home/admin/dashboard/dashboard_page.dart';
import 'package:elite_academy/features/home/quiz/quiz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  static const List<Widget> pages = [
    AdminDashboardPage(),
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
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: "dev@eliteacademy.co.in",
          password: "123456",
        )
        .then((value) => print("Email Verified: ${value.user!.emailVerified}"));
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
