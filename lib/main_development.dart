import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'bootstrap.dart';
import 'firebase_options_dev.dart';

/// This entry point should be used for development only
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // const androidProvider =
  //     kReleaseMode ? AndroidProvider.playIntegrity : AndroidProvider.debug;
  //
  // const appleProvider = kReleaseMode
  //     ? AppleProvider.appAttestWithDeviceCheckFallback
  //     : AppleProvider.debug;
  // final webProvider = isWeb ? reCaptcha : null;

  // await FirebaseAppCheck.instance
  //     .activate(
  //   androidProvider: androidProvider,
  //   appleProvider: appleProvider,
  //   // webRecaptchaSiteKey: _webProvider,
  // )
  //     .then((value) {
  //   if (kDebugMode) {
  //     print('Firebase App Check Activated');
  //   }
  // }).catchError((e) {
  //   if (kDebugMode) {
  //     print('Firebase App Check Activation Error: $e');
  //   }
  // });

  ///You can override your environment variable in bootstrap method here for providers
  bootstrap(() => const App());
}
