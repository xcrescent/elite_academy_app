import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dashboard/controller/student_state_pod.dart';
import '../../dashboard/model/student_model.dart';

@RoutePage()
class ManageStudentPage extends ConsumerWidget {
  const ManageStudentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(studentListPod);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Students'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(studentListPod),
          ),
        ],
      ),
      body: studentsAsync.when(
        data: (students) => _buildStudentsList(students, ref, context),
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading students...'),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error loading students: ${error.toString()}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(studentListPod),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.router.pushNamed('/admin/add-student'),
        icon: const Icon(Icons.person_add),
        label: const Text('Add Student'),
      ),
    );
  }

  Widget _buildStudentsList(List<StudentModel> students, WidgetRef ref, BuildContext context) {
    if (students.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school_outlined, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No students found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the + button to add your first student',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.router.pushNamed('/admin/add-student'),
              icon: const Icon(Icons.person_add),
              label: const Text('Add Student'),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search students...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<String>(
                icon: const Icon(Icons.filter_list),
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'all', child: Text('All Students')),
                  const PopupMenuItem(value: 'active', child: Text('Active')),
                  const PopupMenuItem(value: 'inactive', child: Text('Inactive')),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return _buildStudentCard(student, ref, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStudentCard(StudentModel student, WidgetRef ref, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            student.name.isNotEmpty ? student.name[0].toUpperCase() : '?',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (student.rollNumber != null)
              Text('Roll No: ${student.rollNumber}'),
            if (student.standard != null)
              Text('Class: ${student.standard}'),
            if (student.phoneNumber.isNotEmpty)
              Text('Phone: ${student.phoneNumber}'),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleStudentAction(value, student, ref, context),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'view',
              child: Row(
                children: [
                  Icon(Icons.visibility, size: 20),
                  SizedBox(width: 8),
                  Text('View Details'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'attendance',
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 20),
                  SizedBox(width: 8),
                  Text('Attendance'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'grades',
              child: Row(
                children: [
                  Icon(Icons.grade, size: 20),
                  SizedBox(width: 8),
                  Text('Grades'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red, size: 20),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        onTap: () => _showStudentDetails(student, context),
      ),
    );
  }

  void _handleStudentAction(String action, StudentModel student, WidgetRef ref, BuildContext context) {
    switch (action) {
      case 'view':
        _showStudentDetails(student, context);
        break;
      case 'edit':
        // TODO: Navigate to edit student page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit feature coming soon!')),
        );
        break;
      case 'attendance':
        // TODO: Navigate to attendance page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Attendance tracking coming soon!')),
        );
        break;
      case 'grades':
        // TODO: Navigate to grades page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Grade management coming soon!')),
        );
        break;
      case 'delete':
        _showDeleteConfirmation(student, ref, context);
        break;
    }
  }

  void _showStudentDetails(StudentModel student, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(student.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Roll Number', student.rollNumber ?? 'Not Set'),
              _buildDetailRow('Class', student.standard ?? 'Not Set'),
              _buildDetailRow('Phone', student.phoneNumber),
              _buildDetailRow('WhatsApp', student.whatsappNumber),
              _buildDetailRow('Email', student.email ?? 'Not Set'),
              _buildDetailRow('Address', student.address ?? 'Not Set'),
              const Divider(),
              const Text('Father Details:', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildDetailRow('Father Name', student.fatherName ?? 'Not Set'),
              _buildDetailRow('Father Phone', student.fatherPhone ?? 'Not Set'),
              _buildDetailRow('Father Email', student.fatherEmail ?? 'Not Set'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Navigate to edit
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value.isEmpty ? 'Not Set' : value)),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(StudentModel student, WidgetRef ref, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Student'),
        content: Text('Are you sure you want to delete ${student.name}? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement delete functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Delete functionality coming soon!')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
