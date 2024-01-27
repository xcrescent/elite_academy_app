import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState {
  uninitialized,
  authenticating,
  authenticated,
  unauthenticated,
}

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthNotifier() : super(AuthState.uninitialized) {
    checkAuth();
  }

  // Mimic an authentication check
  Future<void> checkAuth() async {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        state = AuthState.unauthenticated;
      } else {
        state = AuthState.authenticated;
      }
    });
  }

  void setAuthState(AuthState authState) {
    state = authState;
  }

  // Method to perform login
  Future<void> login() async {
    // Perform login operation here...
    state = AuthState.authenticated;
  }

  // Method to perform logout
  void logout() {
    state = AuthState.unauthenticated;
  }
}
