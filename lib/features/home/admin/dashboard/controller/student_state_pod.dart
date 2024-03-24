import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../auth/phone/repository/user_repository.dart';
import '../model/student_model.dart';
import '../repository/student_repository.dart';

final studentControllerProvider =
    StateNotifierProvider<StudentController, StudentModel>((ref) {
  var x = ref.read(userRepositoryProvider).getOrgId();
  return StudentController(x);
});

final studentListPod = FutureProvider<List<StudentModel>>(
  (ref) async {
    return await ref
        .read(studentRepositoryProvider)
        .getAllStudent(await ref.read(userRepositoryProvider).getOrgId());
  },
);

final passStudentIdPod = StateProvider<String>((ref) {
  return "";
});

class StudentController extends StateNotifier<StudentModel> {
  StudentController(Future<String> x)
      : super(
          StudentModel(
            name: "",
            phoneNumber: "",
            orgId: "",
            whatsappNumber: "",
          ),
        ) {
    x.then((value) => state.orgId = value);
  }

  void setFirstName(String name) {
    state.name = name;
  }

  void setPhoneNumber(String phoneNumber) {
    state.phoneNumber = phoneNumber;
  }

  void setOrgId(String orgId) {
    state.orgId = orgId;
  }

  void setStudentId(String studentId) {
    state.id = studentId;
  }

  void setWhatsappNumber(String whatsappNumber) {
    state.whatsappNumber = whatsappNumber;
  }

  void setBatchId(String batchId) {
    state.batchId = batchId;
  }

  void setEnrollmentNumber(String enrollmentNumber) {
    state.enrollmentNumber = enrollmentNumber;
  }

  void setDateOfBirth(DateTime dateOfBirth) {
    state.dateOfBirth = dateOfBirth;
  }

  void setEmail(String username) {
    state.email = username;
  }

  void setAddress(String address) {
    state.address = address;
  }

  void reset() {
    state = StudentModel(
      name: "",
      phoneNumber: "",
      orgId: "",
      whatsappNumber: "",
    );
  }
}
