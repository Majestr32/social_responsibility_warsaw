import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/images.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/create_edit_collection.dart';

class Collections extends StatelessWidget {
  const Collections(
      {Key? key, required this.collectionsList, required this.isEditMode, required this.onTileTap})
      : super(key: key);
  final Function(CollectionEntity) onTileTap;
  final List<CollectionEntity> collectionsList;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: collectionsList.isEmpty ? GestureDetector(
        onTap: (){
          CreateEditCollectionDialog().dialog(context);
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            height: 429,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(AppLocalizations.of(context)!.noCollections, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF474747)),),
                SizedBox(
                    height: 256,
                    child: Image.asset(AppImages.collectionEmpty)),
                Text(AppLocalizations.of(context)!.plusCreateNew, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.mainAccent),),
              ],
            ),
          ),
        ),
      ) : ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 11, top: 11),
              child: Row(children: [
                isEditMode
                    ? Container(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async{
                          if (context
                              .read<ListsBloc>()
                              .listIdToDelete
                              .contains(collectionsList[i].id)) {
                            context
                                .read<ListsBloc>()
                                .listIdToDelete
                                .remove(collectionsList[i].id);
                          } else {
                            context
                                .read<ListsBloc>()
                                .listIdToDelete
                                .add(collectionsList[i].id);
                          }
                          context.read<ListsBloc>().add(ListsEvent.started(
                                isEditMode: isEditMode,
                              ));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: context
                                    .read<ListsBloc>()
                                    .listIdToDelete
                                    .contains(collectionsList[i].id)
                                ? const Icon(
                                    Icons.check_circle,
                                    size: 23.0,
                                    color: AppColors.mainAccent,
                                  )
                                : const Icon(
                                    Icons.radio_button_unchecked,
                                    size: 23.0,
                                    color: AppColors.mainAccent,
                                  ),
                          ),
                        ),
                      ),
                    )
                    : const SizedBox(),
                SizedBox(
                  width: isEditMode ? 22 : 0,
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                      onTap: () {
                        if (isEditMode) {
                          CreateEditCollectionDialog().dialog(context,
                              collectionName: collectionsList[i].collectionName,
                              collectionId: collectionsList[i].id);
                        } else {
                          onTileTap.call(collectionsList[i]);
                        }
                      },
                      title: Text(
                        collectionsList[i].collectionName,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(fontSize: 18),
                      ),
                      subtitle: Text(
                        '${collectionsList[i].cardsCount ?? 0} ${AppLocalizations.of(context)!.cards.toLowerCase()}',
                        style:
                            AppTheme.themeData.textTheme.labelSmall!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      trailing: isEditMode
                          ? SvgPicture.asset(
                              AppIcons.editGreen,
                              height: 18,
                              width: 9,
                            )
                          : SvgPicture.asset(
                              AppIcons.rightArrow,
                              height: 18,
                              width: 9,
                            ),
                    ),
                  ),
                ),
              ]),
            );
          },
          itemCount: collectionsList.length),
    );
  }
}
