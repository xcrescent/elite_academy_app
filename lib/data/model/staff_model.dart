import 'package:hive_flutter/adapters.dart';

part 'staff_model.g.dart';

@HiveType(typeId: 3)
class StaffModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String phone;
  @HiveField(3)
  String? address;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String id;
  @HiveField(6)
  String? orgId;

  StaffModel({
    required this.name,
    this.email,
    required this.phone,
    this.address,
    this.image,
    required this.id,
    this.orgId,
  });

  factory StaffModel.fromMap(Map<String, dynamic> map) {
    return StaffModel(
      name: map['name'],
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
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'id': id,
      'orgId': orgId,
    };
  }
}
