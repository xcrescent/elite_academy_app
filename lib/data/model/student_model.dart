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
  String userName;
  @HiveField(11)
  String? profilePic;
  @HiveField(12)
  String? city;
  @HiveField(13)
  String? state;
  @HiveField(14)
  String? country;
  @HiveField(15)
  String? pincode;
  @HiveField(16)
  String? fatherName;
  @HiveField(17)
  String? motherName;
  @HiveField(18)
  String? fatherMobile;
  @HiveField(19)
  String? motherMobile;
  @HiveField(20)
  String? coverPic;
  @HiveField(21)
  String studyIn;
  @HiveField(22)
  String stream;

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
    required this.userName,
    this.profilePic,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.fatherName,
    this.motherName,
    this.fatherMobile,
    this.motherMobile,
    this.coverPic,
    required this.studyIn,
    required this.stream,
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
      userName: map['userName'],
      profilePic: map['profilePic'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      pincode: map['pincode'],
      fatherName: map['fatherName'],
      motherName: map['motherName'],
      fatherMobile: map['fatherMobile'],
      motherMobile: map['motherMobile'],
      coverPic: map['coverPic'],
      studyIn: map['studyIn'],
      stream: map['stream'],
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
      'userName': userName,
      'profilePic': profilePic,
      'city': city,
      'state': state,
      'country': country,
      'pincode': pincode,
      'fatherName': fatherName,
      'motherName': motherName,
      'fatherMobile': fatherMobile,
      'motherMobile': motherMobile,
      'coverPic': coverPic,
      'studyIn': studyIn,
      'stream': stream,
    };
  }
}
