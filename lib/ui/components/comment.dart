import 'package:flutter/material.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/post_action_button.dart';
import 'package:social_app/ui/components/profile_picture.dart';

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: standartMargin / 2),
      elevation: 0,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.only(left: standartPadding),
            leading: const ProfilePicture(),
            title: Text(
              "Jane Cooper",
              style: bodySmallerSemiBold.copyWith(
                color: dark,
              ),
            ),
            subtitle: RichText(
                text: TextSpan(
              text:
                  "Lorem ipsum dolor sit amet, donec fringilla quam eu faci lisis mollis. \n",
              style: bodySmaller.copyWith(color: dark),
              children: [
                TextSpan(
                  text: "24 March 2021",
                  style: helpText.copyWith(color: dark60),
                ),
              ],
            )),
            isThreeLine: true,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 64,
                  child:
                      PostActionButton(iconName: "like", count: 0.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
