import 'package:hive_flutter/hive_flutter.dart';

part 'org_model.g.dart';

// @HiveType(typeId: 1)
// enum TransactionType {
//   @HiveField(0)
//   income,
//   @HiveField(1)
//   expense,
// }

@HiveType(typeId: 1)
class OrgModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? address;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? logo;
  @HiveField(6)
  String? website;
  @HiveField(7)
  String? facebook;
  @HiveField(8)
  String? twitter;
  @HiveField(9)
  String? instagram;
  @HiveField(10)
  String? youtube;
  @HiveField(11)
  String? linkedin;
  @HiveField(12)
  String? github;

  OrgModel({
    this.id,
    this.name,
    this.address,
    this.email,
    this.phone,
    this.logo,
    this.website,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.linkedin,
    this.github,
  });

  factory OrgModel.fromMap(Map<String, dynamic> map) {
    return OrgModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      phone: map['phone'],
      logo: map['logo'],
      website: map['website'],
      facebook: map['facebook'],
      twitter: map['twitter'],
      instagram: map['instagram'],
      youtube: map['youtube'],
      linkedin: map['linkedin'],
      github: map['github'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'email': email,
      'phone': phone,
      'logo': logo,
      'website': website,
      'facebook': facebook,
      'twitter': twitter,
      'instagram': instagram,
      'youtube': youtube,
      'linkedin': linkedin,
      'github': github,
    };
  }
}
