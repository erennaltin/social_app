import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class AppBarWithBackButton extends StatelessWidget with PreferredSizeWidget {
  AppBarWithBackButton({super.key, this.title, this.page, this.controller});

  @override
  Size preferredSize = Size.fromHeight(77.0);

  final String? title;
  final double? page;
  final PageController? controller;

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
        onPressed: () {
          if (page != null) {
            if (page! > 0) {
              controller?.previousPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn);
            } else {
              Navigator.pop(context);
            }
          } else {
            Navigator.pop(context);
          }
        },
        icon: SvgPicture.asset("assets/svgs/back.svg"),
      ),
    );
  }
}
