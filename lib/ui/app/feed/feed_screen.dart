import 'package:flutter/material.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/ui/components/create_story_box.dart';
import 'package:social_app/ui/components/post_card.dart';
import 'package:social_app/ui/components/story_box.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildStoryBoxContainer(),
          PostCard(),
          PostCard(),
        ],
      ),
    );
  }

  Column buildStoryBoxContainer() {
    return Column(
      children: [
        Container(
          height: 110,
          decoration: BoxDecoration(
            color: white,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              CreateStoryBox(),
              StoryBox(),
              StoryBox(),
              StoryBox(),
              StoryBox(),
              StoryBox(),
              StoryBox(),
              StoryBox(),
            ],
          ),
        ),
        Container(
          height: 0,
          margin: EdgeInsets.symmetric(horizontal: standartMargin),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: secondaryActive,
              ),
            ),
          ),
        )
      ],
    );
  }
}
