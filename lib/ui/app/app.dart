import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/app/feed/feed_screen.dart';
import 'package:social_app/ui/components/app_bar_with_back_button.dart';
import 'package:social_app/ui/components/app_bar_with_leading_title_and_actions.dart';
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
      appBar: buildNavigatedAppBar(),
      body: buildNavigatedScreen(),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedLabelStyle: helpText.copyWith(
            height: 2.4,
          ),
          unselectedLabelStyle: helpText.copyWith(
            height: 2.4,
          ),
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

  PreferredSizeWidget? buildNavigatedAppBar() {
    if (_selectedIndex == 0) {
      return AppBarWithLeadingTitleAndActions(
        title: "Feed",
        actionButtons: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/notification.svg"),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/svgs/new_post.svg"))
        ],
      );
    } else if (_selectedIndex == 1) {
      return AppBarWithLeadingTitleAndActions(
        title: "Chat",
        actionButtons: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/search.svg"),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/svgs/new_post.svg"))
        ],
      );
    } else if (_selectedIndex == 2) {
      return AppBarWithLeadingTitleAndActions(
        title: "Shop",
        actionButtons: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/save.svg", color: accentBlue),
          ),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset("assets/svgs/more.svg"))
        ],
      );
    } else if (_selectedIndex == 3) {
      return AppBarWithLeadingTitleAndActions(
        title: "Profile",
        actionButtons: <Widget>[
          IconButton(
            onPressed: () {},
            icon:
                SvgPicture.asset("assets/svgs/settings.svg", color: accentBlue),
          ),
        ],
      );
    } else
      return null;
  }

  Widget buildNavigatedScreen() {
    if (_selectedIndex == 0)
      return FeedScreen();
    else if (_selectedIndex == 1)
      return Text("Chat Screen");
    else if (_selectedIndex == 2)
      return Text("Shop Screen");
    else if (_selectedIndex == 3)
      return Text("Profile Screen");
    else
      return Text("Selam");
  }
}
