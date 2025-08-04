import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/features/auth/phone/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/controller/student_state_pod.dart';
import '../../dashboard/repository/student_repository.dart';

@RoutePage(
  deferredLoading: true,
)
class AddStudentPage extends ConsumerStatefulWidget {
  const AddStudentPage({super.key});

  @override
  ConsumerState<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends ConsumerState<AddStudentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _passwordController = TextEditingController();
  }

  @override
  dispose() {
    _tabController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final password = ref.watch(passStudentIdPod);
    if (_passwordController.text != password) {
      _passwordController.text = password;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Student',
        ),
      ),
      body: Form(
        key: formKey,
        child: DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'Personal',
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                  Tab(
                    text: 'Contact',
                    icon: Icon(
                      Icons.contact_page,
                    ),
                  ),
                  Tab(
                    text: 'Academic',
                    icon: Icon(
                      Icons.school,
                    ),
                  ),
                  Tab(
                    text: 'Info',
                    icon: Icon(
                      Icons.info,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    PersonalTab(passwordController: _passwordController),
                    const ContactTab(),
                    const AcademicTab(),
                    const InfoTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              if (formKey.currentState?.validate() == true) {
                if (_tabController.index < 3) {
                  _tabController.animateTo(_tabController.index + 1);
                  return;
                }
                // Form validated successfully
                ref.watch(authProvider).fetchSignInMethodsForEmail(
                      ref.watch(studentControllerProvider).email ??
                          'admin@eliteacademy.co.in',
                    );

                var x = await ref.read(studentRepositoryProvider).addStudent(
                      ref.read(studentControllerProvider),
                      ref.watch(passStudentIdPod).toString(),
                    );
                if (!mounted) {
                  return;
                }
                if (x) {
                  ref.read(studentControllerProvider.notifier).reset();
                  ref.read(passStudentIdPod.notifier).state = '';
                  ref.refresh(studentListPod);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Student added successfully',
                      ),
                    ),
                  );
                  context.router.pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Something went wrong',
                      ),
                    ),
                  );
                  return;
                }
              }
            },
            icon: const Icon(
              Icons.arrow_forward,
            ),
            label: Text(
              (_tabController.index < 3) ? 'Next' : 'Submit',
            ),
          );
        },
      ),
    );
  }
}

class PersonalTab extends ConsumerWidget {
  final TextEditingController passwordController;
  
  const PersonalTab({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                'assets/images/user.png',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              initialValue: ref.watch(studentControllerProvider).name,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Student Name';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setFirstName(value),
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                ref.watch(userRepositoryProvider).getOrgId().then((value) {
                  ref.read(studentControllerProvider.notifier).setEmail(
                      '${ref.watch(studentControllerProvider).name}@$value.eliteacademy.co.in');
                });
              },
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              initialValue: ref.watch(studentControllerProvider).dateOfBirth !=
                      null
                  ? DateFormat('dd-MM-yyyy')
                      .format(ref.watch(studentControllerProvider).dateOfBirth!)
                  : null,
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: 'Date of Birth (optional)',
                prefixIcon: Icon(Icons.cake),
              ),
              onTap: () async {
                var x = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (x != null) {
                  ref
                      .read(studentControllerProvider.notifier)
                      .setDateOfBirth(x);
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
              controller: passwordController,
              onChanged: (value) {
                ref.read(studentControllerProvider.notifier).setPassword(value);
                ref.read(passStudentIdPod.notifier).state = value;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.password),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.generating_tokens,
                  ),
                  onPressed: () {
                    // Generate Password
                    const chars =
                        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                    final rnd = Random(DateTime.now().millisecondsSinceEpoch);
                    const length = 8;
                    String result = "";
                    for (var i = 0; i < length; i++) {
                      result += chars[rnd.nextInt(chars.length)];
                    }
                    ref.read(passStudentIdPod.notifier).state = result;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Password generated successfully',
                        ),
                      ),
                    );
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactTab extends ConsumerWidget {
  const ContactTab({super.key});

  // String? _validateEmail(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter an email';
  //   }
  //   RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   if (!emailRegExp.hasMatch(value)) {
  //     return 'Please enter a valid email';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Phone number',
                prefixIcon: Icon(Icons.phone),
              ),
              buildCounter: (BuildContext context,
                  {required int currentLength,
                  required bool isFocused,
                  required int? maxLength}) {
                return null;
              },
              maxLength: 10,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Phone number';
                }
                if (value.length != 10) {
                  return 'Please enter valid Phone number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Whatsapp number (if not same as above)',
                prefixIcon: Icon(Icons.numbers),
              ),
              buildCounter: (BuildContext context,
                  {required int currentLength,
                  required bool isFocused,
                  required int? maxLength}) {
                return null;
              },
              validator: (value) {
                if (value!.isNotEmpty) {
                  if (value.length != 10) {
                    return 'Please enter valid Whatsapp number';
                  }
                }

                return null;
              },
              maxLength: 10,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Address (optional)',
                prefixIcon: Icon(Icons.home),
              ),
              keyboardType: TextInputType.streetAddress,
            ),
          ],
        ),
      ),
    );
  }
}

class AcademicTab extends ConsumerWidget {
  const AcademicTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Roll number';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Roll Number',
                prefixIcon: Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Standard';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Standard',
                prefixIcon: Icon(Icons.class_),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please enter Aadhar Number';
              //   }
              //   return null;
              // },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Aadhar Number (optional)',
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTab extends ConsumerWidget {
  const InfoTab({super.key});

  String? _validateEmail(value) {
    if (value!.isNotEmpty) {
      RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegExp.hasMatch(value)) {
        return 'Please enter a valid email';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Father name';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Father Name',
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Phone number';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Father Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: _validateEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Father Email (optional)',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please enter Address';
              //   }
              //   return null;
              // },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Father Address (optional)',
                prefixIcon: Icon(Icons.home),
              ),
              keyboardType: TextInputType.streetAddress,
            ),
          ],
        ),
      ),
    );
  }
}
