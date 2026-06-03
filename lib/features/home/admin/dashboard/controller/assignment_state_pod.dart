import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/assignment_model.dart';

// Sample assignments provider - replace with Firebase integration
final assignmentListPod = FutureProvider<List<AssignmentModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    AssignmentModel(
      id: '1',
      title: 'Quadratic Equations Practice',
      description: 'Solve the given quadratic equations using different methods',
      subjectId: 'math101',
      subjectName: 'Mathematics',
      classId: 'class10a',
      className: 'Class 10-A',
      type: AssignmentType.homework,
      dueDate: DateTime.now().add(const Duration(days: 3)),
      totalMarks: 50,
      createdBy: 'Dr. Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      instructions: 'Show all working steps. Use at least two different methods for each equation.',
      allowLateSubmission: true,
      latePenaltyPercent: 10,
    ),
    AssignmentModel(
      id: '2',
      title: 'Physics Lab Report - Pendulum',
      description: 'Complete lab report on simple pendulum experiment',
      subjectId: 'phy101',
      subjectName: 'Physics',
      classId: 'class10a',
      className: 'Class 10-A',
      type: AssignmentType.lab,
      dueDate: DateTime.now().add(const Duration(days: 7)),
      totalMarks: 100,
      status: AssignmentStatus.active,
      createdBy: 'Dr. Johnson',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      instructions: 'Include all observations, calculations, and conclusions.',
    ),
    AssignmentModel(
      id: '3',
      title: 'Chemical Bonding Project',
      description: 'Create a presentation on different types of chemical bonds',
      subjectId: 'chem101',
      subjectName: 'Chemistry',
      classId: 'class10a',
      className: 'Class 10-A',
      type: AssignmentType.project,
      dueDate: DateTime.now().add(const Duration(days: 14)),
      totalMarks: 75,
      createdBy: 'Dr. Wilson',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      instructions: 'Present for 10 minutes. Include examples and real-world applications.',
    ),
    AssignmentModel(
      id: '4',
      title: 'Shakespeare Essay',
      description: 'Write an analytical essay on themes in Romeo and Juliet',
      subjectId: 'eng101',
      subjectName: 'English Literature',
      classId: 'class10a',
      className: 'Class 10-A',
      type: AssignmentType.essay,
      dueDate: DateTime.now().subtract(const Duration(days: 1)), // Overdue
      totalMarks: 60,
      status: AssignmentStatus.closed,
      createdBy: 'Ms. Davis',
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      instructions: 'Minimum 1500 words. Use MLA citation format.',
    ),
  ];
});

final submissionListPod = FutureProvider.family<List<StudentSubmissionModel>, String>((ref, assignmentId) async {
  await Future.delayed(const Duration(milliseconds: 500));
  
  // Sample submissions for assignment
  return [
    StudentSubmissionModel(
      id: '1',
      assignmentId: assignmentId,
      studentId: 'student1',
      studentName: 'John Doe',
      submittedAt: DateTime.now().subtract(const Duration(hours: 2)),
      submissionText: 'Here is my completed assignment...',
      status: SubmissionStatus.submitted,
    ),
    StudentSubmissionModel(
      id: '2',
      assignmentId: assignmentId,
      studentId: 'student2',
      studentName: 'Jane Smith',
      submittedAt: DateTime.now().subtract(const Duration(hours: 5)),
      submissionText: 'My solution to the problems...',
      status: SubmissionStatus.graded,
      marksAwarded: 85,
      feedback: 'Good work! Clear explanations.',
      gradedBy: 'Dr. Smith',
      gradedAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];
});

final assignmentControllerProvider = 
    StateNotifierProvider<AssignmentController, AssignmentModel>((ref) {
  return AssignmentController();
});

final assignmentLoadingPod = StateProvider<bool>((ref) => false);

class AssignmentController extends StateNotifier<AssignmentModel> {
  AssignmentController()
      : super(
          AssignmentModel(
            title: '',
            description: '',
            subjectId: '',
            subjectName: '',
            classId: '',
            className: '',
            type: AssignmentType.homework,
            dueDate: DateTime.now().add(const Duration(days: 7)),
            totalMarks: 100,
            createdBy: '',
            createdAt: DateTime.now(),
          ),
        );

  void setTitle(String title) {
    state = AssignmentModel(
      id: state.id,
      title: title,
      description: state.description,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      type: state.type,
      dueDate: state.dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: state.totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: state.instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: state.allowLateSubmission,
      latePenaltyPercent: state.latePenaltyPercent,
    );
  }

  void setDescription(String description) {
    state = AssignmentModel(
      id: state.id,
      title: state.title,
      description: description,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      type: state.type,
      dueDate: state.dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: state.totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: state.instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: state.allowLateSubmission,
      latePenaltyPercent: state.latePenaltyPercent,
    );
  }

  void setSubject(String subjectId, String subjectName) {
    state = AssignmentModel(
      id: state.id,
      title: state.title,
      description: state.description,
      subjectId: subjectId,
      subjectName: subjectName,
      classId: state.classId,
      className: state.className,
      type: state.type,
      dueDate: state.dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: state.totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: state.instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: state.allowLateSubmission,
      latePenaltyPercent: state.latePenaltyPercent,
    );
  }

  void setType(AssignmentType type) {
    state = AssignmentModel(
      id: state.id,
      title: state.title,
      description: state.description,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      type: type,
      dueDate: state.dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: state.totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: state.instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: state.allowLateSubmission,
      latePenaltyPercent: state.latePenaltyPercent,
    );
  }

  void setDueDate(DateTime dueDate) {
    state = AssignmentModel(
      id: state.id,
      title: state.title,
      description: state.description,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      type: state.type,
      dueDate: dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: state.totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: state.instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: state.allowLateSubmission,
      latePenaltyPercent: state.latePenaltyPercent,
    );
  }

  void setTotalMarks(int totalMarks) {
    state = AssignmentModel(
      id: state.id,
      title: state.title,
      description: state.description,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      type: state.type,
      dueDate: state.dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: state.instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: state.allowLateSubmission,
      latePenaltyPercent: state.latePenaltyPercent,
    );
  }

  void setInstructions(String? instructions) {
    state = AssignmentModel(
      id: state.id,
      title: state.title,
      description: state.description,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      type: state.type,
      dueDate: state.dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: state.totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: state.allowLateSubmission,
      latePenaltyPercent: state.latePenaltyPercent,
    );
  }

  void setAllowLateSubmission(bool allow, int? penaltyPercent) {
    state = AssignmentModel(
      id: state.id,
      title: state.title,
      description: state.description,
      subjectId: state.subjectId,
      subjectName: state.subjectName,
      classId: state.classId,
      className: state.className,
      type: state.type,
      dueDate: state.dueDate,
      submissionDeadline: state.submissionDeadline,
      totalMarks: state.totalMarks,
      status: state.status,
      createdBy: state.createdBy,
      createdAt: state.createdAt,
      updatedAt: DateTime.now(),
      instructions: state.instructions,
      attachmentUrls: state.attachmentUrls,
      allowLateSubmission: allow,
      latePenaltyPercent: penaltyPercent,
    );
  }

  void reset() {
    state = AssignmentModel(
      title: '',
      description: '',
      subjectId: '',
      subjectName: '',
      classId: '',
      className: '',
      type: AssignmentType.homework,
      dueDate: DateTime.now().add(const Duration(days: 7)),
      totalMarks: 100,
      createdBy: '',
      createdAt: DateTime.now(),
    );
  }
}