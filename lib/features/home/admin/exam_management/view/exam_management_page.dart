import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/model/exam_model.dart';

// Sample exam data provider
final examProvider = FutureProvider<List<ExamModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    ExamModel(
      id: '1',
      name: 'Mid-term Mathematics',
      description: 'Mid-term examination for mathematics covering chapters 1-5',
      examType: ExamType.midterm,
      subjectId: 'math1',
      subjectName: 'Mathematics',
      classId: 'class10a',
      className: 'Class 10-A',
      startDate: DateTime.now().add(const Duration(days: 7)),
      endDate: DateTime.now().add(const Duration(days: 7, hours: 3)),
      duration: 180,
      totalMarks: 100,
      passingMarks: 35,
      status: ExamStatus.scheduled,
      createdBy: 'Admin',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      instructions: 'Bring calculator, graph paper, and drawing instruments',
      syllabusTopics: ['Algebra', 'Geometry', 'Trigonometry'],
      isPublished: true,
    ),
    ExamModel(
      id: '2',
      name: 'Physics Practical',
      description: 'Practical examination for physics laboratory experiments',
      examType: ExamType.practical,
      subjectId: 'phys1',
      subjectName: 'Physics',
      classId: 'class10a',
      className: 'Class 10-A',
      startDate: DateTime.now().subtract(const Duration(days: 2)),
      endDate: DateTime.now().subtract(const Duration(days: 2, hours: -2)),
      duration: 120,
      totalMarks: 50,
      passingMarks: 18,
      status: ExamStatus.completed,
      createdBy: 'Admin',
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      instructions: 'Bring lab coat and observation notebook',
      isPublished: true,
      resultsPublishedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ExamModel(
      id: '3',
      name: 'Chemistry Unit Test',
      description: 'Unit test covering organic chemistry basics',
      examType: ExamType.unit,
      subjectId: 'chem1',
      subjectName: 'Chemistry',
      classId: 'class10b',
      className: 'Class 10-B',
      startDate: DateTime.now().add(const Duration(days: 2)),
      endDate: DateTime.now().add(const Duration(days: 2, hours: 1)),
      duration: 60,
      totalMarks: 30,
      passingMarks: 12,
      status: ExamStatus.scheduled,
      createdBy: 'Admin',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      isPublished: false,
    ),
    ExamModel(
      id: '4',
      name: 'English Literature Quiz',
      description: 'Quick assessment on Shakespeare\'s works',
      examType: ExamType.quiz,
      subjectId: 'eng1',
      subjectName: 'English Literature',
      classId: 'class10a',
      className: 'Class 10-A',
      startDate: DateTime.now().add(const Duration(hours: 2)),
      endDate: DateTime.now().add(const Duration(hours: 2, minutes: 30)),
      duration: 30,
      totalMarks: 20,
      passingMarks: 8,
      status: ExamStatus.ongoing,
      createdBy: 'Admin',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      isPublished: true,
    ),
  ];
});

final examResultsProvider = FutureProvider<List<ExamResultModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  
  return [
    ExamResultModel(
      id: '1',
      examId: '2',
      studentId: 'student1',
      studentName: 'John Doe',
      marksObtained: 42,
      totalMarks: 50,
      grade: 'A',
      percentage: 84.0,
      status: ExamResultStatus.published,
      isPassed: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      gradedBy: 'Physics Teacher',
      rank: 1,
      remarks: 'Excellent practical skills demonstrated',
      examDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ExamResultModel(
      id: '2',
      examId: '2',
      studentId: 'student2',
      studentName: 'Jane Smith',
      marksObtained: 38,
      totalMarks: 50,
      grade: 'B+',
      percentage: 76.0,
      status: ExamResultStatus.published,
      isPassed: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      gradedBy: 'Physics Teacher',
      rank: 2,
      examDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];
});

@RoutePage()
class ExamManagementPage extends ConsumerStatefulWidget {
  const ExamManagementPage({super.key});

  @override
  ConsumerState<ExamManagementPage> createState() => _ExamManagementPageState();
}

