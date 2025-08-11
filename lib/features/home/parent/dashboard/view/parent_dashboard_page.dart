import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/parent_model.dart';

// Sample parent data providers
final currentParentProvider = StateProvider<ParentModel>((ref) {
  return ParentModel(
    id: 'parent1',
    name: 'Mr. John Smith',
    email: 'john.smith@gmail.com',
    phoneNumber: '9876543210',
    parentType: ParentType.father,
    childrenIds: ['student1', 'student2'],
    occupation: 'Software Engineer',
    workplace: 'Tech Corp',
    createdAt: DateTime.now().subtract(const Duration(days: 365)),
    lastLogin: DateTime.now().subtract(const Duration(hours: 2)),
  );
});

final childrenDataProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return [
    {
      'id': 'student1',
      'name': 'Alex Smith',
      'class': 'Class 10-A',
      'rollNumber': '101',
      'profileImage': null,
      'lastAttendance': DateTime.now().subtract(const Duration(hours: 6)),
      'attendancePercentage': 92.5,
      'avgGrade': 85.2,
      'pendingAssignments': 3,
      'nextExam': 'Mathematics Quiz - Nov 15',
      'recentGrades': [
        {'subject': 'Math', 'grade': 'A', 'marks': '85/100'},
        {'subject': 'Physics', 'grade': 'A+', 'marks': '92/100'},
        {'subject': 'Chemistry', 'grade': 'B+', 'marks': '78/100'},
      ],
    },
    {
      'id': 'student2',
      'name': 'Emma Smith',
      'class': 'Class 8-B',
      'rollNumber': '205',
      'profileImage': null,
      'lastAttendance': DateTime.now().subtract(const Duration(hours: 6)),
      'attendancePercentage': 88.0,
      'avgGrade': 82.7,
      'pendingAssignments': 1,
      'nextExam': 'Science Test - Nov 18',
      'recentGrades': [
        {'subject': 'English', 'grade': 'A', 'marks': '88/100'},
        {'subject': 'Science', 'grade': 'B+', 'marks': '82/100'},
        {'subject': 'Social', 'grade': 'A', 'marks': '86/100'},
      ],
    },
  ];
});

final parentMessagesProvider = FutureProvider<List<MessageModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  return [
    MessageModel(
      id: '1',
      senderId: 'teacher1',
      senderName: 'Ms. Johnson',
      senderRole: 'teacher',
      receiverId: 'parent1',
      receiverName: 'Mr. John Smith',
      receiverRole: 'parent',
      subject: 'Alex\'s Academic Progress',
      content: 'Alex has shown excellent improvement in Mathematics this month. Keep encouraging the practice!',
      messageType: MessageType.academic,
      priority: MessagePriority.normal,
      sentAt: DateTime.now().subtract(const Duration(hours: 3)),
      relatedStudentId: 'student1',
    ),
    MessageModel(
      id: '2',
      senderId: 'admin1',
      senderName: 'School Admin',
      senderRole: 'admin',
      receiverId: 'parent1',
      receiverName: 'Mr. John Smith',
      receiverRole: 'parent',
      subject: 'Parent-Teacher Meeting',
      content: 'Reminder: Parent-Teacher meeting scheduled for November 20th at 2:00 PM. Please confirm your attendance.',
      messageType: MessageType.event,
      priority: MessagePriority.high,
      sentAt: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
      readAt: DateTime.now().subtract(const Duration(hours: 12)),
    ),
    MessageModel(
      id: '3',
      senderId: 'teacher2',
      senderName: 'Mr. Wilson',
      senderRole: 'teacher',
      receiverId: 'parent1',
      receiverName: 'Mr. John Smith',
      receiverRole: 'parent',
      subject: 'Emma\'s Attendance Alert',
      content: 'Emma was absent yesterday due to illness. Please ensure she catches up on the missed Chemistry lesson.',
      messageType: MessageType.attendance,
      priority: MessagePriority.normal,
      sentAt: DateTime.now().subtract(const Duration(days: 2)),
      relatedStudentId: 'student2',
    ),
  ];
});

