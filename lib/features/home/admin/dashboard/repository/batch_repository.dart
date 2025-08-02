import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/bootstrap.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/features/home/admin/dashboard/model/batch_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../const/constants.dart';
import 'org_repository.dart';

final batchRepositoryProvider = Provider(
  (ref) => BatchRepository(
    fireStore: ref.read(firestoreProvider),
    orgRepository: ref.read(orgRepositoryProvider),
  ),
);

class BatchRepository {
  BatchRepository({
    required FirebaseFirestore fireStore,
    required OrgRepository orgRepository,
  })  : _fireStore = fireStore,
        _orgRepository = orgRepository;

  final OrgRepository _orgRepository;

  final FirebaseFirestore _fireStore;

  get batchId => null;

  Stream<List<BatchModel>> getAllBatch() {
    return _fireStore
        .collection(Constants.batches)
        .where("orgId", isEqualTo: _orgRepository.orgId)
        .snapshots()
        .map((value) {
      return value.docs
          .map(
            (e) => BatchModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    });
  }

  Future<BatchModel> getBatchById(String batchId) async {
    return await _fireStore
        .collection(Constants.batches)
        .doc(batchId)
        .get()
        .then((value) {
      return BatchModel.fromMap(value.data()!);
    });
  }

  Future<bool> addBatch(BatchModel batchModel) async {
    var docId = _fireStore.collection(Constants.batches).doc();
    batchModel.id = docId.id;
    try {
      await docId.set(batchModel.toMap());
      return true;
    } catch (e) {
      // Log error with talker for debugging
      if (kDebugMode) {
        talker.error('Failed to add batch: $e');
      }
      return false;
    }
  }

  Future<void> updateBatch(BatchModel batchModel) async {
    await _fireStore
        .collection(Constants.batches)
        .doc(batchModel.id)
        .update(batchModel.toMap());
  }

  Future<void> deleteBatch(String batchId) async {
    await _fireStore.collection(Constants.batches).doc(batchId).delete();
  }
}
