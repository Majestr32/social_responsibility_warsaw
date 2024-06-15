import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/data/remote/collection_service/collection_service_contract.dart';
import 'package:flashcards/data/remote/empty.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';

import '../../../domain/entities/card_entity/card_entity.dart';

class CollectionServiceImpl extends CollectionServiceContract {
  CollectionServiceImpl(
      {required FirebaseFirestore fireStore,
      required FirebaseStorage firebaseStorage,
      required FirebaseAuth firebaseAuth})
      : _firebaseStorage = firebaseStorage,
        _fireStore = fireStore,
        _firebaseAuth = firebaseAuth;

  final FirebaseFirestore _fireStore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> createCollection({required String collectionName}) async {
    try {
      final doc = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc();
      await doc.set({
        "collectionName": collectionName,
        "id": doc.id,
        "createdAt": FieldValue.serverTimestamp()
      });
    } on FirebaseException catch (e) {
      throw Exception("Exception createCollection $e");
    }
  }

  @override
  Future<void> editCollection(
      {required String collectionName, required String collectionId}) async {
    try {
      final collections = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections);

      await collections
          .doc(collectionId)
          .update({'collectionName': collectionName});
    } on FirebaseException catch (e) {
      throw Exception("Exception deleteCollections $e");
    }
  }

  @override
  Future<void> deleteCollections(
      {required List<String> collectionsListToDelete}) async {
    try {
      final collections = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections);
      for (int i = 0; i < collectionsListToDelete.length; i++) {
        final cardsRefs = await collections
            .doc(collectionsListToDelete[i])
            .collection("cards")
            .get();
        final batch = _fireStore.batch();
        batch.delete(collections.doc(collectionsListToDelete[i]));
        for (var cardRef in cardsRefs.docs) {
          batch.delete(collections
              .doc(collectionsListToDelete[i])
              .collection("cards")
              .doc(cardRef.id));
        }
        await batch.commit();
      }
    } catch (e) {
      throw Exception("Exception deleteCollections $e");
    }
  }

  @override
  Future<List<CollectionEntity>> fetchCollections() async {
    try {
      final collectionDocs = await _fireStore
          .collection(
              "${FirestoreCollections.users}/${_firebaseAuth.currentUser!.uid}/${FirestoreCollections.collections}")
          .get();

      List<CollectionEntity> collectionList = collectionDocs.docs
          .map((e) => CollectionEntity.fromJson(e.data()))
          .toList();

      collectionList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      return collectionList;
    } on FirebaseException catch (e) {
      throw Exception("Exception fetchCollections $e");
    }
  }

  @override
  Future<void> updateCollectionName(
      {required String id, required String name}) async {
    try {
      await _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(id)
          .update({"collectionName": name});
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
