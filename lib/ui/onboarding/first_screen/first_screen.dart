import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

import '../../components/button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: standartPadding * 3 / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: buildLogo(),
            ),
            Expanded(
              flex: 2,
              child: buildTexts(),
            ),
            Expanded(
              child: buildButtons(),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Text("Explore new team collaboration experiance",
            style: headline1.copyWith(
              color: dark,
            )),
        Spacer(),
        Text("Keep your files, documents, tools in one place.",
            style: body.copyWith(
              color: dark60,
            )),
        Spacer(),
        Text(
            "Communicate with your team and set up business processes and goals through the mobile and web application.",
            style: body.copyWith(
              color: dark60,
            )),
        Spacer(),
        Spacer(),
        Spacer(),
      ],
    );
  }

  Container buildLogo() {
    return Container(
        padding: EdgeInsets.only(left: standartMargin / 2),
        child: SvgPicture.asset("assets/svg/logo.svg"));
  }

  Row buildButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: standartMargin / 2),
            child: Button(text: "Register", onPressed: () {}),
          ),
        ),
        Expanded(
          child: Button(text: "Sign In", type: "Secondary", onPressed: () {}),
        ),
      ],
    );
  }
}
