import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/admin_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AdminNotifier extends StateNotifier<List<AdminModel>> {
  // var _orgId;

  AdminNotifier() : super([]) {
    // loadAdmins(_orgId);
  }

  final adminsBox = Hive.box<AdminModel>('adminsBox');

  final adminsCollection = FirebaseFirestore.instance.collection('admins');

  // void loadAdmins(orgId) async {
  //   // Load admins from Hive
  //   List<AdminModel> localAdmins = adminsBox.values.toList();
  //   state = localAdmins;
  //
  //   // Load admins from Firestore and update Hive using orgId
  //   adminsCollection
  //       .where(
  //     'orgId',
  //     isEqualTo: orgId,
  //   )
  //       .snapshots()
  //       .listen((snapshot) {
  //     List<AdminModel> remoteAdmins =
  //     snapshot.docs.map((doc) => AdminModel.fromMap(doc.data())).toList();
  //
  //     // Update local Hive cache
  //     for (AdminModel admin in remoteAdmins) {
  //       adminsBox.put(admin.id, admin);
  //     }
  //
  //     // Update state
  //     state = remoteAdmins;
  //   });
  // }

  Future<void> addAdmin(AdminModel admin) async {
    // Create a new document reference with auto-generated ID
    DocumentReference docRef = adminsCollection.doc();

    // Make sure to add the generated ID to your admin object if it's needed
    admin.id = docRef.id;

    // Save to Firestore with auto-generated ID
    await docRef.set(admin.toMap());

    // Save to Hive with the same ID from Firestore
    await adminsBox.put(admin.id, admin);

    // Update state
    state = [...state, admin];
  }

// You can also implement updateAdmin and deleteAdmin similarly.

  Future<void> updateAdmin(AdminModel admin) async {
    // Update Firestore
    await adminsCollection.doc(admin.id).update(admin.toMap());

    // Update Hive
    await adminsBox.put(admin.id, admin);

    state = state.map((s) => s.id == admin.id ? admin : s).toList();
  }

  // Future<void> deleteAdmin(AdminModel admin) async {
  //   // Delete from Firestore
  //   await adminsCollection.doc(admin.id).delete();
  //
  //   // Delete from Hive
  //   await adminsBox.delete(admin.id);
  //
  //   state = state.where((s) => s.id != admin.id).toList();
  // }
}
