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
  String firstName;
  @HiveField(2)
  String? middleName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  DateTime? dateOfBirth;
  @HiveField(5)
  String phoneNumber;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? batchId;
  @HiveField(8)
  String? enrollmentNumber;
  @HiveField(9)
  String? address;
  @HiveField(10)
  String orgId;

  StudentModel({
    this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.dateOfBirth,
    required this.phoneNumber,
    this.email,
    this.batchId,
    this.enrollmentNumber,
    this.address,
    required this.orgId,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      dateOfBirth: map['dateOfBirth'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      batchId: map['batchId'],
      enrollmentNumber: map['enrollmentNumber'],
      address: map['address'],
      orgId: map['orgId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'email': email,
      'batchId': batchId,
      'enrollmentNumber': enrollmentNumber,
      'address': address,
      'orgId': orgId,
    };
  }
}
