import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/providers/firebase_provider.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(
    secureStorage: ref.watch(secureStorageProvider),
    fireStore: ref.watch(firestoreProvider),
  );
});

class UserRepository {
  UserRepository({secureStorage, fireStore})
      : _secureStorage = secureStorage,
        _fireStore = fireStore;

  final FlutterSecureStorage _secureStorage;
  final FirebaseFirestore _fireStore;

  String? _userId;

  void fetchUserId() async {
    _userId = await _secureStorage.read(key: 'uid');
  }

  Future<String?> getUserId() async {
    _userId ??= await _secureStorage.read(key: 'uid');
    return _userId;
  }

  Future<String> getOrgId() async {
    final userId = await getUserId();
    var orgId = await _secureStorage.read(key: "orgId");
    if (orgId == null) {
      orgId = await _fireStore
          .collection('users')
          .doc(userId)
          .get()
          .then((value) => value.data()!['orgId']);
      await _secureStorage.write(key: "orgId", value: orgId);

      if (kDebugMode) {
        print(orgId);
      }
      return orgId!;
    } else {
      if (kDebugMode) {
        print("orgId from secure storage");
      }
      return orgId;
    }
  }
}
