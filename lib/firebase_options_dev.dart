// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD5pIX9rs7glVwXJilBAhRDBvz93bGA6Tw',
    appId: '1:685176098492:web:21162935c36eb1471e0ab9',
    messagingSenderId: '685176098492',
    projectId: 'elite-academy-flutter-dev',
    authDomain: 'elite-academy-flutter-dev.firebaseapp.com',
    storageBucket: 'elite-academy-flutter-dev.appspot.com',
    measurementId: 'G-ZY79W1VDW2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdlIe22PsScEsHKTMAp4oSnFRY2YT7JIo',
    appId: '1:685176098492:android:048f69d180160e081e0ab9',
    messagingSenderId: '685176098492',
    projectId: 'elite-academy-flutter-dev',
    storageBucket: 'elite-academy-flutter-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBAjtZ9xCWiKW3yRhSoexCOG4_DNyX-nc',
    appId: '1:685176098492:ios:ccf0dad4a0b17c371e0ab9',
    messagingSenderId: '685176098492',
    projectId: 'elite-academy-flutter-dev',
    storageBucket: 'elite-academy-flutter-dev.appspot.com',
    iosBundleId: 'edu.aeronex.eliteAcademy.dev',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBAjtZ9xCWiKW3yRhSoexCOG4_DNyX-nc',
    appId: '1:685176098492:ios:ccf0dad4a0b17c371e0ab9',
    messagingSenderId: '685176098492',
    projectId: 'elite-academy-flutter-dev',
    storageBucket: 'elite-academy-flutter-dev.appspot.com',
    iosBundleId: 'edu.aeronex.eliteAcademy.dev',
  );
}
