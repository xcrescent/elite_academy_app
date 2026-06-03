import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/data/model/org_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../const/strings.dart';

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
    final snapshot = await _fireStore.collection(StringConstants.orgs).get();
    return snapshot.docs
        .map(
          (e) => OrgModel.fromMap(
            e.data(),
          ),
        )
        .toList();
  }

  Future<OrgModel> getOrgById(String orgId) async {
    final docRef = await _fireStore.collection(StringConstants.orgs).doc(orgId).get();
    final org = OrgModel.fromMap(docRef.data()!);
    debugPrint(org.toString());
    orgId = org.id!;
    return org;
  }

  Future<String> addOrg(OrgModel orgModel) async {
    DocumentReference docRef = _fireStore.collection(StringConstants.orgs).doc();
    orgModel.id = docRef.id;
    docRef.set(orgModel.toMap());
    return docRef.id;
  }
}
