import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/post_action_button.dart';
import 'package:social_app/ui/components/profile_picture.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    this.extended = false,
  }) : super(key: key);

  final bool extended;

  @override
  Widget build(BuildContext context) {
    var SCREEN_WIDTH = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.settings.name != "/PostDetailScreen") {
          Navigator.pushNamed(context, '/PostDetailScreen');
        }
      },
      child: Card(
          margin: EdgeInsets.only(
              bottom: extended ? standartMargin / 2 : standartMargin),
          elevation: 0.5,
          child: Column(
            children: <Widget>[
              buildListTile(),
              buildImage(SCREEN_WIDTH),
              buildDescriptionContainer(),
              buildActionButtonContainer()
            ],
          )),
    );
  }

  Padding buildActionButtonContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: standartPadding),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                PostActionButton(iconName: "like", count: 0.toString()),
                PostActionButton(iconName: "comment", count: 0.toString()),
                const PostActionButton(iconName: "publish", count: ""),
              ],
            ),
            IconButton(
              padding:
                  const EdgeInsets.symmetric(vertical: standartPadding / 2),
              constraints: const BoxConstraints(),
              icon: SvgPicture.asset('assets/svgs/save.svg'),
              onPressed: () {},
            ),
          ]),
    );
  }

  Container buildDescriptionContainer() {
    return Container(
      padding: const EdgeInsets.all(standartPadding),
      child: Text(
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam",
        style: bodySmaller.copyWith(color: dark80),
        overflow: TextOverflow.ellipsis,
        maxLines: extended ? 9999 : 4,
      ),
    );
  }

  Container buildImage(double SCREEN_WIDTH) {
    return Container(
      height: SCREEN_WIDTH,
      width: SCREEN_WIDTH,
      decoration: const BoxDecoration(
        image: const DecorationImage(
            image: NetworkImage("https://picsum.photos/2000/1000"),
            fit: BoxFit.fitHeight),
      ),
    );
  }

  GestureDetector buildListTile() {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        horizontalTitleGap: standartMargin / 2,
        contentPadding: const EdgeInsets.symmetric(horizontal: standartPadding),
        leading: const ProfilePicture(),
        title: Text(
          "Country Henry",
          style: bodySmallerSemiBold.copyWith(color: dark),
        ),
        subtitle: const Text("iOS Developer"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "24 March 2021",
              style: helpText.copyWith(color: dark60),
            ),
            const Text(" ")
          ],
        ),
      ),
    );
  }
}
