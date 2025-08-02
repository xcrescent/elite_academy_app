import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/bootstrap.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/features/auth/phone/model/user_model.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/student_model.dart';
import 'package:flutter/foundation.dart';
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

  Future<List<StudentModel>> getAllStudent(String orgId) async {
    // Fetching students for orgId: $orgId
    var docs = await _fireStore
        .collection(Constants.users)
        .where("role", isEqualTo: "student")
        .where("orgId", isEqualTo: orgId)
        .get();
    if (docs.docs.isNotEmpty) {
      return docs.docs
          .map(
            (e) => StudentModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    } else {
      return [];
    }
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

  Future<bool> addStudent(StudentModel studentModel, String password) async {
    var x = _fireStore.collection(Constants.users).doc();
    UserModel userModel = UserModel(
      name: studentModel.name,
      phoneNumber: studentModel.phoneNumber,
      role: "student",
      orgId: studentModel.orgId,
      uid: x.id,
      email:
          '${'${studentModel.name}@${studentModel.orgId}'}.eliteacademy.co.in',
      batchId: studentModel.batchId,
      enrollmentNumber: studentModel.enrollmentNumber,
      address: studentModel.address,
      whatsappNumber: studentModel.whatsappNumber,
      dateOfBirth: studentModel.dateOfBirth,
      password: password,
      photoUrl: "",
    );

    try {
      await x.set(userModel.toMap());
      return true;
    } catch (e) {
      // Log error with talker for debugging
      if (kDebugMode) {
        talker.error('Failed to add student: $e');
      }
      return false;
    }
  }

  Future<bool> updateStudent(StudentModel studentModel) async {
    try {
      await _fireStore
          .collection(Constants.users)
          .doc(studentModel.id)
          .update(studentModel.toMap());
      return true;
    } catch (e) {
      // Log error with talker for debugging
      if (kDebugMode) {
        talker.error('Failed to update student: $e');
      }
      return false;
    }
  }

  Future<void> deleteStudent(StudentModel studentModel) async {
    await _fireStore.collection(Constants.users).doc(studentModel.id).delete();
  }
}
