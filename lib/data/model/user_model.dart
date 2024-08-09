class UserDBModel {
  String? id;
  String name;
  DateTime? dateOfBirth;
  String phoneNumber;
  String? email;
  String? batchId;
  String? enrollmentNumber;
  String? address;
  String orgId;

  UserDBModel({
    this.id,
    required this.name,
    this.dateOfBirth,
    required this.phoneNumber,
    this.email,
    this.batchId,
    this.enrollmentNumber,
    this.address,
    required this.orgId,
  });

  factory UserDBModel.fromMap(Map<String, dynamic> map) {
    return UserDBModel(
      id: map['id'],
      name: map['name'],
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
      'name': name,
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
