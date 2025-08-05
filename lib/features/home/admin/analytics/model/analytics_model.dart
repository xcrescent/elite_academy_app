import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'analytics_model.g.dart';

@HiveType(typeId: 92)
class DashboardMetrics extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  DateTime date;
  
  @HiveField(2)
  int totalStudents;
  
  @HiveField(3)
  int totalStaff;
  
  @HiveField(4)
  double totalRevenue;
  
  @HiveField(5)
  double totalExpenses;
  
  @HiveField(6)
  int admissions;
  
  @HiveField(7)
  double attendanceRate;
  
  @HiveField(8)
  int examsConducted;
  
  @HiveField(9)
  double averageMarks;
  
  @HiveField(10)
  int libraryBooks;
  
  @HiveField(11)
  int assetsCount;
  
  @HiveField(12)
  double transportUtilization;
  
  @HiveField(13)
  double hostelOccupancy;

  DashboardMetrics({
    this.id,
    required this.date,
    required this.totalStudents,
    required this.totalStaff,
    required this.totalRevenue,
    required this.totalExpenses,
    required this.admissions,
    required this.attendanceRate,
    required this.examsConducted,
    required this.averageMarks,
    required this.libraryBooks,
    required this.assetsCount,
    required this.transportUtilization,
    required this.hostelOccupancy,
  });

  double get profitMargin => totalRevenue > 0 ? ((totalRevenue - totalExpenses) / totalRevenue) * 100 : 0.0;
  double get netIncome => totalRevenue - totalExpenses;
  double get staffStudentRatio => totalStudents > 0 ? totalStaff / totalStudents : 0.0;

  factory DashboardMetrics.fromMap(Map<String, dynamic> map) {
    return DashboardMetrics(
      id: map['id'],
      date: DateTime.parse(map['date']),
      totalStudents: map['totalStudents'],
      totalStaff: map['totalStaff'],
      totalRevenue: map['totalRevenue'].toDouble(),
      totalExpenses: map['totalExpenses'].toDouble(),
      admissions: map['admissions'],
      attendanceRate: map['attendanceRate'].toDouble(),
      examsConducted: map['examsConducted'],
      averageMarks: map['averageMarks'].toDouble(),
      libraryBooks: map['libraryBooks'],
      assetsCount: map['assetsCount'],
      transportUtilization: map['transportUtilization'].toDouble(),
      hostelOccupancy: map['hostelOccupancy'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'totalStudents': totalStudents,
      'totalStaff': totalStaff,
      'totalRevenue': totalRevenue,
      'totalExpenses': totalExpenses,
      'admissions': admissions,
      'attendanceRate': attendanceRate,
      'examsConducted': examsConducted,
      'averageMarks': averageMarks,
      'libraryBooks': libraryBooks,
      'assetsCount': assetsCount,
      'transportUtilization': transportUtilization,
      'hostelOccupancy': hostelOccupancy,
    };
  }
}

@HiveType(typeId: 93)
class StudentAnalytics extends HiveObject {
  @HiveField(0)
  String classId;
  
  @HiveField(1)
  String className;
  
  @HiveField(2)
  int totalStudents;
  
  @HiveField(3)
  int maleStudents;
  
  @HiveField(4)
  int femaleStudents;
  
  @HiveField(5)
  double averageAttendance;
  
  @HiveField(6)
  double averageGrade;
  
  @HiveField(7)
  int passCount;
  
  @HiveField(8)
  int failCount;
  
  @HiveField(9)
  double feeCollection;
  
  @HiveField(10)
  double pendingFees;

  StudentAnalytics({
    required this.classId,
    required this.className,
    required this.totalStudents,
    required this.maleStudents,
    required this.femaleStudents,
    required this.averageAttendance,
    required this.averageGrade,
    required this.passCount,
    required this.failCount,
    required this.feeCollection,
    required this.pendingFees,
  });

  double get passPercentage => totalStudents > 0 ? (passCount / totalStudents) * 100 : 0.0;
  double get genderRatio => totalStudents > 0 ? maleStudents / totalStudents : 0.0;
  double get feeCollectionRate => (feeCollection + pendingFees) > 0 ? (feeCollection / (feeCollection + pendingFees)) * 100 : 0.0;

