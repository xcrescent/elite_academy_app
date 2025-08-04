import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/controller/assignment_state_pod.dart';
import '../../dashboard/model/assignment_model.dart';

@RoutePage()
class AssignmentsPage extends ConsumerStatefulWidget {
  const AssignmentsPage({super.key});

  @override
  ConsumerState<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends ConsumerState<AssignmentsPage> {
  String selectedFilter = 'All';
  String selectedType = 'All';
  String selectedSubject = 'All';

  @override
  Widget build(BuildContext context) {
    final assignmentsAsync = ref.watch(assignmentListPod);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: _showAnalytics,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'bulk_create',
                child: Row(
                  children: [
                    Icon(Icons.create_new_folder, size: 20),
                    SizedBox(width: 8),
                    Text('Bulk Create'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'templates',
                child: Row(
                  children: [
                    Icon(Icons.content_copy, size: 20),
                    SizedBox(width: 8),
                    Text('Templates'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(),
          _buildQuickStats(assignmentsAsync),
          Expanded(
            child: assignmentsAsync.when(
              data: (assignments) => _buildAssignmentsList(assignments),
              loading: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading assignments...'),
                  ],
                ),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error loading assignments: ${error.toString()}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.refresh(assignmentListPod),
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
        onPressed: _showCreateAssignmentDialog,
        icon: const Icon(Icons.add),
        label: const Text('Create Assignment'),
      ),
    );
  }

  Widget _buildFilters() {
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
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Active', 'Overdue', 'Closed', 'Draft']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
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
                  child: DropdownButtonFormField<String>(
                    value: selectedType,
                    decoration: const InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Homework', 'Project', 'Lab', 'Essay', 'Research', 'Presentation']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
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

  Widget _buildQuickStats(AsyncValue<List<AssignmentModel>> assignmentsAsync) {
    return assignmentsAsync.when(
      data: (assignments) {
        final activeCount = assignments.where((a) => a.status == AssignmentStatus.active).length;
        final overdueCount = assignments.where((a) => a.isOverdue).length;
        final dueThisWeek = assignments.where((a) {
          final now = DateTime.now();
          final weekFromNow = now.add(const Duration(days: 7));
          return a.dueDate.isAfter(now) && a.dueDate.isBefore(weekFromNow);
        }).length;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Active',
                  value: activeCount.toString(),
                  icon: Icons.assignment,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Overdue',
                  value: overdueCount.toString(),
                  icon: Icons.warning,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Due Soon',
                  value: dueThisWeek.toString(),
                  icon: Icons.schedule,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(child: Card(child: SizedBox(height: 80))),
            const SizedBox(width: 12),
            Expanded(child: Card(child: SizedBox(height: 80))),
            const SizedBox(width: 12),
            Expanded(child: Card(child: SizedBox(height: 80))),
          ],
        ),
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

  Widget _buildAssignmentsList(List<AssignmentModel> assignments) {
    final filteredAssignments = _filterAssignments(assignments);

    if (filteredAssignments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.assignment, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No assignments found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create your first assignment using the + button',
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
                '${filteredAssignments.length} assignments found',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                '${_getSubmissionRate(filteredAssignments).toStringAsFixed(0)}% submission rate',
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
            itemCount: filteredAssignments.length,
            itemBuilder: (context, index) {
              final assignment = filteredAssignments[index];
              return _buildAssignmentCard(assignment);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAssignmentCard(AssignmentModel assignment) {
    final statusColor = _getStatusColor(assignment);
    final typeColor = _getTypeColor(assignment.type);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: typeColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              assignment.type.icon,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        title: Text(
          assignment.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${assignment.subjectName} • ${assignment.className}'),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    assignment.isOverdue ? 'Overdue' : assignment.status.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  assignment.timeLeftFormatted,
                  style: TextStyle(
                    fontSize: 12,
                    color: assignment.isOverdue ? Colors.red : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${assignment.totalMarks} pts',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat('MMM dd').format(assignment.dueDate),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        onTap: () => _showAssignmentDetails(assignment),
        onLongPress: () => _showAssignmentOptions(assignment),
      ),
    );
  }

  List<AssignmentModel> _filterAssignments(List<AssignmentModel> assignments) {
    return assignments.where((assignment) {
      // Status filter
      if (selectedFilter != 'All') {
        if (selectedFilter == 'Overdue' && !assignment.isOverdue) return false;
        if (selectedFilter == 'Active' && assignment.status != AssignmentStatus.active) return false;
        if (selectedFilter == 'Closed' && assignment.status != AssignmentStatus.closed) return false;
        if (selectedFilter == 'Draft' && assignment.status != AssignmentStatus.draft) return false;
      }
      
      // Type filter
      if (selectedType != 'All' && assignment.type.displayName != selectedType) {
        return false;
      }
      
      return true;
    }).toList();
  }

  double _getSubmissionRate(List<AssignmentModel> assignments) {
    // Mock calculation - in real app, get from actual submission data
    return 75.0;
  }

  Color _getStatusColor(AssignmentModel assignment) {
    if (assignment.isOverdue) return Colors.red;
    
    switch (assignment.status) {
      case AssignmentStatus.active:
        return Colors.green;
      case AssignmentStatus.draft:
        return Colors.grey;
      case AssignmentStatus.closed:
        return Colors.blue;
      case AssignmentStatus.graded:
        return Colors.purple;
    }
  }

  Color _getTypeColor(AssignmentType type) {
    switch (type) {
      case AssignmentType.homework:
        return Colors.blue;
      case AssignmentType.project:
        return Colors.green;
      case AssignmentType.lab:
        return Colors.orange;
      case AssignmentType.essay:
        return Colors.purple;
      case AssignmentType.research:
        return Colors.teal;
      case AssignmentType.presentation:
        return Colors.indigo;
    }
  }

  void _showAssignmentDetails(AssignmentModel assignment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(assignment.type.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(child: Text(assignment.title)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Subject', assignment.subjectName),
              _buildDetailRow('Class', assignment.className),
              _buildDetailRow('Type', assignment.type.displayName),
              _buildDetailRow('Total Marks', '${assignment.totalMarks}'),
              _buildDetailRow('Due Date', DateFormat('MMM dd, yyyy HH:mm').format(assignment.dueDate)),
              _buildDetailRow('Status', assignment.status.name.toUpperCase()),
              _buildDetailRow('Created By', assignment.createdBy),
              const Divider(),
              const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(assignment.description),
              if (assignment.instructions?.isNotEmpty == true) ...[
                const SizedBox(height: 8),
                const Text('Instructions:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(assignment.instructions!),
              ],
              if (assignment.allowLateSubmission) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      'Late submission allowed${assignment.latePenaltyPercent != null ? ' (${assignment.latePenaltyPercent}% penalty)' : ''}',
                      style: const TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                  ],
                ),
              ],
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
              _showSubmissions(assignment);
            },
            child: const Text('View Submissions'),
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
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void _showAssignmentOptions(AssignmentModel assignment) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('View Details'),
              onTap: () {
                Navigator.pop(context);
                _showAssignmentDetails(assignment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('View Submissions'),
              onTap: () {
                Navigator.pop(context);
                _showSubmissions(assignment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Assignment'),
              onTap: () {
                Navigator.pop(context);
                _showEditAssignment(assignment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Duplicate'),
              onTap: () {
                Navigator.pop(context);
                _duplicateAssignment(assignment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(assignment);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSubmissions(AssignmentModel assignment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('View submissions feature coming soon!')),
    );
  }

  void _showEditAssignment(AssignmentModel assignment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit assignment feature coming soon!')),
    );
  }

  void _duplicateAssignment(AssignmentModel assignment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Duplicate assignment feature coming soon!')),
    );
  }

  void _showDeleteConfirmation(AssignmentModel assignment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Assignment'),
        content: Text(
          'Are you sure you want to delete "${assignment.title}"? This action cannot be undone.',
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

  void _showCreateAssignmentDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create assignment feature coming soon!')),
    );
  }

  void _showAnalytics() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Assignment analytics feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'bulk_create':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bulk create feature coming soon!')),
        );
        break;
      case 'templates':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Assignment templates feature coming soon!')),
        );
        break;
    }
  }
}