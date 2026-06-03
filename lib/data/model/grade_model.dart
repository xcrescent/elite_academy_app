import 'package:hive_flutter/hive_flutter.dart';

part 'grade_model.g.dart';

@HiveType(typeId: 14)
class GradeModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String studentId;
  
  @HiveField(2)
  String studentName;
  
  @HiveField(3)
  String subjectId;
  
  @HiveField(4)
  String subjectName;
  
  @HiveField(5)
  String classId;
  
  @HiveField(6)
  String className;
  
  @HiveField(7)
  String examType; // Quiz, Assignment, Midterm, Final, etc.
  
  @HiveField(8)
  double marksObtained;
  
  @HiveField(9)
  double totalMarks;
  
  @HiveField(10)
  String? grade; // A+, A, B+, etc.
  
  @HiveField(11)
  double? gpa; // 4.0 scale
  
  @HiveField(12)
  DateTime examDate;
  
  @HiveField(13)
  String? remarks;
  
  @HiveField(14)
  String gradedBy;
  
  @HiveField(15)
  DateTime createdAt;
  
  @HiveField(16)
  DateTime? updatedAt;

  GradeModel({
    this.id,
    required this.studentId,
    required this.studentName,
    required this.subjectId,
    required this.subjectName,
    required this.classId,
    required this.className,
    required this.examType,
    required this.marksObtained,
    required this.totalMarks,
    this.grade,
    this.gpa,
    required this.examDate,
    this.remarks,
    required this.gradedBy,
    required this.createdAt,
    this.updatedAt,
  });

  double get percentage => (marksObtained / totalMarks) * 100;

  String get calculatedGrade {
    if (grade != null) return grade!;
    
    final percent = percentage;
    if (percent >= 95) return 'A+';
    if (percent >= 90) return 'A';
    if (percent >= 85) return 'B+';
    if (percent >= 80) return 'B';
    if (percent >= 75) return 'C+';
    if (percent >= 70) return 'C';
    if (percent >= 65) return 'D+';
    if (percent >= 60) return 'D';
    return 'F';
  }

  double get calculatedGPA {
    if (gpa != null) return gpa!;
    
    final percent = percentage;
    if (percent >= 95) return 4.0;
    if (percent >= 90) return 3.7;
    if (percent >= 85) return 3.3;
    if (percent >= 80) return 3.0;
    if (percent >= 75) return 2.7;
    if (percent >= 70) return 2.3;
    if (percent >= 65) return 2.0;
    if (percent >= 60) return 1.7;
    return 0.0;
  }

  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['id'],
      studentId: map['studentId'],
      studentName: map['studentName'],
      subjectId: map['subjectId'],
      subjectName: map['subjectName'],
      classId: map['classId'],
      className: map['className'],
      examType: map['examType'],
      marksObtained: map['marksObtained'].toDouble(),
      totalMarks: map['totalMarks'].toDouble(),
      grade: map['grade'],
      gpa: map['gpa']?.toDouble(),
      examDate: DateTime.parse(map['examDate']),
      remarks: map['remarks'],
      gradedBy: map['gradedBy'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'classId': classId,
      'className': className,
      'examType': examType,
      'marksObtained': marksObtained,
      'totalMarks': totalMarks,
      'grade': grade,
      'gpa': gpa,
      'examDate': examDate.toIso8601String(),
      'remarks': remarks,
      'gradedBy': gradedBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

@HiveType(typeId: 15)
class SubjectModel extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String code; // MATH101, PHY201, etc.
  
  @HiveField(3)
  String? description;
  
  @HiveField(4)
  int creditHours;
  
  @HiveField(5)
  String? facultyId;
  
  @HiveField(6)
  String? facultyName;
  
  @HiveField(7)
  List<String> classIds;
  
  @HiveField(8)
  DateTime createdAt;

  SubjectModel({
    this.id,
    required this.name,
    required this.code,
    this.description,
    this.creditHours = 3,
    this.facultyId,
    this.facultyName,
    this.classIds = const [],
    required this.createdAt,
  });

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'],
      name: map['name'],
      code: map['code'],
      description: map['description'],
      creditHours: map['creditHours'] ?? 3,
      facultyId: map['facultyId'],
      facultyName: map['facultyName'],
      classIds: List<String>.from(map['classIds'] ?? []),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'creditHours': creditHours,
      'facultyId': facultyId,
      'facultyName': facultyName,
      'classIds': classIds,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}