  factory StudentAnalytics.fromMap(Map<String, dynamic> map) {
    return StudentAnalytics(
      classId: map['classId'],
      className: map['className'],
      totalStudents: map['totalStudents'],
      maleStudents: map['maleStudents'],
      femaleStudents: map['femaleStudents'],
      averageAttendance: map['averageAttendance'].toDouble(),
      averageGrade: map['averageGrade'].toDouble(),
      passCount: map['passCount'],
      failCount: map['failCount'],
      feeCollection: map['feeCollection'].toDouble(),
      pendingFees: map['pendingFees'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'classId': classId,
      'className': className,
      'totalStudents': totalStudents,
      'maleStudents': maleStudents,
      'femaleStudents': femaleStudents,
      'averageAttendance': averageAttendance,
      'averageGrade': averageGrade,
      'passCount': passCount,
      'failCount': failCount,
      'feeCollection': feeCollection,
      'pendingFees': pendingFees,
    };
  }
}

@HiveType(typeId: 94)
class FinancialAnalytics extends HiveObject {
  @HiveField(0)
  String month;
  
  @HiveField(1)
  double tuitionFees;
  
  @HiveField(2)
  double transportFees;
  
  @HiveField(3)
  double hostelFees;
  
  @HiveField(4)
  double examFees;
  
  @HiveField(5)
  double otherIncome;
  
  @HiveField(6)
  double salaryExpenses;
  
  @HiveField(7)
  double utilityExpenses;
  
  @HiveField(8)
  double maintenanceExpenses;
  
  @HiveField(9)
  double suppliesExpenses;
  
  @HiveField(10)
  double otherExpenses;

  FinancialAnalytics({
    required this.month,
    required this.tuitionFees,
    required this.transportFees,
    required this.hostelFees,
    required this.examFees,
    required this.otherIncome,
    required this.salaryExpenses,
    required this.utilityExpenses,
    required this.maintenanceExpenses,
    required this.suppliesExpenses,
    required this.otherExpenses,
  });

  double get totalIncome => tuitionFees + transportFees + hostelFees + examFees + otherIncome;
  double get totalExpenses => salaryExpenses + utilityExpenses + maintenanceExpenses + suppliesExpenses + otherExpenses;
  double get netProfit => totalIncome - totalExpenses;
  double get profitMargin => totalIncome > 0 ? (netProfit / totalIncome) * 100 : 0.0;

  factory FinancialAnalytics.fromMap(Map<String, dynamic> map) {
    return FinancialAnalytics(
      month: map['month'],
      tuitionFees: map['tuitionFees'].toDouble(),
      transportFees: map['transportFees'].toDouble(),
      hostelFees: map['hostelFees'].toDouble(),
      examFees: map['examFees'].toDouble(),
      otherIncome: map['otherIncome'].toDouble(),
      salaryExpenses: map['salaryExpenses'].toDouble(),
      utilityExpenses: map['utilityExpenses'].toDouble(),
      maintenanceExpenses: map['maintenanceExpenses'].toDouble(),
      suppliesExpenses: map['suppliesExpenses'].toDouble(),
      otherExpenses: map['otherExpenses'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'month': month,
      'tuitionFees': tuitionFees,
      'transportFees': transportFees,
      'hostelFees': hostelFees,
      'examFees': examFees,
      'otherIncome': otherIncome,
      'salaryExpenses': salaryExpenses,
      'utilityExpenses': utilityExpenses,
      'maintenanceExpenses': maintenanceExpenses,
      'suppliesExpenses': suppliesExpenses,
      'otherExpenses': otherExpenses,
    };
  }
}

@HiveType(typeId: 95)
class AcademicAnalytics extends HiveObject {
  @HiveField(0)
  String subject;
  
  @HiveField(1)
  String className;
  
  @HiveField(2)
  double averageScore;
  
  @HiveField(3)
  double highestScore;
  
  @HiveField(4)
  double lowestScore;
  
  @HiveField(5)
  int studentsAppeared;
  
  @HiveField(6)
  int studentsAbsent;
  
  @HiveField(7)
  String examType;
  
  @HiveField(8)
  DateTime examDate;
  
  @HiveField(9)
  String difficulty;

  AcademicAnalytics({
    required this.subject,
    required this.className,
    required this.averageScore,
    required this.highestScore,
    required this.lowestScore,
    required this.studentsAppeared,
    required this.studentsAbsent,
    required this.examType,
    required this.examDate,
    required this.difficulty,
  });

  double get attendanceRate => (studentsAppeared + studentsAbsent) > 0 ? (studentsAppeared / (studentsAppeared + studentsAbsent)) * 100 : 0.0;
  String get gradeLevel {
    if (averageScore >= 90) return 'A+';
    if (averageScore >= 80) return 'A';
    if (averageScore >= 70) return 'B+';
    if (averageScore >= 60) return 'B';
    if (averageScore >= 50) return 'C';
    return 'F';
  }

