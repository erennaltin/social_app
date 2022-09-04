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

class SignUpUsernameScreen extends StatelessWidget {
  const SignUpUsernameScreen({Key? key, required this.controller})
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
          Text("Create Username",
              style: headline1.copyWith(
                color: dark,
              )),
          Text("Identify yourself or be creative!!!",
              style: bodySmaller.copyWith(
                color: dark60,
              )),
          Padding(padding: EdgeInsets.only(top: standartPadding * 1.5)),
          Expanded(child: SignUpUsernameForm(controller: controller))
        ],
      ),
    );
  }
}

class SignUpUsernameForm extends StatefulWidget {
  const SignUpUsernameForm({super.key, required this.controller});

  final PageController controller;

  @override
  SignUpUsernameFormState createState() {
    return SignUpUsernameFormState();
  }
}

class SignUpUsernameFormState extends State<SignUpUsernameForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool isSignUpActive = false;
  bool isValidating = false;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    _phoneController.addListener(_handleInputChange);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleInputChange() {
    setState(() {
      isValidating = true;
      isValid = false;
    });
    bool val = _formKey.currentState!.validate();
    if (val) {
      setState(() {
        isSignUpActive = true;
        isValidating = false;
        isValid = true;
      });
    } else {
      setState(() {
        isSignUpActive = false;
        isValidating = false;
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
          Input(
              inputType: "Username",
              controller: _phoneController,
              isValidating: isValidating,
              isValid: isValid),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding * 1.5),
          ),
          Spacer(),
          Padding(padding: EdgeInsets.only(top: standartPadding)),
          Button(
              text: "Finish",
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
