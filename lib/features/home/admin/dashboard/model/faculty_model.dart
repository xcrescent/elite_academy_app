import 'package:hive_flutter/adapters.dart';

part 'faculty_model.g.dart';

@HiveType(typeId: 3)
class FacultyModel extends HiveObject {
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

  FacultyModel({
    required this.name,
    this.email,
    required this.phone,
    this.address,
    this.image,
    required this.id,
  });

  factory FacultyModel.fromMap(Map<String, dynamic> map) {
    return FacultyModel(
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
