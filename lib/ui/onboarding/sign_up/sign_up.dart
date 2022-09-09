import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/Button.dart';
import 'package:social_app/ui/components/app_bar_with_back_button.dart';
import 'package:social_app/ui/components/custom_text_button.dart';
import 'package:social_app/ui/components/input.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:country_icons/country_icons.dart';
import 'package:social_app/ui/onboarding/sign_up/sign_up_otp.dart';
import 'package:social_app/ui/onboarding/sign_up/sign_up_password.dart';
import 'package:social_app/ui/onboarding/sign_up/sign_up_phone.dart';
import 'package:social_app/ui/onboarding/sign_up/sign_up_username.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _pageController = PageController();
  double? _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _page = _pageController.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithBackButton(
          title: "Sign Up",
          page: _page,
          controller: _pageController,
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SignUpPhoneScreen(controller: _pageController),
            SignUpOTPScreen(controller: _pageController),
            SignUpPasswordScreen(controller: _pageController),
            SignUpUsernameScreen(controller: _pageController),
          ],
        ));
  }
}
