import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dashboard/controller/student_state_pod.dart';

@RoutePage(
  deferredLoading: true,
)
class AddExpensePage extends ConsumerWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Expense',
        ),
      ),
      body: const DefaultTabController(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setFirstName(value),
              decoration: const InputDecoration(
                labelText: 'First name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setFirstName(value),
              decoration: const InputDecoration(
                labelText: 'Middle name (optional)',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setLastName(value),
              decoration: const InputDecoration(
                labelText: 'Last Name (optional)',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setLastName(value),
              decoration: const InputDecoration(
                labelText: 'Date of Birth (optional)',
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
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Address',
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
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Roll Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Standard',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Aadhar Number',
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
                labelText: 'Father Name',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                labelText: 'Father Phone Number',
              ),
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
                labelText: 'Father Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => ref
                  .read(studentControllerProvider.notifier)
                  .setPhoneNumber(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Father Address',
              ),
              keyboardType: TextInputType.streetAddress,
            ),
          ],
        ),
      ),
    );
  }
}
