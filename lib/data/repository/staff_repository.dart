import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/const/strings.dart';
import 'package:elite_academy/bootstrap.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/data/model/staff_model.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/staff_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffRepositoryProvider = Provider(
  (ref) => StaffRepository(
    fireStore: ref.read(firestoreProvider),
  ),
);

class StaffRepository {
  StaffRepository({
    required FirebaseFirestore fireStore,
  }) : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;

  Future<List<StaffModel>> getAllStaff() async {
    return await _fireStore.collection(StringConstants.users).get().then((value) {
      return value.docs
          .map(
            (e) => StaffModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    });
  }

  Future<StaffModel> getStaffById(String staffId) async {
    return await _fireStore.collection(StringConstants.users).doc(staffId).get().then((value) {
      return StaffModel.fromMap(value.data()!);
    });
  }

  Future<bool> addStaff(StaffModel staffModel) async {
    var x = _fireStore.collection(StringConstants.users).doc();
    staffModel.id = x.id;
    try {
      await x.set(staffModel.toMap());
      return true;
    } catch (e) {
      // Log error with talker for debugging
      if (kDebugMode) {
        talker.error('Failed to add staff: $e');
      }
      return false;
    }
  }

  Future<void> updateStaff(StaffModel staffModel) async {
    await _fireStore
        .collection(StringConstants.users)
        .doc(staffModel.id)
        .update(staffModel.toMap());
  }

  Future<void> deleteStaff(StaffModel staffModel) async {
    await _fireStore.collection(StringConstants.users).doc(staffModel.id).delete();
  }
}
