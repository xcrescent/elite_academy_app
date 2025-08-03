import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/additional_info.dart';
import 'widgets/swipe_card_widget.dart';

@RoutePage(deferredLoading: true)
class StudentDashboardPage extends ConsumerWidget {
  const StudentDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.all(12),
            //   padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            //   decoration: BoxDecoration(
            //     color: ref.watch(themecontrollerProvider) == ThemeMode.dark
            //         ? Colors.grey.shade900
            //         : ref.watch(themecontrollerProvider) == ThemeMode.light
            //             ? Colors.grey.shade200
            //             : Theme.of(context).brightness == Brightness.dark
            //                 ? Colors.grey.shade900
            //                 : Colors.grey.shade200,
            //     boxShadow: const [
            //       BoxShadow(
            //         color: Colors.black12,
            //         blurRadius: 5,
            //         offset: Offset(0, 2),
            //       ),
            //     ],
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   // child: Row(
            //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   //   children: [
            //   //     SizedBox(
            //   //       width: MediaQuery.of(context).size.width - 180,
            //   //       child: AnimatedTextKit(
            //   //         animatedTexts: [
            //   //           TypewriterAnimatedText(
            //   //             'Check out what we have done for you!',
            //   //             textStyle: TextStyle(
            //   //               fontSize: 18,
            //   //               fontWeight: FontWeight.bold,
            //   //               fontFamily: GoogleFonts.poppins().fontFamily,
            //   //             ),
            //   //             speed: const Duration(milliseconds: 100),
            //   //           ),
            //   //         ],
            //   //         repeatForever: true,
            //   //       ),
            //   //     ),
            //   //     ElevatedButton(
            //   //       onPressed: () {
            //   //         context.router.pushNamed('/what-we-have-done');
            //   //       },
            //   //       style: ElevatedButton.styleFrom(
            //   //         shape: RoundedRectangleBorder(
            //   //           borderRadius: BorderRadius.circular(10),
            //   //         ),
            //   //       ),
            //   //       child: Text(
            //   //         'View All',
            //   //         style: TextStyle(
            //   //           fontSize: 16,
            //   //           fontWeight: FontWeight.bold,
            //   //           fontFamily: GoogleFonts.poppins().fontFamily,
            //   //         ),
            //   //       ),
            //   //     ),
            //   //   ],
            //   // ),
            // ),
            // ref.watch(attendanceDataProvider).when(
            //   loading: () {
            //     // Check the connection state
            //     return SizedBox(
            //       height: MediaQuery.of(context).size.height - 200,
            //       child: const Center(
            //         child: CircularProgressIndicator(),
            //       ),
            //     );
            //   },
            //   error: (e, s) {
            //     // Error fetching data
            //     return SizedBox(
            //       height: MediaQuery.of(context).size.height - 200,
            //       child: const Center(
            //         child: Text('Error fetching data'),
            //       ),
            //     );
            //   },
            //   // Add a watch
            //   data: (AttendanceData? data) {
            //     // print("Refreshed");
            //     // If no error occurred
            //     if (data == null) {
            //       return SizedBox(
            //         height: MediaQuery.of(context).size.height - 200,
            //         child: const Center(
            //           child: Text(
            //             'No data found',
            //             style: TextStyle(fontSize: 20),
            //           ),
            //         ),
            //       );
            //     }
            //     String name = '';
            //     String email = '';
            //     print(data
            //         .stdSubAtdDetails!.studentSubjectAttendance[0].userDetails);
            //     if (jsonDecode(data
            //             .stdSubAtdDetails!
            //             .studentSubjectAttendance[0]
            //             .userDetails)['firstName'] !=
            //         null) {
            //       name = jsonDecode(data
            //               .stdSubAtdDetails!
            //               .studentSubjectAttendance
            //               .first
            //               .userDetails)['firstName'] +
            //           ' ' +
            //           jsonDecode(data.stdSubAtdDetails!.studentSubjectAttendance
            //               .first.userDetails)['lastName'];
            //       email = jsonDecode(data.stdSubAtdDetails!
            //           .studentSubjectAttendance.first.userDetails)['email'];
            //     } else {
            //       name =
            //           '${data.stdSubAtdDetails!.studentSubjectAttendance.first.firstName} ${data.stdSubAtdDetails!.studentSubjectAttendance.first.lastName}';

