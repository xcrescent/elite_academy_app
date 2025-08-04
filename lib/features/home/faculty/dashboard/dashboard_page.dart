import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FacultyDashboardPage extends ConsumerWidget {
  const FacultyDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Refresh data
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Show notifications
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Implement refresh logic
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeCard(),
              const SizedBox(height: 16),
              _buildQuickStats(),
              const SizedBox(height: 20),
              _buildQuickActions(context),
              const SizedBox(height: 20),
              _buildTodaySchedule(),
              const SizedBox(height: 20),
              _buildRecentActivities(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.blueAccent],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Dr. Faculty Name', // TODO: Get from user profile
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ready to inspire minds today?',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.schedule, color: Colors.white70, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Today: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Classes Today',
            value: '5', // TODO: Get from actual data
            icon: Icons.class_,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Students',
            value: '156', // TODO: Get from actual data
            icon: Icons.people,
            color: Colors.orange,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Pending',
            value: '8', // TODO: Get from actual data
            icon: Icons.assignment_late,
            color: Colors.red,
          ),
        ),
      ],
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
                    fontSize: 24,
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
              title: 'Take Attendance',
              icon: Icons.how_to_reg,
              color: Colors.green,
              onTap: () => _showComingSoon(context, 'Attendance'),
            ),
            _buildActionCard(
              title: 'Add Grades',
              icon: Icons.grade,
              color: Colors.blue,
              onTap: () => _showComingSoon(context, 'Grade Management'),
            ),
            _buildActionCard(
              title: 'View Schedule',
              icon: Icons.schedule,
              color: Colors.orange,
              onTap: () => _showComingSoon(context, 'Schedule'),
            ),
            _buildActionCard(
              title: 'Assignments',
              icon: Icons.assignment,
              color: Colors.purple,
              onTap: () => _showComingSoon(context, 'Assignments'),
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

  Widget _buildTodaySchedule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Today\'s Schedule',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _buildScheduleItem('9:00 AM', 'Mathematics', 'Class 10-A', 'Room 101'),
              const Divider(height: 1),
              _buildScheduleItem('10:30 AM', 'Physics', 'Class 12-B', 'Lab 203'),
              const Divider(height: 1),
              _buildScheduleItem('1:00 PM', 'Mathematics', 'Class 11-A', 'Room 105'),
              const Divider(height: 1),
              _buildScheduleItem('2:30 PM', 'Free Period', '', ''),
              const Divider(height: 1),
              _buildScheduleItem('3:30 PM', 'Physics Lab', 'Class 12-A', 'Lab 203'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleItem(String time, String subject, String className, String room) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      title: Text(
        subject,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: className.isNotEmpty 
          ? Text('$className • $room')
          : null,
      trailing: subject != 'Free Period'
          ? const Icon(Icons.chevron_right)
          : null,
      onTap: subject != 'Free Period' ? () {
        // TODO: Navigate to class details
      } : null,
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activities',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _buildActivityItem(
                icon: Icons.assignment_turned_in,
                title: 'Grade submitted for Math Quiz',
                subtitle: 'Class 10-A • 2 hours ago',
                color: Colors.green,
              ),
              const Divider(height: 1),
              _buildActivityItem(
                icon: Icons.how_to_reg,
                title: 'Attendance marked',
                subtitle: 'Physics Lab • 4 hours ago',
                color: Colors.blue,
              ),
              const Divider(height: 1),
              _buildActivityItem(
                icon: Icons.assignment,
                title: 'New assignment created',
                subtitle: 'Mathematics • Yesterday',
                color: Colors.orange,
              ),
              const Divider(height: 1),
              _buildActivityItem(
                icon: Icons.message,
                title: 'Message sent to parents',
                subtitle: 'Class 12-B • 2 days ago',
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.1),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right, size: 16),
      onTap: () {
        // TODO: Navigate to activity details
      },
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
