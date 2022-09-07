import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/spacing_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';
import 'package:social_app/ui/components/app_bar_with_back_button.dart';
import 'package:social_app/ui/components/button.dart';
import 'package:social_app/ui/components/custom_text_button.dart';
import 'package:social_app/ui/components/input.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithBackButton(),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: standartPadding * 1.5),
          child: buildBody(),
        ));
  }

  Column buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: standartPadding)),
              buildTitleText(),
              const Padding(padding: EdgeInsets.only(bottom: standartPadding)),
              buildSubtitleText(),
              Padding(
                padding: EdgeInsets.only(bottom: standartPadding * 3),
              ),
              Expanded(
                child: SignInForm(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Text buildSubtitleText() {
    return Text(
      "Welcome back to your workspace!",
      style: headline1.copyWith(
        color: dark60,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Text buildTitleText() {
    return Text(
      "Let’s sign you in.",
      style: welcomeTitle.copyWith(
        color: dark,
      ),
    );
  }
}

// Define a custom Form widget.
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isSignInActive = false;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(_handleInputChange);
    _passwordController.addListener(_handleInputChange);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleInputChange() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSignInActive = true;
      });
    } else {
      setState(() {
        isSignInActive = false;
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
          Input(inputType: "Email", controller: _emailController),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding),
          ),
          Input(inputType: "Password", controller: _passwordController),
          Padding(
            padding: EdgeInsets.only(bottom: standartPadding / 2),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CustomTextButton(
                text: "Forgot your password?", onPressed: () {}),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: standartPadding),
            child: Row(
              children: [
                Text("Don’t have an account?",
                    style: bodySmaller.copyWith(color: dark)),
                Spacer(),
                Text("|", style: bodySmaller.copyWith(color: secondaryActive)),
                Spacer(),
                CustomTextButton(
                    text: "Register",
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUpScreen');
                    })
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: standartPadding)),
          Button(
              text: "Sign In", onPressed: () {}, isDisabled: !isSignInActive),
          Padding(padding: EdgeInsets.only(bottom: standartPadding * 4))
        ],
      ),
    );
  }
}
