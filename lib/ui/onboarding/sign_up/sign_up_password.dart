import 'package:flutter/material.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/Button.dart';
import 'package:social_app/ui/components/app_bar_with_back_button.dart';
import 'package:social_app/ui/components/custom_text_button.dart';
import 'package:social_app/ui/components/input.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:country_icons/country_icons.dart';

class SignUpPasswordScreen extends StatelessWidget {
  const SignUpPasswordScreen({Key? key, required this.controller})
      : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: standartPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: standartPadding * 1.5)),
          Text("Create Password",
              style: headline1.copyWith(
                color: dark,
              )),
          Text("You will need it to sign in to the application",
              style: bodySmaller.copyWith(
                color: dark60,
              )),
          Padding(padding: EdgeInsets.only(top: standartPadding * 1.5)),
          Expanded(child: SignUpPasswordForm(controller: controller))
        ],
      ),
    );
  }
}

class SignUpPasswordForm extends StatefulWidget {
  const SignUpPasswordForm({super.key, required this.controller});

  final PageController controller;

  @override
  SignUpPasswordFormState createState() {
    return SignUpPasswordFormState();
  }
}

class SignUpPasswordFormState extends State<SignUpPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool isSignUpActive = false;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(_handleInputChange);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleInputChange() {
    bool val = _formKey.currentState!.validate();
    if (val) {
      setState(() {
        isSignUpActive = true;
      });
    } else {
      setState(() {
        isSignUpActive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Input(inputType: "Password", controller: _passwordController),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding * 1.5),
          ),
          Spacer(),
          Padding(padding: EdgeInsets.only(top: standartPadding)),
          Button(
              text: "Continue",
              onPressed: () {
                widget.controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              isDisabled: !isSignUpActive),
          KeyboardVisibilityBuilder(builder: (context, visible) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: visible ? (standartPadding) : standartPadding * 4),
            );
          }),
        ],
      ),
    );
  }
}
