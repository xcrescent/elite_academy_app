import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/timetable_model.dart';

// Sample timetable data provider
final timetableProvider = FutureProvider<List<TimetableModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    TimetableModel(
      id: '1',
      classId: 'class10a',
      className: 'Class 10-A',
      academicYear: '2023-24',
      semester: 'First Semester',
      timeSlots: _generateSampleTimeSlots(),
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      createdBy: 'Admin',
      isActive: true,
    ),
    TimetableModel(
      id: '2',
      classId: 'class10b',
      className: 'Class 10-B',
      academicYear: '2023-24',
      semester: 'First Semester',
      timeSlots: _generateSampleTimeSlotsB(),
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
      createdBy: 'Admin',
      isActive: true,
    ),
  ];
});

final teacherScheduleProvider = FutureProvider<List<TeacherScheduleModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  
  return [
    TeacherScheduleModel(
      id: '1',
      teacherId: 'teacher1',
      teacherName: 'Dr. Sarah Johnson',
      department: 'Mathematics',
      scheduleSlots: _generateTeacherSchedule(),
      maxPeriodsPerDay: 6,
      availableDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      preferredTimeSlot: '09:00-10:00',
    ),
    TeacherScheduleModel(
      id: '2',
      teacherId: 'teacher2',
      teacherName: 'Prof. Michael Brown',
      department: 'Physics',
      scheduleSlots: _generateTeacherSchedulePhysics(),
      maxPeriodsPerDay: 5,
      availableDays: ['Monday', 'Wednesday', 'Friday', 'Saturday'],
      preferredTimeSlot: '10:00-11:00',
    ),
  ];
});

@RoutePage()
class TimetablePage extends ConsumerStatefulWidget {
  const TimetablePage({super.key});

