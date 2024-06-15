import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/router.dart';
import '../../core/themes/theme.dart';
import '../../domain/entities/card_entity/card_entity.dart';
import '../blocs/cards/cards_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> learnCards(
    {required String selectedCollectionId, required BuildContext context}) async {
  List<CardEntity> cards =
  await context.read<CardsBloc>().getCards(selectedCollectionId);
  if(!context.mounted) return;
  router.push(
    '/learn_cards',
    extra: {"collectionId": selectedCollectionId, "cards": cards},
  );
}