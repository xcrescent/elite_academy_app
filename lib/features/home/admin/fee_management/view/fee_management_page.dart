import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/fee_record_model.dart';

// Sample fee data provider
final feeRecordsProvider = FutureProvider<List<FeeRecordModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    FeeRecordModel(
      id: '1',
      studentId: 'student1',
      studentName: 'John Doe',
      classId: 'class10a',
      className: 'Class 10-A',
      feeType: FeeType.tuition,
      amount: 15000.0,
      dueDate: DateTime.now().add(const Duration(days: 10)),
      status: FeeStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      createdBy: 'Admin',
    ),
    FeeRecordModel(
      id: '2',
      studentId: 'student2',
      studentName: 'Jane Smith',
      classId: 'class10a',
      className: 'Class 10-A',
      feeType: FeeType.tuition,
      amount: 15000.0,
      dueDate: DateTime.now().subtract(const Duration(days: 5)),
      status: FeeStatus.paid,
      paidDate: DateTime.now().subtract(const Duration(days: 7)),
      paidAmount: 15000.0,
      paymentMethod: 'Online Transfer',
      transactionId: 'TXN123456',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      createdBy: 'Admin',
    ),
    FeeRecordModel(
      id: '3',
      studentId: 'student3',
      studentName: 'Mike Johnson',
      classId: 'class10b',
      className: 'Class 10-B',
      feeType: FeeType.examination,
      amount: 2500.0,
      dueDate: DateTime.now().add(const Duration(days: 5)),
      status: FeeStatus.partial,
      paidDate: DateTime.now().subtract(const Duration(days: 2)),
      paidAmount: 1500.0,
      paymentMethod: 'Cash',
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
      createdBy: 'Admin',
    ),
    FeeRecordModel(
      id: '4',
      studentId: 'student4',
      studentName: 'Sarah Wilson',
      classId: 'class10b',
      className: 'Class 10-B',
      feeType: FeeType.library,
      amount: 1000.0,
      dueDate: DateTime.now().subtract(const Duration(days: 10)),
      status: FeeStatus.pending,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      createdBy: 'Admin',
    ),
  ];
});

@RoutePage()
class FeeManagementPage extends ConsumerStatefulWidget {
  const FeeManagementPage({super.key});

  @override
  ConsumerState<FeeManagementPage> createState() => _FeeManagementPageState();
}

class _FeeManagementPageState extends ConsumerState<FeeManagementPage> {
  String selectedStatus = 'All';
  String selectedFeeType = 'All';
  String selectedClass = 'All';

