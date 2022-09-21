import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    Key? key,
    required this.iconName,
    required this.count,
  }) : super(key: key);

  final String iconName;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: standartPadding * 3 / 2),
      child: Row(children: <Widget>[
        IconButton(
          padding: const EdgeInsets.only(
              right: standartPadding / 2,
              top: standartPadding / 2,
              bottom: standartPadding / 2),
          constraints: BoxConstraints(),
          icon: SvgPicture.asset('assets/svgs/$iconName.svg'),
          onPressed: () {},
        ),
        Text(count, style: bodySecondary),
      ]),
    );
  }
}
