import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dashboard/controller/student_state_pod.dart';

@RoutePage(
  deferredLoading: true,
)
class AddExpensePage extends ConsumerWidget {
    final _formKey = GlobalKey<FormState>();
   AddExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Expense',
        ),
      ),
      body: Form(
         key: _formKey,


        child: const DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Column(
            children: [
              TabBar(
                tabs: [
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
                  children: [
                    PersonalTab(),
                    ContactTab(),
                    AcademicTab(),
                    InfoTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           if (_formKey.currentState?.validate() == true) {

          }

          // if (pageController.page!.round() == 2) {
          //   ref.read(studentRepositoryProvider).addStudent(
          //         ref.read(studentControllerProvider),
          //       );
          // } else {
          //   pageController.nextPage(
          //     duration: const Duration(
          //       milliseconds: 300,
          //     ),
          //     curve: Curves.ease,
          //   );
          // }
        },
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}

class PersonalTab extends ConsumerWidget {
  const PersonalTab({super.key});

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
               validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Fill required fields';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setFirstName(value),
              decoration: const InputDecoration(
                labelText: 'First name',
                 prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              //  validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please Fill required fields';
              //   }
              //   return null;
              // },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setFirstName(value),
              decoration: const InputDecoration(
                labelText: 'Middle name (optional)',
                 prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              //  validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please Fill required fields';
              //   }
              //   return null;
              // },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setLastName(value),
              decoration: const InputDecoration(
                labelText: 'Last Name (optional)',
                 prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              //  validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please Fill required fields';
              //   }
              //   return null;
              // },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setLastName(value),
              decoration: const InputDecoration(
                labelText: 'Date of Birth (optional)',
                 prefixIcon: Icon(Icons.cake),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactTab extends ConsumerWidget {
  const ContactTab({super.key});

     String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
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
              
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Phone number',
                 prefixIcon: Icon(Icons.phone),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Phone number';
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
                labelText: 'Whatsapp number',
                 prefixIcon: Icon(Icons.phone),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Whatsapp number';
                }
                return null;
              },
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
                labelText: 'Email',
                 prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
               validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Fill required fields';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Address',
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
                  return 'Please Fill required fields';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Password',
                 prefixIcon: Icon(Icons.password),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
               validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Fill required fields';
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
                  return 'Please Fill required fields';
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
               validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Fill required fields';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Aadhar Number',
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
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
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
                  return 'Please Fill required fields';
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
                  return 'Please Fill required fields';
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
                labelText: 'Father Email',
                 prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
               validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Fill required fields';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Father Address',
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