  @override
  Widget build(BuildContext context) {
    final feeRecordsAsync = ref.watch(feeRecordsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: _showFeeAnalytics,
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'bulk_generate',
                child: Row(
                  children: [
                    Icon(Icons.receipt_long, size: 20),
                    SizedBox(width: 8),
                    Text('Bulk Generate'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'payment_reminder',
                child: Row(
                  children: [
                    Icon(Icons.notifications, size: 20),
                    SizedBox(width: 8),
                    Text('Send Reminders'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'export_report',
                child: Row(
                  children: [
                    Icon(Icons.file_download, size: 20),
                    SizedBox(width: 8),
                    Text('Export Report'),
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
          _buildFinancialSummary(feeRecordsAsync),
          Expanded(
            child: feeRecordsAsync.when(
              data: (feeRecords) => _buildFeeRecordsList(feeRecords),
              loading: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading fee records...'),
                  ],
                ),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error loading fee records: ${error.toString()}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.refresh(feeRecordsProvider),
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
        onPressed: _showAddFeeDialog,
        icon: const Icon(Icons.add),
        label: const Text('Add Fee'),
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
                    value: selectedStatus,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Pending', 'Paid', 'Partial', 'Overdue']
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
                    value: selectedFeeType,
                    decoration: const InputDecoration(
                      labelText: 'Fee Type',
                      border: OutlineInputBorder(),
                    ),
                    items: ['All', 'Tuition Fee', 'Examination Fee', 'Library Fee', 'Transport Fee']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFeeType = value!;
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

  Widget _buildFinancialSummary(AsyncValue<List<FeeRecordModel>> feeRecordsAsync) {
    return feeRecordsAsync.when(
      data: (feeRecords) {
        final totalAmount = feeRecords.fold<double>(0, (sum, fee) => sum + fee.amount);
        final collectedAmount = feeRecords.fold<double>(0, (sum, fee) => sum + (fee.paidAmount ?? 0));
        final pendingAmount = totalAmount - collectedAmount;
        final overdueAmount = feeRecords
            .where((fee) => fee.isOverdue)
            .fold<double>(0, (sum, fee) => sum + fee.remainingAmount);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  title: 'Total',
                  value: '₹${_formatAmount(totalAmount)}',
                  icon: Icons.account_balance_wallet,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  title: 'Collected',
                  value: '₹${_formatAmount(collectedAmount)}',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  title: 'Pending',
                  value: '₹${_formatAmount(pendingAmount)}',
                  icon: Icons.schedule,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  title: 'Overdue',
                  value: '₹${_formatAmount(overdueAmount)}',
                  icon: Icons.warning,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(4, (index) => 
            Expanded(
              child: Card(child: SizedBox(height: 80)),
            ),
          ).expand((card) => [card, const SizedBox(width: 12)]).toList()..removeLast(),
        ),
      ),
      error: (_, __) => Container(),
    );
  }

  Widget _buildSummaryCard({
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

  Widget _buildFeeRecordsList(List<FeeRecordModel> feeRecords) {
    final filteredRecords = _filterFeeRecords(feeRecords);

    if (filteredRecords.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.receipt, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'No fee records found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add your first fee record using the + button',
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
                '${filteredRecords.length} fee records found',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                '${_getCollectionRate(filteredRecords).toStringAsFixed(1)}% collected',
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
            itemCount: filteredRecords.length,
            itemBuilder: (context, index) {
              final feeRecord = filteredRecords[index];
              return _buildFeeRecordCard(feeRecord);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeeRecordCard(FeeRecordModel feeRecord) {
    final statusColor = _getStatusColor(feeRecord);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              feeRecord.feeType.icon,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        title: Text(
          '${feeRecord.studentName} - ${feeRecord.feeType.displayName}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${feeRecord.className} • Due: ${DateFormat('MMM dd, yyyy').format(feeRecord.dueDate)}'),
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
                    feeRecord.statusDisplayName,
                    style: TextStyle(
                      fontSize: 10,
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '₹${_formatAmount(feeRecord.amount)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleFeeRecordAction(value, feeRecord),
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
            if (feeRecord.status != FeeStatus.paid)
              const PopupMenuItem(
                value: 'record_payment',
                child: Row(
                  children: [
                    Icon(Icons.payment, size: 20),
                    SizedBox(width: 8),
                    Text('Record Payment'),
                  ],
                ),
              ),
            const PopupMenuItem(
              value: 'send_reminder',
              child: Row(
                children: [
                  Icon(Icons.email, size: 20),
                  SizedBox(width: 8),
                  Text('Send Reminder'),
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
          ],
        ),
        onTap: () => _showFeeRecordDetails(feeRecord),
      ),
    );
  }

  List<FeeRecordModel> _filterFeeRecords(List<FeeRecordModel> feeRecords) {
    return feeRecords.where((record) {
      // Status filter
      if (selectedStatus != 'All') {
        if (selectedStatus == 'Overdue' && !record.isOverdue) return false;
        if (selectedStatus == 'Pending' && record.status != FeeStatus.pending) return false;
        if (selectedStatus == 'Paid' && record.status != FeeStatus.paid) return false;
        if (selectedStatus == 'Partial' && record.status != FeeStatus.partial) return false;
      }
      
      // Fee type filter
      if (selectedFeeType != 'All' && record.feeType.displayName != selectedFeeType) {
        return false;
      }
      
      return true;
    }).toList();
  }

  double _getCollectionRate(List<FeeRecordModel> feeRecords) {
    if (feeRecords.isEmpty) return 0.0;
    
    final totalAmount = feeRecords.fold<double>(0, (sum, fee) => sum + fee.amount);
    final collectedAmount = feeRecords.fold<double>(0, (sum, fee) => sum + (fee.paidAmount ?? 0));
    
    return (collectedAmount / totalAmount) * 100;
  }

  String _formatAmount(double amount) {
    if (amount >= 10000000) return '${(amount / 10000000).toStringAsFixed(1)}Cr';
    if (amount >= 100000) return '${(amount / 100000).toStringAsFixed(1)}L';
    if (amount >= 1000) return '${(amount / 1000).toStringAsFixed(1)}K';
    return amount.toStringAsFixed(0);
  }

  Color _getStatusColor(FeeRecordModel feeRecord) {
    if (feeRecord.isOverdue) return Colors.red;
    
    switch (feeRecord.status) {
      case FeeStatus.paid:
        return Colors.green;
      case FeeStatus.pending:
        return Colors.orange;
      case FeeStatus.partial:
        return Colors.blue;
      case FeeStatus.cancelled:
        return Colors.grey;
    }
  }

  void _handleFeeRecordAction(String action, FeeRecordModel feeRecord) {
    switch (action) {
      case 'view':
        _showFeeRecordDetails(feeRecord);
        break;
      case 'record_payment':
        _showRecordPaymentDialog(feeRecord);
        break;
      case 'send_reminder':
        _sendPaymentReminder(feeRecord);
        break;
      case 'edit':
        _editFeeRecord(feeRecord);
        break;
    }
  }

  void _showFeeRecordDetails(FeeRecordModel feeRecord) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(feeRecord.feeType.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Expanded(child: Text(feeRecord.feeType.displayName)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Student', feeRecord.studentName),
              _buildDetailRow('Class', feeRecord.className),
              _buildDetailRow('Amount', '₹${feeRecord.amount}'),
              _buildDetailRow('Due Date', DateFormat('MMM dd, yyyy').format(feeRecord.dueDate)),
              _buildDetailRow('Status', feeRecord.statusDisplayName),
              if (feeRecord.paidAmount != null) ...[
                _buildDetailRow('Paid Amount', '₹${feeRecord.paidAmount}'),
                _buildDetailRow('Remaining', '₹${feeRecord.remainingAmount}'),
              ],
              if (feeRecord.paidDate != null)
                _buildDetailRow('Paid Date', DateFormat('MMM dd, yyyy').format(feeRecord.paidDate!)),
              if (feeRecord.paymentMethod != null)
                _buildDetailRow('Payment Method', feeRecord.paymentMethod!),
              if (feeRecord.transactionId != null)
                _buildDetailRow('Transaction ID', feeRecord.transactionId!),
              if (feeRecord.remarks != null)
                _buildDetailRow('Remarks', feeRecord.remarks!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          if (feeRecord.status != FeeStatus.paid)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showRecordPaymentDialog(feeRecord);
              },
              child: const Text('Record Payment'),
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

  void _showRecordPaymentDialog(FeeRecordModel feeRecord) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Record payment feature coming soon!')),
    );
  }

  void _sendPaymentReminder(FeeRecordModel feeRecord) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reminder sent to ${feeRecord.studentName}!')),
    );
  }

  void _editFeeRecord(FeeRecordModel feeRecord) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit fee record feature coming soon!')),
    );
  }

  void _showAddFeeDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add fee feature coming soon!')),
    );
  }

  void _showFeeAnalytics() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fee analytics feature coming soon!')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'bulk_generate':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bulk generate feature coming soon!')),
        );
        break;
      case 'payment_reminder':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment reminders sent!')),
        );
        break;
      case 'export_report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Export report feature coming soon!')),
        );
        break;
    }
  }
}