import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/const/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/providers/firebase_provider.dart';

@RoutePage(
  deferredLoading: true,
)
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Basics",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: const Text(
                          "Notification",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                        trailing: CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                        trailing: CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(
                          Icons.message,
                        ),
                        title: Text(
                          "SMS Settings",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(
                          Icons.message,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Get SMS Automaker",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        title: Text(
                          "Advance Fee",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                        leading: Icon(
                          CupertinoIcons.money_dollar_circle_fill,
                          color: Colors.white,
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(
                          CupertinoIcons.phone,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "SMS Settings",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Data",
                    style: TextStyle(
                      fontSize: 16,
                      // color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.upload,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Save backup",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.download,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Restore backUp",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Support",
                    style: TextStyle(
                      fontSize: 16,
                      // color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.star,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Rate App",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.folder,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Suggestion",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          CupertinoIcons.phone,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Contact us",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          CupertinoIcons.folder_fill,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Legal",
                    style: TextStyle(
                      fontSize: 16,
                      // color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.folder,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.import_contacts,
                          // color: primaryColor,
                        ),
                        title: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 18,
                            // color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () async {
                      await ref.read(authProvider).signOut();
                      context.router.replaceNamed(Routes.signIn);
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.logout,
                        // color: primaryColor,
                      ),
                      title: Text(
                        "Log Out",
                        style: TextStyle(
                          fontSize: 18,
                          // color: primaryColor,
                        ),
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
