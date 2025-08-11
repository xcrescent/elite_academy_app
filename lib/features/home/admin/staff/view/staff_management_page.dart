import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/staff_model.dart';

// Sample data providers
final staffProvider = FutureProvider<List<StaffModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    StaffModel(
      id: '1',
      employeeId: 'EMP001',
      firstName: 'Sarah',
      lastName: 'Johnson',
      email: 'sarah.johnson@school.edu',
      phoneNumber: '9876543210',
      dateOfBirth: DateTime(1985, 6, 15),
      gender: Gender.female,
      address: '123 Teacher Colony, Education City',
      role: StaffRole.teacher,
      department: 'Mathematics',
      designation: 'Senior Mathematics Teacher',
      joiningDate: DateTime(2020, 1, 15),
      employmentType: EmploymentType.fullTime,
      status: StaffStatus.active,
      basicSalary: 45000.0,
      qualifications: ['M.Sc Mathematics', 'B.Ed'],
      subjects: ['Mathematics', 'Statistics'],
      emergencyContact: '9876543211',
      emergencyContactName: 'Dr. Robert Johnson',
      bankAccountNumber: '1234567890',
      bankName: 'State Bank',
      ifscCode: 'SBI0001234',
      createdAt: DateTime.now().subtract(const Duration(days: 1000)),
      createdBy: 'Admin',
    ),
    StaffModel(
      id: '2',
      employeeId: 'EMP002',
      firstName: 'Michael',
      lastName: 'Brown',
      email: 'michael.brown@school.edu',
      phoneNumber: '9876543212',
      dateOfBirth: DateTime(1978, 9, 22),
      gender: Gender.male,
      address: '456 Faculty Lane, Education City',
      role: StaffRole.principal,
      department: 'Administration',
      designation: 'Principal',
      joiningDate: DateTime(2015, 8, 1),
      employmentType: EmploymentType.fullTime,
      status: StaffStatus.active,
      basicSalary: 75000.0,
      qualifications: ['M.Ed', 'Ph.D Education', 'MBA'],
      subjects: [],
      emergencyContact: '9876543213',
      emergencyContactName: 'Mrs. Lisa Brown',
      bankAccountNumber: '2345678901',
      bankName: 'HDFC Bank',
      ifscCode: 'HDFC0001234',
      createdAt: DateTime.now().subtract(const Duration(days: 1500)),
      createdBy: 'System',
    ),
    StaffModel(
      id: '3',
      employeeId: 'EMP003',
      firstName: 'Emily',
      lastName: 'Davis',
      email: 'emily.davis@school.edu',
      phoneNumber: '9876543214',
      dateOfBirth: DateTime(1990, 3, 10),
      gender: Gender.female,
      address: '789 Science Block, Education City',
      role: StaffRole.librarian,
      department: 'Library',
      designation: 'Chief Librarian',
      joiningDate: DateTime(2021, 6, 1),
      employmentType: EmploymentType.fullTime,
      status: StaffStatus.active,
      basicSalary: 35000.0,
      qualifications: ['M.Lib.Sc', 'B.A English'],
      subjects: [],
      emergencyContact: '9876543215',
      emergencyContactName: 'Mr. James Davis',
      bankAccountNumber: '3456789012',
      bankName: 'ICICI Bank',
      ifscCode: 'ICIC0001234',
      createdAt: DateTime.now().subtract(const Duration(days: 800)),
      createdBy: 'Admin',
    ),
    StaffModel(
      id: '4',
      employeeId: 'EMP004',
      firstName: 'David',
      lastName: 'Wilson',
      email: 'david.wilson@school.edu',
      phoneNumber: '9876543216',
      dateOfBirth: DateTime(1988, 12, 5),
      gender: Gender.male,
      address: '321 Admin Block, Education City',
      role: StaffRole.accountant,
      department: 'Accounts',
      designation: 'Senior Accountant',
      joiningDate: DateTime(2019, 4, 10),
      employmentType: EmploymentType.fullTime,
      status: StaffStatus.on_leave,
      basicSalary: 40000.0,
      qualifications: ['M.Com', 'CA'],
      subjects: [],
      emergencyContact: '9876543217',
      emergencyContactName: 'Mrs. Sarah Wilson',
      bankAccountNumber: '4567890123',
      bankName: 'Axis Bank',
      ifscCode: 'UTIB0001234',
      createdAt: DateTime.now().subtract(const Duration(days: 1200)),
      createdBy: 'Admin',
    ),
  ];
});

