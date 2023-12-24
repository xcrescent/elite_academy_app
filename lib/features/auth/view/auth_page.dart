import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // sendAppCheckToken();
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Authentication'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the function to send OTP
            sendOTP(context, ref);
          },
          child: const Text('Send OTP'),
        ),
      ),
    );
  }

  void sendAppCheckToken() async {
    final appCheckToken = await FirebaseAppCheck.instance.getToken();
    if (appCheckToken != null) {
      print(appCheckToken);
      // final response = await http.get(
      //   Uri.parse("https://yourbackend.example.com/yourExampleEndpoint"),
      //   headers: {"X-Firebase-AppCheck": appCheckToken},
      // );
    } else {
      // Error: couldn't get an App Check token.
    }
  }

  void sendOTP(BuildContext context, WidgetRef ref) async {
    final auth = ref.read(authProvider);

    verificationCompleted(PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
      print(
          "Phone number automatically verified and user signed in: ${auth.currentUser!.uid}");
    }

    verificationFailed(FirebaseAuthException e) {
      print(
          'Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      // Store the verification ID somewhere (e.g., in a state management provider)
      // Navigate to the OTP verification screen and pass the verification ID
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OTPVerificationPage(verificationId: verificationId),
        ),
      );
    }

    codeAutoRetrievalTimeout(String verificationId) {
      // Auto-resolution timed out...
    }

    // Replace with your own phone number
    // String phoneNumber = '+919911168006';
    String phoneNumber = '+917982908790';

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}

class OTPVerificationPage extends ConsumerWidget {
  final String verificationId;

  const OTPVerificationPage({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the function to verify OTP
            verifyOTP(context, ref);
          },
          child: const Text('Verify OTP'),
        ),
      ),
    );
  }

  void verifyOTP(BuildContext context, WidgetRef ref) async {
    final auth = ref.read(authProvider);

    // Replace with the OTP entered by the user
    String otp = '123456';

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    try {
      var userCred = await auth.signInWithCredential(credential);
      print(
          "Phone number automatically verified and user signed in: ${auth.currentUser!.uid}");
      if (userCred.user != null) {
        if (!context.mounted) return;
        context.router.pushNamed('/counter');
      }
      // Handle successful sign-in
    } catch (e) {
      // Handle verification failure
    }
  }
}
