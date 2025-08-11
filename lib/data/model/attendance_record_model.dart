import 'package:hive_flutter/hive_flutter.dart';

part 'attendance_record_model.g.dart';

@HiveType(typeId: 10)
class AttendanceRecordModel extends HiveObject {
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
  DateTime date;
  
  @HiveField(6)
  AttendanceStatus status;
  
  @HiveField(7)
  String? remarks;
  
  @HiveField(8)
  String markedBy;
  
  @HiveField(9)
  DateTime createdAt;

  AttendanceRecordModel({
    this.id,
    required this.studentId,
    required this.studentName,
    required this.classId,
    required this.className,
    required this.date,
    required this.status,
    this.remarks,
    required this.markedBy,
    required this.createdAt,
  });

  factory AttendanceRecordModel.fromMap(Map<String, dynamic> map) {
    return AttendanceRecordModel(
      id: map['id'],
      studentId: map['studentId'],
      studentName: map['studentName'],
      classId: map['classId'],
      className: map['className'],
      date: DateTime.parse(map['date']),
      status: AttendanceStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => AttendanceStatus.absent,
      ),
      remarks: map['remarks'],
      markedBy: map['markedBy'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'classId': classId,
      'className': className,
      'date': date.toIso8601String(),
      'status': status.toString().split('.').last,
      'remarks': remarks,
      'markedBy': markedBy,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

@HiveType(typeId: 11)
enum AttendanceStatus {
  @HiveField(0)
  present,
  
  @HiveField(1)
  absent,
  
  @HiveField(2)
  late,
  
  @HiveField(3)
  excused,
}

extension AttendanceStatusExtension on AttendanceStatus {
  String get displayName {
    switch (this) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.late:
        return 'Late';
      case AttendanceStatus.excused:
        return 'Excused';
    }
  }
  
  String get shortName {
    switch (this) {
      case AttendanceStatus.present:
        return 'P';
      case AttendanceStatus.absent:
        return 'A';
      case AttendanceStatus.late:
        return 'L';
      case AttendanceStatus.excused:
        return 'E';
    }
  }
}