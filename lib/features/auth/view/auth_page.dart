import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends ConsumerState<AuthPage> {
  final TextEditingController _phoneController = TextEditingController();
  String appCheckToken = 'Waiting...';

  @override
  void initState() {
    super.initState();
    // FirebaseAppCheck.instance.getToken().then((value) {
    //   print('AppCheck token: $value');
    //   if (!context.mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('AppCheck token: $value'),
    //     ),
    //   );
    //   if (value != null) {
    //     appCheckToken = value;
    //   }
    // }).catchError((e) {
    //   print('AppCheck error: $e');
    //   if (!context.mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('AppCheck error: $e'),
    //     ),
    //   );
    // });

    // FirebaseAppCheck.instance.onTokenChange.listen((token) async {
    //   print('AppCheck token changed: $token');
    //   if (!context.mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('AppCheck token changed: $token'),
    //     ),
    //   );
    //   if (token != null) {
    //     appCheckToken = token;
    //   }
    // });

    // (() async => await sendAppCheckToken())();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'OTP Authentication',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Click on the button below to send OTP to your phone number',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Call the function to send OTP
                sendOTP(context, ref);
              },
              child: const Text('Send OTP'),
            ),
            const SizedBox(height: 10),
            Text(
              "App Check Token: $kReleaseMode $kDebugMode $appCheckToken",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendAppCheckToken() async {
    try {
      // final forceRefresh = _authRepository.getAppCheckToken() == null;
      final tokenAppCheck =
          await FirebaseAppCheck.instance.getToken(); // <-- Fail
      if (tokenAppCheck != null) {
        appCheckToken = tokenAppCheck;
        //   await Dio(
        //     BaseOptions(
        //       headers: {
        //         'X-Firebase-AppCheck': tokenAppCheck,
        //       },
        //     ),
        //   ).post(
        //     'http://192.168.29.111:3000/api/v1/verify-token',
        //     data: {
        //       'X-Firebase-AppCheck': tokenAppCheck,
        //     },
        //   );
      }
      print('AppCheck token: $tokenAppCheck');
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('AppCheck token: $tokenAppCheck'),
        ),
      );
      // await _saveAppCheckToken(
      //   authRepository: _authRepository,
      //   token: tokenAppCheck,
      // );
    } catch (error, stackTrace) {
      print('AppCheck error: $error');
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('AppCheck error: $error'),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('AppCheck error: ${stackTrace.toString()}}')),
      );
      // logger.d('#AppCheck: ⛔️ ERROR: $error');
    }
  }

  void sendOTP(BuildContext context, WidgetRef ref) async {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a phone number'),
        ),
      );
      return;
    }
    final auth = ref.read(authProvider);
    auth.setSettings(
      appVerificationDisabledForTesting: true,
    );
    verificationCompleted(PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
      print(
          "Phone number automatically verified and user signed in: ${auth.currentUser!.uid}");
      if (!context.mounted) return;
      context.router.pushNamed('/counter');
    }

    verificationFailed(FirebaseAuthException e) {
      print(
          'Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Phone number verification failed. Code: ${e.code}. Message: ${e.message}'),
        ),
      );
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      print('Please check your phone for the verification code.');
      // Store the verification ID somewhere (e.g., in a state management provider)
      // Navigate to the OTP verification screen and pass the verification ID
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP sent successfully'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OTPVerificationPage(verificationId: verificationId),
        ),
      );
    }

    codeAutoRetrievalTimeout(String verificationId) {
      print('verification code: $verificationId');

      // Auto-resolution timed out...
    }

    // Replace with your own phone number
    // String phoneNumber = '+919911168006';
    String phoneNumber = '+91${_phoneController.text.trim()}';

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
                // Call the function to verify OTP
                verifyOTP(context, ref);
              },
              child: const Text('Verify OTP'),
            ),
          ),
        ],
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
