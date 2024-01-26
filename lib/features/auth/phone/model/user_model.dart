class UserModel {
  final String uid;
  final String firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final String? photoUrl;
  final String phoneNumber;
  final String? address;
  final String? orgId;
  final String role;

  UserModel({
    required this.uid,
    required this.firstName,
    this.lastName,
    this.photoUrl,
    required this.email,
    this.middleName,
    required this.phoneNumber,
    this.address,
    this.orgId,
    required this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      firstName: data['firstName'],
      middleName: data['middleName'],
      lastName: data['lastName'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      phoneNumber: data['phoneNumber'],
      address: data['address'],
      orgId: data['orgId'],
      role: data['role'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
      'address': address,
      'orgId': orgId,
      'role': role,
    };
  }
}
