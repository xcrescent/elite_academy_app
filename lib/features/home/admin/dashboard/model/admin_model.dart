import 'package:hive_flutter/adapters.dart';

part 'admin_model.g.dart';

@HiveType(typeId: 0)
class AdminModel extends HiveObject {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String? middleName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String phone;
  @HiveField(5)
  String? address;
  @HiveField(6)
  String? image;
  @HiveField(7)
  String? id;
  @HiveField(8)
  String? orgId;

  AdminModel({
    required this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    required this.phone,
    this.address,
    this.image,
    this.id,
    this.orgId,
  });

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      image: map['image'],
      id: map['id'],
      orgId: map['orgId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'id': id,
      'orgId': orgId,
    };
  }
}
