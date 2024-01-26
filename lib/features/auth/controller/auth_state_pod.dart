import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/firebase_provider.dart';
import '../auth.dart';

final authStateChangesProvider =
    StreamProvider<User?>((ref) => ref.watch(authProvider).authStateChanges());

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

final firstNameProvider = StateProvider<String>((ref) => '');
final lastNameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final middleNameProvider = StateProvider<String>((ref) => '');
