import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/student_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../const/constants.dart';

final studentRepositoryProvider = Provider(
  (ref) => StudentRepository(
    fireStore: ref.read(firestoreProvider),
  ),
);

class StudentRepository {
  StudentRepository({
    required FirebaseFirestore fireStore,
  }) : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;

  Future<List<StudentModel>> getAllStudent() async {
    return await _fireStore.collection(Constants.users).get().then((value) {
      return value.docs
          .map(
            (e) => StudentModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    });
  }

  Future<StudentModel> getStudentById(String studentId) async {
    return await _fireStore
        .collection(Constants.users)
        .doc(studentId)
        .get()
        .then((value) {
      return StudentModel.fromMap(value.data()!);
    });
  }

  Future<void> addStudent(StudentModel studentModel) async {
    await _fireStore
        .collection(Constants.users)
        .doc()
        .set(studentModel.toMap());
  }

  Future<void> updateStudent(StudentModel studentModel) async {
    await _fireStore
        .collection(Constants.users)
        .doc(studentModel.id)
        .update(studentModel.toMap());
  }

  Future<void> deleteStudent(StudentModel studentModel) async {
    await _fireStore.collection(Constants.users).doc(studentModel.id).delete();
  }
}
