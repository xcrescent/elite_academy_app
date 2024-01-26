import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/admin_model.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/org_model.dart';
import 'package:elite_academy/features/home/admin/dashboard/repository/org_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../const/constants.dart';

final adminRepositoryProvider = Provider(
  (ref) => AdminRepository(
    orgRepository: ref.read(orgRepositoryProvider),
    fireStore: ref.read(firestoreProvider),
  ),
);

class AdminRepository {
  AdminRepository({
    required FirebaseFirestore fireStore,
    required OrgRepository orgRepository,
  })  : _fireStore = fireStore,
        _orgRepository = orgRepository;

  final OrgRepository _orgRepository;
  final FirebaseFirestore _fireStore;

  Future<List<AdminModel>> getAllAdmin() async {
    return await _fireStore.collection(Constants.users).get().then((value) {
      return value.docs
          .map(
            (e) => AdminModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    });
  }

  Future<AdminModel> getAdminById(String adminId) async {
    return await _fireStore
        .collection(Constants.users)
        .doc(adminId)
        .get()
        .then((value) {
      return AdminModel.fromMap(value.data()!);
    });
  }

  Future<void> addAdmin(AdminModel adminModel) async {
    DocumentReference docRef = _fireStore.collection(Constants.users).doc();
    adminModel.id = docRef.id;
    await docRef.set(adminModel.toMap());
  }

  Future<void> createAdmin(AdminModel adminModel) async {
    var orgId = await _orgRepository.addOrg(OrgModel());
    DocumentReference docRef =
        _fireStore.collection(Constants.users).doc(adminModel.id);

    adminModel.orgId = orgId;
    await docRef.set(adminModel.toMap());
  }

  Future<void> updateAdmin(AdminModel adminModel) async {
    await _fireStore
        .collection(Constants.users)
        .doc(adminModel.id)
        .update(adminModel.toMap());
  }

  Future<void> deleteAdmin(AdminModel adminModel) async {
    await _fireStore.collection(Constants.users).doc(adminModel.id).delete();
  }
}
