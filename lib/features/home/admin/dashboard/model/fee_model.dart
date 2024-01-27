import 'package:hive_flutter/hive_flutter.dart';

part 'fee_model.g.dart';

// @HiveType(typeId: 1)
// enum TransactionType {
//   @HiveField(0)
//   income,
//   @HiveField(1)
//   expense,
// }

@HiveType(typeId: 5)
class FeeModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int studentId;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime dueDate;
  @HiveField(4)
  final bool isPaid;

  FeeModel({
    required this.id,
    required this.studentId,
    required this.amount,
    required this.dueDate,
    required this.isPaid,
  });

  factory FeeModel.fromMap(Map<String, dynamic> map) {
    return FeeModel(
      id: map['id'],
      studentId: map['studentId'],
      amount: map['amount'],
      dueDate: map['dueDate'],
      isPaid: map['isPaid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'amount': amount,
      'dueDate': dueDate,
      'isPaid': isPaid,
    };
  }
}
