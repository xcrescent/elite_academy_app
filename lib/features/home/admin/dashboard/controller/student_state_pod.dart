import 'package:elite_academy/data/model/student_model.dart';
import 'package:elite_academy/data/repository/student_repository.dart';
import 'package:elite_academy/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentDOBControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final studentListPod = FutureProvider<List<StudentModel>>(
  (ref) async {
    try {
      final orgId = await ref.read(userRepositoryProvider).getOrgId();

      return await ref.read(studentRepositoryProvider).getAllStudent(orgId);
    } catch (e) {
      rethrow;
    }
  },
);

final passStudentIdPod = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

// final studentControllerProvider = StateNotifierProvider<StudentController, StudentModel>((ref) {
//   var x = ref.read(userRepositoryProvider).getOrgId();
//   return StudentController(x);
// });