@RoutePage(deferredLoading: true)
class ParentDashboardPage extends ConsumerWidget {
  const ParentDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parent = ref.watch(currentParentProvider);
    final childrenAsync = ref.watch(childrenDataProvider);
    final messagesAsync = ref.watch(parentMessagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () => _showMessages(context, ref),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => _showNotifications(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // ignore: unused_result
          ref.refresh(childrenDataProvider);
          // ignore: unused_result
          ref.refresh(parentMessagesProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeCard(parent),
              const SizedBox(height: 20),
              _buildQuickActions(context, ref),
              const SizedBox(height: 20),
              _buildChildrenOverview(childrenAsync),
              const SizedBox(height: 20),
              _buildRecentMessages(messagesAsync, context),
              const SizedBox(height: 20),
              _buildUpcomingEvents(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(ParentModel parent) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.purpleAccent],
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
                    parent.name[0],
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
                        parent.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${parent.childrenIds.length} ${parent.childrenIds.length == 1 ? 'Child' : 'Children'}',
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
                const Icon(Icons.access_time, color: Colors.white70, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Last login: ${parent.lastLogin != null ? DateFormat('MMM dd, HH:mm').format(parent.lastLogin!) : 'Never'}',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, WidgetRef ref) {
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
              onTap: () => _showComingSoon(context, 'View Grades'),
            ),
            _buildActionCard(
              title: 'Attendance',
              icon: Icons.calendar_today,
              color: Colors.blue,
              onTap: () => _showComingSoon(context, 'Attendance'),
            ),
            _buildActionCard(
              title: 'Fee Status',
              icon: Icons.payment,
              color: Colors.orange,
              onTap: () => _showComingSoon(context, 'Fee Status'),
            ),
            _buildActionCard(
              title: 'Messages',
              icon: Icons.message,
              color: Colors.purple,
              onTap: () => _showMessages(context, ref),
            ),
            _buildActionCard(
              title: 'Assignments',
              icon: Icons.assignment,
              color: Colors.red,
              onTap: () => _showComingSoon(context, 'Assignments'),
            ),
            _buildActionCard(
              title: 'Schedule',
              icon: Icons.schedule,
              color: Colors.teal,
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

  Widget _buildChildrenOverview(AsyncValue<List<Map<String, dynamic>>> childrenAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Children Overview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        childrenAsync.when(
          data: (children) => Column(
            children: children.map((child) => _buildChildCard(child)).toList(),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const Center(
            child: Text('Error loading children data'),
          ),
        ),
      ],
    );
  }

  Widget _buildChildCard(Map<String, dynamic> child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.withValues(alpha: 0.2),
                  child: Text(
                    child['name'][0],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        child['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${child['class']} • Roll No: ${child['rollNumber']}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) => _handleChildAction(value, child),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'grades', child: Text('View Grades')),
                    const PopupMenuItem(value: 'attendance', child: Text('Attendance')),
                    const PopupMenuItem(value: 'assignments', child: Text('Assignments')),
                    const PopupMenuItem(value: 'fees', child: Text('Fee Details')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildChildStatCard(
                    'Attendance',
                    '${child['attendancePercentage']}%',
                    Icons.calendar_today,
                    _getAttendanceColor(child['attendancePercentage']),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildChildStatCard(
                    'Avg Grade',
                    '${child['avgGrade']}%',
                    Icons.grade,
                    _getGradeColor(child['avgGrade']),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildChildStatCard(
                    'Pending',
                    '${child['pendingAssignments']}',
                    Icons.assignment_late,
                    child['pendingAssignments'] > 0 ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.schedule, color: Colors.blue, size: 16),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      'Next: ${child['nextExam']}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentMessages(AsyncValue<List<MessageModel>> messagesAsync, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Messages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => _showAllMessages(context),
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        messagesAsync.when(
          data: (messages) => Card(
            child: Column(
              children: messages
                  .take(3)
                  .map((message) => _buildMessageItem(message))
                  .expand((widget) => [widget, const Divider(height: 1)])
                  .take(messages.length < 3 ? messages.length * 2 - 1 : 5)
                  .toList(),
            ),
          ),
          loading: () => const Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
          error: (_, __) => const Card(
            child: ListTile(
              leading: Icon(Icons.error, color: Colors.red),
              title: Text('Error loading messages'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageItem(MessageModel message) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _getMessageTypeColor(message.messageType).withValues(alpha: 0.2),
        child: Text(
          message.messageType.icon,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      title: Text(
        message.subject,
        style: TextStyle(
          fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From: ${message.senderName}',
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            message.content.length > 50 
                ? '${message.content.substring(0, 50)}...'
                : message.content,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('MMM dd').format(message.sentAt),
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          if (!message.isRead)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      onTap: () => _showMessageDetails(message),
    );
  }

  Widget _buildUpcomingEvents() {
    final events = [
      {
        'title': 'Parent-Teacher Meeting',
        'date': DateTime.now().add(const Duration(days: 3)),
        'type': 'meeting',
      },
      {
        'title': 'Sports Day',
        'date': DateTime.now().add(const Duration(days: 10)),
        'type': 'event',
      },
      {
        'title': 'Mid-term Exams Begin',
        'date': DateTime.now().add(const Duration(days: 15)),
        'type': 'exam',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming School Events',
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
      case 'meeting':
        eventIcon = Icons.people;
        eventColor = Colors.green;
        break;
      case 'exam':
        eventIcon = Icons.quiz;
        eventColor = Colors.red;
        break;
      case 'event':
        eventIcon = Icons.event;
        eventColor = Colors.blue;
        break;
      default:
        eventIcon = Icons.calendar_today;
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
          color: daysUntil <= 3 ? Colors.red : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getAttendanceColor(double percentage) {
    if (percentage >= 90) return Colors.green;
    if (percentage >= 75) return Colors.orange;
    return Colors.red;
  }

  Color _getGradeColor(double grade) {
    if (grade >= 90) return Colors.green;
    if (grade >= 80) return Colors.lightGreen;
    if (grade >= 70) return Colors.orange;
    return Colors.red;
  }

  Color _getMessageTypeColor(MessageType type) {
    switch (type) {
      case MessageType.academic:
        return Colors.blue;
      case MessageType.attendance:
        return Colors.orange;
      case MessageType.disciplinary:
        return Colors.red;
      case MessageType.fee:
        return Colors.green;
      case MessageType.health:
        return Colors.pink;
      case MessageType.event:
        return Colors.purple;
      case MessageType.general:
        return Colors.grey;
    }
  }

  void _handleChildAction(String action, Map<String, dynamic> child) {
    // Handle child-specific actions
    print('Action: $action for child: ${child['name']}');
  }

  void _showMessages(BuildContext context, WidgetRef ref) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Full messaging system coming soon!')),
    );
  }

  void _showAllMessages(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All messages view coming soon!')),
    );
  }

  void _showMessageDetails(MessageModel message) {
    // Show message details dialog
  }

  void _showNotifications(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notifications coming soon!')),
    );
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