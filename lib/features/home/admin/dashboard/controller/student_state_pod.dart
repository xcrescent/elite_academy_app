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

final studentLoadingPod = StateProvider<bool>((ref) {
  return false;
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
    x.then((value) => _updateState(orgId: value));
  }

  void _updateState({
    String? id,
    String? name,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? email,
    String? batchId,
    String? enrollmentNumber,
    String? address,
    String? orgId,
    String? whatsappNumber,
    String? password,
    String? rollNumber,
    String? standard,
    String? aadharNumber,
    String? fatherName,
    String? fatherPhone,
    String? fatherEmail,
    String? fatherAddress,
  }) {
    state = StudentModel(
      id: id ?? state.id,
      name: name ?? state.name,
      dateOfBirth: dateOfBirth ?? state.dateOfBirth,
      phoneNumber: phoneNumber ?? state.phoneNumber,
      email: email ?? state.email,
      batchId: batchId ?? state.batchId,
      enrollmentNumber: enrollmentNumber ?? state.enrollmentNumber,
      address: address ?? state.address,
      orgId: orgId ?? state.orgId,
      whatsappNumber: whatsappNumber ?? state.whatsappNumber,
      password: password ?? state.password,
      rollNumber: rollNumber ?? state.rollNumber,
      standard: standard ?? state.standard,
      aadharNumber: aadharNumber ?? state.aadharNumber,
      fatherName: fatherName ?? state.fatherName,
      fatherPhone: fatherPhone ?? state.fatherPhone,
      fatherEmail: fatherEmail ?? state.fatherEmail,
      fatherAddress: fatherAddress ?? state.fatherAddress,
    );
  }

  void setFirstName(String name) {
    _updateState(name: name);
  }

  void setPhoneNumber(String phoneNumber) {
    _updateState(phoneNumber: phoneNumber);
  }

  void setOrgId(String orgId) {
    _updateState(orgId: orgId);
  }

  void setStudentId(String studentId) {
    _updateState(id: studentId);
  }

  void setWhatsappNumber(String whatsappNumber) {
    _updateState(whatsappNumber: whatsappNumber);
  }

  void setBatchId(String batchId) {
    _updateState(batchId: batchId);
  }

  void setEnrollmentNumber(String enrollmentNumber) {
    _updateState(enrollmentNumber: enrollmentNumber);
  }

  void setDateOfBirth(DateTime dateOfBirth) {
    _updateState(dateOfBirth: dateOfBirth);
  }

  void setEmail(String username) {
    _updateState(email: username);
  }

  void setAddress(String address) {
    _updateState(address: address);
  }

  void setPassword(String password) {
    _updateState(password: password);
  }

  void setRollNumber(String rollNumber) {
    _updateState(rollNumber: rollNumber);
  }

  void setStandard(String standard) {
    _updateState(standard: standard);
  }

  void setAadharNumber(String aadharNumber) {
    _updateState(aadharNumber: aadharNumber);
  }

  void setFatherName(String fatherName) {
    _updateState(fatherName: fatherName);
  }

  void setFatherPhone(String fatherPhone) {
    _updateState(fatherPhone: fatherPhone);
  }

  void setFatherEmail(String fatherEmail) {
    _updateState(fatherEmail: fatherEmail);
  }

  void setFatherAddress(String fatherAddress) {
    _updateState(fatherAddress: fatherAddress);
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
