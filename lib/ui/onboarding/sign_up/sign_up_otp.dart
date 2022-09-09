import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:social_app/core/blocs/bloc/user_bloc.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/Button.dart';
import 'package:social_app/ui/components/app_bar_with_back_button.dart';
import 'package:social_app/ui/components/custom_text_button.dart';
import 'package:social_app/ui/components/input.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:country_icons/country_icons.dart';

import '../../../core/enums/phone_code.dart';

class SignUpOTPScreen extends StatelessWidget {
  const SignUpOTPScreen({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: standartPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: standartPadding * 1.5)),
              Text("Enter the Code",
                  style: headline1.copyWith(
                    color: dark,
                  )),
              RichText(
                text: TextSpan(
                  text: "Enter the four-digit code that was sent to you at\n",
                  children: [
                    TextSpan(
                      text: state is UserLoaded
                          ? "${state.user.phoneCode.getPhoneCode} ${state.user.phoneNumber}"
                          : "",
                      style: bodySmaller.copyWith(
                        color: accentBlue,
                      ),
                    ),
                  ],
                  style: bodySmaller.copyWith(
                    color: dark60,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: standartPadding * 1.5)),
              Expanded(child: SignInOtpForm(controller: controller))
            ],
          ),
        );
      },
    );
  }
}

class SignInOtpForm extends StatefulWidget {
  const SignInOtpForm({super.key, required this.controller});

  final PageController controller;

  @override
  SignInOtpFormState createState() {
    return SignInOtpFormState();
  }
}

class SignInOtpFormState extends State<SignInOtpForm> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  bool isSignUpActive = false;

  @override
  void initState() {
    super.initState();

    _otpController.addListener(_handleInputChange);
  }

  @override
  void dispose() {
    _otpController.dispose();
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PinCodeTextField(
            length: 4,
            obscureText: false,
            animationType: AnimationType.scale,
            pinTheme: PinTheme(
              activeColor: accentBlue30,
              selectedColor: accentBlue,
              inactiveColor: dark30,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(standartRadius),
              fieldHeight: 56,
              fieldWidth: 50,
              fieldOuterPadding:
                  EdgeInsets.symmetric(horizontal: standartPadding),
              activeFillColor: white,
            ),
            animationDuration: Duration(milliseconds: 300),
            controller: _otpController,
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: (value) {
              print(value);
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
            appContext: context,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding * 1.5),
          ),
          Spacer(),
          Text(
            "Didn't get the code?",
            style: bodySmaller.copyWith(
              color: accentBlue,
            ),
          ),
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