class _ExamManagementPageState extends ConsumerState<ExamManagementPage> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedStatus = 'All';
  String selectedClass = 'All';
  String selectedSubject = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final examAsync = ref.watch(examProvider);
    final resultsAsync = ref.watch(examResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.quiz),
              text: 'Exams',
            ),
            Tab(
              icon: Icon(Icons.grade),
              text: 'Results',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: _showExamAnalytics,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'bulk_create',
                child: Row(
                  children: [
                    Icon(Icons.add_to_photos, size: 20),
                    SizedBox(width: 8),
                    Text('Bulk Create Exams'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'schedule_report',
                child: Row(
                  children: [
                    Icon(Icons.schedule, size: 20),
                    SizedBox(width: 8),
                    Text('Exam Schedule'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'result_analysis',
                child: Row(
                  children: [
                    Icon(Icons.insights, size: 20),
                    SizedBox(width: 8),
                    Text('Result Analysis'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildExamsTab(examAsync),
          _buildResultsTab(resultsAsync),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton.extended(
              onPressed: _showCreateExamDialog,
              icon: const Icon(Icons.add),
              label: const Text('Create Exam'),
            )
          : null,
    );
  }

  Widget _buildExamsTab(AsyncValue<List<ExamModel>> examAsync) {
    return Column(
      children: [
        _buildExamFilters(),
        _buildExamStats(examAsync),
        Expanded(
          child: examAsync.when(
            data: (exams) => _buildExamsList(exams),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading exams...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading exams: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(examProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultsTab(AsyncValue<List<ExamResultModel>> resultsAsync) {
    return resultsAsync.when(
      data: (results) => _buildResultsList(results),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading results...'),
          ],
        ),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error loading results: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(examResultsProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamFilters() {
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
                    value: selectedStatus,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Draft', 'Scheduled', 'Ongoing', 'Completed', 'Cancelled']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedClass,
                    decoration: const InputDecoration(
                      labelText: 'Class',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Class 10-A', 'Class 10-B', 'Class 9-A']
                        .map((cls) => DropdownMenuItem(
                              value: cls,
                              child: Text(cls),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedClass = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamStats(AsyncValue<List<ExamModel>> examAsync) {
    return examAsync.when(
      data: (exams) {
        final upcomingExams = exams.where((exam) => exam.isUpcoming).length;
        final ongoingExams = exams.where((exam) => exam.isOngoing).length;
        final completedExams = exams.where((exam) => exam.isCompleted).length;
        final publishedResults = exams.where((exam) => exam.status == ExamStatus.results_published).length;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Upcoming',
                  value: '$upcomingExams',
                  icon: Icons.schedule,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Ongoing',
                  value: '$ongoingExams',
                  icon: Icons.play_circle,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Completed',
                  value: '$completedExams',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Published',
                  value: '$publishedResults',
                  icon: Icons.publish,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 20),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamsList(List<ExamModel> exams) {
    final filteredExams = _filterExams(exams);

    if (filteredExams.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.quiz, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No exams found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create your first exam using the + button',
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
                '${filteredExams.length} exams found',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredExams.length,
            itemBuilder: (context, index) {
              final exam = filteredExams[index];
              return _buildExamCard(exam);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildExamCard(ExamModel exam) {
    final statusColor = _getExamStatusColor(exam);
    final timeInfo = _getExamTimeInfo(exam);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () => _showExamDetails(exam),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        exam.examType.icon,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exam.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${exam.subjectName} • ${exam.className}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleExamAction(value, exam),
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
                      if (exam.status == ExamStatus.draft)
                        const PopupMenuItem(
                          value: 'publish',
                          child: Row(
                            children: [
                              Icon(Icons.publish, size: 20),
                              SizedBox(width: 8),
                              Text('Publish'),
                            ],
                          ),
                        ),
                      if (exam.status == ExamStatus.completed && exam.status != ExamStatus.results_published)
                        const PopupMenuItem(
                          value: 'publish_results',
                          child: Row(
                            children: [
                              Icon(Icons.grade, size: 20),
                              SizedBox(width: 8),
                              Text('Publish Results'),
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
                      if (exam.status != ExamStatus.ongoing)
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, size: 20, color: Colors.red),
                              SizedBox(width: 8),
                              Text('Delete', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildExamInfoChip(
                      Icons.schedule,
                      DateFormat('MMM dd, HH:mm').format(exam.startDate),
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildExamInfoChip(
                      Icons.timer,
                      '${exam.duration} min',
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildExamInfoChip(
                      Icons.grade,
                      '${exam.totalMarks} marks',
                      Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getStatusDisplayName(exam.status),
                      style: TextStyle(
                        fontSize: 12,
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    timeInfo,
                    style: TextStyle(
                      fontSize: 12,
                      color: exam.isUpcoming ? Colors.blue : 
                             exam.isOngoing ? Colors.orange : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamInfoChip(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList(List<ExamResultModel> results) {
    if (results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.grade, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No exam results found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Results will appear here after exams are graded',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return _buildResultCard(result);
      },
    );
  }

  Widget _buildResultCard(ExamResultModel result) {
    final gradeColor = _getGradeColor(result.grade);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: gradeColor.withValues(alpha: 0.2),
          child: Text(
            result.grade,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: gradeColor,
            ),
          ),
        ),
        title: Text(
          result.studentName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${result.marksObtained}/${result.totalMarks} • ${result.percentage.toStringAsFixed(1)}%'),
            if (result.rank != null)
              Text('Rank: ${result.rank}', style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: result.isPassed ? Colors.green.withValues(alpha: 0.2) : Colors.red.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                result.isPassed ? 'PASS' : 'FAIL',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: result.isPassed ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
        onTap: () => _showResultDetails(result),
      ),
    );
  }

  List<ExamModel> _filterExams(List<ExamModel> exams) {
    return exams.where((exam) {
      // Status filter
      if (selectedStatus != 'All') {
        final statusMatch = selectedStatus.toLowerCase() == exam.status.toString().split('.').last;
        if (!statusMatch) return false;
      }
      
      // Class filter
      if (selectedClass != 'All' && exam.className != selectedClass) {
        return false;
      }
      
      return true;
    }).toList();
  }

  Color _getExamStatusColor(ExamModel exam) {
    if (exam.isOngoing) return Colors.orange;
    
    switch (exam.status) {
      case ExamStatus.draft:
        return Colors.grey;
      case ExamStatus.scheduled:
        return Colors.blue;
      case ExamStatus.ongoing:
        return Colors.orange;
      case ExamStatus.completed:
        return Colors.green;
      case ExamStatus.cancelled:
        return Colors.red;
      case ExamStatus.results_published:
        return Colors.purple;
    }
  }

  String _getStatusDisplayName(ExamStatus status) {
    switch (status) {
      case ExamStatus.draft:
        return 'Draft';
      case ExamStatus.scheduled:
        return 'Scheduled';
      case ExamStatus.ongoing:
        return 'Ongoing';
      case ExamStatus.completed:
        return 'Completed';
      case ExamStatus.cancelled:
        return 'Cancelled';
      case ExamStatus.results_published:
        return 'Results Published';
    }
  }

  String _getExamTimeInfo(ExamModel exam) {
    if (exam.isUpcoming) {
      final days = exam.timeUntilStart.inDays;
      final hours = exam.timeUntilStart.inHours % 24;
      if (days > 0) return 'In $days days';
      if (hours > 0) return 'In $hours hours';
      return 'Starting soon';
    } else if (exam.isOngoing) {
      final remaining = exam.timeUntilEnd.inMinutes;
      return '$remaining min left';
    } else if (exam.isCompleted) {
      final days = DateTime.now().difference(exam.endDate).inDays;
      return 'Completed $days days ago';
    }
    return '';
  }

  Color _getGradeColor(String grade) {
    switch (grade.toUpperCase()) {
      case 'A+':
      case 'A':
        return Colors.green;
      case 'B+':
      case 'B':
        return Colors.lightGreen;
      case 'C+':
      case 'C':
        return Colors.orange;
      case 'D':
        return Colors.red;
      case 'F':
        return Colors.red.shade800;
      default:
        return Colors.grey;
    }
  }

  void _handleExamAction(String action, ExamModel exam) {
    switch (action) {
      case 'view':
        _showExamDetails(exam);
        break;
      case 'publish':
        _publishExam(exam);
        break;
      case 'publish_results':
        _publishResults(exam);
        break;
      case 'edit':
        _editExam(exam);
        break;
      case 'delete':
        _deleteExam(exam);
        break;
    }
  }

  void _showExamDetails(ExamModel exam) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(exam.examType.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(child: Text(exam.name)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Subject', exam.subjectName),
              _buildDetailRow('Class', exam.className),
              _buildDetailRow('Type', exam.examType.displayName),
              _buildDetailRow('Start Date', DateFormat('MMM dd, yyyy HH:mm').format(exam.startDate)),
              _buildDetailRow('Duration', '${exam.duration} minutes'),
              _buildDetailRow('Total Marks', '${exam.totalMarks}'),
              _buildDetailRow('Passing Marks', '${exam.passingMarks}'),
              _buildDetailRow('Status', _getStatusDisplayName(exam.status)),
              if (exam.instructions != null) _buildDetailRow('Instructions', exam.instructions!),
              if (exam.syllabusTopics != null && exam.syllabusTopics!.isNotEmpty)
                _buildDetailRow('Syllabus', exam.syllabusTopics!.join(', ')),
              _buildDetailRow('Created By', exam.createdBy),
              _buildDetailRow('Created At', DateFormat('MMM dd, yyyy').format(exam.createdAt)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
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

  void _showResultDetails(ExamResultModel result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${result.studentName} - Result'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Marks Obtained', '${result.marksObtained}/${result.totalMarks}'),
              _buildDetailRow('Percentage', '${result.percentage.toStringAsFixed(1)}%'),
              _buildDetailRow('Grade', result.grade),
              _buildDetailRow('Status', result.isPassed ? 'PASS' : 'FAIL'),
              if (result.rank != null) _buildDetailRow('Rank', '${result.rank}'),
              if (result.remarks != null) _buildDetailRow('Remarks', result.remarks!),
              _buildDetailRow('Graded By', result.gradedBy),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showCreateExamDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create exam feature coming soon!')),
    );
  }

  void _publishExam(ExamModel exam) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${exam.name} published successfully!')),
    );
  }

  void _publishResults(ExamModel exam) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Results for ${exam.name} published!')),
    );
  }

  void _editExam(ExamModel exam) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit exam feature coming soon!')),
    );
  }

  void _deleteExam(ExamModel exam) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Exam'),
        content: Text('Are you sure you want to delete "${exam.name}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${exam.name} deleted successfully!')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showExamAnalytics() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Exam analytics feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'bulk_create':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bulk create exams feature coming soon!')),
        );
        break;
      case 'schedule_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Exam schedule report feature coming soon!')),
        );
        break;
      case 'result_analysis':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Result analysis feature coming soon!')),
        );
        break;
    }
  }
}