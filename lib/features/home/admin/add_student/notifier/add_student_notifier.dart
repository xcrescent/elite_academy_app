import 'package:elite_academy/data/model/student_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_student_notifier.g.dart';

@riverpod
class AddStudentNotifier extends _$AddStudentNotifier {
  // StudentController(Future<String> x)
  //     : super(
  //         StudentModel(
  //           name: "",
  //           phoneNumber: "",
  //           orgId: "",
  //           whatsappNumber: "",
  //           userName: "",
  //           address: "",
  //           email: "",
  //           enrollmentNumber: "",
  //           batchId: "",
  //           dateOfBirth: DateTime.now(),
  //           id: "",
  //           stream: "",
  //           studyIn: "",
  //         ),
  //       ) {
  //   x.then((value) => state.orgId = value);
  // }
  @override
  StudentModel build() {
    return StudentModel(
      name: "",
      phoneNumber: "",
      orgId: "",
      whatsappNumber: "",
      userName: "",
      address: "",
      email: "",
      enrollmentNumber: "",
      batchId: "",
      dateOfBirth: DateTime.now(),
      id: "",
      stream: "",
      studyIn: "",
    );
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

  void setUserName(String userName) {
    state.userName = userName;
  }

  void setEmail(String email) {
    state.email = email;
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
      userName: "",
      address: "",
      email: "",
      enrollmentNumber: "",
      batchId: "",
      dateOfBirth: DateTime.now(),
      id: "",
      stream: "",
      studyIn: "",
    );
  }
}
