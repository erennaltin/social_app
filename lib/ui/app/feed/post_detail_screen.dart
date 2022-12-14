import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/app_bar_with_back_button.dart';
import 'package:social_app/ui/components/comment.dart';
import 'package:social_app/ui/components/modals/modal_fit.dart';
import 'package:social_app/ui/components/post_action_button.dart';
import 'package:social_app/ui/components/post_card.dart';
import 'package:social_app/ui/components/profile_picture.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  String? _selectedCommentSortingMode = "MOST INTERESTING";
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _commentController.addListener(_handleInputChange);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _handleInputChange() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: extraWhite,
      body: Column(
        children: [
          Expanded(
            child: buildPostDetails(),
          ),
          buildCommentInput()
        ],
      ),
    );
  }

  SingleChildScrollView buildPostDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PostCard(extended: true),
          buildCommentContainer(),
        ],
      ),
    );
  }

  KeyboardVisibilityBuilder buildCommentInput() {
    return KeyboardVisibilityBuilder(builder: (context, visible) {
      return SizedBox(
        height: visible ? 300 : 86,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: SvgPicture.asset('assets/svgs/attachment.svg'),
                  onPressed: () {},
                ),
                Expanded(
                  child: SizedBox(
                    height: visible ? 300 : 40,
                    child: Center(
                      child: TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Write a comment!",
                          hintStyle: body.copyWith(
                              color: dark60, height: visible ? 8 : body.height),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: visible
                                ? BorderRadius.circular(standartRadius)
                                : BorderRadius.circular(999),
                            borderSide: BorderSide(color: accentBlue),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Card buildCommentContainer() {
    return Card(
        margin: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            buildCommentSettingContainer(),
            buildCommentListContainer(),
          ],
        ));
  }

  Column buildCommentListContainer() {
    return Column(
      children: const [
        Comment(),
        Comment(),
        Comment(),
        Comment(),
        Comment(),
        Comment(),
      ],
    );
  }

  ListTile buildCommentSettingContainer() {
    return ListTile(
      title: Text(
        "3 COMMENTS",
        style: uppercaseBig.copyWith(
          color: dark60,
        ),
      ),
      trailing: Column(
        children: [
          buildCommentSettingDropdown(),
        ],
      ),
    );
  }

  DropdownButton<String> buildCommentSettingDropdown() {
    return DropdownButton<String>(
        value: _selectedCommentSortingMode,
        elevation: 20,
        underline: DropdownButtonHideUnderline(child: Container()),
        onChanged: (value) {
          setState(() {
            _selectedCommentSortingMode = value;
          });
        },
        icon: SvgPicture.asset('assets/svgs/down.svg'),
        items: [
          DropdownMenuItem<String>(
            value: "MOST INTERESTING",
            child: Text(
              "MOST INTERESTING",
              style: uppercaseBig.copyWith(color: accentBlue),
            ),
          ),
          DropdownMenuItem<String>(
            value: "MOST RECENT",
            child: Text(
              "MOST RECENT",
              style: uppercaseBig.copyWith(color: accentBlue),
            ),
          )
        ]);
  }

  AppBarWithBackButton buildAppBar() {
    return AppBarWithBackButton(
      title: "Post",
      actionButtons: <Widget>[
        IconButton(
            onPressed: () {
              showMaterialModalBottomSheet(
                expand: false,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalFit(),
              );
            },
            icon: SvgPicture.asset("assets/svgs/more.svg"))
      ],
    );
  }
}
