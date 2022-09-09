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

import '../../../core/blocs/bloc/user_bloc.dart';

class SignUpPhoneScreen extends StatelessWidget {
  SignUpPhoneScreen({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        void changePhoneNumber(String phoneNumber) {
          context.read<UserBloc>().add(SetPhoneNumber(phoneNumber));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: standartPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: standartPadding * 1.5)),
              Text("Mobile Number",
                  style: headline1.copyWith(
                    color: dark,
                  )),
              Text("You will need it to sign in to the application",
                  style: bodySmaller.copyWith(
                    color: dark60,
                  )),
              Padding(padding: EdgeInsets.only(top: standartPadding * 1.5)),
              Expanded(
                  child: SignInMobileForm(
                      controller: controller,
                      changePhoneNumber: changePhoneNumber))
            ],
          ),
        );
      },
    );
  }
}

class SignInMobileForm extends StatefulWidget {
  SignInMobileForm(
      {super.key, required this.controller, required this.changePhoneNumber});

  final PageController controller;
  final Function(String) changePhoneNumber;

  @override
  SignInMobileFormState createState() {
    return SignInMobileFormState();
  }
}

class SignInMobileFormState extends State<SignInMobileForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool isSignUpActive = false;

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
          Input(inputType: "Phone", controller: _phoneController),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding * 1.5),
          ),
          Spacer(),
          Text(
            "You will receive an SMS code for verification.",
            style: bodySmaller.copyWith(
              color: dark60,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: standartPadding)),
          Button(
              text: "Continue",
              onPressed: () {
                widget.changePhoneNumber(_phoneController.text);
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
