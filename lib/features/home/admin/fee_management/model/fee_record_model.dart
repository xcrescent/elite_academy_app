import 'package:hive_flutter/hive_flutter.dart';

part 'fee_record_model.g.dart';

@HiveType(typeId: 21)
class FeeRecordModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String studentId;
  
  @HiveField(2)
  String studentName;
  
  @HiveField(3)
  String classId;
  
  @HiveField(4)
  String className;
  
  @HiveField(5)
  FeeType feeType;
  
  @HiveField(6)
  double amount;
  
  @HiveField(7)
  DateTime dueDate;
  
  @HiveField(8)
  FeeStatus status;
  
  @HiveField(9)
  DateTime? paidDate;
  
  @HiveField(10)
  double? paidAmount;
  
  @HiveField(11)
  String? paymentMethod;
  
  @HiveField(12)
  String? transactionId;
  
  @HiveField(13)
  String? remarks;
  
  @HiveField(14)
  DateTime createdAt;
  
  @HiveField(15)
  String createdBy;

  FeeRecordModel({
    this.id,
    required this.studentId,
    required this.studentName,
    required this.classId,
    required this.className,
    required this.feeType,
    required this.amount,
    required this.dueDate,
    this.status = FeeStatus.pending,
    this.paidDate,
    this.paidAmount,
    this.paymentMethod,
    this.transactionId,
    this.remarks,
    required this.createdAt,
    required this.createdBy,
  });

  bool get isOverdue => status == FeeStatus.pending && DateTime.now().isAfter(dueDate);
  
  double get remainingAmount => amount - (paidAmount ?? 0);
  
  String get statusDisplayName {
    switch (status) {
      case FeeStatus.pending:
        return isOverdue ? 'Overdue' : 'Pending';
      case FeeStatus.partial:
        return 'Partially Paid';
      case FeeStatus.paid:
        return 'Paid';
      case FeeStatus.cancelled:
        return 'Cancelled';
    }
  }

  factory FeeRecordModel.fromMap(Map<String, dynamic> map) {
    return FeeRecordModel(
      id: map['id'],
      studentId: map['studentId'],
      studentName: map['studentName'],
      classId: map['classId'],
      className: map['className'],
      feeType: FeeType.values.firstWhere(
        (e) => e.toString().split('.').last == map['feeType'],
        orElse: () => FeeType.tuition,
      ),
      amount: map['amount'].toDouble(),
      dueDate: DateTime.parse(map['dueDate']),
      status: FeeStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => FeeStatus.pending,
      ),
      paidDate: map['paidDate'] != null ? DateTime.parse(map['paidDate']) : null,
      paidAmount: map['paidAmount']?.toDouble(),
      paymentMethod: map['paymentMethod'],
      transactionId: map['transactionId'],
      remarks: map['remarks'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'classId': classId,
      'className': className,
      'feeType': feeType.toString().split('.').last,
      'amount': amount,
      'dueDate': dueDate.toIso8601String(),
      'status': status.toString().split('.').last,
      'paidDate': paidDate?.toIso8601String(),
      'paidAmount': paidAmount,
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
      'remarks': remarks,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}

@HiveType(typeId: 22)
enum FeeType {
  @HiveField(0)
  tuition,
  
  @HiveField(1)
  admission,
  
  @HiveField(2)
  examination,
  
  @HiveField(3)
  library,
  
  @HiveField(4)
  laboratory,
  
  @HiveField(5)
  transport,
  
  @HiveField(6)
  hostel,
  
  @HiveField(7)
  sports,
  
  @HiveField(8)
  miscellaneous,
}

@HiveType(typeId: 23)
enum FeeStatus {
  @HiveField(0)
  pending,
  
  @HiveField(1)
  partial,
  
  @HiveField(2)
  paid,
  
  @HiveField(3)
  cancelled,
}

extension FeeTypeExtension on FeeType {
  String get displayName {
    switch (this) {
      case FeeType.tuition:
        return 'Tuition Fee';
      case FeeType.admission:
        return 'Admission Fee';
      case FeeType.examination:
        return 'Examination Fee';
      case FeeType.library:
        return 'Library Fee';
      case FeeType.laboratory:
        return 'Laboratory Fee';
      case FeeType.transport:
        return 'Transport Fee';
      case FeeType.hostel:
        return 'Hostel Fee';
      case FeeType.sports:
        return 'Sports Fee';
      case FeeType.miscellaneous:
        return 'Miscellaneous';
    }
  }
  
  String get icon {
    switch (this) {
      case FeeType.tuition:
        return '🎓';
      case FeeType.admission:
        return '📝';
      case FeeType.examination:
        return '📋';
      case FeeType.library:
        return '📚';
      case FeeType.laboratory:
        return '🧪';
      case FeeType.transport:
        return '🚌';
      case FeeType.hostel:
        return '🏠';
      case FeeType.sports:
        return '⚽';
      case FeeType.miscellaneous:
        return '📋';
    }
  }
}