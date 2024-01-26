import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/student_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentNotifier extends StateNotifier<List<StudentModel>> {
  var _orgId;

  StudentNotifier() : super([]) {
    loadStudents(_orgId);
  }

  final studentsBox = Hive.box<StudentModel>('studentsBox');

  final studentsCollection = FirebaseFirestore.instance.collection('students');

  void loadStudents(orgId) async {
    // Load students from Hive
    List<StudentModel> localStudents = studentsBox.values.toList();
    state = localStudents;

    // Load students from Firestore and update Hive using orgId
    studentsCollection
        .where(
          'orgId',
          isEqualTo: orgId,
        )
        .snapshots()
        .listen((snapshot) {
      List<StudentModel> remoteStudents =
          snapshot.docs.map((doc) => StudentModel.fromMap(doc.data())).toList();

      // Update local Hive cache
      for (StudentModel student in remoteStudents) {
        studentsBox.put(student.id, student);
      }

      // Update state
      state = remoteStudents;
    });
  }

  Future<void> addStudent(StudentModel student) async {
    // Create a new document reference with auto-generated ID
    DocumentReference docRef = studentsCollection.doc();

    // Make sure to add the generated ID to your student object if it's needed
    student.id = docRef.id;

    // Save to Firestore with auto-generated ID
    await docRef.set(student.toMap());

    // Save to Hive with the same ID from Firestore
    await studentsBox.put(student.id, student);

    // Update state
    state = [...state, student];
  }

// You can also implement updateStudent and deleteStudent similarly.

  Future<void> updateStudent(StudentModel student) async {
    // Update Firestore
    await studentsCollection.doc(student.id).update(student.toMap());

    // Update Hive
    await studentsBox.put(student.id, student);

    state = state.map((s) => s.id == student.id ? student : s).toList();
  }

  Future<void> deleteStudent(StudentModel student) async {
    // Delete from Firestore
    await studentsCollection.doc(student.id).delete();

    // Delete from Hive
    await studentsBox.delete(student.id);

    state = state.where((s) => s.id != student.id).toList();
  }
}
