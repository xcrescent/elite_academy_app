import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/controller/grade_state_pod.dart';
import '../../dashboard/model/grade_model.dart';

@RoutePage()
class GradesPage extends ConsumerStatefulWidget {
  const GradesPage({super.key});

  @override
  ConsumerState<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends ConsumerState<GradesPage> {
  String selectedFilter = 'All';
  String selectedSubject = 'All';
  String selectedClass = 'All';

  @override
  Widget build(BuildContext context) {
    final gradesAsync = ref.watch(gradeListPod);
    final subjectsAsync = ref.watch(subjectListPod);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: _showAnalytics,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export',
                child: Row(
                  children: [
                    Icon(Icons.file_download, size: 20),
                    SizedBox(width: 8),
                    Text('Export Grades'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'bulk_update',
                child: Row(
                  children: [
                    Icon(Icons.update, size: 20),
                    SizedBox(width: 8),
                    Text('Bulk Update'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(subjectsAsync),
          Expanded(
            child: gradesAsync.when(
              data: (grades) => _buildGradesList(grades),
              loading: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading grades...'),
                  ],
                ),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error loading grades: ${error.toString()}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.refresh(gradeListPod),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddGradeDialog,
        icon: const Icon(Icons.add),
        label: const Text('Add Grade'),
      ),
    );
  }

  Widget _buildFilters(AsyncValue<List<SubjectModel>> subjectsAsync) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filters',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedFilter,
                    decoration: const InputDecoration(
                      labelText: 'Exam Type',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Quiz', 'Assignment', 'Midterm', 'Final']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: subjectsAsync.when(
                    data: (subjects) => DropdownButtonFormField<String>(
                      value: selectedSubject,
                      decoration: const InputDecoration(
                        labelText: 'Subject',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        const DropdownMenuItem(value: 'All', child: Text('All')),
                        ...subjects.map((subject) => DropdownMenuItem(
                              value: subject.id,
                              child: Text(subject.name),
                            )),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value!;
                        });
                      },
                    ),
                    loading: () => const TextField(
                      decoration: InputDecoration(
                        labelText: 'Loading...',
                        border: OutlineInputBorder(),
                      ),
                      enabled: false,
                    ),
                    error: (_, __) => const TextField(
                      decoration: InputDecoration(
                        labelText: 'Error',
                        border: OutlineInputBorder(),
                      ),
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradesList(List<GradeModel> grades) {
    final filteredGrades = _filterGrades(grades);

    if (filteredGrades.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.grade, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No grades found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add your first grade using the + button',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                '${filteredGrades.length} grades found',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                'Avg: ${_calculateAverageGrade(filteredGrades).toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredGrades.length,
            itemBuilder: (context, index) {
              final grade = filteredGrades[index];
              return _buildGradeCard(grade);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGradeCard(GradeModel grade) {
    final percentage = grade.percentage;
    final gradeColor = _getGradeColor(percentage);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: gradeColor.withValues(alpha: 0.2),
          child: Text(
            grade.calculatedGrade,
            style: TextStyle(
              color: gradeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          '${grade.studentName} - ${grade.subjectName}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${grade.examType} • ${grade.className}'),
            Text(
              'Marks: ${grade.marksObtained}/${grade.totalMarks} (${percentage.toStringAsFixed(1)}%)',
              style: TextStyle(
                color: gradeColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Date: ${DateFormat('MMM dd, yyyy').format(grade.examDate)}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleGradeAction(value, grade),
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
        onTap: () => _showGradeDetails(grade),
      ),
    );
  }

  List<GradeModel> _filterGrades(List<GradeModel> grades) {
    return grades.where((grade) {
      if (selectedFilter != 'All' && grade.examType != selectedFilter) {
        return false;
      }
      if (selectedSubject != 'All' && grade.subjectId != selectedSubject) {
        return false;
      }
      if (selectedClass != 'All' && grade.classId != selectedClass) {
        return false;
      }
      return true;
    }).toList();
  }

  double _calculateAverageGrade(List<GradeModel> grades) {
    if (grades.isEmpty) return 0.0;
    final total = grades.fold<double>(0, (sum, grade) => sum + grade.percentage);
    return total / grades.length;
  }

  Color _getGradeColor(double percentage) {
    if (percentage >= 90) return Colors.green;
    if (percentage >= 80) return Colors.lightGreen;
    if (percentage >= 70) return Colors.orange;
    if (percentage >= 60) return Colors.deepOrange;
    return Colors.red;
  }

  void _handleGradeAction(String action, GradeModel grade) {
    switch (action) {
      case 'view':
        _showGradeDetails(grade);
        break;
      case 'edit':
        _showEditGradeDialog(grade);
        break;
      case 'delete':
        _showDeleteConfirmation(grade);
        break;
    }
  }

  void _showGradeDetails(GradeModel grade) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${grade.studentName} - ${grade.subjectName}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Exam Type', grade.examType),
              _buildDetailRow('Class', grade.className),
              _buildDetailRow('Marks Obtained', '${grade.marksObtained}'),
              _buildDetailRow('Total Marks', '${grade.totalMarks}'),
              _buildDetailRow('Percentage', '${grade.percentage.toStringAsFixed(1)}%'),
              _buildDetailRow('Grade', grade.calculatedGrade),
              _buildDetailRow('GPA', grade.calculatedGPA.toStringAsFixed(2)),
              _buildDetailRow('Exam Date', DateFormat('MMM dd, yyyy').format(grade.examDate)),
              _buildDetailRow('Graded By', grade.gradedBy),
              if (grade.remarks?.isNotEmpty == true)
                _buildDetailRow('Remarks', grade.remarks!),
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
              _showEditGradeDialog(grade);
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
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void _showAddGradeDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add Grade feature coming soon!')),
    );
  }

  void _showEditGradeDialog(GradeModel grade) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit Grade feature coming soon!')),
    );
  }

  void _showDeleteConfirmation(GradeModel grade) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Grade'),
        content: Text(
          'Are you sure you want to delete this grade for ${grade.studentName}? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
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

  void _showAnalytics() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Grade Analytics feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'export':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Export feature coming soon!')),
        );
        break;
      case 'bulk_update':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bulk update feature coming soon!')),
        );
        break;
    }
  }
}