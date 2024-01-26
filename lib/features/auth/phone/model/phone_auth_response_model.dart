import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthResponse {
  final User? user;
  final FirebaseAuthException? error;
  final bool isNewUser;

  PhoneAuthResponse({
    required this.user,
    required this.error,
    required this.isNewUser,
  });

  bool get hasError => error != null;

  bool get hasUser => user != null;
}
