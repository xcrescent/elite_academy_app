import 'package:hive_flutter/hive_flutter.dart';

part 'exam_model.g.dart';

@HiveType(typeId: 29)
class ExamModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String description;
  
  @HiveField(3)
  ExamType examType;
  
  @HiveField(4)
  String subjectId;
  
  @HiveField(5)
  String subjectName;
  
  @HiveField(6)
  String classId;
  
  @HiveField(7)
  String className;
  
  @HiveField(8)
  DateTime startDate;
  
  @HiveField(9)
  DateTime endDate;
  
  @HiveField(10)
  int duration; // in minutes
  
  @HiveField(11)
  int totalMarks;
  
  @HiveField(12)
  int passingMarks;
  
  @HiveField(13)
  ExamStatus status;
  
  @HiveField(14)
  String createdBy;
  
  @HiveField(15)
  DateTime createdAt;
  
  @HiveField(16)
  DateTime? updatedAt;
  
  @HiveField(17)
  String? instructions;
  
  @HiveField(18)
  List<String>? syllabusTopics;
  
  @HiveField(19)
  bool isPublished;
  
  @HiveField(20)
  DateTime? resultsPublishedAt;

  ExamModel({
    this.id,
    required this.name,
    required this.description,
    required this.examType,
    required this.subjectId,
    required this.subjectName,
    required this.classId,
    required this.className,
    required this.startDate,
    required this.endDate,
    this.duration = 180,
    required this.totalMarks,
    required this.passingMarks,
    this.status = ExamStatus.scheduled,
    required this.createdBy,
    required this.createdAt,
    this.updatedAt,
    this.instructions,
    this.syllabusTopics,
    this.isPublished = false,
    this.resultsPublishedAt,
  });

  bool get isUpcoming => DateTime.now().isBefore(startDate);
  bool get isOngoing => DateTime.now().isAfter(startDate) && DateTime.now().isBefore(endDate);
  bool get isCompleted => DateTime.now().isAfter(endDate);
  
  Duration get timeUntilStart => startDate.difference(DateTime.now());
  Duration get timeUntilEnd => endDate.difference(DateTime.now());

  factory ExamModel.fromMap(Map<String, dynamic> map) {
    return ExamModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      examType: ExamType.values.firstWhere(
        (e) => e.toString().split('.').last == map['examType'],
        orElse: () => ExamType.unit,
      ),
      subjectId: map['subjectId'],
      subjectName: map['subjectName'],
      classId: map['classId'],
      className: map['className'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      duration: map['duration'] ?? 180,
      totalMarks: map['totalMarks'],
      passingMarks: map['passingMarks'],
      status: ExamStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => ExamStatus.scheduled,
      ),
      createdBy: map['createdBy'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      instructions: map['instructions'],
      syllabusTopics: map['syllabusTopics'] != null 
          ? List<String>.from(map['syllabusTopics'])
          : null,
      isPublished: map['isPublished'] ?? false,
      resultsPublishedAt: map['resultsPublishedAt'] != null 
          ? DateTime.parse(map['resultsPublishedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'examType': examType.toString().split('.').last,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'classId': classId,
      'className': className,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'duration': duration,
      'totalMarks': totalMarks,
      'passingMarks': passingMarks,
      'status': status.toString().split('.').last,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'instructions': instructions,
      'syllabusTopics': syllabusTopics,
      'isPublished': isPublished,
      'resultsPublishedAt': resultsPublishedAt?.toIso8601String(),
    };
  }
}

@HiveType(typeId: 30)
enum ExamType {
  @HiveField(0)
  quiz,
  
  @HiveField(1)
  unit,
  
  @HiveField(2)
  midterm,
  
  @HiveField(3)
  final_exam,
  
  @HiveField(4)
  practical,
  
  @HiveField(5)
  oral,
  
  @HiveField(6)
  project,
}

@HiveType(typeId: 31)
enum ExamStatus {
  @HiveField(0)
  draft,
  
  @HiveField(1)
  scheduled,
  
  @HiveField(2)
  ongoing,
  
  @HiveField(3)
  completed,
  
  @HiveField(4)
  cancelled,
  
  @HiveField(5)
  results_published,
}

@HiveType(typeId: 32)
class ExamResultModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String examId;
  
  @HiveField(2)
  String studentId;
  
  @HiveField(3)
  String studentName;
  
  @HiveField(4)
  double marksObtained;
  
  @HiveField(5)
  double totalMarks;
  
  @HiveField(6)
  String grade;
  
  @HiveField(7)
  double percentage;
  
  @HiveField(8)
  ExamResultStatus status;
  
  @HiveField(9)
  String? remarks;
  
  @HiveField(10)
  DateTime? examDate;
  
  @HiveField(11)
  int? rank;
  
  @HiveField(12)
  bool isPassed;
  
  @HiveField(13)
  DateTime createdAt;
  
  @HiveField(14)
  String gradedBy;

  ExamResultModel({
    this.id,
    required this.examId,
    required this.studentId,
    required this.studentName,
    required this.marksObtained,
    required this.totalMarks,
    required this.grade,
    required this.percentage,
    this.status = ExamResultStatus.graded,
    this.remarks,
    this.examDate,
    this.rank,
    required this.isPassed,
    required this.createdAt,
    required this.gradedBy,
  });

  factory ExamResultModel.fromMap(Map<String, dynamic> map) {
    return ExamResultModel(
      id: map['id'],
      examId: map['examId'],
      studentId: map['studentId'],
      studentName: map['studentName'],
      marksObtained: map['marksObtained'].toDouble(),
      totalMarks: map['totalMarks'].toDouble(),
      grade: map['grade'],
      percentage: map['percentage'].toDouble(),
      status: ExamResultStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => ExamResultStatus.graded,
      ),
      remarks: map['remarks'],
      examDate: map['examDate'] != null ? DateTime.parse(map['examDate']) : null,
      rank: map['rank'],
      isPassed: map['isPassed'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
      gradedBy: map['gradedBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'examId': examId,
      'studentId': studentId,
      'studentName': studentName,
      'marksObtained': marksObtained,
      'totalMarks': totalMarks,
      'grade': grade,
      'percentage': percentage,
      'status': status.toString().split('.').last,
      'remarks': remarks,
      'examDate': examDate?.toIso8601String(),
      'rank': rank,
      'isPassed': isPassed,
      'createdAt': createdAt.toIso8601String(),
      'gradedBy': gradedBy,
    };
  }
}

@HiveType(typeId: 33)
enum ExamResultStatus {
  @HiveField(0)
  pending,
  
  @HiveField(1)
  graded,
  
  @HiveField(2)
  published,
  
  @HiveField(3)
  disputed,
}

extension ExamTypeExtension on ExamType {
  String get displayName {
    switch (this) {
      case ExamType.quiz:
        return 'Quiz';
      case ExamType.unit:
        return 'Unit Test';
      case ExamType.midterm:
        return 'Mid-term Exam';
      case ExamType.final_exam:
        return 'Final Exam';
      case ExamType.practical:
        return 'Practical Exam';
      case ExamType.oral:
        return 'Oral Exam';
      case ExamType.project:
        return 'Project Evaluation';
    }
  }
  
  String get icon {
    switch (this) {
      case ExamType.quiz:
        return '❓';
      case ExamType.unit:
        return '📝';
      case ExamType.midterm:
        return '📊';
      case ExamType.final_exam:
        return '🎓';
      case ExamType.practical:
        return '🔬';
      case ExamType.oral:
        return '🗣️';
      case ExamType.project:
        return '📋';
    }
  }
}