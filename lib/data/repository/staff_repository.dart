import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/const/strings.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/data/model/staff_model.dart';
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
    var y = await x.set(staffModel.toMap()).then((value) => true).catchError((e) => false);
    return y;
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
