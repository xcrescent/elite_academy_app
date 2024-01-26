import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // static Color primaryColor = const Color.fromARGB(255, 101, 181, 245);
  // static Color primaryColor2 = const Color.fromARGB(255, 2, 45, 62);
  // static Color primaryColor3 = const Color.fromARGB(255, 12, 107, 145);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            // color: primaryColor, //change your color here
            ),
        // backgroundColor: primaryColor2,
        title: const Text(
          "Settings",
          style: TextStyle(
              // color: primaryColor,
              ),
        ),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: primaryColor2,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Basics",
                    style: TextStyle(
                      fontSize: 16,
                      // color: primaryColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: primaryColor3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "SMS Settings",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.message,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  " Get SMS Automaker",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Divider(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  CupertinoIcons.money_dollar_circle_fill,
                                  // color: primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Advance Fee",
                                style: TextStyle(
                                  fontSize: 18,
                                  // color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.phone,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "SMS Settings",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Data",
                    style: TextStyle(
                      fontSize: 16,
                      // color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: primaryColor3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.upload,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Save backup",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.download,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Restore backUp",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Support",
                    style: TextStyle(
                      fontSize: 16,
                      // color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: primaryColor3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Rate App",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.folder,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Suggestion",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Divider(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  CupertinoIcons.phone,
                                  // color: primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Contact us",
                                style: TextStyle(
                                  fontSize: 18,
                                  // color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.folder_fill,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "About Us",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "Legal",
                    style: TextStyle(
                      fontSize: 16,
                      // color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: primaryColor3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.folder,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Terms and Conditions",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.import_contacts,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: primaryColor3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  // color: primaryColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                    fontSize: 18,
                                    // color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