final payrollProvider = FutureProvider<List<PayrollModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  
  final currentDate = DateTime.now();
  return [
    PayrollModel(
      id: '1',
      staffId: '1',
      staffName: 'Sarah Johnson',
      employeeId: 'EMP001',
      month: currentDate.month,
      year: currentDate.year,
      basicSalary: 45000.0,
      hra: 9000.0,
      da: 2250.0,
      medicalAllowance: 1500.0,
      transportAllowance: 2000.0,
      specialAllowance: 1000.0,
      overtimeAmount: 500.0,
      bonusAmount: 0.0,
      pfDeduction: 5400.0,
      esiDeduction: 945.0,
      taxDeduction: 4500.0,
      loanDeduction: 0.0,
      otherDeductions: 200.0,
      workingDays: 26,
      presentDays: 25,
      absentDays: 1,
      casualLeaves: 1,
      sickLeaves: 0,
      lossOfPay: 1730.77,
      status: PayrollStatus.calculated,
      paymentMode: 'Bank Transfer',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      createdBy: 'HR Admin',
    ),
    PayrollModel(
      id: '2',
      staffId: '2',
      staffName: 'Michael Brown',
      employeeId: 'EMP002',
      month: currentDate.month,
      year: currentDate.year,
      basicSalary: 75000.0,
      hra: 15000.0,
      da: 3750.0,
      medicalAllowance: 2500.0,
      transportAllowance: 3000.0,
      specialAllowance: 5000.0,
      overtimeAmount: 0.0,
      bonusAmount: 2000.0,
      pfDeduction: 9000.0,
      esiDeduction: 0.0,
      taxDeduction: 12000.0,
      loanDeduction: 0.0,
      otherDeductions: 500.0,
      workingDays: 26,
      presentDays: 26,
      absentDays: 0,
      casualLeaves: 0,
      sickLeaves: 0,
      lossOfPay: 0.0,
      status: PayrollStatus.approved,
      paidDate: DateTime.now().subtract(const Duration(days: 2)),
      paymentMode: 'Bank Transfer',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      createdBy: 'HR Admin',
      processedAt: DateTime.now().subtract(const Duration(days: 3)),
      processedBy: 'Principal',
    ),
  ];
});

final leaveRequestsProvider = FutureProvider<List<LeaveRequestModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 600));
  
  return [
    LeaveRequestModel(
      id: '1',
      staffId: '1',
      staffName: 'Sarah Johnson',
      leaveType: LeaveType.sick,
      startDate: DateTime.now().add(const Duration(days: 2)),
      endDate: DateTime.now().add(const Duration(days: 4)),
      totalDays: 3,
      reason: 'Medical treatment and recovery',
      status: LeaveStatus.pending,
      appliedAt: DateTime.now().subtract(const Duration(hours: 6)),
      remarks: 'Doctor has advised rest for 3 days',
    ),
    LeaveRequestModel(
      id: '2',
      staffId: '3',
      staffName: 'Emily Davis',
      leaveType: LeaveType.casual,
      startDate: DateTime.now().subtract(const Duration(days: 5)),
      endDate: DateTime.now().subtract(const Duration(days: 3)),
      totalDays: 3,
      reason: 'Family function attendance',
      status: LeaveStatus.approved,
      approvedBy: 'Principal',
      approvedAt: DateTime.now().subtract(const Duration(days: 7)),
      appliedAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
    LeaveRequestModel(
      id: '3',
      staffId: '4',
      staffName: 'David Wilson',
      leaveType: LeaveType.emergency,
      startDate: DateTime.now().subtract(const Duration(days: 1)),
      endDate: DateTime.now().add(const Duration(days: 2)),
      totalDays: 4,
      reason: 'Family emergency - father hospitalized',
      status: LeaveStatus.approved,
      approvedBy: 'Principal',
      approvedAt: DateTime.now().subtract(const Duration(hours: 2)),
      appliedAt: DateTime.now().subtract(const Duration(days: 2)),
      remarks: 'Emergency leave approved. Please keep us updated.',
    ),
  ];
});

