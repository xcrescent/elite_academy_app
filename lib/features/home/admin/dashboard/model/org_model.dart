import 'package:hive_flutter/hive_flutter.dart';

part 'org_model.g.dart';

// @HiveType(typeId: 1)
// enum TransactionType {
//   @HiveField(0)
//   income,
//   @HiveField(1)
//   expense,
// }

@HiveType(typeId: 0)
class OrgModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String address;
  @HiveField(3)
  String email;
  @HiveField(4)
  String phone;

  OrgModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
  });

  factory OrgModel.fromMap(Map<String, dynamic> map) {
    return OrgModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'email': email,
      'phone': phone,
    };
  }
}
