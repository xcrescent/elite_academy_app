import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth.dart';

@RoutePage()
class PhoneVerificationPage extends ConsumerWidget {
  final String verificationId;

  const PhoneVerificationPage({
    super.key,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'OTP Verification',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            maxLength: 6,
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter OTP',
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Enter the OTP sent to your phone number',
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print("OTP: ${otpController.text}");
                  context.router.replaceNamed('/home');
                  return;
                }
                // Call the function to verify OTP
                verifyOTP(context, ref, otpController.text);
              },
              child: const Text('Verify OTP'),
            ),
          ),
        ],
      ),
    );
  }

  void verifyOTP(BuildContext context, WidgetRef ref, String otp) async {
    final auth = ref.read(authProvider);

    if (otp.isEmpty || otp.length < 6 || otp.length > 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid OTP'),
        ),
      );
      return;
    }
    // Replace with the OTP entered by the user
    if (kDebugMode) {
      print("OTP: $otp");
    }

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    try {
      var userCred = await auth.signInWithCredential(credential);
      if (kDebugMode) {
        print(
            "Phone number automatically verified and user signed in: ${auth.currentUser!.uid}");
      }
      if (userCred.user != null) {
        if (!context.mounted) return;
        context.router.replaceNamed('/home');
      }

      // Handle successful sign-in
    } catch (e) {
      if (kDebugMode) {
        print('Phone number verification failed. Error: $e');
      }
      // Handle verification failure
    }
  }
}
