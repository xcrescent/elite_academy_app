import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/analytics_model.dart';

// Sample data providers
final dashboardMetricsProvider = FutureProvider<List<DashboardMetrics>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  final now = DateTime.now();
  return List.generate(12, (index) {
    final date = DateTime(now.year, now.month - index, 1);
    return DashboardMetrics(
      id: 'metric_${index + 1}',
      date: date,
      totalStudents: 1200 + (index * 25),
      totalStaff: 85 + (index * 2),
      totalRevenue: 2500000.0 + (index * 50000),
      totalExpenses: 2200000.0 + (index * 45000),
      admissions: 45 + (index * 5),
      attendanceRate: 85.5 + (index * 0.5),
      examsConducted: 12 + index,
      averageMarks: 75.0 + (index * 0.8),
      libraryBooks: 5000 + (index * 20),
      assetsCount: 250 + (index * 3),
      transportUtilization: 78.0 + (index * 1.2),
      hostelOccupancy: 92.0 - (index * 0.5),
    );
  }).reversed.toList();
});

final studentAnalyticsProvider = FutureProvider<List<StudentAnalytics>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));
  
  return [
    StudentAnalytics(
      classId: '1',
      className: 'Class 10th A',
      totalStudents: 45,
      maleStudents: 25,
      femaleStudents: 20,
      averageAttendance: 88.5,
      averageGrade: 78.2,
      passCount: 42,
      failCount: 3,
      feeCollection: 450000.0,
      pendingFees: 45000.0,
    ),
    StudentAnalytics(
      classId: '2',
      className: 'Class 10th B',
      totalStudents: 42,
      maleStudents: 22,
      femaleStudents: 20,
      averageAttendance: 85.2,
      averageGrade: 75.8,
      passCount: 38,
      failCount: 4,
      feeCollection: 420000.0,
      pendingFees: 63000.0,
    ),
    StudentAnalytics(
      classId: '3',
      className: 'Class 12th A',
      totalStudents: 38,
      maleStudents: 20,
      femaleStudents: 18,
      averageAttendance: 91.3,
      averageGrade: 82.1,
      passCount: 36,
      failCount: 2,
      feeCollection: 380000.0,
      pendingFees: 19000.0,
    ),
    StudentAnalytics(
      classId: '4',
      className: 'Class 12th B',
      totalStudents: 40,
      maleStudents: 23,
      femaleStudents: 17,
      averageAttendance: 89.7,
      averageGrade: 79.5,
      passCount: 37,
      failCount: 3,
      feeCollection: 400000.0,
      pendingFees: 40000.0,
    ),
  ];
});

final financialAnalyticsProvider = FutureProvider<List<FinancialAnalytics>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 600));
  
  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
  return months.map((month) => FinancialAnalytics(
    month: month,
    tuitionFees: 1800000.0 + (months.indexOf(month) * 25000),
    transportFees: 350000.0 + (months.indexOf(month) * 5000),
    hostelFees: 450000.0 + (months.indexOf(month) * 8000),
    examFees: 125000.0 + (months.indexOf(month) * 2000),
    otherIncome: 75000.0 + (months.indexOf(month) * 1500),
    salaryExpenses: 1200000.0 + (months.indexOf(month) * 15000),
    utilityExpenses: 180000.0 + (months.indexOf(month) * 3000),
    maintenanceExpenses: 120000.0 + (months.indexOf(month) * 2500),
    suppliesExpenses: 95000.0 + (months.indexOf(month) * 2000),
    otherExpenses: 85000.0 + (months.indexOf(month) * 1800),
  )).toList();
});

