class UserModel {
  final String uid;
  final String name;
  final String? email;
  final String? photoUrl;
  final String phoneNumber;
  final String? address;
  final String? orgId;
  final String role;
  String? batchId;
  String? enrollmentNumber;
  String? whatsappNumber;
  String? password;
  DateTime? dateOfBirth;

  UserModel({
    required this.uid,
    required this.name,
    this.photoUrl,
    required this.email,
    required this.phoneNumber,
    this.address,
    this.orgId,
    required this.role,
    this.batchId,
    this.enrollmentNumber,
    this.whatsappNumber,
    this.password,
    this.dateOfBirth,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      phoneNumber: data['phoneNumber'],
      address: data['address'],
      orgId: data['orgId'],
      role: data['role'],
      batchId: data['batchId'],
      enrollmentNumber: data['enrollmentNumber'],
      whatsappNumber: data['whatsappNumber'],
      password: data['password'],
      dateOfBirth: data['dateOfBirth'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
      'address': address,
      'orgId': orgId,
      'role': role,
      'batchId': batchId,
      'enrollmentNumber': enrollmentNumber,
      'whatsappNumber': whatsappNumber,
      'password': password,
      'dateOfBirth': dateOfBirth,
    };
  }
}
