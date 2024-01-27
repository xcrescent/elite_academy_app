import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/org_model.dart';

class OrgNotifier extends StateNotifier<List<OrgModel>> {
  OrgNotifier() : super([]) {
    // loadOrgs(_orgId);
  }

  final orgsBox = Hive.box<OrgModel>('orgsBox');

  final orgsCollection = FirebaseFirestore.instance.collection('orgs');

  void loadOrgs(orgId) async {
    // Load orgs from Hive
    List<OrgModel> localOrgs = orgsBox.values.toList();
    state = localOrgs;

    // Load orgs from Firestore and update Hive using orgId
    orgsCollection
        .where(
          'orgId',
          isEqualTo: orgId,
        )
        .snapshots()
        .listen((snapshot) {
      List<OrgModel> remoteOrgs =
          snapshot.docs.map((doc) => OrgModel.fromMap(doc.data())).toList();

      // Update local Hive cache
      for (OrgModel org in remoteOrgs) {
        orgsBox.put(org.id, org);
      }

      // Update state
      state = remoteOrgs;
    });
  }

  Future<void> addOrg(OrgModel org) async {
    // Create a new document reference with auto-generated ID
    DocumentReference docRef = orgsCollection.doc();

    // Make sure to add the generated ID to your org object if it's needed
    org.id = docRef.id;

    // Save to Firestore with auto-generated ID
    await docRef.set(org.toMap());

    // Save to Hive with the same ID from Firestore
    await orgsBox.put(org.id, org);

    // Update state
    state = [...state, org];
  }

// You can also implement updateOrg and deleteOrg similarly.

  Future<void> updateOrg(OrgModel org) async {
    // Update Firestore
    await orgsCollection.doc(org.id).update(org.toMap());

    // Update Hive
    await orgsBox.put(org.id, org);

    state = state.map((s) => s.id == org.id ? org : s).toList();
  }

  Future<void> deleteOrg(OrgModel org) async {
    // Delete from Firestore
    await orgsCollection.doc(org.id).delete();

    // Delete from Hive
    await orgsBox.delete(org.id);

    state = state.where((s) => s.id != org.id).toList();
  }
}
