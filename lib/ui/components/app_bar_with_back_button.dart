import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class AppBarWithBackButton extends StatelessWidget with PreferredSizeWidget {
  AppBarWithBackButton({super.key, this.title});

  @override
  Size preferredSize = Size.fromHeight(77.0);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: title == null ? 0 : 0.5,
      toolbarHeight: 100,
      backgroundColor: white,
      title: Text(title ?? "",
          style: headline2.copyWith(
            color: dark,
          )),
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/svgs/back.svg"),
      ),
    );
  }
}
