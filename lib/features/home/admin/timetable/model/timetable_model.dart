import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'timetable_model.g.dart';

@HiveType(typeId: 34)
class TimetableModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String classId;
  
  @HiveField(2)
  String className;
  
  @HiveField(3)
  String academicYear;
  
  @HiveField(4)
  String semester;
  
  @HiveField(5)
  List<TimetableSlotModel> timeSlots;
  
  @HiveField(6)
  DateTime createdAt;
  
  @HiveField(7)
  String createdBy;
  
  @HiveField(8)
  DateTime? updatedAt;
  
  @HiveField(9)
  bool isActive;

  TimetableModel({
    this.id,
    required this.classId,
    required this.className,
    required this.academicYear,
    this.semester = 'All',
    this.timeSlots = const [],
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
    this.isActive = true,
  });

  factory TimetableModel.fromMap(Map<String, dynamic> map) {
    return TimetableModel(
      id: map['id'],
      classId: map['classId'],
      className: map['className'],
      academicYear: map['academicYear'],
      semester: map['semester'] ?? 'All',
      timeSlots: (map['timeSlots'] as List?)
          ?.map((slot) => TimetableSlotModel.fromMap(slot))
          .toList() ?? [],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'],
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      isActive: map['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'classId': classId,
      'className': className,
      'academicYear': academicYear,
      'semester': semester,
      'timeSlots': timeSlots.map((slot) => slot.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
      'updatedAt': updatedAt?.toIso8601String(),
      'isActive': isActive,
    };
  }
}

@HiveType(typeId: 35)
class TimetableSlotModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  WeekDay dayOfWeek;
  
  @HiveField(2)
  int periodNumber;
  
  @HiveField(3)
  String startTime;
  
  @HiveField(4)
  String endTime;
  
  @HiveField(5)
  String subjectId;
  
  @HiveField(6)
  String subjectName;
  
  @HiveField(7)
  String subjectCode;
  
  @HiveField(8)
  String teacherId;
  
  @HiveField(9)
  String teacherName;
  
  @HiveField(10)
  String? roomNumber;
  
  @HiveField(11)
  SlotType slotType;
  
  @HiveField(12)
  bool isBreak;
  
  @HiveField(13)
  String? breakType;

  TimetableSlotModel({
    this.id,
    required this.dayOfWeek,
    required this.periodNumber,
    required this.startTime,
    required this.endTime,
    required this.subjectId,
    required this.subjectName,
    this.subjectCode = '',
    required this.teacherId,
    required this.teacherName,
    this.roomNumber,
    this.slotType = SlotType.regular,
    this.isBreak = false,
    this.breakType,
  });

  Duration get duration {
    final start = _parseTime(startTime);
    final end = _parseTime(endTime);
    return end.difference(start);
  }

  DateTime _parseTime(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(2023, 1, 1, hour, minute);
  }

  factory TimetableSlotModel.fromMap(Map<String, dynamic> map) {
    return TimetableSlotModel(
      id: map['id'],
      dayOfWeek: WeekDay.values.firstWhere(
        (e) => e.toString().split('.').last == map['dayOfWeek'],
        orElse: () => WeekDay.monday,
      ),
      periodNumber: map['periodNumber'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      subjectId: map['subjectId'],
      subjectName: map['subjectName'],
      subjectCode: map['subjectCode'] ?? '',
      teacherId: map['teacherId'],
      teacherName: map['teacherName'],
      roomNumber: map['roomNumber'],
      slotType: SlotType.values.firstWhere(
        (e) => e.toString().split('.').last == map['slotType'],
        orElse: () => SlotType.regular,
      ),
      isBreak: map['isBreak'] ?? false,
      breakType: map['breakType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dayOfWeek': dayOfWeek.toString().split('.').last,
      'periodNumber': periodNumber,
      'startTime': startTime,
      'endTime': endTime,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectCode': subjectCode,
      'teacherId': teacherId,
      'teacherName': teacherName,
      'roomNumber': roomNumber,
      'slotType': slotType.toString().split('.').last,
      'isBreak': isBreak,
      'breakType': breakType,
    };
  }
}

@HiveType(typeId: 36)
enum WeekDay {
  @HiveField(0)
  monday,
  
  @HiveField(1)
  tuesday,
  
  @HiveField(2)
  wednesday,
  
  @HiveField(3)
  thursday,
  
  @HiveField(4)
  friday,
  
  @HiveField(5)
  saturday,
  
  @HiveField(6)
  sunday,
}

@HiveType(typeId: 37)
enum SlotType {
  @HiveField(0)
  regular,
  
  @HiveField(1)
  laboratory,
  
  @HiveField(2)
  library,
  
  @HiveField(3)
  sports,
  
  @HiveField(4)
  assembly,
  
  @HiveField(5)
  study_hall,
}

@HiveType(typeId: 38)
class TeacherScheduleModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String teacherId;
  
  @HiveField(2)
  String teacherName;
  
  @HiveField(3)
  String department;
  
  @HiveField(4)
  List<ScheduleSlotModel> scheduleSlots;
  
  @HiveField(5)
  int maxPeriodsPerDay;
  
  @HiveField(6)
  List<String> availableDays;
  
  @HiveField(7)
  String? preferredTimeSlot;

  TeacherScheduleModel({
    this.id,
    required this.teacherId,
    required this.teacherName,
    required this.department,
    this.scheduleSlots = const [],
    this.maxPeriodsPerDay = 6,
    this.availableDays = const [],
    this.preferredTimeSlot,
  });

  int getPeriodsOnDay(WeekDay day) {
    return scheduleSlots.where((slot) => slot.dayOfWeek == day).length;
  }

  bool isAvailableAt(WeekDay day, String timeSlot) {
    return !scheduleSlots.any((slot) => 
      slot.dayOfWeek == day && 
      slot.startTime == timeSlot
    );
  }

  factory TeacherScheduleModel.fromMap(Map<String, dynamic> map) {
    return TeacherScheduleModel(
      id: map['id'],
      teacherId: map['teacherId'],
      teacherName: map['teacherName'],
      department: map['department'],
      scheduleSlots: (map['scheduleSlots'] as List?)
          ?.map((slot) => ScheduleSlotModel.fromMap(slot))
          .toList() ?? [],
      maxPeriodsPerDay: map['maxPeriodsPerDay'] ?? 6,
      availableDays: List<String>.from(map['availableDays'] ?? []),
      preferredTimeSlot: map['preferredTimeSlot'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teacherId': teacherId,
      'teacherName': teacherName,
      'department': department,
      'scheduleSlots': scheduleSlots.map((slot) => slot.toMap()).toList(),
      'maxPeriodsPerDay': maxPeriodsPerDay,
      'availableDays': availableDays,
      'preferredTimeSlot': preferredTimeSlot,
    };
  }
}

@HiveType(typeId: 39)
class ScheduleSlotModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  WeekDay dayOfWeek;
  
  @HiveField(2)
  int periodNumber;
  
  @HiveField(3)
  String startTime;
  
  @HiveField(4)
  String endTime;
  
  @HiveField(5)
  String classId;
  
  @HiveField(6)
  String className;
  
  @HiveField(7)
  String subjectId;
  
  @HiveField(8)
  String subjectName;
  
  @HiveField(9)
  String? roomNumber;

  ScheduleSlotModel({
    this.id,
    required this.dayOfWeek,
    required this.periodNumber,
    required this.startTime,
    required this.endTime,
    required this.classId,
    required this.className,
    required this.subjectId,
    required this.subjectName,
    this.roomNumber,
  });

  factory ScheduleSlotModel.fromMap(Map<String, dynamic> map) {
    return ScheduleSlotModel(
      id: map['id'],
      dayOfWeek: WeekDay.values.firstWhere(
        (e) => e.toString().split('.').last == map['dayOfWeek'],
        orElse: () => WeekDay.monday,
      ),
      periodNumber: map['periodNumber'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      classId: map['classId'],
      className: map['className'],
      subjectId: map['subjectId'],
      subjectName: map['subjectName'],
      roomNumber: map['roomNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dayOfWeek': dayOfWeek.toString().split('.').last,
      'periodNumber': periodNumber,
      'startTime': startTime,
      'endTime': endTime,
      'classId': classId,
      'className': className,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'roomNumber': roomNumber,
    };
  }
}

extension WeekDayExtension on WeekDay {
  String get displayName {
    switch (this) {
      case WeekDay.monday:
        return 'Monday';
      case WeekDay.tuesday:
        return 'Tuesday';
      case WeekDay.wednesday:
        return 'Wednesday';
      case WeekDay.thursday:
        return 'Thursday';
      case WeekDay.friday:
        return 'Friday';
      case WeekDay.saturday:
        return 'Saturday';
      case WeekDay.sunday:
        return 'Sunday';
    }
  }

  String get shortName {
    switch (this) {
      case WeekDay.monday:
        return 'Mon';
      case WeekDay.tuesday:
        return 'Tue';
      case WeekDay.wednesday:
        return 'Wed';
      case WeekDay.thursday:
        return 'Thu';
      case WeekDay.friday:
        return 'Fri';
      case WeekDay.saturday:
        return 'Sat';
      case WeekDay.sunday:
        return 'Sun';
    }
  }
}

extension SlotTypeExtension on SlotType {
  String get displayName {
    switch (this) {
      case SlotType.regular:
        return 'Regular Class';
      case SlotType.laboratory:
        return 'Laboratory';
      case SlotType.library:
        return 'Library';
      case SlotType.sports:
        return 'Sports';
      case SlotType.assembly:
        return 'Assembly';
      case SlotType.study_hall:
        return 'Study Hall';
    }
  }

  String get icon {
    switch (this) {
      case SlotType.regular:
        return '📚';
      case SlotType.laboratory:
        return '🧪';
      case SlotType.library:
        return '📖';
      case SlotType.sports:
        return '⚽';
      case SlotType.assembly:
        return '🏛️';
      case SlotType.study_hall:
        return '📝';
    }
  }

  Color get color {
    switch (this) {
      case SlotType.regular:
        return const Color(0xFF2196F3);
      case SlotType.laboratory:
        return const Color(0xFF9C27B0);
      case SlotType.library:
        return const Color(0xFF4CAF50);
      case SlotType.sports:
        return const Color(0xFFFF5722);
      case SlotType.assembly:
        return const Color(0xFF795548);
      case SlotType.study_hall:
        return const Color(0xFF607D8B);
    }
  }
}