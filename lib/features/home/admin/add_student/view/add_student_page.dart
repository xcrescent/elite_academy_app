import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dashboard/controller/student_state_pod.dart';
import '../../dashboard/repository/student_repository.dart';

@RoutePage(
  deferredLoading: true,
)
class AddStudentPage extends ConsumerWidget {
  const AddStudentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Column(
        children: [
          PageView(
            controller: pageController,
            children: [
              Column(
                children: [
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setFirstName(value),
                    decoration: const InputDecoration(
                      labelText: 'First name',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setFirstName(value),
                    decoration: const InputDecoration(
                      labelText: 'Middle name',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setLastName(value),
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setLastName(value),
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setPhoneNumber(value),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
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
              Column(
                children: [
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setPhoneNumber(value),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
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
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setPhoneNumber(value),
                    decoration: const InputDecoration(
                      labelText: 'Standard',
                    ),
                    keyboardType: TextInputType.text,
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
              Column(
                children: [
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setPhoneNumber(value),
                    decoration: const InputDecoration(
                      labelText: 'Father Name',
                    ),
                    keyboardType: TextInputType.text,
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
                  TextFormField(
                    onChanged: (value) => ref
                        .read(studentControllerProvider.notifier)
                        .setPhoneNumber(value),
                    decoration: const InputDecoration(
                      labelText: 'Father Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
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
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (pageController.page!.round() == 2) {
            ref.read(studentRepositoryProvider).addStudent(
                  ref.read(studentControllerProvider),
                );
          } else {
            pageController.nextPage(
              duration: const Duration(
                milliseconds: 300,
              ),
              curve: Curves.ease,
            );
          }
        },
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
