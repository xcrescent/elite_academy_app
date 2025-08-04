import 'package:hive_flutter/hive_flutter.dart';

part 'assignment_model.g.dart';

@HiveType(typeId: 16)
class AssignmentModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String title;
  
  @HiveField(2)
  String description;
  
  @HiveField(3)
  String subjectId;
  
  @HiveField(4)
  String subjectName;
  
  @HiveField(5)
  String classId;
  
  @HiveField(6)
  String className;
  
  @HiveField(7)
  AssignmentType type;
  
  @HiveField(8)
  DateTime dueDate;
  
  @HiveField(9)
  DateTime? submissionDeadline;
  
  @HiveField(10)
  int totalMarks;
  
  @HiveField(11)
  AssignmentStatus status;
  
  @HiveField(12)
  String createdBy;
  
  @HiveField(13)
  DateTime createdAt;
  
  @HiveField(14)
  DateTime? updatedAt;
  
  @HiveField(15)
  String? instructions;
  
  @HiveField(16)
  List<String>? attachmentUrls;
  
  @HiveField(17)
  bool allowLateSubmission;
  
  @HiveField(18)
  int? latePenaltyPercent;

  AssignmentModel({
    this.id,
    required this.title,
    required this.description,
    required this.subjectId,
    required this.subjectName,
    required this.classId,
    required this.className,
    required this.type,
    required this.dueDate,
    this.submissionDeadline,
    required this.totalMarks,
    this.status = AssignmentStatus.active,
    required this.createdBy,
    required this.createdAt,
    this.updatedAt,
    this.instructions,
    this.attachmentUrls,
    this.allowLateSubmission = false,
    this.latePenaltyPercent,
  });

  bool get isOverdue => DateTime.now().isAfter(dueDate);
  
  Duration get timeLeft => dueDate.difference(DateTime.now());
  
  String get timeLeftFormatted {
    if (isOverdue) return 'Overdue';
    
    final days = timeLeft.inDays;
    final hours = timeLeft.inHours % 24;
    
    if (days > 0) {
      return '$days day${days == 1 ? '' : 's'} left';
    } else if (hours > 0) {
      return '$hours hour${hours == 1 ? '' : 's'} left';
    } else {
      return 'Due soon';
    }
  }

  factory AssignmentModel.fromMap(Map<String, dynamic> map) {
    return AssignmentModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      subjectId: map['subjectId'],
      subjectName: map['subjectName'],
      classId: map['classId'],
      className: map['className'],
      type: AssignmentType.values.firstWhere(
        (e) => e.toString().split('.').last == map['type'],
        orElse: () => AssignmentType.homework,
      ),
      dueDate: DateTime.parse(map['dueDate']),
      submissionDeadline: map['submissionDeadline'] != null 
          ? DateTime.parse(map['submissionDeadline']) 
          : null,
      totalMarks: map['totalMarks'],
      status: AssignmentStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => AssignmentStatus.active,
      ),
      createdBy: map['createdBy'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      instructions: map['instructions'],
      attachmentUrls: map['attachmentUrls'] != null 
          ? List<String>.from(map['attachmentUrls']) 
          : null,
      allowLateSubmission: map['allowLateSubmission'] ?? false,
      latePenaltyPercent: map['latePenaltyPercent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'classId': classId,
      'className': className,
      'type': type.toString().split('.').last,
      'dueDate': dueDate.toIso8601String(),
      'submissionDeadline': submissionDeadline?.toIso8601String(),
      'totalMarks': totalMarks,
      'status': status.toString().split('.').last,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'instructions': instructions,
      'attachmentUrls': attachmentUrls,
      'allowLateSubmission': allowLateSubmission,
      'latePenaltyPercent': latePenaltyPercent,
    };
  }
}

@HiveType(typeId: 17)
enum AssignmentType {
  @HiveField(0)
  homework,
  
  @HiveField(1)
  project,
  
