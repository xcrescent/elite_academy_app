import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/view/app.dart';
import 'bootstrap.dart';
import 'firebase_options.dart';

/// This entry point should be used for production only
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const androidProvider =
      kReleaseMode ? AndroidProvider.playIntegrity : AndroidProvider.debug;
  const appleProvider = kReleaseMode
      ? AppleProvider.appAttestWithDeviceCheckFallback
      : AppleProvider.debug;
  // final webProvider = isWeb ? reCaptcha : null;

  await FirebaseAppCheck.instance.activate(
    androidProvider: androidProvider,
    appleProvider: appleProvider,
    // webRecaptchaSiteKey: _webProvider,
  );

  FirebaseAppCheck.instance.onTokenChange.listen((token) async {
    print('AppCheck token changed: $token');
    // await _saveAppCheckToken(
    //   authRepository: _authRepository,
    //   token: token,
    // );
  });

  try {
    // final forceRefresh = _authRepository.getAppCheckToken() == null;
    final tokenAppCheck =
        await FirebaseAppCheck.instance.getToken(true); // <-- Fail
    print('AppCheck token: $tokenAppCheck');
    // await _saveAppCheckToken(
    //   authRepository: _authRepository,
    //   token: tokenAppCheck,
    // );
  } catch (error, stackTrace) {
    print('AppCheck error: $error');
    // logger.d('#AppCheck: ⛔️ ERROR: $error');
  }

  ///You can override your environment variable in bootstrap method here for providers
  bootstrap(() => const App());
}
