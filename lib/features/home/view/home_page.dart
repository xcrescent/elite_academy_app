import 'package:auto_route/annotations.dart';
import 'package:elite_academy/features/home/faculty/dashboard/view/dashboard_page.dart';
import 'package:elite_academy/features/home/quiz/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage(
  deferredLoading: true,
)
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = useState<int>(0);

    const List<Widget> pages = [
      // AdminDashboardPage()
      FacultyDashboardPage(),
      QuizPage(),
      QuizPage(),
      QuizPage(),
      QuizPage(),
    ];

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: pages[pageIndex.value],
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
          currentIndex: pageIndex.value,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            pageIndex.value = index;
          },
        ),
      ),
    );
  }
}
