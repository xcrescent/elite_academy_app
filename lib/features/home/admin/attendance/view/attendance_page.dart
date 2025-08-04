import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/controller/student_state_pod.dart';
import '../../dashboard/model/attendance_record_model.dart';
import '../../dashboard/model/student_model.dart';

@RoutePage()
class AttendancePage extends ConsumerStatefulWidget {
  const AttendancePage({super.key});

  @override
  ConsumerState<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends ConsumerState<AttendancePage> {
  DateTime selectedDate = DateTime.now();
  String selectedClass = 'All';
  Map<String, AttendanceStatus> attendanceMap = {};
  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _initializeAttendance();
  }

  void _initializeAttendance() {
    // Initialize all students as absent by default
    final studentsAsync = ref.read(studentListPod);
    studentsAsync.whenData((students) {
      for (var student in students) {
        attendanceMap[student.id!] = AttendanceStatus.absent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final studentsAsync = ref.watch(studentListPod);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Attendance'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: _showAttendanceHistory,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildDateSelector(),
          _buildClassSelector(),
          Expanded(
            child: studentsAsync.when(
              data: (students) => _buildStudentsList(students),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 64, color: Colors.red),
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
          ),
        ],
      ),
      bottomNavigationBar: _buildSubmitButton(),
    );
  }

  Widget _buildDateSelector() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: const Text('Date'),
        subtitle: Text(DateFormat('EEEE, MMM dd, yyyy').format(selectedDate)),
        trailing: const Icon(Icons.chevron_right),
        onTap: _selectDate,
      ),
    );
  }

  Widget _buildClassSelector() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: const Icon(Icons.class_),
        title: const Text('Class'),
        subtitle: Text(selectedClass),
        trailing: const Icon(Icons.chevron_right),
        onTap: _selectClass,
      ),
    );
  }

  Widget _buildStudentsList(List<StudentModel> students) {
    final filteredStudents = selectedClass == 'All'
        ? students
        : students.where((s) => s.standard == selectedClass).toList();

    if (filteredStudents.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school_outlined, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              selectedClass == 'All'
                  ? 'No students found'
                  : 'No students found for $selectedClass',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                '${filteredStudents.length} students',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => _markAllPresent(filteredStudents),
                icon: const Icon(Icons.check_circle, size: 20),
                label: const Text('Mark All Present'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredStudents.length,
            itemBuilder: (context, index) {
              final student = filteredStudents[index];
              return _buildStudentAttendanceCard(student);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStudentAttendanceCard(StudentModel student) {
    final status = attendanceMap[student.id!] ?? AttendanceStatus.absent;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(status).withOpacity(0.2),
          child: Text(
            student.name.isNotEmpty ? student.name[0].toUpperCase() : '?',
            style: TextStyle(
              color: _getStatusColor(status),
              fontWeight: FontWeight.bold,
            ),
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
            if (student.standard != null) Text('Class: ${student.standard}'),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getStatusColor(status).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _getStatusColor(status), width: 1),
          ),
          child: Text(
            status.displayName,
            style: TextStyle(
              color: _getStatusColor(status),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () => _showStatusDialog(student),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: isSubmitting ? null : _submitAttendance,
        child: isSubmitting
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Text('Submit Attendance'),
      ),
    );
  }

  Color _getStatusColor(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return Colors.green;
      case AttendanceStatus.absent:
        return Colors.red;
      case AttendanceStatus.late:
        return Colors.orange;
      case AttendanceStatus.excused:
        return Colors.blue;
    }
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _selectClass() async {
    final students = await ref.read(studentListPod.future);

    final classes = [
      'All',
      ...students.map((s) => s.standard).where((s) => s != null).toSet()
    ];

    if (!mounted) return;

    final selectedValue = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Class'),
        children: classes
            .map((className) => SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, className),
                  child: Text(className ?? 'Unknown'),
                ))
            .toList(),
      ),
    );

    if (selectedValue != null) {
      setState(() {
        selectedClass = selectedValue;
      });
    }
  }

  void _markAllPresent(List<StudentModel> students) {
    setState(() {
      for (var student in students) {
        attendanceMap[student.id!] = AttendanceStatus.present;
      }
    });
  }

  Future<void> _showStatusDialog(StudentModel student) async {
    final selectedStatus = await showDialog<AttendanceStatus>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Mark Attendance for ${student.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AttendanceStatus.values.map((status) {
            return RadioListTile<AttendanceStatus>(
              title: Text(status.displayName),
              value: status,
              groupValue: attendanceMap[student.id!],
              onChanged: (value) => Navigator.pop(context, value),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (selectedStatus != null) {
      setState(() {
        attendanceMap[student.id!] = selectedStatus;
      });
    }
  }

  Future<void> _submitAttendance() async {
    setState(() {
      isSubmitting = true;
    });

    try {
      // TODO: Save attendance to Firebase/local storage
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Attendance submitted for ${DateFormat('MMM dd, yyyy').format(selectedDate)}',
            ),
            backgroundColor: Colors.green,
          ),
        );
        context.router.maybePop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error submitting attendance: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        isSubmitting = false;
      });
    }
  }

  void _showAttendanceHistory() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Attendance history feature coming soon!')),
    );
  }
}