  @override
  ConsumerState<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends ConsumerState<TimetablePage> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedClass = 'All';
  String selectedSemester = 'All';

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
    final timetableAsync = ref.watch(timetableProvider);
    final teacherScheduleAsync = ref.watch(teacherScheduleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.schedule),
              text: 'Class Timetables',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Teacher Schedules',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_view_week),
            onPressed: _showWeeklyView,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'generate_timetable',
                child: Row(
                  children: [
                    Icon(Icons.auto_awesome, size: 20),
                    SizedBox(width: 8),
                    Text('Auto Generate'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'import_timetable',
                child: Row(
                  children: [
                    Icon(Icons.upload_file, size: 20),
                    SizedBox(width: 8),
                    Text('Import Timetable'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'export_pdf',
                child: Row(
                  children: [
                    Icon(Icons.picture_as_pdf, size: 20),
                    SizedBox(width: 8),
                    Text('Export PDF'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'conflict_check',
                child: Row(
                  children: [
                    Icon(Icons.warning, size: 20),
                    SizedBox(width: 8),
                    Text('Check Conflicts'),
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
          _buildTimetablesTab(timetableAsync),
          _buildTeacherSchedulesTab(teacherScheduleAsync),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton.extended(
              onPressed: _showCreateTimetableDialog,
              icon: const Icon(Icons.add),
              label: const Text('Create Timetable'),
            )
          : FloatingActionButton.extended(
              onPressed: _showAddTeacherScheduleDialog,
              icon: const Icon(Icons.person_add),
              label: const Text('Add Teacher'),
            ),
    );
  }

  Widget _buildTimetablesTab(AsyncValue<List<TimetableModel>> timetableAsync) {
    return Column(
      children: [
        _buildTimetableFilters(),
        Expanded(
          child: timetableAsync.when(
            data: (timetables) => _buildTimetablesList(timetables),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading timetables...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading timetables: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(timetableProvider),
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

  Widget _buildTeacherSchedulesTab(AsyncValue<List<TeacherScheduleModel>> schedulesAsync) {
    return schedulesAsync.when(
      data: (schedules) => _buildTeacherSchedulesList(schedules),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading teacher schedules...'),
          ],
        ),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error loading schedules: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(teacherScheduleProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimetableFilters() {
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
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedSemester,
                    decoration: const InputDecoration(
                      labelText: 'Semester',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'First Semester', 'Second Semester']
                        .map((semester) => DropdownMenuItem(
                              value: semester,
                              child: Text(semester),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSemester = value!;
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

  Widget _buildTimetablesList(List<TimetableModel> timetables) {
    final filteredTimetables = _filterTimetables(timetables);

    if (filteredTimetables.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.schedule, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No timetables found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Create your first timetable using the + button',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTimetables.length,
      itemBuilder: (context, index) {
        final timetable = filteredTimetables[index];
        return _buildTimetableCard(timetable);
      },
    );
  }

  Widget _buildTimetableCard(TimetableModel timetable) {
    final totalPeriods = timetable.timeSlots.length;
    final activeDays = timetable.timeSlots.map((slot) => slot.dayOfWeek).toSet().length;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showTimetableView(timetable),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.schedule,
                        size: 24,
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
                          timetable.className,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${timetable.academicYear} • ${timetable.semester}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleTimetableAction(value, timetable),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'view',
                        child: Row(
                          children: [
                            Icon(Icons.visibility, size: 20),
                            SizedBox(width: 8),
                            Text('View Full'),
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
                        value: 'duplicate',
                        child: Row(
                          children: [
                            Icon(Icons.copy, size: 20),
                            SizedBox(width: 8),
                            Text('Duplicate'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'export',
                        child: Row(
                          children: [
                            Icon(Icons.download, size: 20),
                            SizedBox(width: 8),
                            Text('Export PDF'),
                          ],
                        ),
                      ),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTimetableStatChip(
                      Icons.schedule,
                      '$totalPeriods Periods',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTimetableStatChip(
                      Icons.calendar_today,
                      '$activeDays Days',
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTimetableStatChip(
                      Icons.check_circle,
                      timetable.isActive ? 'Active' : 'Inactive',
                      timetable.isActive ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Created: ${DateFormat('MMM dd, yyyy').format(timetable.createdAt)} by ${timetable.createdBy}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimetableStatChip(IconData icon, String text, Color color) {
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

  Widget _buildTeacherSchedulesList(List<TeacherScheduleModel> schedules) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final schedule = schedules[index];
        return _buildTeacherScheduleCard(schedule);
      },
    );
  }

  Widget _buildTeacherScheduleCard(TeacherScheduleModel schedule) {
    final totalPeriods = schedule.scheduleSlots.length;
    final averagePeriodsPerDay = totalPeriods / schedule.availableDays.length;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showTeacherScheduleView(schedule),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.purple.withValues(alpha: 0.2),
                    child: Text(
                      schedule.teacherName[0],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          schedule.teacherName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          schedule.department,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleTeacherScheduleAction(value, schedule),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'view',
                        child: Row(
                          children: [
                            Icon(Icons.visibility, size: 20),
                            SizedBox(width: 8),
                            Text('View Schedule'),
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
                        value: 'workload',
                        child: Row(
                          children: [
                            Icon(Icons.analytics, size: 20),
                            SizedBox(width: 8),
                            Text('Workload Analysis'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTimetableStatChip(
                      Icons.schedule,
                      '$totalPeriods Total',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTimetableStatChip(
                      Icons.trending_up,
                      '${averagePeriodsPerDay.toStringAsFixed(1)} Avg/Day',
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildTimetableStatChip(
                      Icons.calendar_today,
                      '${schedule.availableDays.length} Days',
                      Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (schedule.preferredTimeSlot != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Preferred: ${schedule.preferredTimeSlot}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<TimetableModel> _filterTimetables(List<TimetableModel> timetables) {
    return timetables.where((timetable) {
      // Class filter
      if (selectedClass != 'All' && timetable.className != selectedClass) {
        return false;
      }
      
      // Semester filter
      if (selectedSemester != 'All' && timetable.semester != selectedSemester) {
        return false;
      }
      
      return true;
    }).toList();
  }

  void _showTimetableView(TimetableModel timetable) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    timetable.className,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _buildTimetableGrid(timetable),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimetableGrid(TimetableModel timetable) {
    // Group slots by day and period
    final slotsByDay = <WeekDay, Map<int, TimetableSlotModel>>{};
    
    for (final slot in timetable.timeSlots) {
      slotsByDay.putIfAbsent(slot.dayOfWeek, () => {});
      slotsByDay[slot.dayOfWeek]![slot.periodNumber] = slot;
    }

    final days = [
      WeekDay.monday,
      WeekDay.tuesday,
      WeekDay.wednesday,
      WeekDay.thursday,
      WeekDay.friday,
      WeekDay.saturday,
    ];

    final maxPeriods = timetable.timeSlots
        .map((slot) => slot.periodNumber)
        .fold(0, (max, period) => period > max ? period : max);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          defaultColumnWidth: const FixedColumnWidth(120),
          children: [
            // Header row
            TableRow(
              decoration: BoxDecoration(color: Colors.grey.shade100),
              children: [
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Time/Day', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                ...days.map((day) => TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      day.shortName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
              ],
            ),
            // Period rows
            for (int period = 1; period <= maxPeriods; period++)
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey.shade50,
                      child: Text(
                        'Period $period',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  ...days.map((day) {
                    final slot = slotsByDay[day]?[period];
                    return TableCell(
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.all(4),
                        child: slot != null
                            ? _buildSlotCell(slot)
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Free',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    );
                  }),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotCell(TimetableSlotModel slot) {
    return Container(
      decoration: BoxDecoration(
        color: slot.slotType.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: slot.slotType.color.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            slot.subjectName,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: slot.slotType.color,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            slot.teacherName,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (slot.roomNumber != null)
            Text(
              'Room ${slot.roomNumber}',
              style: const TextStyle(
                fontSize: 8,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }

  void _showTeacherScheduleView(TeacherScheduleModel schedule) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Teacher schedule view for ${schedule.teacherName} coming soon!')),
    );
  }

  void _handleTimetableAction(String action, TimetableModel timetable) {
    switch (action) {
      case 'view':
        _showTimetableView(timetable);
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit timetable feature coming soon!')),
        );
        break;
      case 'duplicate':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Duplicated ${timetable.className} timetable!')),
        );
        break;
      case 'export':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Exporting ${timetable.className} timetable to PDF...')),
        );
        break;
      case 'delete':
        _deleteTimetable(timetable);
        break;
    }
  }

  void _handleTeacherScheduleAction(String action, TeacherScheduleModel schedule) {
    switch (action) {
      case 'view':
        _showTeacherScheduleView(schedule);
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit teacher schedule feature coming soon!')),
        );
        break;
      case 'workload':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Workload analysis for ${schedule.teacherName} coming soon!')),
        );
        break;
    }
  }

  void _deleteTimetable(TimetableModel timetable) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Timetable'),
        content: Text('Are you sure you want to delete the timetable for "${timetable.className}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${timetable.className} timetable deleted!')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showCreateTimetableDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create timetable feature coming soon!')),
    );
  }

  void _showAddTeacherScheduleDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add teacher schedule feature coming soon!')),
    );
  }

  void _showWeeklyView() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Weekly view feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'generate_timetable':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Auto-generating timetable...')),
        );
        break;
      case 'import_timetable':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Import timetable feature coming soon!')),
        );
        break;
      case 'export_pdf':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Exporting all timetables to PDF...')),
        );
        break;
      case 'conflict_check':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Checking for timetable conflicts...')),
        );
        break;
    }
  }
}

// Sample data generation functions
List<TimetableSlotModel> _generateSampleTimeSlots() {
  return [
    TimetableSlotModel(
      id: '1',
      dayOfWeek: WeekDay.monday,
      periodNumber: 1,
      startTime: '09:00',
      endTime: '10:00',
      subjectId: 'math1',
      subjectName: 'Mathematics',
      subjectCode: 'MATH101',
      teacherId: 'teacher1',
      teacherName: 'Dr. Sarah Johnson',
      roomNumber: 'A101',
      slotType: SlotType.regular,
    ),
    TimetableSlotModel(
      id: '2',
      dayOfWeek: WeekDay.monday,
      periodNumber: 2,
      startTime: '10:00',
      endTime: '11:00',
      subjectId: 'phys1',
      subjectName: 'Physics',
      subjectCode: 'PHYS101',
      teacherId: 'teacher2',
      teacherName: 'Prof. Michael Brown',
      roomNumber: 'B201',
      slotType: SlotType.regular,
    ),
    TimetableSlotModel(
      id: '3',
      dayOfWeek: WeekDay.monday,
      periodNumber: 3,
      startTime: '11:15',
      endTime: '12:15',
      subjectId: 'chem1',
      subjectName: 'Chemistry',
      subjectCode: 'CHEM101',
      teacherId: 'teacher3',
      teacherName: 'Dr. Emily Davis',
      roomNumber: 'C301',
      slotType: SlotType.laboratory,
    ),
    TimetableSlotModel(
      id: '4',
      dayOfWeek: WeekDay.tuesday,
      periodNumber: 1,
      startTime: '09:00',
      endTime: '10:00',
      subjectId: 'eng1',
      subjectName: 'English',
      subjectCode: 'ENG101',
      teacherId: 'teacher4',
      teacherName: 'Ms. Lisa Wilson',
      roomNumber: 'A102',
      slotType: SlotType.regular,
    ),
    TimetableSlotModel(
      id: '5',
      dayOfWeek: WeekDay.friday,
      periodNumber: 6,
      startTime: '14:30',
      endTime: '15:30',
      subjectId: 'sports1',
      subjectName: 'Physical Education',
      teacherId: 'teacher5',
      teacherName: 'Coach Roberts',
      slotType: SlotType.sports,
    ),
  ];
}

List<TimetableSlotModel> _generateSampleTimeSlotsB() {
  return [
    TimetableSlotModel(
      id: '6',
      dayOfWeek: WeekDay.monday,
      periodNumber: 1,
      startTime: '09:00',
      endTime: '10:00',
      subjectId: 'math1',
      subjectName: 'Mathematics',
      subjectCode: 'MATH101',
      teacherId: 'teacher1',
      teacherName: 'Dr. Sarah Johnson',
      roomNumber: 'A103',
      slotType: SlotType.regular,
    ),
  ];
}

List<ScheduleSlotModel> _generateTeacherSchedule() {
  return [
    ScheduleSlotModel(
      id: '1',
      dayOfWeek: WeekDay.monday,
      periodNumber: 1,
      startTime: '09:00',
      endTime: '10:00',
      classId: 'class10a',
      className: 'Class 10-A',
      subjectId: 'math1',
      subjectName: 'Mathematics',
      roomNumber: 'A101',
    ),
    ScheduleSlotModel(
      id: '2',
      dayOfWeek: WeekDay.monday,
      periodNumber: 3,
      startTime: '11:15',
      endTime: '12:15',
      classId: 'class10b',
      className: 'Class 10-B',
      subjectId: 'math1',
      subjectName: 'Mathematics',
      roomNumber: 'A103',
    ),
  ];
}

List<ScheduleSlotModel> _generateTeacherSchedulePhysics() {
  return [
    ScheduleSlotModel(
      id: '3',
      dayOfWeek: WeekDay.monday,
      periodNumber: 2,
      startTime: '10:00',
      endTime: '11:00',
      classId: 'class10a',
      className: 'Class 10-A',
      subjectId: 'phys1',
      subjectName: 'Physics',
      roomNumber: 'B201',
    ),
  ];
}