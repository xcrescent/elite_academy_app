import 'package:elite_academy/features/home/student/dashboard/classworkstu.dart';
import 'package:elite_academy/features/home/student/dashboard/exampagestu%20copy.dart';
import 'package:elite_academy/features/home/student/dashboard/feespagestu.dart';
import 'package:elite_academy/features/home/student/dashboard/widgets/contextgrid.dart';
import 'package:flutter/material.dart';

//
// final initialAttAnimationPod = Provider((ref) => false);
//
// class AttAnimationNotifier extends Notifier<bool>{
//   @override
//   bool build() {
//     return ref.watch(initialAttAnimationPod);
//   }
// }
//
// final attAnimationPod = NotifierProvider<AttAnimationNotifier, bool>(
//   AttAnimationNotifier.new,
//   name: 'attAnimationPod',
// );

final class SwipeCardsScreen extends StatefulWidget {
  const SwipeCardsScreen({
    super.key,
    required this.overallPercentage,
    required this.totalSubjects,
    required this.subjectsList,
  });

  final double overallPercentage;
  final int totalSubjects;
  final List<Subject> subjectsList;

  @override
  State<SwipeCardsScreen> createState() => _SwipeCardsScreenState();
}

mixin Subject {}

class _SwipeCardsScreenState extends State<SwipeCardsScreen> {
  double _targetSize = 0;
  bool additional = false;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {'title': 'Exams', 'iconData': Icons.assignment},
      {'title': 'Fees', 'iconData': Icons.payment},
      {'title': 'Classwork', 'iconData': Icons.remove_red_eye},
      {'title': 'Homework', 'iconData': Icons.assignment_turned_in},
      {'title': 'Exams', 'iconData': Icons.assignment},
      {'title': 'Fees', 'iconData': Icons.payment},
      {'title': 'Classwork', 'iconData': Icons.remove_red_eye},
      {'title': 'Homework', 'iconData': Icons.assignment_turned_in},
      {'title': 'Exams', 'iconData': Icons.assignment},
      {'title': 'Fees', 'iconData': Icons.payment},
      {'title': 'Classwork', 'iconData': Icons.remove_red_eye},
      {'title': 'Homework', 'iconData': Icons.assignment_turned_in},
    ];
    List<Map<String, dynamic>> add = [
      {'title': 'Exams', 'iconData': Icons.assignment},
      {'title': 'Fees', 'iconData': Icons.payment},
      {'title': 'Classwork', 'iconData': Icons.remove_red_eye},
      {'title': 'Homework', 'iconData': Icons.assignment_turned_in},
      {'title': 'Exams', 'iconData': Icons.assignment},
      {'title': 'Fees', 'iconData': Icons.payment},
      {'title': 'Classwork', 'iconData': Icons.remove_red_eye},
      {'title': 'Homework', 'iconData': Icons.assignment_turned_in},
      {'title': 'Exams', 'iconData': Icons.assignment},
      {'title': 'Fees', 'iconData': Icons.payment},
      {'title': 'Classwork', 'iconData': Icons.remove_red_eye},
      {'title': 'Homework', 'iconData': Icons.assignment_turned_in},
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 90,
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 2,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ExamsPagestu(),
                              ),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FeesPagestu(),
                              ),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Classworkstu(),
                              ),
                            );
                            break;
                          // Add more cases as needed
                        }
                      },
                      child: GridContext(
                        title: items[index]['title'] ?? '',
                        iconData: items[index]['iconData'] ??
                            Icons.error, // Default icon in case of missing data
                      ),
                    );
                  },
                ),
                if (additional)
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 90,
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 2,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: add.length, // Provide additional items
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Your existing onTap logic for additional items
                          switch (index) {
                            // Existing cases for additional items
                          }
                        },
                        child: GridContext(
                          title: add[index]['title'] ?? '',
                          iconData: add[index]['iconData'] ?? Icons.error,
                        ),
                      );
                    },
                  ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        additional = !additional;
                      });
                    },
                    icon: Icon(
                      additional ? Icons.arrow_upward : Icons.arrow_downward,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// class AnimatedText extends StatelessWidget {
//   final List<Subject> subjectsList;

//   const AnimatedText({Key? key, required this.subjectsList}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedTextKit(
//       animatedTexts: subjectsList
//           .map(
//             (subject) => TyperAnimatedText(
//               subject.name ?? '',
//               speed: const Duration(milliseconds: 70),
//               textStyle: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }
