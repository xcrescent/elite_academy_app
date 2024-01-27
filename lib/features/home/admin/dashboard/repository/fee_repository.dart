import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/fee_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../const/constants.dart';
import 'org_repository.dart';

final feeRepositoryProvider = Provider(
  (ref) => FeeRepository(
    fireStore: ref.read(firestoreProvider),
    orgRepository: ref.read(orgRepositoryProvider),
  ),
);

class FeeRepository {
  FeeRepository({
    required FirebaseFirestore fireStore,
    required OrgRepository orgRepository,
  })  : _fireStore = fireStore,
        _orgRepository = orgRepository;

  final FirebaseFirestore _fireStore;
  final OrgRepository _orgRepository;

  final feeId = null;

  Future<List<FeeModel>> getAllFee() async {
    return await _fireStore
        .collection(Constants.orgs)
        .doc(_orgRepository.orgId)
        .collection(Constants.fees)
        .get()
        .then(
      (value) {
        return value.docs
            .map(
              (e) => FeeModel.fromMap(
                e.data(),
              ),
            )
            .toList();
      },
    );
  }

  Future<FeeModel> getFeeById(String feeId) async {
    return await _fireStore
        .collection(Constants.orgs)
        .doc(_orgRepository.orgId)
        .collection(Constants.fees)
        .doc(feeId)
        .get()
        .then(
      (value) {
        return FeeModel.fromMap(value.data()!);
      },
    );
  }

  Future<void> addFee(FeeModel feeModel) async {
    await _fireStore
        .collection(Constants.orgs)
        .doc(_orgRepository.orgId)
        .collection(Constants.fees)
        .doc()
        .set(feeModel.toMap());
  }

  Future<void> updateFee(FeeModel feeModel) async {
    await _fireStore
        .collection(Constants.orgs)
        .doc(_orgRepository.orgId)
        .collection(Constants.fees)
        .doc(feeModel.id)
        .update(feeModel.toMap());
  }

  Future<void> deleteFee(FeeModel feeModel) async {
    await _fireStore
        .collection(Constants.orgs)
        .doc(_orgRepository.orgId)
        .collection(Constants.fees)
        .doc(feeModel.id)
        .delete();
  }

  Future<void> deleteAllFee() async {
    await _fireStore
        .collection(Constants.orgs)
        .doc(_orgRepository.orgId)
        .collection(Constants.fees)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
