import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../auth/phone/repository/user_repository.dart';
import '../model/grade_model.dart';
import '../repository/grade_repository.dart';

// Sample data provider - replace with real Firebase integration
final gradeListPod = FutureProvider<List<GradeModel>>((ref) async {
  // Simulate loading delay
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    GradeModel(
      id: '1',
      studentId: 'student1',
      studentName: 'John Doe',
      subjectId: 'math101',
      subjectName: 'Mathematics',
      classId: 'class10a',
      className: 'Class 10-A',
      examType: 'Quiz',
      marksObtained: 85,
      totalMarks: 100,
      examDate: DateTime.now().subtract(const Duration(days: 5)),
      gradedBy: 'Dr. Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    GradeModel(
      id: '2',
      studentId: 'student1',
      studentName: 'John Doe',
      subjectId: 'phy101',
      subjectName: 'Physics',
      classId: 'class10a',
      className: 'Class 10-A',
      examType: 'Assignment',
      marksObtained: 92,
      totalMarks: 100,
      examDate: DateTime.now().subtract(const Duration(days: 3)),
      gradedBy: 'Dr. Johnson',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    GradeModel(
      id: '3',
      studentId: 'student2',
      studentName: 'Jane Smith',
      subjectId: 'math101',
      subjectName: 'Mathematics',
      classId: 'class10a',
      className: 'Class 10-A',
      examType: 'Midterm',
      marksObtained: 78,
      totalMarks: 100,
      examDate: DateTime.now().subtract(const Duration(days: 7)),
      gradedBy: 'Dr. Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];
});

final subjectListPod = FutureProvider<List<SubjectModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
  
  return [
    SubjectModel(
      id: 'math101',
      name: 'Mathematics',
      code: 'MATH101',
      description: 'Basic Mathematics for Grade 10',
      creditHours: 4,
      facultyId: 'faculty1',
      facultyName: 'Dr. Smith',
      classIds: ['class10a', 'class10b'],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    SubjectModel(
      id: 'phy101',
      name: 'Physics',
      code: 'PHY101',
      description: 'Introduction to Physics',
      creditHours: 4,
      facultyId: 'faculty2',
      facultyName: 'Dr. Johnson',
      classIds: ['class10a', 'class10b'],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    SubjectModel(
      id: 'chem101',
      name: 'Chemistry',
      code: 'CHEM101',
      description: 'Basic Chemistry',
      creditHours: 3,
      facultyId: 'faculty3',
      facultyName: 'Dr. Wilson',
      classIds: ['class10a'],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];
});

final gradeControllerProvider = 
    StateNotifierProvider<GradeController, GradeModel>((ref) {
  return GradeController();
});

final gradeLoadingPod = StateProvider<bool>((ref) => false);

class GradeController extends StateNotifier<GradeModel> {
  GradeController()
      : super(
          GradeModel(
            studentId: '',
            studentName: '',
            subjectId: '',
            subjectName: '',
            classId: '',
            className: '',
            examType: 'Quiz',
            marksObtained: 0,
            totalMarks: 100,
            examDate: DateTime.now(),
            gradedBy: '',
            createdAt: DateTime.now(),
          ),
        );

  void setStudent(String studentId, String studentName) {
    state = GradeModel(
      id: state.id,
      studentId: studentId,
      studentName: studentName,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      examType: state.examType,
      marksObtained: state.marksObtained,
      totalMarks: state.totalMarks,
      grade: state.grade,
      gpa: state.gpa,
      examDate: state.examDate,
      remarks: state.remarks,
      gradedBy: state.gradedBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  void setSubject(String subjectId, String subjectName) {
    state = GradeModel(
      id: state.id,
      studentId: state.studentId,
      studentName: state.studentName,
      subjectId: subjectId,
      subjectName: subjectName,
      classId: state.classId,
      className: state.className,
      examType: state.examType,
      marksObtained: state.marksObtained,
      totalMarks: state.totalMarks,
      grade: state.grade,
      gpa: state.gpa,
      examDate: state.examDate,
      remarks: state.remarks,
      gradedBy: state.gradedBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  void setExamType(String examType) {
    state = GradeModel(
      id: state.id,
      studentId: state.studentId,
      studentName: state.studentName,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      examType: examType,
      marksObtained: state.marksObtained,
      totalMarks: state.totalMarks,
      grade: state.grade,
      gpa: state.gpa,
      examDate: state.examDate,
      remarks: state.remarks,
      gradedBy: state.gradedBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  void setMarks(double marksObtained, double totalMarks) {
    state = GradeModel(
      id: state.id,
      studentId: state.studentId,
      studentName: state.studentName,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      examType: state.examType,
      marksObtained: marksObtained,
      totalMarks: totalMarks,
      grade: state.grade,
      gpa: state.gpa,
      examDate: state.examDate,
      remarks: state.remarks,
      gradedBy: state.gradedBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  void setExamDate(DateTime examDate) {
    state = GradeModel(
      id: state.id,
      studentId: state.studentId,
      studentName: state.studentName,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      examType: state.examType,
      marksObtained: state.marksObtained,
      totalMarks: state.totalMarks,
      grade: state.grade,
      gpa: state.gpa,
      examDate: examDate,
      remarks: state.remarks,
      gradedBy: state.gradedBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  void setRemarks(String remarks) {
    state = GradeModel(
      id: state.id,
      studentId: state.studentId,
      studentName: state.studentName,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      examType: state.examType,
      marksObtained: state.marksObtained,
      totalMarks: state.totalMarks,
      grade: state.grade,
      gpa: state.gpa,
      examDate: state.examDate,
      remarks: remarks,
      gradedBy: state.gradedBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  void reset() {
    state = GradeModel(
      studentId: '',
      studentName: '',
      subjectId: '',
      subjectName: '',
      classId: '',
      className: '',
      examType: 'Quiz',
      marksObtained: 0,
      totalMarks: 100,
      examDate: DateTime.now(),
      gradedBy: '',
      createdAt: DateTime.now(),
    );
  }
}