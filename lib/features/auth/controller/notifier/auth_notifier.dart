import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/firebase_provider.dart';
import '../../../../data/repository/auth_repository.dart';

part 'auth_notifier.g.dart';

/// Listens to the authentication state and updates the state accordingly
@riverpod
class AuthNotifier extends _$AuthNotifier {
  // final _controller = StreamController<User?>();
  @override
  Stream<User?> build() async* {
    // var user = FirebaseAuth.instance.currentUser;
    yield* FirebaseAuth.instance.authStateChanges();
    // _controller.stream;
  }

  void signOut() async {
    await ref.read(authProvider).signOut();
  }

  Future<void> signInWithGoogle() async {
    await ref.read(authRepositoryProvider).signInWithGoogle();
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    return await ref.read(authRepositoryProvider).signInWithEmailAndPassword(email, password);
  }

  Future<void> setUser(User user) async {
    state = AsyncData(user);
  }
}
