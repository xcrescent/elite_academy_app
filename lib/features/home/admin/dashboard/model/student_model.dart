import 'package:hive_flutter/hive_flutter.dart';

part 'student_model.g.dart';

// @HiveType(typeId: 1)
// enum TransactionType {
//   @HiveField(0)
//   income,
//   @HiveField(1)
//   expense,
// }

@HiveType(typeId: 4)
class StudentModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  DateTime? dateOfBirth;
  @HiveField(3)
  String phoneNumber;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? batchId;
  @HiveField(6)
  String? enrollmentNumber;
  @HiveField(7)
  String? address;
  @HiveField(8)
  String orgId;
  @HiveField(9)
  String whatsappNumber;
  @HiveField(10)
  String? password;
  @HiveField(11)
  String? rollNumber;
  @HiveField(12)
  String? standard;
  @HiveField(13)
  String? aadharNumber;
  @HiveField(14)
  String? fatherName;
  @HiveField(15)
  String? fatherPhone;
  @HiveField(16)
  String? fatherEmail;
  @HiveField(17)
  String? fatherAddress;

  StudentModel({
    this.id,
    required this.name,
    this.dateOfBirth,
    required this.phoneNumber,
    this.email,
    this.batchId,
    this.enrollmentNumber,
    this.address,
    required this.orgId,
    required this.whatsappNumber,
    this.password,
    this.rollNumber,
    this.standard,
    this.aadharNumber,
    this.fatherName,
    this.fatherPhone,
    this.fatherEmail,
    this.fatherAddress,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      dateOfBirth: map['dateOfBirth'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      batchId: map['batchId'],
      enrollmentNumber: map['enrollmentNumber'],
      address: map['address'],
      orgId: map['orgId'],
      whatsappNumber: map['whatsappNumber'],
      password: map['password'],
      rollNumber: map['rollNumber'],
      standard: map['standard'],
      aadharNumber: map['aadharNumber'],
      fatherName: map['fatherName'],
      fatherPhone: map['fatherPhone'],
      fatherEmail: map['fatherEmail'],
      fatherAddress: map['fatherAddress'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'email': email,
      'batchId': batchId,
      'enrollmentNumber': enrollmentNumber,
      'address': address,
      'orgId': orgId,
      'whatsappNumber': whatsappNumber,
      'password': password,
      'rollNumber': rollNumber,
      'standard': standard,
      'aadharNumber': aadharNumber,
      'fatherName': fatherName,
      'fatherPhone': fatherPhone,
      'fatherEmail': fatherEmail,
      'fatherAddress': fatherAddress,
    };
  }
}
