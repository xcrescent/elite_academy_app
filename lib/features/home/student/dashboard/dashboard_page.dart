import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


// Sample student data provider
final currentStudentProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {
    'id': 'student1',
    'name': 'John Doe',
    'rollNumber': '101',
    'className': 'Class 10-A',
    'email': 'john.doe@eliteacademy.co.in',
    'profileImage': null,
  };
});

final studentGradesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return [
    {
      'subject': 'Mathematics',
      'grade': 'A',
      'marks': '85/100',
      'percentage': 85.0,
      'lastExam': 'Mid-term',
      'trend': 'up', // up, down, stable
    },
    {
      'subject': 'Physics',
      'grade': 'A+',
      'marks': '92/100',
      'percentage': 92.0,
      'lastExam': 'Assignment',
      'trend': 'up',
    },
    {
      'subject': 'Chemistry',
      'grade': 'B+',
      'marks': '78/100',
      'percentage': 78.0,
      'lastExam': 'Quiz',
      'trend': 'down',
    },
    {
      'subject': 'English',
      'grade': 'A',
      'marks': '88/100',
      'percentage': 88.0,
      'lastExam': 'Essay',
      'trend': 'stable',
    },
  ];
});

@RoutePage(deferredLoading: true)
class StudentDashboardPage extends ConsumerWidget {
  const StudentDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(currentStudentProvider);
    final gradesAsync = ref.watch(studentGradesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${student['name'].split(' ')[0]}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // ignore: unused_result
          ref.refresh(studentGradesProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeCard(student),
              const SizedBox(height: 20),
              _buildQuickStats(gradesAsync),
              const SizedBox(height: 20),
              _buildQuickActions(context),
              const SizedBox(height: 20),
              _buildRecentGrades(gradesAsync),
              const SizedBox(height: 20),
              _buildUpcomingEvents(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(Map<String, dynamic> student) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo, Colors.indigoAccent],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  child: Text(
                    student['name'][0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Roll No: ${student['rollNumber']} • ${student['className']}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.school, color: Colors.white70, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Academic Year: ${DateTime.now().year}-${DateTime.now().year + 1}',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats(AsyncValue<List<Map<String, dynamic>>> gradesAsync) {
    return gradesAsync.when(
      data: (grades) {
        final avgPercentage = grades.fold<double>(
              0,
              (sum, grade) => sum + (grade['percentage'] as double),
            ) /
            grades.length;
        final highestGrade = grades
            .reduce((a, b) =>
                (a['percentage'] as double) > (b['percentage'] as double)
                    ? a
                    : b)['grade'];
        final totalSubjects = grades.length;

        return Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Average',
                value: '${avgPercentage.toStringAsFixed(1)}%',
                icon: Icons.analytics,
                color: avgPercentage >= 85
                    ? Colors.green
                    : avgPercentage >= 75
                        ? Colors.orange
                        : Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                title: 'Best Grade',
                value: highestGrade.toString(),
                icon: Icons.star,
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                title: 'Subjects',
                value: totalSubjects.toString(),
                icon: Icons.book,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
      loading: () => const Row(
        children: [
          Expanded(child: Card(child: SizedBox(height: 80))),
          SizedBox(width: 12),
          Expanded(child: Card(child: SizedBox(height: 80))),
          SizedBox(width: 12),
          Expanded(child: Card(child: SizedBox(height: 80))),
        ],
      ),
      error: (_, __) => Container(),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 24),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
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
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: [
            _buildActionCard(
              title: 'View Grades',
              icon: Icons.grade,
              color: Colors.green,
              onTap: () => _showComingSoon(context, 'Grade View'),
            ),
            _buildActionCard(
              title: 'Assignments',
              icon: Icons.assignment,
              color: Colors.blue,
              onTap: () => _showComingSoon(context, 'Assignments'),
            ),
            _buildActionCard(
              title: 'Attendance',
              icon: Icons.calendar_today,
              color: Colors.orange,
              onTap: () => _showComingSoon(context, 'Attendance'),
            ),
            _buildActionCard(
              title: 'Schedule',
              icon: Icons.schedule,
              color: Colors.purple,
              onTap: () => _showComingSoon(context, 'Class Schedule'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentGrades(AsyncValue<List<Map<String, dynamic>>> gradesAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Grades',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        gradesAsync.when(
          data: (grades) => Card(
            child: Column(
              children: grades
                  .map((grade) => _buildGradeItem(grade))
                  .expand((widget) => [widget, const Divider(height: 1)])
                  .take(grades.length * 2 - 1)
                  .toList(),
            ),
          ),
          loading: () => Card(
            child: Column(
              children: List.generate(
                3,
                (index) => const ListTile(
                  leading: CircleAvatar(child: SizedBox()),
                  title: SizedBox(width: 100, height: 16),
                  subtitle: SizedBox(width: 80, height: 14),
                ),
              ),
            ),
          ),
          error: (_, __) => const Card(
            child: ListTile(
              leading: Icon(Icons.error, color: Colors.red),
              title: Text('Error loading grades'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradeItem(Map<String, dynamic> grade) {
    final percentage = grade['percentage'] as double;
    final gradeColor = _getGradeColor(percentage);
    final trendIcon = _getTrendIcon(grade['trend'] as String);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: gradeColor.withValues(alpha: 0.2),
        child: Text(
          grade['grade'],
          style: TextStyle(
            color: gradeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        grade['subject'],
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${grade['marks']} • ${grade['lastExam']}',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${percentage.toStringAsFixed(0)}%',
            style: TextStyle(
              color: gradeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Icon(trendIcon, size: 16, color: _getTrendColor(grade['trend'])),
        ],
      ),
      onTap: () {
        // TODO: Navigate to subject details
      },
    );
  }

  Widget _buildUpcomingEvents() {
    final events = [
      {
        'title': 'Mathematics Quiz',
        'date': DateTime.now().add(const Duration(days: 2)),
        'type': 'exam',
      },
      {
        'title': 'Physics Lab Report Due',
        'date': DateTime.now().add(const Duration(days: 5)),
        'type': 'assignment',
      },
      {
        'title': 'Parent-Teacher Meeting',
        'date': DateTime.now().add(const Duration(days: 7)),
        'type': 'meeting',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Events',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: events
                .map((event) => _buildEventItem(event))
                .expand((widget) => [widget, const Divider(height: 1)])
                .take(events.length * 2 - 1)
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEventItem(Map<String, dynamic> event) {
    final IconData eventIcon;
    final Color eventColor;

    switch (event['type']) {
      case 'exam':
        eventIcon = Icons.quiz;
        eventColor = Colors.red;
        break;
      case 'assignment':
        eventIcon = Icons.assignment;
        eventColor = Colors.blue;
        break;
      case 'meeting':
        eventIcon = Icons.people;
        eventColor = Colors.green;
        break;
      default:
        eventIcon = Icons.event;
        eventColor = Colors.grey;
    }

    final date = event['date'] as DateTime;
    final daysUntil = date.difference(DateTime.now()).inDays;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: eventColor.withValues(alpha: 0.2),
        child: Icon(eventIcon, color: eventColor, size: 20),
      ),
      title: Text(
        event['title'],
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        DateFormat('MMM dd, yyyy').format(date),
      ),
      trailing: Text(
        daysUntil == 0
            ? 'Today'
            : daysUntil == 1
                ? 'Tomorrow'
                : '$daysUntil days',
        style: TextStyle(
          color: daysUntil <= 2 ? Colors.red : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getGradeColor(double percentage) {
    if (percentage >= 90) return Colors.green;
    if (percentage >= 80) return Colors.lightGreen;
    if (percentage >= 70) return Colors.orange;
    if (percentage >= 60) return Colors.deepOrange;
    return Colors.red;
  }

  IconData _getTrendIcon(String trend) {
    switch (trend) {
      case 'up':
        return Icons.trending_up;
      case 'down':
        return Icons.trending_down;
      case 'stable':
        return Icons.trending_flat;
      default:
        return Icons.trending_flat;
    }
  }

  Color _getTrendColor(String trend) {
    switch (trend) {
      case 'up':
        return Colors.green;
      case 'down':
        return Colors.red;
      case 'stable':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature feature coming soon!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}