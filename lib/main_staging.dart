import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'bootstrap.dart';
import 'firebase_options_stg.dart';

/// This entry point should be used for staging only
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///You can override your environment variable in bootstrap method here for providers
  bootstrap(() => const App());
}