@RoutePage()
class StaffManagementPage extends ConsumerStatefulWidget {
  const StaffManagementPage({super.key});

  @override
  ConsumerState<StaffManagementPage> createState() => _StaffManagementPageState();
}

class _StaffManagementPageState extends ConsumerState<StaffManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedRole = 'All';
  String selectedDepartment = 'All';
  String selectedStatus = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final staffAsync = ref.watch(staffProvider);
    final payrollAsync = ref.watch(payrollProvider);
    final leavesAsync = ref.watch(leaveRequestsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.people), text: 'Staff'),
            Tab(icon: Icon(Icons.account_balance_wallet), text: 'Payroll'),
            Tab(icon: Icon(Icons.event_available), text: 'Leaves'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: _showStaffAnalytics,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'attendance_report',
                child: Row(
                  children: [
                    Icon(Icons.assignment, size: 20),
                    SizedBox(width: 8),
                    Text('Attendance Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'salary_report',
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, size: 20),
                    SizedBox(width: 8),
                    Text('Salary Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'bulk_payroll',
                child: Row(
                  children: [
                    Icon(Icons.batch_prediction, size: 20),
                    SizedBox(width: 8),
                    Text('Bulk Payroll'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'export_data',
                child: Row(
                  children: [
                    Icon(Icons.download, size: 20),
                    SizedBox(width: 8),
                    Text('Export Data'),
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
          _buildStaffTab(staffAsync),
          _buildPayrollTab(payrollAsync),
          _buildLeavesTab(leavesAsync),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    switch (_tabController.index) {
      case 0:
        return FloatingActionButton.extended(
          onPressed: _showAddStaffDialog,
          icon: const Icon(Icons.person_add),
          label: const Text('Add Staff'),
        );
      case 1:
        return FloatingActionButton.extended(
          onPressed: _showGeneratePayrollDialog,
          icon: const Icon(Icons.calculate),
          label: const Text('Generate Payroll'),
        );
      case 2:
        return FloatingActionButton.extended(
          onPressed: _showApplyLeaveDialog,
          icon: const Icon(Icons.add),
          label: const Text('Apply Leave'),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStaffTab(AsyncValue<List<StaffModel>> staffAsync) {
    return Column(
      children: [
        _buildStaffFilters(),
        _buildStaffStats(staffAsync),
        Expanded(
          child: staffAsync.when(
            data: (staff) => _buildStaffList(staff),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading staff...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading staff: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(staffProvider),
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

  Widget _buildPayrollTab(AsyncValue<List<PayrollModel>> payrollAsync) {
    return Column(
      children: [
        _buildPayrollStats(payrollAsync),
        Expanded(
          child: payrollAsync.when(
            data: (payrolls) => _buildPayrollList(payrolls),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading payroll data...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading payroll: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(payrollProvider),
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

  Widget _buildLeavesTab(AsyncValue<List<LeaveRequestModel>> leavesAsync) {
    return Column(
      children: [
        _buildLeaveStats(leavesAsync),
        Expanded(
          child: leavesAsync.when(
            data: (leaves) => _buildLeavesList(leaves),
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading leave requests...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading leaves: ${error.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(leaveRequestsProvider),
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

  Widget _buildStaffFilters() {
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
                    value: selectedRole,
                    decoration: const InputDecoration(
                      labelText: 'Role',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Teacher', 'Principal', 'Admin Staff', 'Librarian', 'Accountant']
                        .map((role) => DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedStatus,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Active', 'Inactive', 'On Leave', 'Terminated']
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaffStats(AsyncValue<List<StaffModel>> staffAsync) {
    return staffAsync.when(
      data: (staff) {
        final totalStaff = staff.length;
        final activeStaff = staff.where((s) => s.isActive).length;
        final teachers = staff.where((s) => s.role == StaffRole.teacher).length;
        final avgSalary = staff.isNotEmpty 
            ? staff.map((s) => s.basicSalary).reduce((a, b) => a + b) / staff.length
            : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total Staff',
                  value: '$totalStaff',
                  icon: Icons.people,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Active',
                  value: '$activeStaff',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Teachers',
                  value: '$teachers',
                  icon: Icons.school,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Avg Salary',
                  value: '₹${_formatAmount(avgSalary)}',
                  icon: Icons.currency_rupee,
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

  Widget _buildPayrollStats(AsyncValue<List<PayrollModel>> payrollAsync) {
    return payrollAsync.when(
      data: (payrolls) {
        final totalPayrolls = payrolls.length;
        final totalSalaryPaid = payrolls.fold<double>(0, (sum, p) => sum + p.netSalary);
        final pendingPayrolls = payrolls.where((p) => p.status != PayrollStatus.paid).length;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total',
                  value: '$totalPayrolls',
                  icon: Icons.receipt,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Total Paid',
                  value: '₹${_formatAmount(totalSalaryPaid)}',
                  icon: Icons.account_balance_wallet,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Pending',
                  value: '$pendingPayrolls',
                  icon: Icons.pending,
                  color: Colors.orange,
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

  Widget _buildLeaveStats(AsyncValue<List<LeaveRequestModel>> leavesAsync) {
    return leavesAsync.when(
      data: (leaves) {
        final totalLeaves = leaves.length;
        final pendingLeaves = leaves.where((l) => l.isPending).length;
        final approvedLeaves = leaves.where((l) => l.isApproved).length;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total',
                  value: '$totalLeaves',
                  icon: Icons.event_available,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Pending',
                  value: '$pendingLeaves',
                  icon: Icons.hourglass_empty,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Approved',
                  value: '$approvedLeaves',
                  icon: Icons.check_circle,
                  color: Colors.green,
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

  Widget _buildStaffList(List<StaffModel> staff) {
    final filteredStaff = _filterStaff(staff);

    if (filteredStaff.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No staff members found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Add your first staff member using the + button',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredStaff.length,
      itemBuilder: (context, index) {
        final staffMember = filteredStaff[index];
        return _buildStaffCard(staffMember);
      },
    );
  }

  Widget _buildStaffCard(StaffModel staff) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showStaffDetails(staff),
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
                    backgroundColor: staff.role.color.withValues(alpha: 0.2),
                    child: Text(
                      staff.initials,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: staff.role.color,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          staff.fullName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${staff.role.displayName} • ${staff.department}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          staff.employeeId,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) => _handleStaffAction(value, staff),
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
                            Icon(Icons.assignment_ind, size: 20),
                            SizedBox(width: 8),
                            Text('Attendance'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'payroll',
                        child: Row(
                          children: [
                            Icon(Icons.account_balance_wallet, size: 20),
                            SizedBox(width: 8),
                            Text('Payroll'),
                          ],
                        ),
                      ),
                      if (staff.status != StaffStatus.terminated)
                        const PopupMenuItem(
                          value: 'deactivate',
                          child: Row(
                            children: [
                              Icon(Icons.block, size: 20, color: Colors.red),
                              SizedBox(width: 8),
                              Text('Deactivate', style: TextStyle(color: Colors.red)),
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
                    child: _buildStaffInfoChip(
                      Icons.work,
                      '${staff.experienceInYears} years',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildStaffInfoChip(
                      Icons.calendar_today,
                      '${staff.age} years',
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildStaffInfoChip(
                      Icons.currency_rupee,
                      '₹${_formatAmount(staff.basicSalary)}',
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStaffStatusColor(staff.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      staff.status.toString().split('.').last.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        color: _getStaffStatusColor(staff.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    staff.email,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              if (staff.subjects.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: staff.subjects.take(3).map((subject) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        subject,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStaffInfoChip(IconData icon, String text, Color color) {
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

  Widget _buildPayrollList(List<PayrollModel> payrolls) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: payrolls.length,
      itemBuilder: (context, index) {
        final payroll = payrolls[index];
        return _buildPayrollCard(payroll);
      },
    );
  }

  Widget _buildPayrollCard(PayrollModel payroll) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showPayrollDetails(payroll),
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
                    backgroundColor: _getPayrollStatusColor(payroll.status).withValues(alpha: 0.2),
                    child: Text(
                      payroll.staffName[0],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getPayrollStatusColor(payroll.status),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          payroll.staffName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${payroll.employeeId} • ${payroll.monthYear}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹${_formatAmount(payroll.netSalary)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getPayrollStatusColor(payroll.status).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          payroll.status.toString().split('.').last.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            color: _getPayrollStatusColor(payroll.status),
                            fontWeight: FontWeight.bold,
                          ),
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
                    child: _buildPayrollInfoChip(
                      'Earnings',
                      '₹${_formatAmount(payroll.totalEarnings)}',
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildPayrollInfoChip(
                      'Deductions',
                      '₹${_formatAmount(payroll.totalDeductions)}',
                      Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildPayrollInfoChip(
                      'Attendance',
                      '${payroll.presentDays}/${payroll.workingDays}',
                      Colors.blue,
                    ),
                  ),
                ],
              ),
              if (payroll.paidDate != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Paid on: ${DateFormat('MMM dd, yyyy').format(payroll.paidDate!)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPayrollInfoChip(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeavesList(List<LeaveRequestModel> leaves) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: leaves.length,
      itemBuilder: (context, index) {
        final leave = leaves[index];
        return _buildLeaveCard(leave);
      },
    );
  }

  Widget _buildLeaveCard(LeaveRequestModel leave) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: leave.leaveType.color.withValues(alpha: 0.2),
          child: Text(
            leave.staffName[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: leave.leaveType.color,
            ),
          ),
        ),
        title: Text(
          leave.staffName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${leave.leaveType.displayName} • ${leave.totalDays} days'),
            Text('${DateFormat('MMM dd').format(leave.startDate)} - ${DateFormat('MMM dd, yyyy').format(leave.endDate)}'),
            Text(leave.reason, maxLines: 1, overflow: TextOverflow.ellipsis),
            if (leave.rejectionReason != null)
              Text(
                'Reason: ${leave.rejectionReason}',
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getLeaveStatusColor(leave.status).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                leave.status.toString().split('.').last.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: _getLeaveStatusColor(leave.status),
                ),
              ),
            ),
            if (leave.isPending) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.green, size: 20),
                    onPressed: () => _approveLeave(leave),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red, size: 20),
                    onPressed: () => _rejectLeave(leave),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                  ),
                ],
              ),
            ],
          ],
        ),
        onTap: () => _showLeaveDetails(leave),
      ),
    );
  }

  List<StaffModel> _filterStaff(List<StaffModel> staff) {
    return staff.where((member) {
      // Role filter
      if (selectedRole != 'All') {
        if (selectedRole == 'Teacher' && member.role != StaffRole.teacher) return false;
        if (selectedRole == 'Principal' && member.role != StaffRole.principal) return false;
        if (selectedRole == 'Admin Staff' && member.role != StaffRole.admin_staff) return false;
        if (selectedRole == 'Librarian' && member.role != StaffRole.librarian) return false;
        if (selectedRole == 'Accountant' && member.role != StaffRole.accountant) return false;
      }
      
      // Status filter
      if (selectedStatus != 'All') {
        if (selectedStatus == 'Active' && member.status != StaffStatus.active) return false;
        if (selectedStatus == 'Inactive' && member.status != StaffStatus.inactive) return false;
        if (selectedStatus == 'On Leave' && member.status != StaffStatus.on_leave) return false;
        if (selectedStatus == 'Terminated' && member.status != StaffStatus.terminated) return false;
      }
      
      return true;
    }).toList();
  }

  String _formatAmount(double amount) {
    if (amount >= 10000000) return '${(amount / 10000000).toStringAsFixed(1)}Cr';
    if (amount >= 100000) return '${(amount / 100000).toStringAsFixed(1)}L';
    if (amount >= 1000) return '${(amount / 1000).toStringAsFixed(1)}K';
    return amount.toStringAsFixed(0);
  }

  Color _getStaffStatusColor(StaffStatus status) {
    switch (status) {
      case StaffStatus.active:
        return Colors.green;
      case StaffStatus.inactive:
        return Colors.grey;
      case StaffStatus.on_leave:
        return Colors.blue;
      case StaffStatus.suspended:
        return Colors.orange;
      case StaffStatus.terminated:
      case StaffStatus.resigned:
        return Colors.red;
    }
  }

  Color _getPayrollStatusColor(PayrollStatus status) {
    switch (status) {
      case PayrollStatus.draft:
        return Colors.grey;
      case PayrollStatus.calculated:
        return Colors.blue;
      case PayrollStatus.approved:
        return Colors.orange;
      case PayrollStatus.paid:
        return Colors.green;
      case PayrollStatus.cancelled:
        return Colors.red;
    }
  }

  Color _getLeaveStatusColor(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.pending:
        return Colors.orange;
      case LeaveStatus.approved:
        return Colors.green;
      case LeaveStatus.rejected:
        return Colors.red;
      case LeaveStatus.cancelled:
        return Colors.grey;
    }
  }

  void _handleStaffAction(String action, StaffModel staff) {
    switch (action) {
      case 'view':
        _showStaffDetails(staff);
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit staff feature coming soon!')),
        );
        break;
      case 'attendance':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Attendance for ${staff.fullName} coming soon!')),
        );
        break;
      case 'payroll':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payroll for ${staff.fullName} coming soon!')),
        );
        break;
      case 'deactivate':
        _deactivateStaff(staff);
        break;
    }
  }

  void _showStaffDetails(StaffModel staff) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: staff.role.color.withValues(alpha: 0.2),
              child: Text(
                staff.initials,
                style: TextStyle(color: staff.role.color),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(staff.fullName)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Employee ID', staff.employeeId),
              _buildDetailRow('Role', staff.role.displayName),
              _buildDetailRow('Department', staff.department),
              _buildDetailRow('Designation', staff.designation),
              _buildDetailRow('Email', staff.email),
              _buildDetailRow('Phone', staff.phoneNumber),
              _buildDetailRow('Address', staff.address),
              _buildDetailRow('Date of Birth', DateFormat('MMM dd, yyyy').format(staff.dateOfBirth)),
              _buildDetailRow('Age', '${staff.age} years'),
              _buildDetailRow('Joining Date', DateFormat('MMM dd, yyyy').format(staff.joiningDate)),
              _buildDetailRow('Experience', '${staff.experienceInYears} years'),
              _buildDetailRow('Employment Type', staff.employmentType.toString().split('.').last),
              _buildDetailRow('Basic Salary', '₹${staff.basicSalary}'),
              _buildDetailRow('Status', staff.status.toString().split('.').last),
              if (staff.qualifications.isNotEmpty)
                _buildDetailRow('Qualifications', staff.qualifications.join(', ')),
              if (staff.subjects.isNotEmpty)
                _buildDetailRow('Subjects', staff.subjects.join(', ')),
              if (staff.emergencyContact != null)
                _buildDetailRow('Emergency Contact', '${staff.emergencyContactName} - ${staff.emergencyContact}'),
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

  void _showPayrollDetails(PayrollModel payroll) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${payroll.staffName} - ${payroll.monthYear}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Earnings:', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildDetailRow('Basic Salary', '₹${payroll.basicSalary}'),
              _buildDetailRow('HRA', '₹${payroll.hra}'),
              _buildDetailRow('DA', '₹${payroll.da}'),
              _buildDetailRow('Medical Allowance', '₹${payroll.medicalAllowance}'),
              _buildDetailRow('Transport Allowance', '₹${payroll.transportAllowance}'),
              _buildDetailRow('Special Allowance', '₹${payroll.specialAllowance}'),
              if (payroll.overtimeAmount > 0)
                _buildDetailRow('Overtime', '₹${payroll.overtimeAmount}'),
              if (payroll.bonusAmount > 0)
                _buildDetailRow('Bonus', '₹${payroll.bonusAmount}'),
              _buildDetailRow('Total Earnings', '₹${payroll.totalEarnings}'),
              const SizedBox(height: 16),
              const Text('Deductions:', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildDetailRow('PF Deduction', '₹${payroll.pfDeduction}'),
              _buildDetailRow('ESI Deduction', '₹${payroll.esiDeduction}'),
              _buildDetailRow('Tax Deduction', '₹${payroll.taxDeduction}'),
              if (payroll.loanDeduction > 0)
                _buildDetailRow('Loan Deduction', '₹${payroll.loanDeduction}'),
              if (payroll.otherDeductions > 0)
                _buildDetailRow('Other Deductions', '₹${payroll.otherDeductions}'),
              if (payroll.lossOfPay > 0)
                _buildDetailRow('Loss of Pay', '₹${payroll.lossOfPay}'),
              _buildDetailRow('Total Deductions', '₹${payroll.totalDeductions}'),
              const SizedBox(height: 16),
              _buildDetailRow('Net Salary', '₹${payroll.netSalary}'),
              const SizedBox(height: 16),
              const Text('Attendance:', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildDetailRow('Working Days', '${payroll.workingDays}'),
              _buildDetailRow('Present Days', '${payroll.presentDays}'),
              _buildDetailRow('Absent Days', '${payroll.absentDays}'),
              _buildDetailRow('Attendance %', '${payroll.attendancePercentage.toStringAsFixed(1)}%'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          if (payroll.status == PayrollStatus.calculated)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _approvePayroll(payroll);
              },
              child: const Text('Approve'),
            ),
        ],
      ),
    );
  }

  void _showLeaveDetails(LeaveRequestModel leave) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Leave details for ${leave.staffName} coming soon!')),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
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

  void _deactivateStaff(StaffModel staff) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deactivate Staff'),
        content: Text('Are you sure you want to deactivate ${staff.fullName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${staff.fullName} has been deactivated')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Deactivate'),
          ),
        ],
      ),
    );
  }

  void _approvePayroll(PayrollModel payroll) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payroll approved for ${payroll.staffName}!')),
    );
  }

  void _approveLeave(LeaveRequestModel leave) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Leave approved for ${leave.staffName}!')),
    );
  }

  void _rejectLeave(LeaveRequestModel leave) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Leave rejected for ${leave.staffName}!')),
    );
  }

  void _showAddStaffDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add staff feature coming soon!')),
    );
  }

  void _showGeneratePayrollDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Generate payroll feature coming soon!')),
    );
  }

  void _showApplyLeaveDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Apply leave feature coming soon!')),
    );
  }

  void _showStaffAnalytics() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Staff analytics feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'attendance_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Attendance report feature coming soon!')),
        );
        break;
      case 'salary_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Salary report feature coming soon!')),
        );
        break;
      case 'bulk_payroll':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bulk payroll generation feature coming soon!')),
        );
        break;
      case 'export_data':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Export data feature coming soon!')),
        );
        break;
    }
  }
}