  @HiveField(2)
  lab,
  
  @HiveField(3)
  essay,
  
  @HiveField(4)
  research,
  
  @HiveField(5)
  presentation,
}

@HiveType(typeId: 18)
enum AssignmentStatus {
  @HiveField(0)
  draft,
  
  @HiveField(1)
  active,
  
  @HiveField(2)
  closed,
  
  @HiveField(3)
  graded,
}

@HiveType(typeId: 19)
class StudentSubmissionModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String assignmentId;
  
  @HiveField(2)
  String studentId;
  
  @HiveField(3)
  String studentName;
  
  @HiveField(4)
  DateTime submittedAt;
  
  @HiveField(5)
  String? submissionText;
  
  @HiveField(6)
  List<String>? attachmentUrls;
  
  @HiveField(7)
  SubmissionStatus status;
  
  @HiveField(8)
  double? marksAwarded;
  
  @HiveField(9)
  String? feedback;
  
  @HiveField(10)
  String? gradedBy;
  
  @HiveField(11)
  DateTime? gradedAt;
  
  @HiveField(12)
  bool isLate;

  StudentSubmissionModel({
    this.id,
    required this.assignmentId,
    required this.studentId,
    required this.studentName,
    required this.submittedAt,
    this.submissionText,
    this.attachmentUrls,
    this.status = SubmissionStatus.submitted,
    this.marksAwarded,
    this.feedback,
    this.gradedBy,
    this.gradedAt,
    this.isLate = false,
  });

  factory StudentSubmissionModel.fromMap(Map<String, dynamic> map) {
    return StudentSubmissionModel(
      id: map['id'],
      assignmentId: map['assignmentId'],
      studentId: map['studentId'],
      studentName: map['studentName'],
      submittedAt: DateTime.parse(map['submittedAt']),
      submissionText: map['submissionText'],
      attachmentUrls: map['attachmentUrls'] != null 
          ? List<String>.from(map['attachmentUrls']) 
          : null,
      status: SubmissionStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => SubmissionStatus.submitted,
      ),
      marksAwarded: map['marksAwarded']?.toDouble(),
      feedback: map['feedback'],
      gradedBy: map['gradedBy'],
      gradedAt: map['gradedAt'] != null ? DateTime.parse(map['gradedAt']) : null,
      isLate: map['isLate'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'assignmentId': assignmentId,
      'studentId': studentId,
      'studentName': studentName,
      'submittedAt': submittedAt.toIso8601String(),
      'submissionText': submissionText,
      'attachmentUrls': attachmentUrls,
      'status': status.toString().split('.').last,
      'marksAwarded': marksAwarded,
      'feedback': feedback,
      'gradedBy': gradedBy,
      'gradedAt': gradedAt?.toIso8601String(),
      'isLate': isLate,
    };
  }
}

@HiveType(typeId: 20)
enum SubmissionStatus {
  @HiveField(0)
  submitted,
  
  @HiveField(1)
  graded,
  
  @HiveField(2)
  returned,
  
  @HiveField(3)
  resubmitted,
}

extension AssignmentTypeExtension on AssignmentType {
  String get displayName {
    switch (this) {
      case AssignmentType.homework:
        return 'Homework';
      case AssignmentType.project:
        return 'Project';
      case AssignmentType.lab:
        return 'Lab Work';
      case AssignmentType.essay:
        return 'Essay';
      case AssignmentType.research:
        return 'Research';
      case AssignmentType.presentation:
        return 'Presentation';
    }
  }
  
  String get icon {
    switch (this) {
      case AssignmentType.homework:
        return '📝';
      case AssignmentType.project:
        return '🔬';
      case AssignmentType.lab:
        return '🧪';
      case AssignmentType.essay:
        return '📄';
      case AssignmentType.research:
        return '🔍';
      case AssignmentType.presentation:
        return '📊';
    }
  }
}