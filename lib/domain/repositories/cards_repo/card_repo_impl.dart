import 'package:flashcards/data/remote/card_service/card_service_contract.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/entities/full_card_entity/full_card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:flashcards/domain/repositories/cards_repo/card_repo_contract.dart';

class CardRepoImpl extends CardRepo {
  CardRepoImpl({required this.cardService});

  CardService cardService;

  @override
  Future<void> createCard({required CreateCardParam cardParam}) async {
    await cardService.createCard(cardParam: cardParam);
  }

  @override
  Future<void> editCard({required EditCardParam cardParam}) async {
    await cardService.editCard(cardParam: cardParam);
  }

  @override
  Future<void> shareCollection({required  String collectionId,
    required String collectionName}) async {
    await cardService.shareCollection(collectionId: collectionId, collectionName: collectionName);
  }

  @override
  Future<void> createSharedCards(
      {required String collectionId, required String sender}) async {
    await cardService.createSharedCards(
        collectionId: collectionId, sender: sender);
  }

  @override
  Future<void> deleteCards(
      {required String collectionId,
        required List<String> cardsToDelete}) async {
    await cardService.deleteCards(
        collectionId: collectionId, cardsToDelete: cardsToDelete);
  }

  @override
  Future<List<CardEntity>> fetchCards({required String collectionId}) async {
    return await cardService.fetchCards(collectionId: collectionId);
  }
  @override
  Future<void> swipeCard({required CardEntity cardEntity}) async {
     await cardService.swipeCard(cardEntity: cardEntity);
  }

  @override
  Future<void> copyToCollection({required List<CardEntity> cards, required String toCollectionId}) async{
    await cardService.copyToCollection(cards: cards, toCollectionId: toCollectionId);
  }

  @override
  Future<void> moveToCollection({required List<CardEntity> cards, required String fromCollectionId, required String toCollectionId}) async{
    await cardService.moveToCollection(cards: cards, fromCollectionId: fromCollectionId, toCollectionId: toCollectionId);
  }

  @override
  Future<FullCardEntity> getFullCard({required CardEntity card}) {
    return cardService.getFullCard(card: card);
  }

  @override
  Future<void> importExcel({required String path,
    required String collectionId,
    required String collectionName}) async{
    await cardService.importExcel(path: path, collectionName: collectionName, collectionId: collectionId);
  }

  @override
  Future<void> saveLearningResult({required String collectionId, required int learned}) async{
    await cardService.saveLearningResult(collectionId: collectionId, learned: learned);
  }
}
