import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class CreateStoryBox extends StatelessWidget {
  const CreateStoryBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(standartPadding * 3 / 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: standartPadding / 2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: DottedBorder(
              strokeWidth: 1.5,
              color: accentBlue,
              borderType: BorderType.Circle,
              dashPattern: const [standartRadius / 2, standartRadius / 4],
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentBlue10,
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/svgs/new_story.svg',
                        width: 24, height: 24),
                  ),
                ),
              ),
            ),
          ),
          Text("What's New?", style: helpText.copyWith(color: accentBlue)),
        ],
      ),
    );
  }
}
