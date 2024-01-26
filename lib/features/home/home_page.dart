import 'package:auto_route/annotations.dart';
import 'package:elite_academy/features/home/admin/dashboard/view/dashboard_page.dart';
import 'package:elite_academy/features/home/quiz/quiz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../auth/phone/controller/phone_auth_state_pod.dart';
import '../auth/phone/model/phone_auth_response_model.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: "dev@eliteacademy.co.in",
        password: "123456",
      )
          .then(
        (value) {
          if (kDebugMode) {
            print("Email Verified: ${value.user!.emailVerified}");
          }
          const storage = FlutterSecureStorage();
          storage.write(
            key: "uid",
            value: value.user!.uid,
          );
          storage.read(key: "uid").then((value) {
            if (kDebugMode) {
              print("UID: $value");
            }
          });
          // ref.read(adminRepositoryProvider).createAdmin(
          //       AdminModel(
          //         email: 'usjadon19@gmail.com',
          //         phone: '+919911168006',
          //         firstName: 'Utkarsh',
          //         lastName: 'S Jadon',
          //         id: value.user!.uid,
          //       ),
          //     );
          //
          ref.read(phoneAuthNotifierProvider.notifier).setResponse(
                PhoneAuthResponse(
                  user: value.user,
                  error: null,
                  isNewUser: false,
                ),
              );
        },
      );
    }
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
          currentIndex: pageIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
