import 'dart:math';

import 'package:elite_academy/features/home/admin/settings/view/settings_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConst {
  static Color primaryColor = const Color.fromARGB(255, 101, 181, 245);
  static Color primaryColor2 = const Color.fromARGB(255, 2, 45, 62);
  static Color primaryColor3 = const Color.fromARGB(255, 12, 107, 145);
}

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage>
    with SingleTickerProviderStateMixin {
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
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
          "${MediaQuery.sizeOf(context).height}     ${MediaQuery.sizeOf(context).width}");
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConst.primaryColor2,
            toolbarHeight: 70, //set your height
            flexibleSpace: SafeArea(
              child: Container(
                color: ColorConst.primaryColor2, // set your color
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.person_rounded,
                            size: 40,
                            color: ColorConst.primaryColor,
                          ),
                          onPressed: () {}),
                      Text(
                        "Tufee Single User - Offline",
                        style: GoogleFonts.poppins(
                          color: ColorConst.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        color: ColorConst.primaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingPage()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: ColorConst.primaryColor2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            AdditionalInfo(
                              image: Image.asset('assets/images/Logo.jpeg'),
                              label: 'Students',
                              index1: 0,
                              index2: 0,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AdditionalInfo(
                              image: Image.asset(
                                'assets/images/Logo.jpeg',
                              ),
                              label: 'Batches',
                              index1: 0,
                              index2: 0,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AdditionalInfo(
                              image: Image.asset(
                                'assets/images/Logo.jpeg',
                              ),
                              label: 'Staffs',
                              index1: 0,
                              index2: 0,
                            ),
                            const SizedBox(
                              width: 20,
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
                            color: ColorConst.primaryColor3,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.auto_graph_sharp,
                                    color: ColorConst.primaryColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Attendance Summary",
                                    style: TextStyle(
                                        color: ColorConst.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                color: const Color.fromARGB(255, 99, 120, 100),
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
                                            // border: Border.all(color: Colors.black, width: 5),
                                            borderRadius:
                                                BorderRadius.circular(8)),
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
                                                color: Colors.indigo,
                                              ),
                                              // The orange line
                                              LineChartBarData(
                                                spots: dummyData2,
                                                isCurved: true,
                                                barWidth: 3,
                                                color: Colors.red,
                                              ),
                                              // The blue line
                                              LineChartBarData(
                                                spots: dummyData3,
                                                isCurved: false,
                                                barWidth: 3,
                                                color: Colors.blue,
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
        //       backgroundColor: Colors.blue.shade500,
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
                    icon: Icons.abc,
                    iconColor: Colors.brown,
                    title: "Person",
                    titleStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                    bubbleColor: Colors.red,
                    onPress: () {
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

class AdditionalInfo extends StatelessWidget {
  final Image image;
  final String label;

  final int index1;
  final int index2;

  const AdditionalInfo({
    super.key,
    required this.image,
    required this.label,
    required this.index1,
    required this.index2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 200,
      decoration: BoxDecoration(
          color: ColorConst.primaryColor3,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: image,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.primaryColor,
                ),
              ),
            ]),

            // Icon(
            //     ,
            //     size: 40,
            //   ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorConst.primaryColor,
                        ),
                      ),
                      Text('Active',
                          style: TextStyle(
                            color: ColorConst.primaryColor,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text('0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorConst.primaryColor,
                        )),
                    Text(
                      'Closed',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
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
                color: ColorConst.primaryColor3,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Student Attendance',
                    style: TextStyle(
                        color: ColorConst.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const AnimatedLinearProgressIndicator(
                        color: Colors.blue,
                        percentage: 0.8,
                        label: '',
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0/0',
                        style: TextStyle(
                            color: ColorConst.primaryColor,
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
                color: ColorConst.primaryColor3,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Student Attendance',
                    style: TextStyle(
                        color: ColorConst.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const AnimatedLinearProgressIndicator(
                        color: Colors.blue,
                        percentage: 0.8,
                        label: '',
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '0/0',
                        style: TextStyle(
                            color: ColorConst.primaryColor,
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
                color: ColorConst.primaryColor3,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: ColorConst.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Exams',
                        style: TextStyle(
                            color: ColorConst.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                        color: ColorConst.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total Exams',
                    style: TextStyle(
                      color: ColorConst.primaryColor,
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
                color: ColorConst.primaryColor3,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.cake,
                        color: ColorConst.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Birthdays',
                        style: TextStyle(
                            color: ColorConst.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                        color: ColorConst.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Today Birthdays',
                    style: TextStyle(
                      color: ColorConst.primaryColor,
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
    Key? key,
    required this.percentage,
    required this.label,
    required this.color,
  }) : super(key: key);

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
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "${(value * 100).toInt()}%",
                      style: TextStyle(
                        color: ColorConst.primaryColor,
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
                    color: color,
                    backgroundColor: ColorConst.primaryColor3,
                  ),
                )
              ],
            ));
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
        color: ColorConst.primaryColor3,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.calculate,
                  color: ColorConst.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('Due Fees',
                    style: TextStyle(
                      color: ColorConst.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(width: 200),
                Icon(
                  Icons.open_in_new,
                  color: ColorConst.primaryColor,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Active',
                  style: TextStyle(
                    color: ColorConst.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                Text(
                  'Close',
                  style: TextStyle(
                    color: ColorConst.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0/-',
                      style: TextStyle(
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Students',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0/-',
                      style: TextStyle(
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Students',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
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
          color: ColorConst.primaryColor3,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.auto_graph_sharp,
                        color: ColorConst.primaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Monthly Summary",
                        style: TextStyle(
                            color: ColorConst.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 53, 85, 55)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Collected Fees',
                            style: TextStyle(
                              color: ColorConst.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.open_in_new,
                            color: ColorConst.primaryColor,
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
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Today',
                                style: TextStyle(
                                  color: ColorConst.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Jan-2024',
                                style: TextStyle(
                                  color: ColorConst.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'All Time',
                                style: TextStyle(
                                  color: ColorConst.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade800,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Expenses',
                            style: TextStyle(
                              color: ColorConst.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.open_in_new,
                            color: ColorConst.primaryColor,
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
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Today',
                                style: TextStyle(
                                  color: ColorConst.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Jan-2024',
                                style: TextStyle(
                                  color: ColorConst.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0/-',
                                style: TextStyle(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'All Time',
                                style: TextStyle(
                                  color: ColorConst.primaryColor,
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
        color: ColorConst.primaryColor3,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  color: ColorConst.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('Enquiry',
                    style: TextStyle(
                      color: ColorConst.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(width: 210),
                Icon(
                  Icons.open_in_new,
                  color: ColorConst.primaryColor,
                )
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
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
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Close',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          color: ColorConst.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Today Follow up ',
                      style: TextStyle(
                        color: ColorConst.primaryColor,
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
