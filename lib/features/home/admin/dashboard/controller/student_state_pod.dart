import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../auth/phone/repository/user_repository.dart';
import '../model/student_model.dart';

final studentControllerProvider =
    StateNotifierProvider<StudentController, StudentModel>((ref) {
  var x = ref.read(userRepositoryProvider).getOrgId();
  return StudentController(x);
});

class StudentController extends StateNotifier<StudentModel> {
  StudentController(Future<String> x)
      : super(
          StudentModel(
            firstName: "",
            lastName: "",
            phoneNumber: "",
            orgId: "",
          ),
        ) {
    x.then((value) => state.orgId = value);
  }

  void setFirstName(String firstName) {
    state.firstName = firstName;
  }

  void setLastName(String lastName) {
    state.lastName = lastName;
  }

  void setPhoneNumber(String phoneNumber) {
    state.phoneNumber = phoneNumber;
  }

  void setBatchId(String batchId) {
    state.batchId = batchId;
  }

  void setEnrollmentNumber(String enrollmentNumber) {
    state.enrollmentNumber = enrollmentNumber;
  }
}