final academicAnalyticsProvider = FutureProvider<List<AcademicAnalytics>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
  
  return [
    AcademicAnalytics(
      subject: 'Mathematics',
      className: 'Class 10th',
      averageScore: 78.5,
      highestScore: 98.0,
      lowestScore: 45.0,
      studentsAppeared: 85,
      studentsAbsent: 2,
      examType: 'Unit Test',
      examDate: DateTime.now().subtract(const Duration(days: 15)),
      difficulty: 'Medium',
    ),
    AcademicAnalytics(
      subject: 'Science',
      className: 'Class 10th',
      averageScore: 82.3,
      highestScore: 96.5,
      lowestScore: 52.0,
      studentsAppeared: 84,
      studentsAbsent: 3,
      examType: 'Unit Test',
      examDate: DateTime.now().subtract(const Duration(days: 12)),
      difficulty: 'Medium',
    ),
    AcademicAnalytics(
      subject: 'English',
      className: 'Class 12th',
      averageScore: 75.8,
      highestScore: 94.0,
      lowestScore: 48.5,
      studentsAppeared: 76,
      studentsAbsent: 2,
      examType: 'Monthly Test',
      examDate: DateTime.now().subtract(const Duration(days: 8)),
      difficulty: 'Easy',
    ),
    AcademicAnalytics(
      subject: 'Chemistry',
      className: 'Class 12th',
      averageScore: 69.2,
      highestScore: 91.5,
      lowestScore: 38.0,
      studentsAppeared: 77,
      studentsAbsent: 1,
      examType: 'Monthly Test',
      examDate: DateTime.now().subtract(const Duration(days: 5)),
      difficulty: 'Hard',
    ),
  ];
});

@RoutePage()
class AnalyticsDashboardPage extends ConsumerStatefulWidget {
  const AnalyticsDashboardPage({super.key});

  @override
  ConsumerState<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
}

