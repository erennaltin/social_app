import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/app_bar_with_back_button.dart';
import 'package:social_app/ui/components/create_story_box.dart';
import 'package:social_app/ui/components/post_card.dart';
import 'package:social_app/ui/components/story_box.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: extraWhite,
      appBar: AppBar(
        elevation: 0.5,
        toolbarHeight: 100,
        backgroundColor: white,
        title: Text(
          "Feed",
          style: headline1.copyWith(
            color: dark,
          ),
        ),
        centerTitle: false,
        titleSpacing: (standartMargin * 3) / 2,
        leadingWidth: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/notification.svg"),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/svgs/new_post.svg"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildStoryBoxContainer(),
            PostCard(),
            PostCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedLabelStyle: helpText,
          unselectedLabelStyle: helpText,
          selectedItemColor: dark,
          unselectedItemColor: dark60,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? SvgPicture.asset("assets/svgs/home_active.svg")
                    : SvgPicture.asset("assets/svgs/home.svg"),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? SvgPicture.asset("assets/svgs/chat_active.svg")
                    : SvgPicture.asset("assets/svgs/chat.svg"),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? SvgPicture.asset("assets/svgs/shop_active.svg")
                    : SvgPicture.asset("assets/svgs/shop.svg"),
                label: 'Shop'),
            BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? SvgPicture.asset("assets/svgs/profile_active.svg")
                    : SvgPicture.asset("assets/svgs/profile.svg"),
                label: 'Profile'),
          ],
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
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
