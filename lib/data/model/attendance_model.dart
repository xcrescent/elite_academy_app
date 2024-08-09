import 'package:hive_flutter/hive_flutter.dart';

part 'attendance_model.g.dart';

// @HiveType(typeId: 1)
// enum TransactionType {
//   @HiveField(0)
//   income,
//   @HiveField(1)
//   expense,
// }

@HiveType(typeId: 6)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int studentId;
  @HiveField(2)
  int batchId;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  bool isPresent;

  AttendanceModel({
    required this.id,
    required this.studentId,
    required this.batchId,
    required this.date,
    required this.isPresent,
  });

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      id: map['id'],
      studentId: map['studentId'],
      batchId: map['batchId'],
      date: map['date'],
      isPresent: map['isPresent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'batchId': batchId,
      'date': date,
      'isPresent': isPresent,
    };
  }
}
