import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/org_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../const/constants.dart';

final orgRepositoryProvider = Provider(
  (ref) => OrgRepository(
    fireStore: ref.read(firestoreProvider),
  ),
);

class OrgRepository {
  OrgRepository({
    required FirebaseFirestore fireStore,
  }) : _fireStore = fireStore;

  get orgId => null;

  final FirebaseFirestore _fireStore;

  Future<List<OrgModel>> getAllOrg() async {
    return await _fireStore.collection(Constants.orgs).get().then((value) {
      return value.docs
          .map(
            (e) => OrgModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    });
  }

  Future<OrgModel> getOrgById(String orgId) async {
    OrgModel org = await _fireStore
        .collection(Constants.orgs)
        .doc(orgId)
        .get()
        .then((value) {
      return OrgModel.fromMap(value.data()!);
    });
    orgId = org.id!;
    return org;
  }

  Future<String> addOrg(OrgModel orgModel) async {
    DocumentReference docRef = _fireStore.collection(Constants.orgs).doc();
    orgModel.id = docRef.id;
    docRef.set(orgModel.toMap());
    return docRef.id;
  }
}
