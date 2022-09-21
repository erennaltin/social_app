import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var SCREEN_WIDTH = MediaQuery.of(context).size.width;

    return Card(
        margin: EdgeInsets.only(bottom: standartMargin),
        elevation: 0.5,
        child: Column(
          children: <Widget>[
            buildListtile(),
            buildImage(SCREEN_WIDTH),
            buildDescriptionContainer(),
            buildActionButtonContainer()
          ],
        ));
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
                PostActionButton(iconName: "publish", count: ""),
              ],
            ),
            IconButton(
              padding:
                  const EdgeInsets.symmetric(vertical: standartPadding / 2),
              constraints: BoxConstraints(),
              icon: SvgPicture.asset('assets/svgs/save.svg'),
              onPressed: () {},
            ),
          ]),
    );
  }

  Container buildDescriptionContainer() {
    return Container(
      padding: EdgeInsets.all(standartPadding),
      height: 104,
      child: Text(
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam...",
        style: bodySmaller.copyWith(color: dark80),
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
    );
  }

  Container buildImage(double SCREEN_WIDTH) {
    return Container(
      height: SCREEN_WIDTH,
      width: SCREEN_WIDTH,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/2000/1000"),
            fit: BoxFit.fitHeight),
      ),
    );
  }

  ListTile buildListtile() {
    return ListTile(
      horizontalTitleGap: standartMargin / 2,
      contentPadding: EdgeInsets.symmetric(horizontal: standartPadding),
      leading: buildProfilePicture(),
      title: Text(
        "Country Henry",
        style: bodySmallerSemiBold.copyWith(color: dark),
      ),
      subtitle: Text("iOS Developer"),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "24 March 2021",
            style: helpText.copyWith(color: dark60),
          ),
          Text(" ")
        ],
      ),
    );
  }

  Container buildProfilePicture() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: accentBlue10, width: 1),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

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
