import 'package:flutter/material.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class AppBarWithLeadingTitleAndActions extends StatelessWidget
    with PreferredSizeWidget {
  AppBarWithLeadingTitleAndActions(
      {super.key, required this.title, this.actionButtons = const <Widget>[]});

  final String title;
  final actionButtons;

  @override
  Size preferredSize = const Size.fromHeight(77.0);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
        elevation: 0.5,
        toolbarHeight: 100,
        backgroundColor: white,
        title: Text(
          title,
          style: headline1.copyWith(
            color: dark,
          ),
        ),
        centerTitle: false,
        titleSpacing: (standartMargin * 3) / 2,
        leadingWidth: 0,
        actions: actionButtons);
  }
}