class _AnalyticsDashboardPageState extends ConsumerState<AnalyticsDashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  AnalyticsPeriod selectedPeriod = AnalyticsPeriod.monthly;
  String selectedMetric = 'Revenue';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardAsync = ref.watch(dashboardMetricsProvider);
    final studentAsync = ref.watch(studentAnalyticsProvider);
    final financialAsync = ref.watch(financialAnalyticsProvider);
    final academicAsync = ref.watch(academicAnalyticsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Overview'),
            Tab(icon: Icon(Icons.people), text: 'Students'),
            Tab(icon: Icon(Icons.account_balance_wallet), text: 'Financial'),
            Tab(icon: Icon(Icons.school), text: 'Academic'),
          ],
        ),
        actions: [
          PopupMenuButton<AnalyticsPeriod>(
            icon: const Icon(Icons.date_range),
            onSelected: (period) {
              setState(() {
                selectedPeriod = period;
              });
            },
            itemBuilder: (context) => AnalyticsPeriod.values.map((period) =>
              PopupMenuItem(
                value: period,
                child: Text(period.displayName),
              ),
            ).toList(),
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
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
                value: 'export_excel',
                child: Row(
                  children: [
                    Icon(Icons.table_chart, size: 20),
                    SizedBox(width: 8),
                    Text('Export Excel'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'share',
                child: Row(
                  children: [
                    Icon(Icons.share, size: 20),
                    SizedBox(width: 8),
                    Text('Share Report'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'schedule_report',
                child: Row(
                  children: [
                    Icon(Icons.schedule_send, size: 20),
                    SizedBox(width: 8),
                    Text('Schedule Report'),
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
          _buildOverviewTab(dashboardAsync),
          _buildStudentTab(studentAsync),
          _buildFinancialTab(financialAsync),
          _buildAcademicTab(academicAsync),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(AsyncValue<List<DashboardMetrics>> metricsAsync) {
    return metricsAsync.when(
      data: (metrics) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKPICards(metrics.last),
            const SizedBox(height: 24),
            _buildRevenueChart(metrics),
            const SizedBox(height: 24),
            _buildMetricsTrendChart(metrics),
            const SizedBox(height: 24),
            _buildComparisonCards(metrics),
          ],
        ),
      ),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading analytics...'),
          ],
        ),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error loading analytics: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(dashboardMetricsProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentTab(AsyncValue<List<StudentAnalytics>> studentAsync) {
    return studentAsync.when(
      data: (students) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildStudentStatsGrid(students),
            const SizedBox(height: 24),
            _buildEnrollmentChart(students),
            const SizedBox(height: 24),
            _buildGenderDistributionChart(students),
            const SizedBox(height: 24),
            _buildAttendanceChart(students),
            const SizedBox(height: 24),
            _buildPerformanceChart(students),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: ${error.toString()}')),
    );
  }

  Widget _buildFinancialTab(AsyncValue<List<FinancialAnalytics>> financialAsync) {
    return financialAsync.when(
      data: (financial) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFinancialSummaryCards(financial),
            const SizedBox(height: 24),
            _buildRevenueBreakdownChart(financial),
            const SizedBox(height: 24),
            _buildExpenseBreakdownChart(financial),
            const SizedBox(height: 24),
            _buildProfitTrendChart(financial),
            const SizedBox(height: 24),
            _buildFinancialComparison(financial),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: ${error.toString()}')),
    );
  }

  Widget _buildAcademicTab(AsyncValue<List<AcademicAnalytics>> academicAsync) {
    return academicAsync.when(
      data: (academic) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAcademicStatsGrid(academic),
            const SizedBox(height: 24),
            _buildSubjectPerformanceChart(academic),
            const SizedBox(height: 24),
            _buildGradeDistributionChart(academic),
            const SizedBox(height: 24),
            _buildExamAttendanceChart(academic),
            const SizedBox(height: 24),
            _buildDifficultyAnalysis(academic),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: ${error.toString()}')),
    );
  }

  Widget _buildKPICards(DashboardMetrics latest) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildKPICard(
          'Total Students',
          '${latest.totalStudents}',
          Icons.people,
          Colors.blue,
          '+5.2% from last month',
          MetricTrend.increasing,
        ),
        _buildKPICard(
          'Total Revenue',
          '₹${_formatAmount(latest.totalRevenue)}',
          Icons.currency_rupee,
          Colors.green,
          '+8.1% from last month',
          MetricTrend.increasing,
        ),
        _buildKPICard(
          'Attendance Rate',
          '${latest.attendanceRate.toStringAsFixed(1)}%',
          Icons.check_circle,
          Colors.orange,
          '+2.3% from last month',
          MetricTrend.increasing,
        ),
        _buildKPICard(
          'Net Profit',
          '₹${_formatAmount(latest.netIncome)}',
          Icons.account_balance_wallet,
          Colors.purple,
          '+12.5% from last month',
          MetricTrend.increasing,
        ),
      ],
    );
  }

  Widget _buildKPICard(
    String title,
    String value,
    IconData icon,
    Color color,
    String trend,
    MetricTrend trendType,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 28),
                Icon(
                  trendType.icon,
                  color: trendType.color,
                  size: 20,
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              trend,
              style: TextStyle(
                fontSize: 12,
                color: trendType.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueChart(List<DashboardMetrics> metrics) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Revenue Trend',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedMetric,
                  items: ['Revenue', 'Expenses', 'Profit']
                      .map((metric) => DropdownMenuItem(
                            value: metric,
                            child: Text(metric),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMetric = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: _buildSimulatedLineChart(metrics),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSimulatedLineChart(List<DashboardMetrics> metrics) {
    final data = metrics.map((m) {
      switch (selectedMetric) {
        case 'Revenue':
          return m.totalRevenue;
        case 'Expenses':
          return m.totalExpenses;
        case 'Profit':
          return m.netIncome;
        default:
          return m.totalRevenue;
      }
    }).toList();

    final maxValue = data.reduce((a, b) => a > b ? a : b);
    final minValue = data.reduce((a, b) => a < b ? a : b);

    return CustomPaint(
      size: const Size.fromHeight(300),
      painter: LineChartPainter(
        data: data,
        labels: metrics.map((m) => DateFormat('MMM').format(m.date)).toList(),
        maxValue: maxValue,
        minValue: minValue,
        color: _getMetricColor(selectedMetric),
      ),
    );
  }

  Color _getMetricColor(String metric) {
    switch (metric) {
      case 'Revenue':
        return Colors.green;
      case 'Expenses':
        return Colors.red;
      case 'Profit':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Widget _buildMetricsTrendChart(List<DashboardMetrics> metrics) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Key Metrics Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: Row(
                children: [
                  Expanded(child: _buildMetricProgressBar('Students', metrics.last.totalStudents.toDouble(), 1500, Colors.blue)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildMetricProgressBar('Staff', metrics.last.totalStaff.toDouble(), 100, Colors.orange)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildMetricProgressBar('Attendance', metrics.last.attendanceRate, 100, Colors.green)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildMetricProgressBar('Assets', metrics.last.assetsCount.toDouble(), 300, Colors.purple)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricProgressBar(String title, double value, double maxValue, Color color) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);
    
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 60,
                  height: 200 * percentage,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value.toStringAsFixed(title == 'Attendance' ? 1 : 0),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          '${(percentage * 100).toStringAsFixed(0)}%',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildComparisonCards(List<DashboardMetrics> metrics) {
    if (metrics.length < 2) return const SizedBox.shrink();

    final current = metrics.last;
    final previous = metrics[metrics.length - 2];

    return Row(
      children: [
        Expanded(
          child: _buildComparisonCard(
            'Revenue Growth',
            current.totalRevenue,
            previous.totalRevenue,
            Colors.green,
            Icons.trending_up,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildComparisonCard(
            'Student Growth',
            current.totalStudents.toDouble(),
            previous.totalStudents.toDouble(),
            Colors.blue,
            Icons.people,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildComparisonCard(
            'Profit Margin',
            current.profitMargin,
            previous.profitMargin,
            Colors.purple,
            Icons.percent,
          ),
        ),
      ],
    );
  }

  Widget _buildComparisonCard(
    String title,
    double current,
    double previous,
    Color color,
    IconData icon,
  ) {
    final growth = previous > 0 ? ((current - previous) / previous) * 100 : 0.0;
    final isPositive = growth >= 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color),
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPositive ? Colors.green : Colors.red,
                  size: 16,
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
            const SizedBox(height: 4),
            Text(
              '${growth.toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
            Text(
              'vs last month',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentStatsGrid(List<StudentAnalytics> students) {
    final totalStudents = students.fold<int>(0, (sum, s) => sum + s.totalStudents);
    final avgAttendance = students.fold<double>(0, (sum, s) => sum + s.averageAttendance) / students.length;
    final avgGrade = students.fold<double>(0, (sum, s) => sum + s.averageGrade) / students.length;
    final passPercentage = students.fold<double>(0, (sum, s) => sum + s.passPercentage) / students.length;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('Total Students', '$totalStudents', Icons.people, Colors.blue),
        _buildStatCard('Avg Attendance', '${avgAttendance.toStringAsFixed(1)}%', Icons.check_circle, Colors.green),
        _buildStatCard('Avg Grade', '${avgGrade.toStringAsFixed(1)}%', Icons.grade, Colors.orange),
        _buildStatCard('Pass Rate', '${passPercentage.toStringAsFixed(1)}%', Icons.school, Colors.purple),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
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

  Widget _buildEnrollmentChart(List<StudentAnalytics> students) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Class-wise Enrollment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildHorizontalBarChart(
                students.map((s) => ChartDataPoint(
                  label: s.className,
                  value: s.totalStudents.toDouble(),
                  color: Colors.primaries[students.indexOf(s) % Colors.primaries.length],
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalBarChart(List<ChartDataPoint> data) {
    final maxValue = data.map((d) => d.value).reduce((a, b) => a > b ? a : b);

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        final percentage = item.value / maxValue;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.label, style: const TextStyle(fontWeight: FontWeight.w500)),
                  Text('${item.value.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGenderDistributionChart(List<StudentAnalytics> students) {
    final totalMale = students.fold<int>(0, (sum, s) => sum + s.maleStudents);
    final totalFemale = students.fold<int>(0, (sum, s) => sum + s.femaleStudents);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gender Distribution',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildPieChart([
                ChartDataPoint(label: 'Male', value: totalMale.toDouble(), color: Colors.blue),
                ChartDataPoint(label: 'Female', value: totalFemale.toDouble(), color: Colors.pink),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart(List<ChartDataPoint> data) {
    final total = data.fold<double>(0, (sum, item) => sum + item.value);

    return Row(
      children: [
        Expanded(
          child: CustomPaint(
            size: const Size(200, 200),
            painter: PieChartPainter(data: data),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.map((item) {
            final percentage = (item.value / total * 100);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('${item.label}: ${percentage.toStringAsFixed(1)}%'),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAttendanceChart(List<StudentAnalytics> students) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Class-wise Attendance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildHorizontalBarChart(
                students.map((s) => ChartDataPoint(
                  label: s.className,
                  value: s.averageAttendance,
                  color: _getAttendanceColor(s.averageAttendance),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getAttendanceColor(double attendance) {
    if (attendance >= 90) return Colors.green;
    if (attendance >= 80) return Colors.orange;
    return Colors.red;
  }

  Widget _buildPerformanceChart(List<StudentAnalytics> students) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Academic Performance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildHorizontalBarChart(
                students.map((s) => ChartDataPoint(
                  label: s.className,
                  value: s.averageGrade,
                  color: _getGradeColor(s.averageGrade),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getGradeColor(double grade) {
    if (grade >= 80) return Colors.green;
    if (grade >= 70) return Colors.blue;
    if (grade >= 60) return Colors.orange;
    return Colors.red;
  }

  Widget _buildFinancialSummaryCards(List<FinancialAnalytics> financial) {
    final latest = financial.last;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('Total Income', '₹${_formatAmount(latest.totalIncome)}', Icons.attach_money, Colors.green),
        _buildStatCard('Total Expenses', '₹${_formatAmount(latest.totalExpenses)}', Icons.money_off, Colors.red),
        _buildStatCard('Net Profit', '₹${_formatAmount(latest.netProfit)}', Icons.account_balance, Colors.blue),
        _buildStatCard('Profit Margin', '${latest.profitMargin.toStringAsFixed(1)}%', Icons.percent, Colors.purple),
      ],
    );
  }

  Widget _buildRevenueBreakdownChart(List<FinancialAnalytics> financial) {
    final latest = financial.last;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Revenue Breakdown',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: _buildPieChart([
                ChartDataPoint(label: 'Tuition Fees', value: latest.tuitionFees, color: Colors.blue),
                ChartDataPoint(label: 'Transport Fees', value: latest.transportFees, color: Colors.green),
                ChartDataPoint(label: 'Hostel Fees', value: latest.hostelFees, color: Colors.orange),
                ChartDataPoint(label: 'Exam Fees', value: latest.examFees, color: Colors.purple),
                ChartDataPoint(label: 'Other Income', value: latest.otherIncome, color: Colors.teal),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseBreakdownChart(List<FinancialAnalytics> financial) {
    final latest = financial.last;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Expense Breakdown',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: _buildPieChart([
                ChartDataPoint(label: 'Salary', value: latest.salaryExpenses, color: Colors.red),
                ChartDataPoint(label: 'Utilities', value: latest.utilityExpenses, color: Colors.blue),
                ChartDataPoint(label: 'Maintenance', value: latest.maintenanceExpenses, color: Colors.green),
                ChartDataPoint(label: 'Supplies', value: latest.suppliesExpenses, color: Colors.orange),
                ChartDataPoint(label: 'Others', value: latest.otherExpenses, color: Colors.grey),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfitTrendChart(List<FinancialAnalytics> financial) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profit Trend',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildProfitLineChart(financial),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfitLineChart(List<FinancialAnalytics> financial) {
    final data = financial.map((f) => f.netProfit).toList();
    final maxValue = data.reduce((a, b) => a > b ? a : b);
    final minValue = data.reduce((a, b) => a < b ? a : b);

    return CustomPaint(
      size: const Size.fromHeight(200),
      painter: LineChartPainter(
        data: data,
        labels: financial.map((f) => f.month).toList(),
        maxValue: maxValue,
        minValue: minValue,
        color: Colors.green,
      ),
    );
  }

  Widget _buildFinancialComparison(List<FinancialAnalytics> financial) {
    if (financial.length < 2) return const SizedBox.shrink();

    final current = financial.last;
    final previous = financial[financial.length - 2];

    return Row(
      children: [
        Expanded(
          child: _buildComparisonCard(
            'Income Growth',
            current.totalIncome,
            previous.totalIncome,
            Colors.green,
            Icons.trending_up,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildComparisonCard(
            'Expense Change',
            current.totalExpenses,
            previous.totalExpenses,
            Colors.red,
            Icons.trending_down,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildComparisonCard(
            'Profit Change',
            current.netProfit,
            previous.netProfit,
            Colors.blue,
            Icons.account_balance,
          ),
        ),
      ],
    );
  }

  Widget _buildAcademicStatsGrid(List<AcademicAnalytics> academic) {
    final avgScore = academic.fold<double>(0, (sum, a) => sum + a.averageScore) / academic.length;
    final totalAppeared = academic.fold<int>(0, (sum, a) => sum + a.studentsAppeared);
    final totalAbsent = academic.fold<int>(0, (sum, a) => sum + a.studentsAbsent);
    final avgAttendance = academic.fold<double>(0, (sum, a) => sum + a.attendanceRate) / academic.length;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('Avg Score', '${avgScore.toStringAsFixed(1)}%', Icons.grade, Colors.blue),
        _buildStatCard('Students Appeared', '$totalAppeared', Icons.people, Colors.green),
        _buildStatCard('Exam Attendance', '${avgAttendance.toStringAsFixed(1)}%', Icons.check_circle, Colors.orange),
        _buildStatCard('Subjects Tested', '${academic.length}', Icons.subject, Colors.purple),
      ],
    );
  }

  Widget _buildSubjectPerformanceChart(List<AcademicAnalytics> academic) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Subject-wise Performance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildHorizontalBarChart(
                academic.map((a) => ChartDataPoint(
                  label: a.subject,
                  value: a.averageScore,
                  color: _getGradeColor(a.averageScore),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeDistributionChart(List<AcademicAnalytics> academic) {
    final gradeDistribution = <String, int>{};
    for (final exam in academic) {
      final grade = exam.gradeLevel;
      gradeDistribution[grade] = (gradeDistribution[grade] ?? 0) + 1;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Grade Distribution',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildPieChart(
                gradeDistribution.entries.map((entry) => ChartDataPoint(
                  label: 'Grade ${entry.key}',
                  value: entry.value.toDouble(),
                  color: Colors.primaries[gradeDistribution.keys.toList().indexOf(entry.key) % Colors.primaries.length],
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamAttendanceChart(List<AcademicAnalytics> academic) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Exam Attendance by Subject',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildHorizontalBarChart(
                academic.map((a) => ChartDataPoint(
                  label: a.subject,
                  value: a.attendanceRate,
                  color: _getAttendanceColor(a.attendanceRate),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyAnalysis(List<AcademicAnalytics> academic) {
    final difficultyCount = <String, int>{};
    final difficultyScores = <String, List<double>>{};
    
    for (final exam in academic) {
      difficultyCount[exam.difficulty] = (difficultyCount[exam.difficulty] ?? 0) + 1;
      difficultyScores[exam.difficulty] ??= [];
      difficultyScores[exam.difficulty]!.add(exam.averageScore);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Performance by Difficulty Level',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: difficultyScores.entries.map((entry) {
                final avgScore = entry.value.reduce((a, b) => a + b) / entry.value.length;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          entry.key,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: avgScore / 100,
                          backgroundColor: Colors.grey.withValues(alpha: 0.3),
                          valueColor: AlwaysStoppedAnimation(_getDifficultyColor(entry.key)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${avgScore.toStringAsFixed(1)}%',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatAmount(double amount) {
    if (amount >= 10000000) return '${(amount / 10000000).toStringAsFixed(1)}Cr';
    if (amount >= 100000) return '${(amount / 100000).toStringAsFixed(1)}L';
    if (amount >= 1000) return '${(amount / 1000).toStringAsFixed(1)}K';
    return amount.toStringAsFixed(0);
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'export_pdf':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PDF export feature coming soon!')),
        );
        break;
      case 'export_excel':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Excel export feature coming soon!')),
        );
        break;
      case 'share':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Share report feature coming soon!')),
        );
        break;
      case 'schedule_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Schedule report feature coming soon!')),
        );
        break;
    }
  }
}

// Custom painters for charts
class LineChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final double maxValue;
  final double minValue;
  final Color color;

  LineChartPainter({
    required this.data,
    required this.labels,
    required this.maxValue,
    required this.minValue,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    if (data.isEmpty) return;

    final path = Path();
    final fillPath = Path();
    
    final stepX = size.width / (data.length - 1);
    final range = maxValue - minValue;

    // Start the path
    final firstY = range > 0 ? size.height - ((data[0] - minValue) / range) * size.height : size.height / 2;
    path.moveTo(0, firstY);
    fillPath.moveTo(0, size.height);
    fillPath.lineTo(0, firstY);

    // Draw the line
    for (int i = 1; i < data.length; i++) {
      final x = i * stepX;
      final y = range > 0 ? size.height - ((data[i] - minValue) / range) * size.height : size.height / 2;
      path.lineTo(x, y);
      fillPath.lineTo(x, y);
    }

    // Close fill path
    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    // Draw fill and line
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Draw points
    final pointPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = range > 0 ? size.height - ((data[i] - minValue) / range) * size.height : size.height / 2;
      canvas.drawCircle(Offset(x, y), 4, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PieChartPainter extends CustomPainter {
  final List<ChartDataPoint> data;

  PieChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width < size.height ? size.width / 2 : size.height / 2;
    
    final total = data.fold<double>(0, (sum, item) => sum + item.value);
    
    double startAngle = -90 * (3.14159 / 180); // Start from top
    
    for (final item in data) {
      final sweepAngle = (item.value / total) * 2 * 3.14159;
      
      final paint = Paint()
        ..color = item.color ?? Colors.grey
        ..style = PaintingStyle.fill;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - 20),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
      
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}