  factory AcademicAnalytics.fromMap(Map<String, dynamic> map) {
    return AcademicAnalytics(
      subject: map['subject'],
      className: map['className'],
      averageScore: map['averageScore'].toDouble(),
      highestScore: map['highestScore'].toDouble(),
      lowestScore: map['lowestScore'].toDouble(),
      studentsAppeared: map['studentsAppeared'],
      studentsAbsent: map['studentsAbsent'],
      examType: map['examType'],
      examDate: DateTime.parse(map['examDate']),
      difficulty: map['difficulty'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'className': className,
      'averageScore': averageScore,
      'highestScore': highestScore,
      'lowestScore': lowestScore,
      'studentsAppeared': studentsAppeared,
      'studentsAbsent': studentsAbsent,
      'examType': examType,
      'examDate': examDate.toIso8601String(),
      'difficulty': difficulty,
    };
  }
}

// Data Models for Charts
class ChartDataPoint {
  final String label;
  final double value;
  final Color? color;

  ChartDataPoint({
    required this.label,
    required this.value,
    this.color,
  });
}

class TimeSeriesData {
  final DateTime date;
  final double value;
  final String category;

  TimeSeriesData({
    required this.date,
    required this.value,
    required this.category,
  });
}

class ComparisonData {
  final String category;
  final double current;
  final double previous;
  final double target;

  ComparisonData({
    required this.category,
    required this.current,
    required this.previous,
    required this.target,
  });

  double get growthRate => previous > 0 ? ((current - previous) / previous) * 100 : 0.0;
  double get targetAchievement => target > 0 ? (current / target) * 100 : 0.0;
}

// Enums for Analytics
@HiveType(typeId: 96)
enum AnalyticsPeriod {
  @HiveField(0)
  daily,
  
  @HiveField(1)
  weekly,
  
  @HiveField(2)
  monthly,
  
  @HiveField(3)
  quarterly,
  
  @HiveField(4)
  yearly,
}

@HiveType(typeId: 97)
enum ChartType {
  @HiveField(0)
  line,
  
  @HiveField(1)
  bar,
  
  @HiveField(2)
  pie,
  
  @HiveField(3)
  donut,
  
  @HiveField(4)
  area,
  
  @HiveField(5)
  scatter,
}

@HiveType(typeId: 98)
enum MetricTrend {
  @HiveField(0)
  increasing,
  
  @HiveField(1)
  decreasing,
  
  @HiveField(2)
  stable,
  
  @HiveField(3)
  volatile,
}

// Extensions
extension AnalyticsPeriodExtension on AnalyticsPeriod {
  String get displayName {
    switch (this) {
      case AnalyticsPeriod.daily:
        return 'Daily';
      case AnalyticsPeriod.weekly:
        return 'Weekly';
      case AnalyticsPeriod.monthly:
        return 'Monthly';
      case AnalyticsPeriod.quarterly:
        return 'Quarterly';
      case AnalyticsPeriod.yearly:
        return 'Yearly';
    }
  }

  int get dayCount {
    switch (this) {
      case AnalyticsPeriod.daily:
        return 1;
      case AnalyticsPeriod.weekly:
        return 7;
      case AnalyticsPeriod.monthly:
        return 30;
      case AnalyticsPeriod.quarterly:
        return 90;
      case AnalyticsPeriod.yearly:
        return 365;
    }
  }
}

extension MetricTrendExtension on MetricTrend {
  String get displayName {
    switch (this) {
      case MetricTrend.increasing:
        return 'Increasing';
      case MetricTrend.decreasing:
        return 'Decreasing';
      case MetricTrend.stable:
        return 'Stable';
      case MetricTrend.volatile:
        return 'Volatile';
    }
  }

  Color get color {
    switch (this) {
      case MetricTrend.increasing:
        return Colors.green;
      case MetricTrend.decreasing:
        return Colors.red;
      case MetricTrend.stable:
        return Colors.blue;
      case MetricTrend.volatile:
        return Colors.orange;
    }
  }

  IconData get icon {
    switch (this) {
      case MetricTrend.increasing:
        return Icons.trending_up;
      case MetricTrend.decreasing:
        return Icons.trending_down;
      case MetricTrend.stable:
        return Icons.trending_flat;
      case MetricTrend.volatile:
        return Icons.show_chart;
    }
  }
}