            //       email = data.stdSubAtdDetails!.studentSubjectAttendance.first
            //               .email ??
            //           '';
            //     }
            //     int totalSubjects = data.stdSubAtdDetails!
            //         .studentSubjectAttendance[0].subjects.length;
            //     double overallPercentage =
            //         data.stdSubAtdDetails!.overallPercentage;
            //     List<Subject> subjectsList =
            //         data.stdSubAtdDetails!.studentSubjectAttendance[0].subjects;
            //     int? totalPresent = data.stdSubAtdDetails?.overallPresent!;
            //     int? totalClasses = data.stdSubAtdDetails?.overallLecture!;
            // int totalAbsent = totalClasses - totalPresent;
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome, xyz",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                "xyz@gmail.com",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  // color: Colors.black,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   width: 8,
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     showDialog(
                          //       context: context,
                          //       builder: (context) {
                          //         return SizedBox(
                          //           height: 80,
                          //           width: 80,
                          //           child: CircleAvatar(
                          //             backgroundImage: NetworkImage(
                          //               profilePhotoUrl!,
                          //               scale: 0.1,
                          //             ),
                          //             radius: 18,
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   },
                          //   child: Container(
                          //     height: 70,
                          //     width: 70,
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         border: Border.all(
                          //           color: Colors.black,
                          //         )),
                          //     child: ClipRRect(
                          //         borderRadius: BorderRadius.circular(100),
                          //         child: profilePhotoUrl!.isNotEmpty
                          //             ? Image.network(profilePhotoUrl!,
                          //                 fit: BoxFit.cover, loadingBuilder:
                          //                     (context, child,
                          //                         loadingProgress) {
                          //                 if (loadingProgress == null) {
                          //                   return child;
                          //                 }
                          //                 return const Center(
                          //                   child:
                          //                       CircularProgressIndicator(),
                          //                 );
                          //               }, errorBuilder:
                          //                     (context, object, stack) {
                          //                 return const Icon(
                          //                   Icons.error_outline,
                          //                   color: Colors.amber,
                          //                 );
                          //               })
                          //             : const Center(
                          //                 child: CircularProgressIndicator(),
                          //               )),
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  // height: 120,
                  width: double.infinity,
                  child: SwipeCardsScreen(
                    subjectsList: [],
                    totalSubjects: 2,
                    overallPercentage: 99,
                    //  subjectsList: ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 2,
                  ),
                  child: Text(
                    'Your Statistics',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 270,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        AdditionalInfo(
                          index: 0,
                          text: Text(
                            '22 - 25',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          label: 'Course',
                          value: 'Student weak',
                          category:
                              'Lorem ipsum dolor sit amet consectetur. Mattis felisid tempor vehicula proin turpis. Neque lorem tristiqueeget vitae in vitae. ',
                          detail: 'Volunteers needed',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        // AdditionalInfo(
                        //   index: 1,
                        //   image: Image.asset(
                        //     'assets/images/presentation_760138.png',
                        //   ),
                        //   label: 'Attendance Preview',
                        //   value: '',
                        // ),
                        // const SizedBox(
                        //   width: 15,
                        // ),
                        // AdditionalInfo(
                        //   index: 2,
                        //   image: Image.asset(
                        //     'assets/images/presentation_760138.png',
                        //   ),
                        //   label: 'Classes Required for 75%:',
                        //   value: '',
                        // ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Today’s Schedule',
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.800000011920929),
                              fontSize: 25,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              // height: 0.06,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Text(
                        'see more',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 39);
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          // width: 326,
                          height: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          'Physics 211',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24),
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          'Lecture - G7',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w400,
                                            height: 0.09,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        'Prof. Andrew Grey',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        '11:25 - 1:20 pm',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Attendance',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < 5; i++) ...[
                  Consumer(
                    builder: (context, ref, child) {
                      final currentTheme = ref.watch(themecontrollerProvider);
                      var brightness =
                          MediaQuery.of(context).platformBrightness;
                      bool isDarkMode = brightness == Brightness.dark;
                      return Container(
                        decoration: BoxDecoration(
                          color: currentTheme == ThemeMode.dark
                              ? Colors.grey.shade900
                              : currentTheme == ThemeMode.light
                                  ? Colors.grey.shade200
                                  : isDarkMode
                                      ? Colors.grey.shade900
                                      : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.only(left: 18, right: 15),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         SubjectAttendanceScreen(
                            //       attendanceData: 0,
                            //       subject: subjectsList[i],
                            //     ),
                            //   ),
                            // );
                          },
                          child: const SubjectCard(
                            subject: "3", attendance: 12, totalClasses: 22,
                            totalPresent: 2,
                            // totalPresent: subjectsList[i].presentLeactures,
                            // totalClasses: subjectsList[i].totalLeactures,
                            // subject: subjectsList[i].name,
                            // attendance:
                            //     subjectsList[i].percentageAttendance,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ],
            )
            // },
            // ),
            // ref.watch(pdpAttendanceDataProvider).when(
            //   loading: () {
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            //   error: (e, s) {
            //     return const Center(
            //       child: Text('Error fetching data'),
            //     );
            //   },
            //   data: (ss) {
            //     int presentLectures = 0;
            //     if (ss != null) {
            //       if (ss.isEmpty) {
            //         return const SizedBox(
            //           height: 100,
            //         );
            //       }

            //       for (var element in ss) {
            //         if (element.isInAbsent == false) {
            //           presentLectures++;
            //         }
            //       }

            //  Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 16),
            //       child: Text(
            //         'PDP Attendance',
            //         style: TextStyle(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: GoogleFonts.poppins().fontFamily,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         // Navigate to PDP Attendance Screen
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => PDPAttendanceScreen(
            //               attendanceData: ss,
            //               presentLectures: presentLectures,
            //               percentageAttendance:
            //                   (presentLectures / ss.length) * 100,
            //             ),
            //           ),
            //         );
            //       },
            //       child: Consumer(
            //         builder: (context, ref, child) {
            //           final currentTheme =
            //               ref.watch(themecontrollerProvider);
            //           var brightness =
            //               MediaQuery.of(context).platformBrightness;
            //           bool isDarkMode = brightness == Brightness.dark;
            //           return Container(
            //             decoration: BoxDecoration(
            //               color: currentTheme == ThemeMode.dark
            //                   ? Colors.grey.shade900
            //                   : currentTheme == ThemeMode.light
            //                       ? Colors.grey.shade200
            //                       : isDarkMode
            //                           ? Colors.grey.shade900
            //                           : Colors.grey.shade200,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             margin:
            //                 const EdgeInsets.only(left: 18, right: 15),
            //             child: SubjectCard(
            //               totalPresent: presentLectures,
            //               totalClasses: ss.length,
            //               subject: "PDP",
            //               attendance: (presentLectures / ss.length) * 100,
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // );
            //           } else {
            //             return const SizedBox(
            //               height: 100,
            //             );
            //           }
            //         },
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //     ],
            //   ),
            // ),
          ])),
      drawer: const Drawer(
        backgroundColor: Colors.black12,
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subject;
  final double attendance;
  final int? totalPresent;
  final int? totalClasses;

  const SubjectCard(
      {super.key,
      required this.subject,
      required this.attendance,
      required this.totalPresent,
      required this.totalClasses});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 100,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  // color: Colors.black54,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                'Attendance: $totalPresent / $totalClasses ($attendance%)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  // color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 50,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: attendance / 100),
            duration: const Duration(seconds: 3),
            builder: (BuildContext context, double value, Widget? child) =>
                CircularProgressIndicator(
              value: value,
              backgroundColor: Colors.white60,
              color: attendance >= 75
                  ? Colors.green
                  : attendance >= 50
                      ? Colors.orange
                      : Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
