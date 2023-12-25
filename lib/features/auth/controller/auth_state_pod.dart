import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/auth.dart';

/// This provider holds AuthNotifier
final authPod = NotifierProvider<AuthNotifier, int>(
  AuthNotifier.new,
  name: 'authPod',
);

///This provider used to seup the intial value
///which can be overriden for test
final intialAuthValuePod = Provider((ref) => 0);
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
