import 'dart:async';

import 'package:elite_academy/data/repository/admin_repository.dart';
import 'package:elite_academy/features/auth/controller/notifier/auth_notifier.dart';
import 'package:elite_academy/features/auth/phone/model/phone_auth_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/providers/firebase_provider.dart';
import '../../features/auth/phone/controller/phone_auth_state_pod.dart';
import '../model/admin_model.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    remoteDataSource: AuthRemoteDataSource(
      auth: ref.watch(authProvider),
      ref: ref,
    ),
  ),
);

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  Future<bool> signInWithGoogle() async {
    return await remoteDataSource.signInWithGoogle();
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    return await remoteDataSource.signInWithEmailAndPassword(email, password);
  }

  Future<String?> sendOtp(String phoneNumber) async {
    return await remoteDataSource.sendOtp(phoneNumber);
  }

  Future<PhoneAuthResponse> verifyOtp(String otp) async {
    return await remoteDataSource.verifyOtp(otp);
  }

  Future<void> saveUser(
      String firstName, String? middleName, String? lastName, String? email) async {
    return await remoteDataSource.saveUser(firstName, middleName, lastName, email);
  }

  Future<void> signOut() async {
    return await remoteDataSource.signOut();
  }

  Future<bool> checkNewUser() async {
    return await remoteDataSource.checkNewUser();
  }
}

class AuthRemoteDataSource {
  AuthRemoteDataSource({required auth, required ref})
      : _auth = auth,
        _ref = ref;

  final FirebaseAuth _auth;
  final Ref _ref;

  String? _verificationId;

  String? otp;
  User? _user;

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      await _ref.read(authNotifierProvider.notifier).setUser(_user!);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<String?> sendOtp(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          final UserCredential userCredential = await _auth.signInWithCredential(credential);
          final User? user = userCredential.user;
          PhoneAuthResponse res = PhoneAuthResponse(
              user: user, error: null, isNewUser: userCredential.additionalUserInfo!.isNewUser);
          _ref.read(phoneAuthNotifierProvider.notifier).setResponse(res);
          _user = user;
        },
        verificationFailed: (FirebaseAuthException e) {
          PhoneAuthResponse res = PhoneAuthResponse(
            user: null,
            error: e,
            isNewUser: false,
          );
          _ref.read(phoneAuthNotifierProvider.notifier).setResponse(res);
        },
        codeSent: (String verificationId, int? resendToken) async {
          _ref.read(verificationIdProvider.notifier).state = verificationId;
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          _verificationId = verificationId;
        },
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        return 'The provided phone number is not valid.';
      } else {
        return e.message;
      }
    }
  }

  Future<PhoneAuthResponse> verifyOtp(String otp) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      FlutterSecureStorage storage = const FlutterSecureStorage();

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      await storage.write(key: 'uid', value: userCredential.user!.uid);
      await storage.write(
          key: 'new', value: userCredential.additionalUserInfo!.isNewUser.toString());
      final User? user = userCredential.user;
      var res = PhoneAuthResponse(
        user: user,
        error: null,
        isNewUser: userCredential.additionalUserInfo!.isNewUser,
      );
      _ref.read(phoneAuthNotifierProvider.notifier).setResponse(res);
      _user = user;
      return res;
    } on FirebaseAuthException catch (e) {
      return PhoneAuthResponse(
        user: null,
        error: e,
        isNewUser: false,
      );
    }
  }

  Future<void> saveUser(
      String firstName, String? middleName, String? lastName, String? email) async {
    AdminModel admin = AdminModel(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      email: email,
      phone: _user!.phoneNumber!,
      id: _user!.uid,
    );

    _ref.read(adminRepositoryProvider).createAdmin(admin);
    PhoneAuthResponse res = PhoneAuthResponse(
      user: _user,
      error: null,
      isNewUser: false,
    );
    _ref.read(phoneAuthNotifierProvider.notifier).setResponse(res);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> checkNewUser() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    var x = await storage.read(key: 'new');
    if (x == "null" || x == "true") {
      // await storage.write(key: 'new', value: 'false');
      return true;
    }
    return false;
  }
}
