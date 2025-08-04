// Example of how to refactor admin forms using new common components
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:math';

import 'base_tab_form.dart';
import 'common_form_components.dart';
import '../../utils/snackbar_utils.dart';

@RoutePage(deferredLoading: true)
class OptimizedAddStudentPage extends ConsumerStatefulWidget {
  const OptimizedAddStudentPage({super.key});

  @override
  ConsumerState<OptimizedAddStudentPage> createState() => _OptimizedAddStudentPageState();
}

class _OptimizedAddStudentPageState extends ConsumerState<OptimizedAddStudentPage> {
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTabForm(
      title: 'Add Student',
      tabs: [
        TabData(
          title: 'Personal',
          icon: Icons.person,
          content: _buildPersonalTab(),
        ),
        TabData(
          title: 'Contact',
          icon: Icons.contact_page,
          content: _buildContactTab(),
        ),
        TabData(
          title: 'Academic',
          icon: Icons.school,
          content: _buildAcademicTab(),
        ),
        TabData(
          title: 'Info',
          icon: Icons.info,
          content: _buildInfoTab(),
        ),
      ],
      onSubmit: _handleSubmit,
    );
  }

  Widget _buildPersonalTab() {
    return BaseFormTab(
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/user.png'),
        ),
        const SizedBox(height: 16),
        
        CommonFormComponents.buildNameField(
          label: 'Student Name',
          onChanged: (value) {
            // Update state management
            // ref.read(studentControllerProvider.notifier).setFirstName(value);
          },
        ),
        
        CommonFormComponents.buildPasswordField(
          controller: _passwordController,
          onChanged: (value) {
            // Update state management
            // ref.read(studentControllerProvider.notifier).setPassword(value);
          },
          suffixIcon: IconButton(
            icon: const Icon(Icons.generating_tokens),
            onPressed: _generatePassword,
          ),
        ),
        
        CommonFormComponents.buildDateField(
          context: context,
          label: 'Date of Birth',
          onChanged: (date) {
            // Update state management
            // ref.read(studentControllerProvider.notifier).setDateOfBirth(date);
          },
        ),
      ],
    );
  }

  Widget _buildContactTab() {
    return BaseFormTab(
      children: [
        CommonFormComponents.buildPhoneField(
          onChanged: (value) {
            // Update state management
          },
        ),
        
        CommonFormComponents.buildPhoneField(
          label: 'WhatsApp Number (if different)',
          isRequired: false,
          onChanged: (value) {
            // Update state management
          },
        ),
        
        CommonFormComponents.buildAddressField(
          onChanged: (value) {
            // Update state management
          },
        ),
      ],
    );
  }

  Widget _buildAcademicTab() {
    return BaseFormTab(
      children: [
        CommonFormComponents.buildNumberField(
          label: 'Roll Number',
          onChanged: (value) {
            // Update state management
          },
        ),
        
        CommonFormComponents.buildTextField(
          label: 'Standard',
          icon: Icons.class_,
          onChanged: (value) {
            // Update state management
          },
        ),
        
        CommonFormComponents.buildTextField(
          label: 'Aadhar Number',
          icon: Icons.credit_card,
          isRequired: false,
          onChanged: (value) {
            // Update state management
          },
        ),
      ],
    );
  }

  Widget _buildInfoTab() {
    return BaseFormTab(
      children: [
        CommonFormComponents.buildNameField(
          label: 'Father Name',
          onChanged: (value) {
            // Update state management
          },
        ),
        
        CommonFormComponents.buildPhoneField(
          label: 'Father Phone Number',
          onChanged: (value) {
            // Update state management
          },
        ),
        
        CommonFormComponents.buildEmailField(
          label: 'Father Email',
          isRequired: false,
          autoValidate: true,
          onChanged: (value) {
            // Update state management
          },
        ),
        
        CommonFormComponents.buildAddressField(
          label: 'Father Address',
          hasOutlineBorder: true,
          onChanged: (value) {
            // Update state management
          },
        ),
      ],
    );
  }

  void _generatePassword() {
    const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    final rnd = Random(DateTime.now().millisecondsSinceEpoch);
    const length = 8;
    String result = "";
    for (var i = 0; i < length; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    _passwordController.text = result;
    
    SnackbarUtils.showInfo(context, 'Password generated successfully');
  }

  void _handleSubmit() async {
    try {
      // Simulate API call
      // final success = await ref.read(studentRepositoryProvider).addStudent(...);
      
      const success = true; // Simulated success
      
      if (!mounted) return;
      
      if (success) {
        // Reset form state
        _passwordController.clear();
        
        SnackbarUtils.showSuccess(context, 'Student added successfully');
        context.router.maybePop();
      } else {
        SnackbarUtils.showError(context);
      }
    } catch (e) {
      if (!mounted) return;
      SnackbarUtils.showError(context, message: 'Error: ${e.toString()}');
    }
  }
}