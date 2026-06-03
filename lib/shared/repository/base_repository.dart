import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elite_academy/bootstrap.dart';
import 'package:flutter/foundation.dart';

abstract class BaseRepository<T> {
  BaseRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;

  String get collectionName;

  T fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap(T model);
  String getId(T model);
  T setId(T model, String id);

  Future<List<T>> getAll({
    String? field,
    dynamic value,
    String? orgIdField,
    String? orgId,
  }) async {
    try {
      Query query = _fireStore.collection(collectionName);

      if (field != null && value != null) {
        query = query.where(field, isEqualTo: value);
      }

      if (orgIdField != null && orgId != null) {
        query = query.where(orgIdField, isEqualTo: orgId);
      }

      final docs = await query.get();
      
      if (docs.docs.isNotEmpty) {
        return docs.docs.map((e) => fromMap(e.data() as Map<String, dynamic>)).toList();
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        talker.error('Failed to get all $collectionName: $e');
      }
      return [];
    }
  }

  Future<T?> getById(String id) async {
    try {
      final doc = await _fireStore.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        talker.error('Failed to get $collectionName by ID: $e');
      }
      return null;
    }
  }

  Future<bool> add(T model) async {
    try {
      final docRef = _fireStore.collection(collectionName).doc();
      final modelWithId = setId(model, docRef.id);
      await docRef.set(toMap(modelWithId));
      return true;
    } catch (e) {
      if (kDebugMode) {
        talker.error('Failed to add $collectionName: $e');
      }
      return false;
    }
  }

  Future<bool> update(T model) async {
    try {
      await _fireStore
          .collection(collectionName)
          .doc(getId(model))
          .update(toMap(model));
      return true;
    } catch (e) {
      if (kDebugMode) {
        talker.error('Failed to update $collectionName: $e');
      }
      return false;
    }
  }

  Future<bool> delete(String id) async {
    try {
      await _fireStore.collection(collectionName).doc(id).delete();
      return true;
    } catch (e) {
      if (kDebugMode) {
        talker.error('Failed to delete $collectionName: $e');
      }
      return false;
    }
  }
}