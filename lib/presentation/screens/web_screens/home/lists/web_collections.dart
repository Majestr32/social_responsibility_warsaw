import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/presentation/blocs/web_list/web_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/const/icons.dart';
import '../../../../../core/router/router.dart';
import '../../../../widgets/app_icon_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebCollections extends StatefulWidget {
  const WebCollections({
    Key? key,
  }) : super(key: key);

  @override
  State<WebCollections> createState() => _WebCollectionsState();
}

class _WebCollectionsState extends State<WebCollections> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 65.0, top: 40, right: 65.0, bottom: 80),
        child: Container(
          color: AppColors.background,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 65.0, top: 40, right: 65.0, bottom: 80),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, bottom: 11, top: 11),
                    child: Row(children: [
                      context.watch<WebListBloc>().state.isEdit
                          ? Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (context
                                        .read<WebListBloc>()
                                        .listIdToDelete
                                        .contains(context
                                            .read<WebListBloc>()
                                            .state
                                            .collectionsList![i]
                                            .id)) {
                                      context
                                          .read<WebListBloc>()
                                          .listIdToDelete
                                          .remove(context
                                              .read<WebListBloc>()
                                              .state
                                              .collectionsList![i]
                                              .id);
                                    } else {
                                      context
                                          .read<WebListBloc>()
                                          .listIdToDelete
                                          .add(context
                                              .read<WebListBloc>()
                                              .state
                                              .collectionsList![i]
                                              .id);
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: context
                                            .read<WebListBloc>()
                                            .listIdToDelete
                                            .contains(context
                                                .read<WebListBloc>()
                                                .state
                                                .collectionsList![i]
                                                .id)
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
                        width:
                            context.watch<WebListBloc>().state.isEdit ? 22 : 0,
                      ),
                      Flexible(
                        flex: 15,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            onTap: context.watch<WebListBloc>().state.isEdit
                                ? null
                                : () {
                                    router.push(
                                      '/web_cards',
                                      extra: {
                                        "collectionName": context
                                            .read<WebListBloc>()
                                            .state
                                            .collectionsList![i]
                                            .collectionName,
                                        "collectionId": context
                                            .read<WebListBloc>()
                                            .state
                                            .collectionsList![i]
                                            .id,
                                      },
                                    );
                                  },
                            contentPadding: const EdgeInsets.only(
                                left: 28, right: 33, bottom: 6, top: 6),
                            title: Text(
                              context
                                  .read<WebListBloc>()
                                  .state
                                  .collectionsList![i]
                                  .collectionName,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              '${context.read<WebListBloc>().state.collectionsList![i].cardsCount} ${AppLocalizations.of(context)!.cards.toLowerCase()}',
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(color: Colors.black, fontSize: 14),
                            ),
                            trailing: context.watch<WebListBloc>().state.isEdit
                                ? AppIconButton(
                                    onTap: () {
                                      buildShowDialog(
                                        context,
                                        collectionId: context
                                            .read<WebListBloc>()
                                            .state
                                            .collectionsList![i]
                                            .id,
                                        collectionName: context
                                            .read<WebListBloc>()
                                            .state
                                            .collectionsList![i]
                                            .collectionName,
                                      );
                                    },
                                    svgIcon: AppIcons.pen,
                                    color: AppColors.mainAccent,
                                    height: 24,
                                    width: 24,
                                  )
                                : const FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: AppColors.mainAccent,
                                    size: 18,
                                  ),
                          ),
                        ),
                      ),
                    ]),
                  );
                },
                itemCount:
                    context.read<WebListBloc>().state.collectionsList!.length),
          ),
        ),
      ),
    );
  }

  buildShowDialog(
    BuildContext context, {
    required String collectionId,
    required String collectionName,
  }) {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.7,
              width: MediaQuery.of(context).size.width / 3.6,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, top: 12, right: 12, bottom: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            router.pop(context);
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            size: 12,
                            color: AppColors.mainAccent,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Edit Collection',
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(AppLocalizations.of(context)!.giveName,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(color: Colors.black)),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        maxLength: 29,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        style: AppTheme.themeData.textTheme.labelMedium!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                        controller: nameTextEditingController
                          ..text = collectionName,
                        decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            focusColor: AppColors.mainAccent,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        AppColors.mainAccent.withOpacity(0.15)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        AppColors.mainAccent.withOpacity(0.15)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15)))),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      child: Text(AppLocalizations.of(context)!.done,
                          style: AppTheme.themeData.textTheme.labelMedium!
                              .copyWith(color: AppColors.mainAccent)),
                      onPressed: () {
                        if (nameTextEditingController.text.isNotEmpty) {
                          context.read<WebListBloc>().add(
                              WebListEvent.updateCollection(
                                  name: nameTextEditingController.text,
                                  collectionId: collectionId));
                          nameTextEditingController.clear();
                          router.pop();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
