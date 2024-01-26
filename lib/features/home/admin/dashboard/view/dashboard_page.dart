import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/theme/theme_controller.dart';
import 'package:elite_academy/features/home/admin/dashboard/repository/student_repository.dart';
import 'package:elite_academy/features/home/admin/settings/view/settings_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConst {
  // static Color primaryColor = const Color.fromARGB(255, 101, 181, 245);
  // static Color primaryColor2 = const Color.fromARGB(255, 2, 45, 62);
  // static Color primaryColor3 = const Color.fromARGB(255, 12, 107, 145);
}

class AdminDashboardPage extends ConsumerStatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  ConsumerState<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends ConsumerState<AdminDashboardPage>
    with SingleTickerProviderStateMixin {
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(
      index.toDouble(),
      index * Random().nextDouble(),
    );
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(
      index.toDouble(),
      index * Random().nextDouble(),
    );
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(
      index.toDouble(),
      index * Random().nextDouble(),
    );
  });

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.height < 600;

    if (kDebugMode) {
      print(
          "${MediaQuery.sizeOf(context).height} ${MediaQuery.sizeOf(context).width}");
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            // backgroundColor: ColorConst.primaryColor2,
            title: Text(
              "Elite Academy",
              style: GoogleFonts.poppins(
                  // color: ColorConst.primaryColor,
                  ),
            ),
            leading: IconButton(
                icon: const Icon(
                  Icons.person_rounded,
                  size: 40,
                  // color: ColorConst.primaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ),
                  );
                }),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                // color: ColorConst.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ),
                  );
                },
              )
            ],
            toolbarHeight: 70, //set your height
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            AdditionalInfo(
                              icon: Icons.group,
                              label: 'Students',
                              index1: 0,
                              index2: 0,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            AdditionalInfo(
                              icon: Icons.school,
                              label: 'Batches',
                              index1: 0,
                              index2: 0,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            AdditionalInfo(
                              icon: Icons.groups,
                              label: 'Staffs',
                              index1: 0,
                              index2: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: ColorConst.primaryColor3,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.auto_graph_sharp,
                                    // color: ColorConst.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Attendance Summary",
                                    style: TextStyle(
                                        // color: ColorConst.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                // color: const Color.fromARGB(255, 99, 120, 100),
                                height: isMobile
                                    ? 100
                                    : 200, // Set the height as per your requirement
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: isMobile
                                            ? MediaQuery.of(context).size.width
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                2,
                                        decoration: BoxDecoration(
                                          // // border: Border.all(color: Colors.black, width: 5),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: LineChart(
                                          LineChartData(
                                            borderData:
                                                FlBorderData(show: false),
                                            lineBarsData: [
                                              // The red line
                                              LineChartBarData(
                                                spots: dummyData1,
                                                isCurved: true,
                                                barWidth: 3,
                                                // color: Colors.indigo,
                                              ),
                                              // The orange line
                                              LineChartBarData(
                                                spots: dummyData2,
                                                isCurved: true,
                                                barWidth: 3,
                                                // color: Colors.red,
                                              ),
                                              // The blue line
                                              LineChartBarData(
                                                spots: dummyData3,
                                                isCurved: false,
                                                barWidth: 3,
                                                // color: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const NeoBox2(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FullContainer(),
                    ),
                    const NeoBox3(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FullContainer2(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FullContainer3(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        //  Positioned(
        //     bottom: 16.0,
        //     right: 16.0,
        //     child: FloatingActionButton(
        //       // backgroundColor: Colors.blue.shade500,
        //       onPressed: () {
        //         // Handle the floating action button press
        //       },
        //       child: Icon(Icons.add ,),
        //     ),
        //   ),

        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FloatingActionBubble(
              // animation controller
              animation: _animation,
              // On pressed change animation state
              onPress: () => _animationController.isCompleted
                  ? _animationController.reverse()
                  : _animationController.forward(),
              // Floating Action button Icon color
              iconColor: Colors.blue,
              // Floating Action button Icon
              iconData: Icons.add,
              backGroundColor: Colors.white,
              // Menu items
              items: <Bubble>[
                Bubble(
                    icon: Icons.currency_rupee,
                    iconColor: Colors.brown,
                    title: "In App Purchase",
                    titleStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                    bubbleColor: Colors.red,
                    onPress: () async {
                      // final inAppPurchase = InAppPurchase.instance;
                      // bool available = await inAppPurchase.isAvailable();
                      // if (available) {
                      //   if (kDebugMode) {
                      //     print('available');
                      //   }
                      //   await inAppPurchase.restorePurchases();
                      //   final allProducts = await inAppPurchase
                      //       .queryProductDetails({'edu.aeronex.elite_academy'});
                      //   if (allProducts.productDetails.isEmpty) {
                      //     if (kDebugMode) {
                      //       print('empty');
                      //     }
                      //   }
                      //   if (allProducts.notFoundIDs.isNotEmpty) {
                      //     if (kDebugMode) {
                      //       print('not found');
                      //     }
                      //   } else {
                      //     if (kDebugMode) {
                      //       print('found');
                      //     }
                      //
                      //     await inAppPurchase.buyConsumable(
                      //       purchaseParam: PurchaseParam(
                      //         productDetails: allProducts.productDetails.first,
                      //       ),
                      //     );
                      //   }
                      // } else {
                      //   if (kDebugMode) {
                      //     print('not available');
                      //   }
                      //   _animationController.reverse();
                      // }
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('In App Purchase'),
                          content: const Text('Coming Soon'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }),
                Bubble(
                    icon: Icons.abc,
                    iconColor: Colors.brown,
                    title: "Add Student",
                    titleStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                    bubbleColor: Colors.red,
                    onPress: () {
                      context.router.pushNamed('/add-student');
                      _animationController.reverse();
                    }),
                Bubble(
                    icon: Icons.abc,
                    iconColor: Colors.brown,
                    title: "Person",
                    titleStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                    bubbleColor: Colors.red,
                    onPress: () {
                      _animationController.reverse();
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AdditionalInfo extends ConsumerWidget {
  final IconData icon;
  final String label;
  final int index1;
  final int index2;

  const AdditionalInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.index1,
    required this.index2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studentProvider = ref.watch(studentRepositoryProvider);
    final brightness = Theme.of(context).brightness;
    return Container(
      height: 120,
      width: MediaQuery.sizeOf(context).width * 0.42,
      decoration: BoxDecoration(
        // color: ColorConst.primaryColor3,
        color: ref.watch(themecontrollerProvider) == ThemeMode.light
            ? Theme.of(context).primaryColorLight
            : ref.watch(themecontrollerProvider) == ThemeMode.dark
                ? Theme.of(context).primaryColorDark
                : brightness == Brightness.dark
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Active',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Closed',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NeoBox2 extends StatelessWidget {
  const NeoBox2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 140,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 130,
            width: 180,
            decoration: BoxDecoration(
              // color: ColorConst.primaryColor3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Student Attendance',
                    style: TextStyle(
                        // color: ColorConst.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      AnimatedLinearProgressIndicator(
                        color: Colors.blue,
                        percentage: 0.8,
                        label: '',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0/0',
                        style: TextStyle(
                            // color: ColorConst.primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 100,
            width: 180,
            decoration: BoxDecoration(
              // color: ColorConst.primaryColor3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Student Attendance',
                    style: TextStyle(
                        // color: ColorConst.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      AnimatedLinearProgressIndicator(
                        color: Colors.blue,
                        percentage: 0.8,
                        label: '',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0/0',
                        style: TextStyle(
                            // color: ColorConst.primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NeoBox3 extends StatelessWidget {
  const NeoBox3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 140,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 130,
            width: 180,
            decoration: BoxDecoration(
              // color: ColorConst.primaryColor3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        // color: ColorConst.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Exams',
                        style: TextStyle(
                            // color: ColorConst.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                        // color: ColorConst.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total Exams',
                    style: TextStyle(
                        // color: ColorConst.primaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 130,
            width: 180,
            decoration: BoxDecoration(
              // color: ColorConst.primaryColor3,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.cake,
                        // color: ColorConst.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Birthdays',
                        style: TextStyle(
                            // color: ColorConst.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                        // color: ColorConst.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Today Birthdays',
                    style: TextStyle(
                        // color: ColorConst.primaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    super.key,
    required this.percentage,
    required this.label,
    required this.color,
  });

  final double percentage;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: percentage),
      duration: const Duration(seconds: 2),
      builder: (context, double value, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                // style: const TextStyle(color: Colors.white),
              ),
              Text(
                "${(value * 100).toInt()}%",
                style: const TextStyle(
                    // color: ColorConst.primaryColor,
                    ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 14,
            width: MediaQuery.of(context).size.width * 0.3,
            child: LinearProgressIndicator(
              value: value,
              // color: color,
              // backgroundColor: ColorConst.primaryColor3,
            ),
          )
        ],
      ),
    );
  }
}

class FullContainer extends StatelessWidget {
  const FullContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: ColorConst.primaryColor3,
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.calculate,
                  // color: ColorConst.primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Due Fees',
                  style: TextStyle(
                    // color: ColorConst.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 200),
                Icon(
                  Icons.open_in_new,
                  // color: ColorConst.primaryColor,
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Active',
                  style: TextStyle(
                      // color: ColorConst.primaryColor,
                      ),
                ),
                SizedBox(
                  width: 150,
                ),
                Text(
                  'Close',
                  style: TextStyle(
                      // color: ColorConst.primaryColor,
                      ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0/-',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Students',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0/-',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Students',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FullContainer2 extends StatelessWidget {
  const FullContainer2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: ColorConst.primaryColor3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.auto_graph_sharp,
                        // color: ColorConst.primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Monthly Summary",
                        style: TextStyle(
                            // color: ColorConst.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: const Color.fromARGB(255, 53, 85, 55),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Collected Fees',
                            style: TextStyle(
                                // color: ColorConst.primaryColor,
                                ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.open_in_new,
                            // color: ColorConst.primaryColor,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Today',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Jan-2024',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'All Time',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                          // color: Colors.grey.shade800,
                          ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Expenses',
                            style: TextStyle(
                                // color: ColorConst.primaryColor,
                                ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.open_in_new,
                            // color: ColorConst.primaryColor,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Today',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Jan-2024',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'All Time',
                                style: TextStyle(
                                    // color: ColorConst.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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

class FullContainer3 extends StatelessWidget {
  const FullContainer3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: ColorConst.primaryColor3,
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  // color: ColorConst.primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Enquiry',
                  style: TextStyle(
                    // color: ColorConst.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 210),
                Icon(
                  Icons.open_in_new,
                  // color: ColorConst.primaryColor,
                )
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Close',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Today Follow up ',
                      style: TextStyle(
                          // color: ColorConst.primaryColor,
                          ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
