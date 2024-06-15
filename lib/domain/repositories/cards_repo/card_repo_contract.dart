import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/entities/full_card_entity/full_card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';

abstract class CardRepo {
  Future<void> createCard({required CreateCardParam cardParam});

  Future<FullCardEntity> getFullCard({required CardEntity card});

  Future<void> editCard({required EditCardParam cardParam});

  Future<List<CardEntity>> fetchCards({required String collectionId});

  Future<void> shareCollection(
      {required String collectionId, required String collectionName});

  Future<void> importExcel(
      {required String path,
      required String collectionId,
      required String collectionName});

  Future<void> moveToCollection({required List<CardEntity> cards, required String fromCollectionId, required String toCollectionId});

  Future<void> copyToCollection({required List<CardEntity> cards, required String toCollectionId});

  Future<void> createSharedCards(
      {required String collectionId, required String sender});

  Future<void> saveLearningResult({required String collectionId, required int learned});

  Future<void> deleteCards(
      {required List<String> cardsToDelete, required String collectionId});

  Future<void> swipeCard({required CardEntity cardEntity});
}
