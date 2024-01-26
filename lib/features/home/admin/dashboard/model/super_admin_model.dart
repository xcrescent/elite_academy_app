import 'package:hive_flutter/adapters.dart';

part 'super_admin_model.g.dart';

@HiveType(typeId: 0)
class SuperAdminModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String phone;
  @HiveField(3)
  String? address;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String id;

  SuperAdminModel({
    required this.name,
    required this.email,
    required this.phone,
    this.address,
    this.image,
    required this.id,
  });

  factory SuperAdminModel.fromMap(Map<String, dynamic> map) {
    return SuperAdminModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      image: map['image'],
      id: map['id'],
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
    };
  }
}
