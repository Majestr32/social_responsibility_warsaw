import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/learning_mode/learn.dart';
import 'package:flashcards/presentation/screens/mobile_screens/profile/profile.dart';
import 'package:flashcards/presentation/widgets/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lists_screen/lists_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeMobile extends StatefulWidget {
  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  PageController pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPage = 0;

  List<String> get pageNames => [
    AppLocalizations.of(context)!.collections,
    AppLocalizations.of(context)!.learn,
    AppLocalizations.of(context)!.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        // elevation: 8,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  pageNames[_selectedPage],
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Lists(),
          Learn(scaffoldKey: _scaffoldKey),
          const Profile()
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(pageController: pageController),
    );
  }
}
